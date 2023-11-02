#Chocolatey Software 
$choco_packages = @{

    "Vlc" = "vlc"
    "Discord" = "discord"
    "EGS" = "epicgameslauncher"
    "Steam" = "steam"
    "QBittorrent" = "qbittorrent"
    "Stremio" = "stremio"
    "Microsoft Visual C++" = "vcredist140"
    "Spotify" = "spotify"
    "7-Zip" = "7zip"
}
#Chocolatey Browser
$browserpackages = @{
    "Brave" = "brave"
    "LibreWolf" = "librewolf"
    "Google Chrome" = "googlechrome"
}
#Winget Software 
$winget_packages = @{
   "Vlc" = "VideoLAN.VLC"
   "Discord" = "Discord.Discord"
   "EGS" = "EpicGames.EpicGamesLauncher"
   "Steam" =  "Valve.Steam"
   "QBittorrent" = "qBittorrent.qBittorrent"
   "Stremio" = "Stremio.Stremio"
   "Microsoft Visual C++" =  "Microsoft.VCRedist.2015+.x64"
   "7zip" = "7zip.7zip"
    "Surfshark" = "Surfshark.Surfshark"
    "Spotify" =  "Spotify.Spotify"
}

function InstallSoftware {   #Chocolatey Function Installing Softwares
    $nextcontinue = $true
    while ($nextcontinue) {
        Write-Host "Select software to install:"
        Write-Host "1. Install all software"

        $i = 2
        $choco_packages.GetEnumerator() | ForEach-Object {
            Write-Host ("{0}. {1}" -f $i, $_.Key)
            $i++
        }

        $choice = Read-Host "Enter the number of the software you want to install (e.g., 1 for all, 2 for Vlc.., or 'q' to quit): "

        if ($choice -eq 'q') {
            $nextcontinue = $false
            break
        }

        if ($choice -eq 1) {
            foreach ($package in $choco_packages.Values) {
                Write-Host "Installing $package..."
                Invoke-Expression "choco install $package -y"
            }
        } elseif ($choice -ge 2) {
            $selectedAlias = ($choco_packages.Keys | Select-Object -Index ($choice - 2))
            $selectedPackage = $choco_packages[$selectedAlias]
            Write-Host "Installing $selectedAlias..."
            if ($selectedPackage) {
                Invoke-Expression "choco install $selectedPackage -y -q"
            } else {
                Write-Host "Invalid choice"
            }
        } else {
            Write-Host "Invalid choice"
        }
    }
}

function InstallBrowser{   #Chocolatey Function Installing Browser
    $browsercontinue = $true
    while ($browsercontinue){
        Write-Host "Select Browser to install"

        $i = 1
        $browserpackages.GetEnumerator() | ForEach-Object {
            Write-Host ("{0}. {1}" -f $i, $_.Key)
            $i++
        }
    
        $choice = Read-Host "Enter the number of the Browser you want to install (e.g., 1 for Brave.Brave, or 'q' to quit): "
        if ($choice -eq 'q') {
            $browsercontinue = $false
            break
        }
        if ($choice -ge 1) {
            $selectedPackage = ($browserpackages.Keys | Select-Object -Index ($choice - 1))
            $selected_appended_package = $browserpackages[$selectedPackage]
            Write-Host "Installing $selectedPackage..."
            if ($selected_appended_package) {
                Invoke-Expression "choco install $selected_appended_package -y -q"
        } else {
            Write-Host "Invalid choice. Please select a valid option."
        }
    }
}
}


function Uninstallsoftware{   #Chocolatey Function Uninstalling Softwares
    $uninstallsoftware = $true
    while ($uninstallsoftware){
        Write-Host "Select Software to Uninstall"

        $i = 1
        $choco_packages.GetEnumerator() | ForEach-Object {
            Write-Host ("{0}. {1}" -f $i, $_.Key)
            $i++
        }
        $choice = Read-Host "Enter the number of the software you want to uninstall (e.g., 1 for Brave.Brave, or 'q' to quit): "

        if ($choice -eq 'q') {
            $uninstallsoftware = $false
            break
        }

        if ($choice -ge 1) {
            $selectedAlias = ($choco_packages.Keys | Select-Object -Index ($choice - 1))
            $selectedPackage = $choco_packages[$selectedAlias]
            Write-Host "Installing $selectedAlias..."
            if ($selectedPackage) {
                Invoke-Expression "choco uninstall $selectedPackage -y"
            }else {
            Write-Host "Bug"
        }
        }else{
            Write-Host "Invalid choice. Please select a valid option."
        }

    }

}

function WingetInstallSoftware {    #Winget Function Installing Softwares 
    $wingetinstall_software = $true
    while ($wingetinstall_software) {
        Write-Host "Select Software to Install"
        Write-Host "1. Install all software"
        
        $i = 2
        $winget_packages.GetEnumerator() | ForEach-Object {
            Write-Host ("{0}. {1}" -f $i, $_.Key)
            $i++
        }
        $choice = Read-Host "Enter the number of the software you want to install (e.g., 1 for all, 2 for Vlc.., or 'q' to quit): "

        if($choice -eq 'q'){
            $wingetinstall_software = $false
            break
        }
        if ($choice -eq 1) {
            foreach ($package in $winget_packages.Values) {
                Write-Host "Installing $package..."
                winget install $package -h
            }
        }
        elseif ($choice -ge 2){
            $selectedAlias = ($winget_packages.Keys | Select-Object -Index ($choice - 2))
            $selectedPackage = $winget_packages[$selectedAlias]
            Write-Host "Installing $selectedAlias..."
            winget install $selectedPackage -h
        }
        else {
            Write-Host "Invalid action. Please select a valid option."
        }
    }
}

function WingetUninstaller{  #Winget Function Uninstalling Software
    $wingetuninstaller = $true
    while($wingetuninstaller) {
        Write-Host "Select Software to Install"

        $winget_packages.GetEnumerator() | ForEach-Object {
            Write-Host ("{0}. {1}" -f $i, $_.Key)
            $i++
        }

        $choice = Read-Host "Enter the number of the software you want to uninstall (e.g. 1. for Vlc.., or 'q' to quit): "

        if($choice -eq 'q'){
            $wingetuninstaller = $false
            break
        }
        if ($choice -ge 1) {
            $selectedAlias = ($winget_packages.Keys | Select-Object -Index ($choice - 1))
            $selectedPackage = $winget_packages[$selectedAlias]
            Write-Host "Installing $selectedAlias..."
            winget uninstall --id $selectedPackage -h
        } else {
            Write-Host "Invalid choice. Please select a valid option."
        }

    }
}

$continue = $true

while ($continue) {  

    Write-Host "Select the Package Manager"     #Selecing Package Manager
    Write-Host "1. Chocolatey"
    Write-Host "2. Winget"

    $package_manager = Read-Host "Select the package manager you want to use: "

    if $package_manager == 1{
        package_manager_access = 1
    }elseif ($package_manager == 2){
        package_manager_access = 2
    }else{
        Write-Host "Invalid action. Please select a valid option."
        break
    }
    if package_manager_access = 1{
        if (-not (Test-Path -Path "C:\ProgramData\chocolatey\choco.exe")) {
            Set-ExecutionPolicy Bypass -Scope Process -Force
            [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
            Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
        }else{
            Write-Host "Chocolatey Already Exist!"
        }
        $choco_access = $true
        while($choco_access){    #Chocolatey Package Manager Menu
            Write-Host "Chocolatey Package Manager"
            Write-Host "1. Install Software"
            Write-Host "2. Install Browser"
            Write-Host "3. Uninstall Software"
            Write-Host "4. Quit"

            $action = Read-Host "Enter the number of the action you want to perform (e.g., 1 for install, 4 to quit):"

            if ($action -eq '4') {
                $choco_access = $false
                continue
            }if ($action -eq '1') {
                InstallSoftware
            }elseif ($action -eq '2') {
                InstallBrowser
            }elseif ($action -eq '3') {
                Uninstallsoftware
            }else{
                "Invalid action. Please select a valid option."
            }    
        }
    }elseif package_manager_access = 2{
        $winget_access = $true
        While($winget_access){ #Winget Package Manager Menu 

            Write-Host "Winget Package Manager"
            Write-Host "1. Install Software"
            Write-Host "2. Install Browser"
            Write-Host "3. Uninstall Software"
            Write-Host "4. Quit"

            $action = Read-Host "Enter the number of the action you want to perform (e.g., 1 for install, 4 to quit):"

            if ($action -eq '4') {
                $winget_access = $false
                continue
            }if ($action -eq '1'){
                WingetInstallSoftware
            }elseif ($action -eq '2'){
                Write-Host "Under Development"   #Under Developement Working.
                break
            }elseif($action -eq '3'){
                WingetUninstaller
            }else{
                "Invalid action. Please select a valid option."
            }
        }
    }else {
        Write-Host "Invalid action. Please select a valid option."
    }
}

Write-Host "Thank you for Using. Made with Love :)"
