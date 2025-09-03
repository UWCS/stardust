{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    utils.url = "github:numtide/flake-utils";
    rust-overlay.url = "github:oxalica/rust-overlay";
  };

  outputs = { self, nixpkgs, utils, rust-overlay }:
    utils.lib.eachDefaultSystem (system:
        let
            pkgs = import nixpkgs {
                inherit system;
                overlays = [ rust-overlay.overlays.default ];
            };
  
            rustToolchain = pkgs.rust-bin.stable."1.87.0".default;
  
            rustPlatform = pkgs.makeRustPlatform {
                cargo = rustToolchain;
                rustc = rustToolchain;
            };

            zolaPkg = rustPlatform.buildRustPackage rec {
                pname = "zola";
                version = "0.21.0-rev1";
                
                src = pkgs.fetchFromGitHub {
                    owner = "raven0034";
                    repo = pname;
                    rev = "cf3b50222c27a06389df08c3f4344cb9112fdc60";
                    hash = "sha256-k2Q6XHWkTMuVlv5pjcYWnGql+K96U/Q6wOZpQz4RZvs=";
                };

                cargoLock = {
                    lockFile = "${src}/Cargo.lock";
                    allowBuiltinFetchGit = true;
                };
            };
        in {
            packages.default = zolaPkg;

            devShells.default = pkgs.mkShell {
                buildInputs = [ zolaPkg pkgs.python313 ];
                shellHook = ''
                    mkdir -p ./bin
                    ln -sf ${zolaPkg}/bin/zola ./bin/zola
                    echo "Linked ./bin/zola -> ${zolaPkg}/bin/zola"
                '';
            };
        }
    );
}