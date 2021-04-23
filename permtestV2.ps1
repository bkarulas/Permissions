# $OutFile = ".\Permissions.csv"
# $Header = "Folder Path,IdentityReference,AccessControlType,IsInherited,InheritanceFlags,PropagationFlags"
# Del $OutFile
# Add-Content -Value $Header -Path $OutFile 

Function anyKey
{
Write-Host -NoNewline -Object 'Press any key to return to the main menu...' -ForegroundColor Yellow
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown')
Menu
}

$RootPath = "C:\MetaTest"

# $Folders = dir $RootPath -recurse | where {$_.psiscontainer -eq $true}

# foreach ($Folder in $Folders){
# 	$ACLs = get-acl $Folder.fullname | ForEach-Object { $_.Access  }
# 	Foreach ($ACL in $ACLs){
#         if ($ACL.IdentityReference = "Everyone"){
#             $OutInfo = $Folder.Fullname + "," + $ACL.IdentityReference  + "," + $ACL.AccessControlType + "," + $ACL.IsInherited + "," + $ACL.InheritanceFlags + "," + $ACL.PropagationFlags
#             Add-Content -Value $OutInfo -Path $OutFile
#         }
# 	}}

(Get-Acl -Path $RootPath).Access | Out-File -FilePath .\output.json

anyKey
