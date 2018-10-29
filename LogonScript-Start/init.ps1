function init {
   $printNum = 1

    Write-Host "Which startup set would you like to initialize?"
    foreach ( $startup in $UserStartups.user.StartupSet) {
        Write-Host "$printNum)  $($startup.Name)"
        $printNum++
    }
    Write-Host "$printNum)  Print programs in each set"
    $selection = Read-Host -Prompt "Selection "
    if ( $selection -gt $printNum ) {
        cls
        Write-Host "Please try again"
        init
    } elseif ( $selection -ne $printNum ) {
        startPrograms $selection
    } else {
        printPrograms
    }
}

function printPrograms {
    $i = 0
    foreach ( $startup in $UserStartups.user.StartupSet ) {
        $tempList = " "
        foreach ( $childNode in $startup.ChildNodes ) {
            if ( $i -eq 0 ) {
                $tempList = $childNode.'#text' + ":"
                $i++
            } else {
                $tempList = $tempList + ", " + $childNode.GetAttribute("name")
                $i++
            }
        }
        Write-Host $tempList
        $i = 0
    }
    init
}

function startPrograms {
    param([string]$set)
    $j = 0
    foreach ( $program in $UserStartups.user.StartupSet[$set - 1].ChildNodes ) {
        if ( $j -ne 0 ) {
            $temp = $program.'#text'
            switch ( $program.GetAttribute("name") ) {
                "Spotify" {
                    Write-Host "Starting" $program.GetAttribute("name")
                    start $temp
                    startSpotify
                }
                "Chrome" {
                    Write-Host "Starting" $program.GetAttribute("name")
                    start chrome.exe --restore-last-session
                }
                "Atom" {
                    Write-Host "Starting" $program.GetAttribute("name")
                    & $env:USERPROFILE\AppData\Local\atom\Update.exe --processStart 'atom.exe'
                }
                default {
                    Write-Host "Starting" $program.GetAttribute("name")
                    start $temp
                }
            }
        }
        $j++
        Start-Sleep -s 2
    }
}

function startSpotify {
    Start-Sleep -s 10
    Set-SpotifyTrack -Resume
}

# ACTUAL START OF SCRIPT
cd C:\
cd $env:USERPROFILE\WinLogon\
#https://github.com/bmsimons/ps-spotify
Import-Module $env:USERPROFILE\WinLogon\PowershellPlugins\ps-spotify\ps-spotify.psm1
[xml]$UserStartups = Get-Content -Path ToOpen.xml
cls
init