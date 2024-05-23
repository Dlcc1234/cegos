if ([System.Security.Principal.WindowsIdentity]::GetCurrent().groups -match 'S-1-5-32-544') {
    #Script à lancer en administrateur
    #Récupération automatique dernière version de 2fast
    Start-BitsTransfer -source ((Invoke-WebRequest 'https://api.github.com/repos/2fast-team/2fast/releases/latest') | ConvertFrom-Json).assets.browser_download_url -Destination './2fast.zip'
    Start-BitsTransfer -source 'https://raw.githubusercontent.com/renaudwangler/ib-labs/master/trainingMFA.2fa' -Destination "$([System.Environment]::GetFolderPath("MyDocuments"))\ibMFA.2fa"
    Expand-Archive '.\2fast.zip' -DestinationPath .\2fast -Force

    #Activation du "sideloading" d'applications sur le poste
    $devKey = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock'
    $devVal = 'AllowDevelopmentWithoutDevLicense'
    if (Get-ItemProperty -path $devKey -Name $devVal -errorAction silentlyContinue) {Set-ItemProperty -Path $devKey -Name $devVal -Value 1}
    else {New-ItemProperty -path $devKey -Name $devVal -PropertyType Dword -Value 1}

    #Installation de l'application
    set-location .\2fast
    .\Add-appDevPackage.ps1 -CertificatePath (Get-ChildItem *.cer).VersionInfo.FileName -Force
    .\Add-appDevPackage.ps1 -SkipLoggingTelemetry -Force

    #Nettoyage final
    Set-Location ..
    Remove-Item -Path .\2fast -Recurse
    Remove-Item -path .\2fast.zip

    Write-Warning -Message 'Application de MFA installée, procédez à sa configuration...' 
    Start-Process -FilePath 'explorer.exe' "shell:appsFolder\$((Get-StartApps "2fast*").appId)"}
else {
    Write-Error -Message 'Ce script d''installation est à lancer en administrateur (UAC inclus)' -Category AuthenticationError }
