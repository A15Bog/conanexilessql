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
$Batchfile = "$ScriptDirectory\logins.bat"
Start-Process -Filepath $Batchfile -WorkingDirectory $ScriptDirectory -NoNewWindow -wait
$inputfile = "$ScriptDirectory\logins.txt"
$outputfile = "$ScriptDirectory\logins.csv"
(Get-Content $inputfile) | Foreach-Object {
    $_ -replace '[/?]', ',' `
       -replace 'Error:', 'Error ' `
       -replace 'Warning:', 'Warning ' `
       -replace '::', ':' `
       -replace ':', ',' `
       -replace '[\[]', '' `
       -replace ']', ',' 
} | Set-Content $inputfile 
$inputfile2 = Get-Content $inputfile	   
$output = @() 
foreach($line in $inputfile2)
	{
	$Date = ($line -split ",")[1]
	$Name = ($line -split ",") -match "Name="
	$SteamID = ($line -split ",") -match "dw_user_id="
	$Name = $Name -replace "Name=",""
	$SteamID = $SteamID -replace "dw_user_id=",""
	$output += "'" + $Date + "','" + $Name + "','" + $SteamID + "'"
	}
$output | Set-Content $outputfile
del $inputfile
$filedata = import-csv $outputfile -Header date , name , steamid  
$filedata | export-csv $outputfile -NoTypeInformation
