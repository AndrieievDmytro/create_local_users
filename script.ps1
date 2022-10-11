
$wshell = New-Object -ComObject wscript.shell;
$wshell.SendKeys('~')
$users = Get-content -Raw users.JSON | ConvertFrom-Json
$pass = Read-Host -AsSecureString
$x=0
for(;$x -le $users.Count-1 ;$x++)
{ 
    $user = $users[$x].name
    $pass = $users[$x].pass
    $fullName = $users[$x].fullName
    $description = $users[$x].description
    $userCheck = Get-LocalUser -Name $user;
    if( $null -eq $userCheck){
        New-LocalUser -Name $user -Password $pass -FullName $fullName -Description $description
    }else {
        Write-Output "User $user exists"
    }
}

Get-LocalUser