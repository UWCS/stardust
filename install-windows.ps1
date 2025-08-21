rm zola*-pc-windows-gnu.zip
# Get release info
$release_info= (Invoke-RestMethod -Method GET -Uri "https://api.github.com/repos/raven0034/zola/releases")[0].assets | Where-Object name -like *-pc-windows-gnu.zip
$release_url= $release_info.browser_download_url
$release_file= $release_info.name

# echo "Downloading $release_download"
Invoke-WebRequest -Uri $release_url -OutFile $release_file
mkdir -Force bin

# echo "Extract to ./bin"
Expand-Archive zola*-pc-windows-gnu.zip -DestinationPath  "bin" -Force

# Set PATH
$AddPath = "$PWD\bin"
$env:Path = $AddPath + ";" + $env:Path
# https://github.com/ThePoShWolf/Utilities/blob/master/Misc/Set-PathVariable.ps1
$regexPath = [regex]::Escape($AddPath)
$arrPath = [System.Environment]::GetEnvironmentVariable('PATH', 'User') -split ';'
$arrPath = $arrPath | Where-Object { $_ -notMatch "^$regexPath\\?" }

$value = (,$AddPath + $arrPath) -join ';'
[System.Environment]::SetEnvironmentVariable('PATH', $value, 'User')

rm zola*-pc-windows-gnu.zip