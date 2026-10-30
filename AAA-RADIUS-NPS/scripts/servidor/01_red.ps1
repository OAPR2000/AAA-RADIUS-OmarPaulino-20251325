# =====================================================================
# Servidor OMAR1325 (Windows Server 2022) - Direccionamiento
# Ejecutar en PowerShell como administrador
# =====================================================================
Get-NetAdapter
New-NetIPAddress -InterfaceAlias "Ethernet0 2" -IPAddress 10.13.25.10 -PrefixLength 24 -DefaultGateway 10.13.25.1
Set-DnsClientServerAddress -InterfaceAlias "Ethernet0 2" -ServerAddresses 127.0.0.1
ipconfig /all
