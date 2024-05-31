#cria um usuário com senha temporária para mudar no próximo login
$secpass = Read-Host "Insira a senha temporária do usuário:" -AsSecureString
New-ADUser -Name "Lebron James" -SamAccountName lebron.james -UserPrincipalName "lebron.james@tigs.com.br" -ChangePasswordAtLogon $true -AccountPassword $secpass -Path "OU=UserAccounts,OU=LabLocal,DC=lab,DC=local" -Enabled:$true

#Consulta o usuário dentro da floresta
Get-ADUser -Identity lebron.james -Properties *

#Cria grupos de administração
New-ADGroup -Name "Diretoria" -SamAccountName Diretoria -GroupCategory Security -GroupScope Global -DisplayName "Diretoria" -Path "OU=Groups,OU=LabLocal,DC=lab,DC=local" -Description "Members of this group are part of board directors"

#Consulta o grupo criado
Get-ADGroup -Identity Diretoria -Properties *

#Insere o usuário em grupos
Add-ADGroupMember -Identity Diretoria -Members lebron.james

#Habilita recycle Bin do AD 
Enable-ADOptionalFeature –Identity 'CN=Recycle Bin Feature,CN=Optional Features,CN=Directory Service,CN=Windows NT,CN=Services,CN=Configuration,DC=lab,DC=local' –Scope ForestOrConfigurationSet –Target 'lab.local'

#Verifica se o recycle bin está habilitado
Get-ADOptionalFeature -Filter *