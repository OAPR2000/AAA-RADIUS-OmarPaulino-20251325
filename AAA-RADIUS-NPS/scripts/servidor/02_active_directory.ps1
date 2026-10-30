# =====================================================================
# Dominio Omar1325.local - OU, grupos y usuarios para AAA
# Ejecutar en PowerShell como administrador del dominio
# =====================================================================
New-ADOrganizationalUnit -Name "AAA-1325" -Path "DC=Omar1325,DC=local"
$ou = "OU=AAA-1325,DC=Omar1325,DC=local"

# Grupos (uno por nivel de privilegio)
New-ADGroup -Name GRP-NIVEL0-1325  -GroupScope Global -GroupCategory Security -Path $ou -Description "Privilegio 0 en router y switch"
New-ADGroup -Name GRP-NIVEL5-1325  -GroupScope Global -GroupCategory Security -Path $ou -Description "Privilegio 5 en router y switch"
New-ADGroup -Name GRP-NIVEL10-1325 -GroupScope Global -GroupCategory Security -Path $ou -Description "Privilegio 10 en router y switch"

# Usuarios
New-ADUser -Name "Usuario Nivel 0"  -SamAccountName nivel0-1325  -UserPrincipalName nivel0-1325@Omar1325.local  -Path $ou -AccountPassword (ConvertTo-SecureString 'N0#Lab2025!'  -AsPlainText -Force) -Enabled $true -PasswordNeverExpires $true
New-ADUser -Name "Usuario Nivel 5"  -SamAccountName nivel5-1325  -UserPrincipalName nivel5-1325@Omar1325.local  -Path $ou -AccountPassword (ConvertTo-SecureString 'N5#Lab2025!'  -AsPlainText -Force) -Enabled $true -PasswordNeverExpires $true
New-ADUser -Name "Usuario Nivel 10" -SamAccountName nivel10-1325 -UserPrincipalName nivel10-1325@Omar1325.local -Path $ou -AccountPassword (ConvertTo-SecureString 'N10#Lab2025!' -AsPlainText -Force) -Enabled $true -PasswordNeverExpires $true

# Membresias
Add-ADGroupMember -Identity GRP-NIVEL0-1325  -Members nivel0-1325
Add-ADGroupMember -Identity GRP-NIVEL5-1325  -Members nivel5-1325
Add-ADGroupMember -Identity GRP-NIVEL10-1325 -Members nivel10-1325

# Verificacion
Get-ADGroupMember GRP-NIVEL0-1325  | Select Name,SamAccountName
Get-ADGroupMember GRP-NIVEL5-1325  | Select Name,SamAccountName
Get-ADGroupMember GRP-NIVEL10-1325 | Select Name,SamAccountName
