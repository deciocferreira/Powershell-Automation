#Cria uma OU dentro do AD padrão protegida de deleção acidental
New-ADOrganizationalUnit -Name "Groups" -Path "OU=LabLocal,DC=lab,DC=local"

#Desativa a propriedade de deleção acidental para gerenciar o objeto
Get-ADOrganizationalUnit -Identity "OU=UserAccounts,DC=lab,DC=local" | Set-ADObject -ProtectedFromAccidentalDeletion:$false -PassThru 

#Move a OU para dentro de outro local no AD
Move-ADObject -Identity "OU=UserAccounts,DC=lab,DC=local" -TargetPath "OU=LabLocal,DC=lab,DC=local" 