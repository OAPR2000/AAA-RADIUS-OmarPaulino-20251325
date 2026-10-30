# =====================================================================
# NPS (Network Policy Server) - Instalacion, registro y clientes RADIUS
# Ejecutar en PowerShell como administrador del dominio
# =====================================================================
Install-WindowsFeature NPAS -IncludeManagementTools

# Registrar el NPS en Active Directory (permite leer los grupos de los usuarios)
netsh nps add registeredserver

# Clientes RADIUS
New-NpsRadiusClient -Name "R1-1325" -Address 10.13.25.1 -SharedSecret "Radius#1325"
New-NpsRadiusClient -Name "SW-1325" -Address 10.13.25.2 -SharedSecret "Radius#1325"
Get-NpsRadiusClient

# Las tres directivas de red (AAA-NIVEL10-1325, AAA-NIVEL5-1325 y AAA-NIVEL0-1325)
# se crean en la consola NPS. Ver la seccion del README.
