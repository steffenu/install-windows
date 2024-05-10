# Vorab Setzen der Ausführungsrichtlinie (erforderlich, um Skripte auszuführen)
# Set-ExecutionPolicy Bypass -Scope Process -Force ( nur für diese Ausführung setzen )
# Set-ExecutionPolicy RemoteSigned ( Alternativ systemweit setzen )
# Diese Datei musst du als admin ausführen ./install.ps1

# Installation Programme Azure Entwickler - Cloud Team
######################################################

# Überprüfen, ob Chocolatey installiert ist
if (-not (Get-Command choco -ErrorAction SilentlyContinue)) {
    # Chocolatey ist nicht installiert, also installiere es
    Write-Host "Installiere Chocolatey..."
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
    iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}
else {
    Write-Host "Chocolatey ist bereits installiert."
}

### Hauptpakete ###

# visual studio extesions that did not install properly via chocoloatey
#'visualstudio2022-workload-azure',
#'visualstudio2022-workload-netweb',
#'visualstudio2022-workload-universal',
#'visualstudio2022-workload-manageddesktop',

# Liste der zu installierenden Haupt-Pakete
$haupt_pakete = @(
'sql-server-management-studio',
'microsoftazurestorageexplorer',
'visualstudio2022professional',
'vscode',
'git',
'postman',
'nodejs' ,
'filezilla',
'microsoft-teams')

# Anzeigen der Liste der zusätzlichen Pakete
Write-Host "Folgende Haupt - Programme können installiert werden:"
foreach ($paket in $haupt_pakete) {
    Write-Host "- $paket"
}

# Abfrage, ob Haupt Programme installiert werden sollen
$antwort_haupt = Read-Host "Möchten Sie diese Haupt Programme installieren? (y/n)"


### Zusatz-Pakete ###

# Liste der zusätzlich zu installierenden Pakete
$zusatzpakete = @('python', 'pycharm-community', 'pnpm' , 'docker-desktop' , 'filezilla' , '7zip' , 'googlechrome')

# Anzeigen der Liste der zusätzlichen Pakete
Write-Host "Folgende zusätzliche Programme können installiert werden:"
foreach ($paket in $zusatzpakete) {
    Write-Host "- $paket"
}

# Abfrage, ob Zusatz Programme installiert werden sollen
$antwort_zusatz = Read-Host "Möchten Sie zusätzliche Programme installieren? (y/n)"

### Development Extras  ###

# Liste der zusätzlich zu installierenden Development Pakete
$dev_extras = @('terraform' , 'kubernetes-cli' , 'azure-cli')

# Anzeigen der Liste der zusätzlichen Pakete
Write-Host "Folgende zusätzliche Programme können installiert werden:"
foreach ($paket in $steffens_extras) {
    Write-Host "- $paket"
}

# Abfrage, ob Dev Extras  installiert werden sollen
$antwort_dev = Read-Host "Möchten Sie Dev Extra Programme installieren? (y/n)"

### Gaming Extras  ###

# Liste der zusätzlich zu installierenden Gaming Pakete
$gaming_extras = @('discord.install' , 'steam' , 'teampspeak')

# Anzeigen der Liste der zusätzlichen Pakete
Write-Host "Folgende zusätzliche Programme können installiert werden:"
foreach ($paket in $gaming_extras) {
    Write-Host "- $paket"
}

# Abfrage, ob Dev Extras  installiert werden sollen
$antwort_gaming = Read-Host "Möchten Sie Dev Gaming Programme installieren? (y/n)"


### Steffen's Extras Pakete ###

# Liste der zusätzlich zu installierenden Pakete
$steffens_extras = @(
'gulp-cli',
'razer-synapse-3',
'logitechgaming' ,
'steelseries-engine',
'obsidian',
'teamviewer',
'vlc',
'paint.net',
'malwarebytes',
'winrar',
'calibre',
'blender' , 
'pdfxchangeeditor',
'rufus')

# Anzeigen der Liste der zusätzlichen Pakete
Write-Host "Folgende zusätzliche Programme können installiert werden:"
foreach ($paket in $steffens_extras) {
    Write-Host "- $paket"
}

# Abfrage, ob Zusatz Programme installiert werden sollen
$antwort_steffen = Read-Host "Möchten Sie Steffen's Extra Programme installieren? (y/n)"

# List of Extension IDs to check and install
$ExtensionIds = @(
    "ms-azuretools.vscode-docker",
    "ms-dotnettools.csdevkit",
    "ms-vscode.vscode-node-azure-pack",
    "Box-Of-Hats.bemhelper",
    "aaron-bond.better-comments",
    "naumovs.color-highlight",
    "mhutchie.git-graph",
    "GitHub.github-vscode-theme",
    "PKief.material-icon-theme",
    "midnightsyntax.vscode-wrap-console-log",
    "ms-vscode-remote.remote-wsl"
    # Add more extension IDs as needed
)

# Anzeigen der Liste der zusätzlichen Pakete
Write-Host "Folgende zusätzliche VSCode Extension werden empfohlen können installiert werden:"
foreach ($paket in $ExtensionIds) {
    Write-Host "- $paket"
}

# Abfrage, ob Zusatz Programme installiert werden sollen
$antwort_extensions = Read-Host "Möchten Sie folgende Vscode Extensions installieren? (y/n)"

# Abfrage, ob Zusatz Programme installiert werden sollen
$antwort_wsl = Read-Host "Möchten Sie WSL ( Windows Subsystem for Linux ) + Unbuntu for WSL installieren? (y/n)"

if ($antwort_haupt -eq "y") {

    foreach ($paket in $haupt_pakete) {
        # Überprüfen, ob das Paket bereits installiert ist
        $installiert = choco list | Select-String "^$paket\s"

        if ($installiert -eq $null) {
            # Das Paket ist nicht installiert, also installiere es
            Write-Host "Installiere $paket..."
            choco install $paket -y
        }
        else {
            # Das Paket ist bereits installiert
            Write-Host "$paket ist bereits installiert."
        }
    }
} elseif ($antwort_haupt -eq "n") {
    Write-Host "Haupt Installationen übersprungen."
} else {
    Write-Host "Ungültige Eingabe. Bitte antworten Sie mit 'y' oder 'y'."
}


if ($antwort_zusatz -eq "y") {

    foreach ($paket in $zusatzpakete) {
        # Überprüfen, ob das Paket bereits installiert ist
        $installiert = choco list | Select-String "^$paket\s"

        if ($installiert -eq $null) {
            # Das Paket ist nicht installiert, also installiere es
            Write-Host "Installiere $paket..."
            choco install $paket -y
        }
        else {
            # Das Zusatz-Paket ist bereits installiert
            Write-Host "$paket ist bereits installiert."
        }
    }
} elseif ($antwort_zusatz -eq "n") {
    Write-Host "Zusätzliche Installationen übersprungen."
} else {
    Write-Host "Ungültige Eingabe. Bitte antworten Sie mit 'y' oder 'n'."
}


if ($antwort_steffen -eq "y") {

    foreach ($paket in $steffens_extras) {
        # Überprüfen, ob das Paket bereits installiert ist
        $installiert = choco list | Select-String "^$paket\s"

        if ($installiert -eq $null) {
            # Das Paket ist nicht installiert, also installiere es
            Write-Host "Installiere $paket..."
            choco install $paket -y
        }
        else {
            # Das Paket ist bereits installiert
            Write-Host "$paket ist bereits installiert."
        }
    }
} elseif ($antwort_steffen -eq "n") {
    Write-Host "Steffens Extra Installationen übersprungen."
} else {
    Write-Host "Ungültige Eingabe. Bitte antworten Sie mit 'y' oder 'n'."
}

if ($antwort_dev -eq "y") {

    foreach ($paket in $steffens_extras) {
        # Überprüfen, ob das Paket bereits installiert ist
        $installiert = choco list | Select-String "^$paket\s"

        if ($installiert -eq $null) {
            # Das Paket ist nicht installiert, also installiere es
            Write-Host "Installiere $paket..."
            choco install $paket -y
        }
        else {
            # Das Paket ist bereits installiert
            Write-Host "$paket ist bereits installiert."
        }
    }
} elseif ($antwort_dev -eq "n") {
    Write-Host "Steffens Extra Installationen übersprungen."
} else {
    Write-Host "Ungültige Eingabe. Bitte antworten Sie mit 'y' oder 'n'."
}


if ($antwort_extensions -eq "y") {
# Get the list of currently installed extensions
$InstalledExtensions = code --list-extensions

# Iterate over each extension ID in the list
foreach ($ExtensionId in $ExtensionIds) {
    # Check if the extension is already installed
    if ($InstalledExtensions -contains $ExtensionId) {
        Write-Host "Extension $ExtensionId is already installed."
    } else {
        Write-Host "Installing extension $ExtensionId..."
        code --install-extension $ExtensionId
        Write-Host "Installation of $ExtensionId completed."
    }
}
}


if ($antwort_wsl -eq "y") {

    # Überprüfen, ob WSL installiert ist
    $wsl = Get-WindowsOptionalFeature -FeatureName Microsoft-Windows-Subsystem-Linux -Online

    Write-Host "WSL-Status: $($wsl.State)"

    if ($wsl.State -eq "Enabled") {
        Write-Host "WSL ist bereits aktiviert."
    } else {
        Write-Host "Aktiviere WSL..."
        # WSL aktivieren
        Enable-WindowsOptionalFeature -FeatureName Microsoft-Windows-Subsystem-Linux -Online -NoRestart
    }

    #https://learn.microsoft.com/de-de/windows/wsl/install-manual#step-4---download-the-linux-kernel-update-package	
    wsl.exe --update

    # Überprüfen, ob die Virtual Machine Platform aktiviert ist, was für WSL2 erforderlich ist
    $vmPlatform = Get-WindowsOptionalFeature -FeatureName VirtualMachinePlatform -Online

    if ($vmPlatform.State -eq "Enabled") {
        Write-Host "Virtual Machine Platform ist bereits aktiviert."
    } else {
        Write-Host "Aktiviere Virtual Machine Platform..."
        # Virtual Machine Platform aktivieren
        Enable-WindowsOptionalFeature -FeatureName VirtualMachinePlatform -Online -NoRestart
        # Neustart anfordern
        Write-Host "Ein Neustart könnte erforderlich sein, um die Installation abzuschließen."
    }

    # WSL auf Version 2 setzen
    wsl --set-default-version 2

    

    # Ubuntu 22.04 LTS installieren
    # Überprüfen, ob Ubuntu 22.04 bereits installiert ist
    $ubuntu = wsl -l -q | Select-String "Ubuntu-22.04"

    if ($ubuntu) {
        Write-Host "Ubuntu 22.04 LTS ist bereits installiert."
    } else {
        Write-Host "Installiere Ubuntu 22.04 LTS für WSL2..."
        # Ubuntu 22.04 LTS über Microsoft Store installieren
        # Dies erfordert den Microsoft Store, daher kann es sein, dass dieser Schritt manuell durchgeführt werden muss
        # Alternativ kann ein spezifischer Befehl verwendet werden, wenn ein direkter Download-Link oder ein Paketname bekannt ist
        wsl --install -d Ubuntu-22.04
    }
} elseif ($antwort_wsl -eq "n") {
    Write-Host "Installation von WSL und Ubuntu für WSL übersprungen."
} else {
    Write-Host "Ungültige Eingabe. Bitte antworten Sie mit 'y' für Ja oder 'n' für Nein."
}


