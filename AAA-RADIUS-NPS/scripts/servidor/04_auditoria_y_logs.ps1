# =====================================================================
# Auditoria de eventos NPS (6272 / 6273), firewall y verificacion
# =====================================================================
auditpol /set /subcategory:"Servidor de directivas de redes" /success:enable /failure:enable
auditpol /get /subcategory:"Servidor de directivas de redes"

Get-NetFirewallRule | Where-Object DisplayName -like "*RADIUS*" | Select DisplayName,Enabled

Restart-Service IAS -Force

# Eventos de acceso concedido (6272) y denegado (6273)
Get-WinEvent -FilterHashtable @{LogName='Security'; Id=6272,6273} -MaxEvents 20 | Select TimeCreated,Id,Message

# Exportar la configuracion completa del NPS
netsh nps export filename="C:\NPS-1325.xml" exportPSK=YES
