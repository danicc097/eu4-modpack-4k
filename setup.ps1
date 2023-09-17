$modDir = "D:\mod"
$modBackupDir = "${modDir}_backup"

if (Test-Path -Path $modBackupDir) {
  $confirmation = Read-Host "A 'mod_backup' folder already exists. Do you want to delete it? (Y/N)"

  if ($confirmation -eq "Y" -or $confirmation -eq "y") {
    Remove-Item -Path $modBackupDir -Force -Recurse
    Write-Host "The 'mod_backup' folder has been deleted."
  }
  else {
    Write-Host "Operation canceled. The 'mod_backup' folder has not been deleted."
    exit
  }
}

New-Item -ItemType Junction -Path $modDir -Target (Get-Location).Path

Write-Host "Mod folder $modDir updated. Please update dlc_load.json with:"
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
    "mod/xorme_ai.mod"
  ],
'
