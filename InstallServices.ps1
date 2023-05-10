# Define variáveis para os recursos a serem instalados
$ADDSFeature = "AD-Domain-Services"
$DNSFeature = "DNS"
$DHCPFeature = "DHCP"
$IISFeature = "Web-Server"
$PrintServerFeature = "Print-Server"

# Verifica se o usuário atual é um administrador
if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Warning "Este script deve ser executado como administrador!"
    exit 1
}

# Instala o recurso AD DS
Install-WindowsFeature -Name $ADDSFeature -IncludeManagementTools

# Instala o recurso DNS
Install-WindowsFeature -Name $DNSFeature -IncludeManagementTools

# Instala o recurso DHCP
Install-WindowsFeature -Name $DHCPFeature -IncludeManagementTools

# Instala o recurso IIS
Install-WindowsFeature -Name $IISFeature -IncludeManagementTools

# Instala o recurso Print-Server
Install-WindowsFeature -Name $PrintServerFeature -IncludeManagementTools

# Confirma a conclusão da instalação dos recursos
Write-Host "Instalação concluída com sucesso!"
