from http.server import HTTPServer, SimpleHTTPRequestHandler
import os
import sys
import tarfile
import platform
import sysconfig
import subprocess
import zipfile

import requests

ZOLA_VERSION = "0.21.0-rev1"  # Need strictly semver so -revX to work around in fork
ZOLA_PATH = "./bin"
ZOLA_BINARY = f"{ZOLA_PATH}/zola" + (".exe" if platform.system() == "Windows" else "")
ZOLA_REPO = "raven0034/zola"

HOST = "127.0.0.1"
PORT = 1111


def get_release_name() -> str:
    """
    Attempt to figure out the mess of targets so the right asset gets downloaded later

    Returns:
        str: Returns either the target or an empty string
    """
    
    mch = platform.machine().lower()
    mch = "x86_64" if mch == "amd64" else mch
    mch = "aarch64" if mch == "arm64" else mch
    psys = platform.system().lower()
    
    if psys == "linux":
        soabi = sysconfig.get_config_var("SOABI")
        
        clib = ""
        clib = "gnu" if "gnu" in soabi else clib
        clib = "musl" if "musl" in soabi else clib
        
        return f"{mch}-unknown-linux-{clib}"
        
    elif psys == "darwin":
        return f"{mch}-apple-darwin"
            
    elif psys == "windows":
        wt = "msvc" if "MSC v." in sys.version else "gnu"
        return f"{mch}-pc-windows-{wt}"
    
    return ""  # can't figure out a reasonable release name

def check_zola() -> bool:
    """
    Check that zola is present at ZOLA_BINARY and that its version matches ZOLA_VERSION

    Returns:
        bool: True if matching zola is present, False otherwise
    """
    
    if not os.path.exists(ZOLA_BINARY):
        print(f"No Zola binary found at {ZOLA_PATH}")
        return False
    
    try:
        zola_ver = subprocess.check_output([ZOLA_BINARY, "--version"], text=True).removeprefix("zola ").strip()
        
        if zola_ver == ZOLA_VERSION:
            print(f"Found correct version of Zola {ZOLA_VERSION} at {ZOLA_BINARY}")
            return True
        
        print(f"Expected Zola {ZOLA_VERSION}, found {zola_ver}\n{repr(ZOLA_VERSION)} vs {repr(zola_ver)}")
        return False
    except Exception as e:
        print(f"Error while checking for zola: {e}")
        return False
        

def download_zola() -> None:
    print("Preparing Zola...")
    os.makedirs(ZOLA_PATH, exist_ok=True)
    
    release_base = f"https://api.github.com/repos/{ZOLA_REPO}/releases"
    
    repo_releases_r = requests.get(release_base)
    repo_releases_r.raise_for_status()
    repo_releases = repo_releases_r.json()
    
    for r in repo_releases:
        if r["tag_name"] == f"v{ZOLA_VERSION}":
            print(f"Matched tag {r['tag_name']}")
            rname = get_release_name()
            if rname:
                target = f"zola-v{ZOLA_VERSION}-{rname}"
                
                for d in r["assets"]:
                    if target in d["name"]:
                        print(f"Downloading from target: {d['browser_download_url']}")
                        r = requests.get(d["browser_download_url"], stream=True)
                        r.raise_for_status()
                        output = f"{ZOLA_PATH}/{d['name']}"
                        f= open(output, "wb")
                        
                        for chunk in r.iter_content(chunk_size=8192):
                            if chunk:
                                f.write(chunk)
                        
                        f.close()
                        
                        print("Completed download, extracting...")
                        
                        if os.path.exists(ZOLA_BINARY):
                            os.remove(ZOLA_BINARY)  # safely clean up old binary

                        if output.endswith(".zip"):
                            z = zipfile.ZipFile(output, "r")
                            z.extractall(ZOLA_PATH)
                            z.close()
                        
                        elif tarfile.is_tarfile(output):
                            t = tarfile.open(output, "r:*")
                            t.extractall(ZOLA_PATH)
                            t.close()
                        
                        else:
                            raise RuntimeError(f"Unexpected asset (not zip or tar) downloaded from URL: {d['browser_download_url']}")
                        
                        os.remove(output)
                        
                        if not check_zola():
                            raise RuntimeError("Cannot resolve Zola version correctly")
                        
                        print(f"Successfully downloaded Zola v{ZOLA_VERSION} to {ZOLA_BINARY}")
                        return
            else:
                raise RuntimeError(f"Could not find a reasonable release target for this platform for Zola v{ZOLA_VERSION}")
    
    raise RuntimeError(f"No releases match the expected version (Zola v{ZOLA_VERSION})")

def start_stardust() -> None:
    print("Building site (may take a while)...")
    subprocess.run([ZOLA_BINARY, "build", "--base-url", f"http://{HOST}:{PORT}", "--force"], check=True)
    
    print("Starting http server...")

    os.chdir("./public")
    
    httpd = HTTPServer((HOST, PORT), SimpleHTTPRequestHandler)
    print(f"Serving on http://{HOST}:{PORT}\nCtrl-C to exit...")
    try:
        httpd.serve_forever()
    except KeyboardInterrupt:
        print("\nReceived interrupt, closing server...")
    finally:
        httpd.server_close()

if __name__ == "__main__":
    valid_zola = check_zola()
    if not valid_zola:
        download_zola()
    
    start_stardust()
    
    
