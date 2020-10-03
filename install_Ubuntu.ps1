Add-AppxPackage .\Ubuntu.appx
ubuntu2004.exe
wsl exec env PWD='/mnt/c/Users/r/wsl_setup' ./wsl_setup.sh
wsl --shutdown
wsl --export Ubuntu-20.04 .\Ubuntu.tar

## Packaging everything away from Ubuntu App
Remove-AppxPackage CanonicalGroupLimited.Ubuntu20.04onWindows_2004.2020.424.0_x64__79rhkp1fndgsc
mkdir $HOME\Ubuntu
wsl --import Ubuntu $HOME\Ubuntu .\Ubuntu.tar
rm .\Ubuntu.tar
