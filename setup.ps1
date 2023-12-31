param (
  [Parameter(Mandatory = $True)]
  [string]$ModDir
)

$ErrorActionPreference = 'Stop'

$modBackupDir = "${ModDir}_backup"

$confirmation = Read-Host "This will move the current mod folder to $modBackupDir. Continue? (Y/N)"
if (-not ($confirmation -eq "Y" -or $confirmation -eq "y")) {
  Exit
}

if (Test-Path -Path $modBackupDir) {
  $confirmation = Read-Host "A mod backup folder already exists. Do you want to delete it? (Y/N)"

  if ($confirmation -eq "Y" -or $confirmation -eq "y") {
    Remove-Item -Path $modBackupDir -Force -Recurse
  }
  else {
    Write-Host "Operation canceled. The mod backup folder has not been updated."
    exit
  }
}

Move-Item $ModDir $modBackupDir
New-Item -ItemType Junction -Path $ModDir -Target (Get-Location).Path

Write-Host "Mod folder $ModDir updated. Please update dlc_load.json to:"
#     "mod/beyond_typus.mod",
#     "mod/beyond_typus_orbis.mod",
Write-Host '
"enabled_mods": [
    "mod/extended_timeline_map.mod",
    "mod/extended_timeline_map_orbis.mod",
    "mod/extended_timeline_map_orbis_4k_patch.mod",
    "mod/proper_4k_ui_project.mod",
    "mod/harder-colonization.mod",
    "mod/flavors_and_events_expanded_4k.mod",
    "mod/historic_colonization.mod",
    "mod/subject_types_expanded.mod",
    "mod/great_monuments_expanded_4k.mod",
    "mod/governments_expanded_4k.mod",
    "mod/peace_treaties_expanded_4k.mod",
    "mod/advisor_types_expanded_4k.mod",
    "mod/zzz_custom_modifiers.mod",
    "mod/xorme_ai.mod"
  ],

NOTE: If you want to use the beyond typus map, replace "extended_timeline*" mods with beyond_typus and beyond_typus_orbis
'
Write-Host "To revert changes, delete $ModDir and rename the backup dir."
