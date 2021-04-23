Function anyKey
{
Write-Host -NoNewline -Object 'Press any key to return to the main menu...' -ForegroundColor Yellow
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown')
Menu
}

$RootPath = "C:\MetaTest\"



$folderList += (Get-Childitem -Path $RootPath -Directory -Recurse -Depth 0).name

foreach ($folders in $folderList) {
    $folder = $RootPath + $folders
    #$outPut1 += Get-Acl -Path $folder
    #$outPut2 += Get-Acl $folder
    $outPut3 += Get-Acl -Path $folder | Format-Table -Wrap
    $outPut4 += Get-Acl -Path $folder | Format-List
    #$outPut5 += (Get-Acl -Path $folder).Access
    #$outPut6 += (Get-Acl -Path $folder).Access.IdentityReference
    #$outPut7 += (Get-Acl -Path $folder).[TAB]
    #$outPut8 += Get-ChildItem -Directory -Path $folder -Recurse -Force
}

$folderList | Out-File -FilePath .\folders.txt

#$outPut1 | Out-File -FilePath .\output1.txt
#$outPut2 | Out-File -FilePath .\output2.txt
$outPut3 | Out-File -FilePath .\output3.txt
$outPut4 | Out-File -FilePath .\output4.txt
#$outPut5 | Out-File -FilePath .\output5.txt
#$outPut6 | Out-File -FilePath .\output6.txt
#$outPut7 | Out-File -FilePath .\output7.txt
#$outPut8 | Out-File -FilePath .\output8.txt


anyKey
