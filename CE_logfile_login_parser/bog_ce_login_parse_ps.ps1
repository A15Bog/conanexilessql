#Created by A15 Bog to parse logins for finding exploiters
#https://github.com/A15Bog/conanexilessql
function Get-ScriptDirectory
{ 
if($hostinvocation -ne $null)
{
Split-Path $hostinvocation.MyCommand.path
}
else
{
Split-Path $script:MyInvocation.MyCommand.Path
}
}
$ScriptDirectory = Get-ScriptDirectory
$logdata = gci -Path $ScriptDirectory -r -i *.log | select-string "userId"
$inputfile = $logdata
$outputfile = "$ScriptDirectory\logins.csv"
$inputfile = $inputfile | Foreach-Object {
    $_ -replace '[/?]', ',' `
       -replace 'Error:', 'Error ' `
       -replace 'Warning:', 'Warning ' `
       -replace '::', ':' `
       -replace ':', ',' `
       -replace '[\[]', '' `
       -replace ']', ','
}
$inputfile2 = $inputfile
$output = @()
foreach($line in $inputfile2)
	{
	$Date = ($line -split ",")[3]
	$Name = ($line -split ",") -match "Name="
	$SteamID = ($line -split ",") -match "dw_user_id="
	$Name = $Name -replace "Name=",""
	$SteamID = $SteamID -replace "dw_user_id=","steamid="
	$LoginCount = ""
	$output += "`"" + $Date + "`",`"" + $Name + "`",`"" + $SteamID + "`"" + ",`"" + $LoginCount + "`""
	}
$output | Set-Content $outputfile
$filedata = import-csv $outputfile -Header Date , Name , SteamID, LoginCount
foreach ($file in $filedata)
{
$SteamID = ""
$SteamID = $file.SteamID
$LoginCount = $filedata | where {$_.SteamID -match $SteamID} | measure
$file.LoginCount = $LoginCount.Count
}
$filedata = $filedata | Sort-Object -Property {$_.LoginCount},{$_.Name},{$_.Date}  -descending
$filedata | export-csv $outputfile -NoTypeInformation