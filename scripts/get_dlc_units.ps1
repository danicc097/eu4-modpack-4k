$sourceDirectory = "C:\Games\Europa Universalis IV\dlc"
$tempPath = "D:\Downloads\temp_unit_pack_extraction"
$destinationDirectory = "D:\Downloads\extracted_unit_packs"

Remove-Item -Recurse -Force $tempPath
Remove-Item -Recurse -Force $destinationDirectory
mkdir $tempPath
mkdir $destinationDirectory

$folders = Get-ChildItem -Path $sourceDirectory -Directory | Where-Object { $_.Name -like "*unit_pack" }

foreach ($folder in $folders) {
  $zipFiles = Get-ChildItem -Path $folder.FullName -File -Filter *.zip

  foreach ($zipFile in $zipFiles) {
    $extractedFolder = Join-Path -Path $tempPath -ChildPath $folder.Name
    if (-not (Test-Path -Path $extractedFolder -PathType Container)) {
      New-Item -Path $extractedFolder -ItemType Directory
    }

    Add-Type -AssemblyName System.IO.Compression.FileSystem
    [System.IO.Compression.ZipFile]::OpenRead($zipFile.FullName).Entries | ForEach-Object {
      if ($_.FullName -like "interface/assets/*") {
        $destinationPath = Join-Path -Path $extractedFolder -ChildPath $_.Name
        $_.Open().CopyTo([System.IO.File]::Create($destinationPath))
      }
    }
  }
}

$gfxFiles = Get-ChildItem -Path $tempPath -File -Recurse -Filter *.gfx
foreach ($gfxFile in $gfxFiles) {
  # change new scale accordingly
  (Get-Content -Path $gfxFile.FullName) | ForEach-Object { $_ -replace 'scale = 0\.[0-9]+', 'scale = 0.35' } | Set-Content -Path $gfxFile.FullName

  $destinationPath = Join-Path -Path $destinationDirectory -ChildPath $gfxFile.Name
  Write-Host "gfxFile.FullName: $($gfxFile.FullName)"
  Write-Host "Destination Path: $destinationPath"
  Move-Item -Path $gfxFile.FullName -Destination $destinationPath -Force
}
