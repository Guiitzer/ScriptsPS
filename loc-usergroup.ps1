function loc-usergroup ($group) {

Write-Host "-------------------------------------------------------------"
Write-Host " Usuários dentro do grupo $group : " -ForegroundColor "Yellow"
Write-Host "-------------------------------------------------------------"

Get-ADGroupMember -identity $group | Select-Object -ExpandProperty name
Write-Host "-------------------------------------------------------------"

}