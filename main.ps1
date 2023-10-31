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
    "Stremio",
    "Microsoft.Visual.c++.2015-2022.64",
    "7zip",
    "Surfshark",
    "Spotify"
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
    "Stremio.Stremio",
    "Microsoft.VCRedist.2015+.x64",
    "7zip.7zip",
    "Surfshark.Surfshark",
    "Spotify.Spotify"
)

Function InstallPackages {

while ($true) {
    # Display package options
    Write-Host "Select packages to install:"
    Write-Host ("{0}. Install all packages" -f (0))
    for ($i = 0; $i -lt $packagesdisplay.Length; $i++) {
        Write-Host ("{0}. {1}" -f ($i + 1), $packagesdisplay[$i])
    }
    Write-Host ("{0}. Exit" -f ($packagesdisplay.Length + 1))
    
    # Get user input
    $selection = Read-Host "Enter the option number"
    if ($selection -eq ($packagesdisplay.Length + 1)) {
     Write-Host "Exiting......." #Exit Loop
     break }
    elseif ($selection -eq (0)) {
        # Install all packages
        $BrowserSelection = Read-Host "What browser U need? 
        1.LibreWolf
        2.Brave
        3.Chrome"
        $confirmedbrowser = $browserpackages[$BrowserSelection - 1]
        winget install $confirmedbrowser
        foreach ($package in $packages) {
            if (-not (IsInstalled $package)) {
                    Write-Host "Installing $package..."
                    winget install $package
                }
                else {
                    Write-Host "$package is already installed."
                } }
    }
    elseif ($selection -ge 1 -and $selection -le $browserpackages.Length) {
       # Install the selected package
       $selectedPackage = $browserpackages[$selection - 1]
      winget install $selectedPackage
              
    }
    elseif ($selection -gt $browserpackages.Length) {
        $selectedPackage = $packages[$selection - ($browserpackages.Length + 1)]
        winget install $selectedpackage
      } 
     }
    }
# Call the InstallPackages function
InstallPackages
