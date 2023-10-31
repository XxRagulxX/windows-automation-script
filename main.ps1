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
    "QBittorrent",
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
    Write-Host "
    こんにちは, Welcome to DEFALT's windows Package installer 
    " -ForegroundColor Red
    Write-Host "
Select packages to install:
    " -ForegroundColor Magenta
    Write-Host ("  {0}. Install all packages" -f (0)) -ForegroundColor DarkGreen
    for ($i = 0; $i -lt $packagesdisplay.Length; $i++) {
        if ($i -le 8){ 
        Write-Host ("  {0}. {1}" -f ($i + 1), $packagesdisplay[$i]  ) -ForegroundColor Yellow }
        else{
        Write-Host (" {0}. {1}" -f ($i + 1), $packagesdisplay[$i]  ) -ForegroundColor Yellow }
    }
    Write-Host (" {0}. Exit" -f ($packagesdisplay.Length + 1)) -ForegroundColor Yellow
    
    # Get user input
    $temp = Read-Host "Enter the option number" 
    Write-Host " "
    $selection = [int]$temp
    if ($selection -eq ($packagesdisplay.Length + 1)) {
     Write-Host "

     Exiting さようなら.......
     
     " -ForegroundColor Green
     #Exit Loop
     break }
    elseif ($selection -eq (0)) {
        # Install all packages
        for ($i = 0; $i -lt $browserpackages.Length; $i++) {
             Write-Host ("{0}. {1}" -f ($i + 1), $packagesdisplay[$i]) -ForegroundColor Yellow }
        Write-Host ("{0}. Go Back" -f ($browserpackages.Length + 1)) -ForegroundColor Yellow
        $BrowserSelection = Read-Host "Select your browser" 
        #install Browser
        if ($BrowserSelection -le $browserpackages.length) {
            $confirmedbrowser = $browserpackages[$BrowserSelection - 1]
            $display_text= $packagesdisplay[$BrowserSelection - 1]
            Write-Host $confirmedbrowser
            Write-Host " 
        Installing $display_text...

            " -ForegroundColor Cyan
            winget install $confirmedbrowser --silent
        }
        elseif($BrowserSelection -eq $browserpackages.length + 1) {
             Write-Host "
         
        Reverting to menu...
            
            " -ForegroundColor Cyan
            InstallPackages
            break
           }
        foreach ($package in $packages) {
         Write-Host "
        Installing $package...

         " -ForegroundColor Cyan
         winget install $package --silent } 
    }
    elseif ($selection -ge 1 -and $selection -le $browserpackages.Length){
       # Install the selected package
       $selectedPackage = $browserpackages[$selection - 1]
       $display_text= $packagesdisplay[$selection - 1]
       Write-Host "
    Installing $display_text...

       " -ForegroundColor Cyan
       winget install $selectedPackage --silent      
    }
    elseif ($selection -gt $browserpackages.Length) {
        $selectedPackage = $packages[$selection - ($browserpackages.Length + 1)]
        $display_text= $packagesdisplay[$selection - 1]
        Write-Host "    
    Installing $display_text...

        " -ForegroundColor Cyan
        winget install $selectedpackage --silent
    } 
  }
}
# Call the InstallPackages function
InstallPackages
