Function User-Ou ($nomeou) {
Write-Host "-------------------------------------------" -ForegroundColor "yellow"
Write-Host " __________________________________________" -ForegroundColor "Green"
Write-Host "|Verificacao de usuarios dentro de OU no AD|" -ForegroundColor "Green"
Write-Host " -------------------------------------------" -ForegroundColor "Green"
Write-Host "Obs:. Caso a OU tenha espaço utilizar Aspas ex. "Servico de TI""

Write-Host "-----------Você quis Dizer?--------------" -ForegroundColor "yellow"

Get-ADOrganizationalUnit -filter * | Select-Object name | findstr /im $nomeou

Write-Host "-----------Caminho da OU $nomeou--------------" -ForegroundColor "yellow"

Get-ADOrganizationalUnit -Filter 'name -like $nomeou' -Properties * | Select-Object -ExpandProperty CanonicalName

## Atribuição da OU em uma Variavel
$varuserou = Get-ADOrganizationalUnit -Filter 'name -like $nomeou' -Properties * | Select-Object -ExpandProperty DistinguishedName


Write-Host "---------Usuarios dentro da OU $nomeou--------" -ForegroundColor "yellow"

$validacao = Get-ADUser -filter * -SearchBase $varuserou | Select-Object -ExpandProperty sAMAccountName
$result = $?

if ($? = True) {write-host ("$validacao") }else {write-host ("OU não existe no AD!") }

Write-Host "----------------------------------------------" -ForegroundColor "yellow"


}