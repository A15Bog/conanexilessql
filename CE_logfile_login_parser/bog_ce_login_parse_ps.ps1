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
$ScriptDirectory = 'C:\ConanExiles\LOG' #Get-ScriptDirectory
$logdata = Get-ChildItem -Recurse -Include "$ScriptDirectory\*.log" | select-string userID
$inputfile = $logdata
$outputfile = "$ScriptDirectory\logins.csv"
#$Batchfile = "$ScriptDirectory\bog_ce_login_parse.bat"
#del $inputfile  -erroraction 'SilentlyContinue'
#del $inputfile  -erroraction 'SilentlyContinue'
#Start-Process -Filepath $Batchfile -WorkingDirectory $ScriptDirectory -NoNewWindow -wait
$inputfile | Foreach-Object {
    $_ -replace '[/?]', ',' `
       -replace 'Error:', 'Error ' `
       -replace 'Warning:', 'Warning ' `
       -replace '::', ':' `
       -replace ':', ',' `
       -replace '[\[]', '' `
       -replace ']', ',' 
} #| Set-Content $inputfile 
$inputfile2 = $inputfile
$output = @()
foreach($line in $inputfile2)
	{
	$Date = ($line -split ",")[1]
	$Name = ($line -split ",") -match "Name="
	$SteamID = ($line -split ",") -match "dw_user_id="
	$Name = $Name -replace "Name=",""
	$SteamID = $SteamID -replace "dw_user_id=","steamid="
	$LoginCount = ""
	$output += "`"" + $Date + "`",`"" + $Name + "`",`"" + $SteamID + "`"" + ",`"" + $LoginCount + "`""
	}
$output | Set-Content $outputfile
#del $inputfile
$filedata = import-csv $outputfile -Header Date , Name , SteamID, LoginCount
foreach ($file in $filedata)
{
$SteamID = ""
$SteamID = $file.SteamID
#$SteamID = "steamid=76561198041098811"
$LoginCount = $filedata | where {$_.SteamID -match $SteamID} | measure
#$LoginCount = $LoginCount.Count
$file.LoginCount = $LoginCount.Count
}
$filedata = $filedata | Sort-Object -Property {$_.LoginCount},{$_.Name},{$_.Date}  -descending
$filedata | export-csv $outputfile -NoTypeInformation
