# Define an array of package names
$packagesdisplay = @(
    "LibreWolf",
    "Brave",
    "Google Chrome",
    "NVClean",
    "VLC",
    "Discord",
    "EpicGamesLauncher",
    "Steam",
    "qBittorrent",
    "VLC",
    "Stremio",
    "Microsoft.Visual.c++.2015-2022.64",
    "7zip"
)

$browserpackages = @(
    "LibreWolf.Librewolf",
    "Brave.Brave",
    "Google.Chrome"
)

$packages = @(
    "TechPowerUp.NVCleanstall",
    "VideoLAN.VLC",
    "Discord.Discord",
    "EpicGames.EpicGamesLauncher",
    "Valve.Steam",
    "qBittorrent.qBittorrent",
    "VideoLAN.VLC",
    "Stremio.Stremio",
    "Microsoft.VCRedist.2015+.x64",
    "7zip.7zip"
)

# Function to display package options and install
Function InstallPackages {
    # Display package options
    Write-Host "Select packages to install:"
    Write-Host ("{0}. Install all packages" -f (0))
    for ($i = 0; $i -lt $packagesdisplay.Length; $i++) {
        Write-Host ("{0}. {1}" -f ($i + 1), $packagesdisplay[$i])
    }

    # Get user input
    $selection = Read-Host "Enter the option number"
    if ($selection -eq (0)) {
        # Install all packages
        $BrowserSelection = Read-Host "What browser U need? 
        1.LibreWolf
        2.Brave
        3.Chrome"
        $confirmedbrowser = $browserpackages[$BrowserSelection - 1]
        winget install $confirmedbrowser
        foreach ($package in $packages) {
            winget install $package
        }

    }
    elseif ($selection -ge 1 -and $selection -le $browserpackages.Length) {
        # Install the selected browser package
        $selectedPackage = $browserpackages[$selection - 1]
        winget install $selectedPackage
    }
    elseif ($selection -ge ($browserpackages.Length + 1) -and $selection -le $packages.Length) {
        # Install the selected package
        $selectedPackage = $packages[$selection - $browserpackages.Length - 1]
        winget install $selectedPackage
    } else {
        Write-Host "Invalid selection. Please enter a valid option number."
    }
}

# Call the InstallPackages function
InstallPackages
