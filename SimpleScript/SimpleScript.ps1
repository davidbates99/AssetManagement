#Example PowerShell Script for Asset Management Updates

#Import CSV files from barcode serial number scans
$Scan1 = (Import-csv "C:\Users\David Bates\Projects\AssetManagement\SimpleScript\Scan1.csv")
$Scan2 = (Import-Csv "C:\Users\David Bates\Projects\AssetManagement\SimpleScript\Scan2.csv")

#Combining scans & only selecting unique data
$CombinedScans = $Scan1 + $Scan2
Select-Object -unique

#Import Master Asset List
$MasterAssetList = (Import-csv "C:\Users\David Bates\Projects\AssetManagement\SimpleScript\MasterAssetList.csv")

#Initialize Arrays used for Reporting Findings
$Report_Verified = @()
$Report_NotVerified = @()
$Report_NotOurDevice = @()

#sorting serials
#If serial is in CombinedScans & MasterAssetList -> verified
foreach($serial in $CombinedScans){
	if($MasterAssetList. Contains($serial)) {
		$Report_Verified += $serial}
	else {$Report_NotOurDevice += $serial}
}

foreach($serial in $MasterAssetList){
	if($Report_Verified. NotContains($serial)) {
    $Report_NotVerified += $serial}
}

Write-Output $Report_Verified
