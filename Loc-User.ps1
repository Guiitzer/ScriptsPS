Function Loc-User ($nome) {

Write-Host "  "
Write-Host "  "

$ControladorDominio = Get-ADDomainController | Select-Object -ExpandProperty HostName

Write-Host "-----------Caminho do Usuario-----------" -ForegroundColor "yellow"

get-aduser $nome -Properties * | Select-Object -ExpandProperty canonicalname

Write-Host "---------Usuario está Bloqueado?--------" -ForegroundColor "yellow"

$bloq = get-aduser $nome -Properties * | Select-Object -ExpandProperty LockedOut

if ($bloq -like "True") {write-host "SIM" -ForegroundColor "Red"}
if ($bloq -like "False") {Write-Host "NÃO" -ForegroundColor "Green"} 

Write-Host "---------Controlador de Dominio---------" -ForegroundColor "yellow"

$ControladorDominio.ToUpper()

Write-Host "-------------Departamento---------------" -ForegroundColor "yellow"

Get-aduser $nome -Properties * | Select-Object -ExpandProperty Department

Write-Host "-------------Grupos Ativos--------------" -ForegroundColor "yellow"

Get-ADPrincipalGroupMembership -Identity $nome | Select-Object -ExpandProperty name 

Write-Host "----------------------------------------" -ForegroundColor "yellow"

}