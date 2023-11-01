# Define an array of package names
$displayoptions = @(
    "Browser",
    "communication",
    "DEV-Tools",
    "Game Launchers",
    "Microsoft tools",
    "Multi-media Tools",
    "Utilities",
    "My Config"
)

$packages = @{
    "browserpackages" = @{
        "All" = @(
            "LibreWolf.Librewolf",
            "Brave.Brave",
            "Google.Chrome",
            "Mozilla.Firefox"
        )
        "LibreWolf" = "LibreWolf.Librewolf"
        "Brave"     = "Brave.Brave"
        "Chrome"    = "Google.Chrome"
        "Firefox"   = "Mozilla.Firefox"
    }

    "communicationpackages" = @{
        "All"      = @(
            "Discord.Discord",
            "Telegram.TelegramDesktop",
            "WhatsApp.WhatsApp",
            "Microsoft.Teams"
        )
        "Discord"  = "Discord.Discord"
        "Telegram" = "Telegram.TelegramDesktop"
        "WhatsApp" = "WhatsApp.WhatsApp"
        "Teams"    = "Microsoft.Teams"
    }

    "devpackages"           = @{
        "All"                        = @(
            "Git.Git",
            "Microsoft.VisualStudioCode",
            "GitHub.GitHubDesktop",
            "Postman.Postman",
            "Python.Python.3.11",
            "Oracle.JDK.19",
            "OpenJS.NodeJS"
        )
        "Git"                        = "Git.Git"
        "Microsoft VisualStudioCode" = "Microsoft.VisualStudioCode"
        "GitHub"                     = "GitHub.GitHubDesktop"
        "Postman"                    = "Postman.Postman"
        "Python.3.11"                = "Python.Python.3.11"
        "Oracle JDK 19"              = "Oracle.JDK.19"
        "NodeJS"                     = "OpenJS.NodeJS"
        "SublimeHQ"                  = "SublimeHQ.SublimeText.4"
        "Docker"                     = "Docker.DockerDesktop"
    }

    "gamepackages"          = @{
        "All"        = @(
            "EpicGames.EpicGamesLauncher",
            "Valve.Steam",
            "GOG.Galaxy",
            "RiotGames.Valorant.AP"
        )
        "EpicGames"  = "EpicGames.EpicGamesLauncher"
        "Steam"      = "Valve.Steam"
        "GOG Galaxy" = "GOG.Galaxy"
        "RiotGames"  = "RiotGames.Valorant.AP"
    }

    "microsoftpackages"     = @{
        "All"                         = @(
            "Microsoft.VCRedist.2015+.x64",
            "Microsoft.DotNet.SDK.7",
            "Microsoft.PowerShell",
            "Microsoft.OneDrive"
        )
        "Microsoft VCRedist 2015 x64" = "Microsoft.VCRedist.2015+.x64"
        "Microsoft DotNet SDK 7"      = "Microsoft.DotNet.SDK.7"
        "Microsoft PowerShell"        = "Microsoft.PowerShell"
        "Microsoft OneDrive"          = "Microsoft.OneDrive"
    }

    "multimediapackages"    = @{
        "All"        = @(
            "Spotify.Spotify",
            "Shabinder.SpotiFlyer",
            "VideoLAN.VLC"
        )
        "Spotify"    = "Spotify.Spotify"
        "Spotiflyer" = "Shabinder.SpotiFlyer"
        "VLC"        = "VideoLAN.VLC"
    }

    "ultilitypackages"      = @{
        "All"             = @(
            "7zip.7zip",
            "Surfshark.Surfshark",
            "qBittorrent.qBittorrent",
            "TechPowerUp.NVCleanstall",
            "CPUID.CPU-Z",
            "AnyDeskSoftwareGmbH.AnyDesk",
            "Guru3D.Afterburner",
            "Bitwarden.Bitwarden",
            "PrestonN.FreeTube"  
        )
        "7zip"            = "7zip.7zip"
        "Surfshark"       = "Surfshark.Surfshark"
        "qBittorrent"     = "qBittorrent.qBittorrent"
        "NVClean"         = "TechPowerUp.NVCleanstall"
        "CPU-Z"           = "CPUID.CPU-Z"
        "AnyDesk"         = "AnyDeskSoftwareGmbH.AnyDesk"
        "MSI Afterburner" = "Guru3D.Afterburner"
        "Bitwarden"       = "Bitwarden.Bitwarden"
        "FreeTube"        = "PrestonN.FreeTube"
    }

    "myconfigpackages"      = @{
        "All"                          = @(
            "LibreWolf.Librewolf",
            "Microsoft.VisualStudioCode",
            "Discord.Discord",
            "EpicGames.EpicGamesLauncher",
            "Valve.Steam",
            "Microsoft.VCRedist.2015+.x64",
            "7zip.7zip",
            "Surfshark.Surfshark",
            "qBittorrent.qBittorrent",
            "VideoLAN.VLC",
            "TechPowerUp.NVCleanstall",
            "Guru3D.Afterburner",
            "PrestonN.FreeTube"
        )
        "LibreWolf"                    = "LibreWolf.Librewolf"
        "Microsoft Visual Studio Code" = "Microsoft.VisualStudioCode"
        "Discord"                      = "Discord.Discord"
        "EpicGames"                    = "EpicGames.EpicGamesLauncher"
        "Steam"                        = "Valve.Steam"
        "Microsoft VCRedist 2015+ x64" = "Microsoft.VCRedist.2015+.x64"
        "7zip "                        = "7zip.7zip"
        "Surfshark"                    = "Surfshark.Surfshark"
        "qBittorrent"                  = "qBittorrent.qBittorrent"
        "VLC"                          = "VideoLAN.VLC"
        "NVClean"                      = "TechPowerUp.NVCleanstall"
        "MSI Afterburner"              = "Guru3D.Afterburner"
        "FreeTube"                     = "PrestonN.FreeTube"
    }
}
Function DisplayPackages {
    $display_option_legnth = $displayoptions.Length
    while ($true) {
        # Display package options
        Write-Host "
    こんにちは, Welcome to DEFALT's windows Package installer" -ForegroundColor Red
        for ($i = 0; $i -lt $display_option_legnth; $i++) {
            Write-Host ("  {0}. {1}" -f ($i + 1), $displayoptions[$i] ) -ForegroundColor Yellow 
        }
        Write-Host ("  {0}. Exit" -f ($display_option_legnth + 1)) -ForegroundColor Yellow
        # Get user input
        $temp = Read-Host "Enter the option number" 
        Write-Host " "
        $selection = [int]$temp
        #Exit
        if ($selection -eq ($display_option_legnth + 1)) {
            Write-Host "
    
         Exiting さようなら.......
         
         " -ForegroundColor Green
            #Exit Loop
            break 
        }
        #Install packages
        Function InstallPackages {
            $packagearray = @(
                "browserpackages",
                "communicationpackages",
                "devpackages",
                "gamepackages",
                "microsoftpackages",
                "multimediapackages",
                "ultilitypackages",
                "myconfigpackages"
            )
            $selecteduseroption = $packagearray[$selection - 1]
            $neededpackage = $packages[$selecteduseroption]
            [string[]] $allpackages = $neededpackage.keys | Sort-Object
            $key_count = 0
            foreach ($keys in $allpackages) { 
                Write-Host ("{0}. {1}" -f ($key_count + 1), $keys) 
                $key_count++
            }
            Write-Host ("{0}. Go Back" -f ($neededpackage.count + 1)) -ForegroundColor Yellow
            $Select_temp = Read-Host "Select your option" :
            $selectedoption = [int]$Select_temp
            if ($selectedoption -le $neededpackage.count) {
                $confirmedoption = $allpackages[$selectedoption - 1 ]
                if ($confirmedoption -eq "All") {
                    foreach ($packs in $neededpackage[$confirmedoption]) {
                        winget install $packs --silent
                    }
                }
                else {
                    winget install $neededpackage[$confirmedoption] --silent
                }
            }
            elseif ($selectedoption -eq $neededpackage.count + 1) {
                Write-Host "
                 
                Reverting to menu...
                    
                    " -ForegroundColor Cyan
                DisplayPackages
                break
            }
        }
        InstallPackages
    }   
}
# Call the InstallPackages function
DisplayPackages