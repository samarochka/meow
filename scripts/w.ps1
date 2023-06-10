Read-Host "This script will install app to $pwd\meow. Press Enter to continue or Ctrl+C to cancel"
if (Test-Path -Path meow) {
    Remove-Item meow -Recurse
}

Write-Output "Downloading embedded core"
Invoke-WebRequest -Uri https://www.python.org/ftp/python/3.10.11/python-3.10.11-embed-amd64.zip -OutFile python.zip

Write-Output "Unpacking embedded core"
Expand-Archive python.zip -Force
Remove-Item python.zip

Write-Output "Configuring embedded core"
Rename-Item python meow
Remove-Item meow/python310._pth

Write-Output "Installing packaging core. This may take a while..."
Set-Location meow
Invoke-WebRequest -Uri https://bootstrap.pypa.io/get-pip.py -OutFile get-pip.py
.\python.exe get-pip.py --no-warn-script-location --quiet
Remove-Item get-pip.py

Write-Output "Downloading application"
Invoke-WebRequest -Uri https://github.com/samarochka/meow/releases/latest/download/meow-universal-py3-none-any.whl -OutFile meow-universal-py3-none-any.whl

Write-Output "Installing application and dependencies"
./Scripts/pip install meow-universal-py3-none-any.whl
Remove-Item meow-universal-py3-none-any.whl

Write-Output ""
Write-Host "Installed. " -ForegroundColor Green -NoNewline
Write-Host "Script is availiable at " -NoNewline
Write-Host "$pwd\Scripts\meow " -ForegroundColor Cyan

Set-Location ..
