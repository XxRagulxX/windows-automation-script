if (-not (Test-Path -Path "C:\ProgramData\chocolatey\choco.exe")) {
    Set-ExecutionPolicy Bypass -Scope Process -Force
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}
else{
    Write-Host "Chocolatey Already Exist!"
}
$packages = @(
    #"TechPowerUp.NVCleanstall",
    "vlc",
    "discord",
    "epicgameslauncher",
    "steam",
    "qbittorrent",
    "stremio",
    "vcredist140",
    "7zip"
)
$browserpackages = @(
    "brave",
    "librewolf",
    "googlechrome"
)

function InstallSoftware {
    $nextcontinue = $true
    while ($nextcontinue) {
        Write-Host "Select software to install:"
        Write-Host "1. Install all software"

        for ($i = 0; $i -lt $packages.Length; $i++) {
            Write-Host ("{0}. {1}" -f ($i + 2), $packages[$i])
        }
        $choice = Read-Host "Enter the number of the software you want to install (e.g., 1 for all, 2 for Vlc.., or 'q' to quit):"

        if ($choice -eq 'q') {
            $nextcontinue = $false
            break
        }

        if ($choice -eq 1) {
            foreach ($package in $packages) {
                Write-Host "Installing $package..."
                Invoke-Expression "choco install $package -y"
            }
        } elseif ($choice -ge 2) {
            $selectedPackage = $packages[$choice - 2]
            Write-Host "Installing $selectedPackage..."
            Invoke-Expression "choco install $selectedPackage -y -q"
        } else {
            Write-Host "Invalid choice"
        }
    }
}

function InstallBrowser{
    $browsercontinue = $true
    while ($browsercontinue){
        Write-Host "Select Browser to install"

        for ($i = 0; $i -lt $browserpackages.Count; $i++) {
            Write-Host "$($i + 1). $($browserpackages[$i])"
            if ($i -ge 2) {
                break
            }
        }
        $choice = Read-Host "Enter the number of the Browser you want to install: "
        if ($choice -eq 'q') {
            $browsercontinue = $false
            break
        }
        if ($choice -ge 1) {
            $selectedPackage = $browserpackages[$choice - 1]
            Write-Host "Installing $selectedPackage..."
            Invoke-Expression "choco install $selectedPackage -y"
        } else {
            Write-Host "Invalid choice. Please select a valid option."
        }
    }
}

function Uninstallsoftware{
    $uninstallsoftware = $true
    while ($uninstallsoftware){
        Write-Host "Select Software to Uninstall"

        for ($i = 0; $i -lt $packages.Count; $i++) {
            Write-Host "$($i + 1). $($packages[$i])"
        }
        $choice = Read-Host "Enter the number of the software you want to uninstall (e.g., 1 for Brave.Brave, or 'q' to quit):"

        if ($choice -eq 'q') {
            $uninstallsoftware = $false
            break
        }

        if ($choice -ge 1) {
            $selectedPackage = $packages[$choice - 1]
            Write-Host "Uninstalling $selectedPackage..."
            Invoke-Expression "choco uninstall $selectedPackage -y"
        } else {
            Write-Host "Invalid choice. Please select a valid option."
        }

    }

}

$continue = $true

while ($continue) {
    Write-Host "Select an action:"
    Write-Host "1. Install software"
    Write-Host "2. Install Browser"
    Write-Host "3. Uninstall software"
    Write-Host "4. Quit"

    $action = Read-Host "Enter the number of the action you want to perform (e.g., 1 for install, 4 to quit): "

    if ($action -eq '4') {
        $continue = $false
        continue
    }

    if ($action -eq '1') {
        InstallSoftware
    } elseif ($action -eq '2') {
        InstallBrowser
    } elseif ($action -eq '3') {
        Uninstallsoftware
    } else {
        Write-Host "Invalid action. Please select a valid option."
    }
}

Write-Host "Thank for Using. Made with Love :)"
