# List all installed printers
Get-Printer

# Define the list of printers
$printers = @("PrinterNameHere", "PrinterNameHere", "PrinterNameHere")

# Loop through each printer in list and set its defaults to black and white and set 2 sided printing to One Sided. 
#For all config options go the docs here: https://learn.microsoft.com/en-us/powershell/module/printmanagement/set-printconfiguration?view=windowsserver2022-ps
foreach ($printer in $printers) {
    if (Get-Printer -Name $printer -ErrorAction SilentlyContinue) {
        Set-PrintConfiguration -PrinterName $printer -Color $False -DuplexingMode OneSided
    } else {
        Write-Host "Printer not found: $printer"
    }
}