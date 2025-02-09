# eu4-modpack-4k

**Tested on v1.35.6**

**EXPERIMENTAL**

![GitHub repo size](https://img.shields.io/github/repo-size/danicc097/eu4-modpack-4k)

Europa Universalis IV opinionated modpack with adhoc 4k compatibility patches and custom modifiers. Recommended use with `hard` difficulty. All
original mod credits go to their respective owners:

- [Advisor Types Expanded](https://steamcommunity.com/sharedfiles/filedetails/?id=2737385499)
- [Extended Timeline](https://steamcommunity.com/sharedfiles/filedetails/?id=217416366)
  (only map and some features used to ensure other mods' compatibility)
- [Theatrum Orbis Terrarum (Addon: Extended Timeline Patch)](https://steamcommunity.com/sharedfiles/filedetails/?id=2520382130)
- [Theatrum Orbis Terrarum for 1.30+](https://steamcommunity.com/sharedfiles/filedetails/?id=1867433999)
- [Flavour and Events Expanded](https://steamcommunity.com/sharedfiles/filedetails/?id=2185445645)
- [Governments Expanded](https://steamcommunity.com/sharedfiles/filedetails/?id=1596815683)
- [Great Monuments Expanded](https://steamcommunity.com/workshop/filedetails/?id=2469419235)
- [Historic Colonization](https://steamcommunity.com/sharedfiles/filedetails/?id=2252832069)
- [Subjects Expanded](https://steamcommunity.com/sharedfiles/filedetails/?id=1834079712)
- [Proper 4K UI Project](https://steamcommunity.com/sharedfiles/filedetails/?id=2860690691)
- [Peace Treaties Expanded](https://steamcommunity.com/sharedfiles/filedetails/?id=2615504872)
- [Xorme - AI](https://steamcommunity.com/sharedfiles/filedetails/?id=2451296932)


## Installation

To ensure seamless and quick upgrades as game and mod updates come, it is recommended to follow the
setup as a git repo, since it will incrementally update everything. `git` must
be installed.
You can always default to downloading the repo as a zip and uncompressing directly.

### Windows

```powershell
git clone https://github.com/danicc097/eu4-modpack-4k # anywhere within your machine, need not be same disk. approx 6GB uncompressed
cd eu4-modpack-4k
.\setup.ps1 "<your mod folder>"
# follow instructions
```

To update on a new release:

```powershell
cd <...>/eu4-modpack-4k
git pull
# run setup again if necessary
```

## Useful links

### Mod downloads
Steer clear from steam workshop downloaders (obsolete, incomplete or suspicious
content).

Alternative links:
  - https://catalogue.smods.ru/


## 4K settings

`Paradox Interactive/Europa Universalis IV/settings.txt`: ``game_ui_scale=1.100``

## Development

### Fixing `PROPER 4K UI` on new patches:

Delete all `alerticon*.dds` files from the mod and change alerts.gui (copy paste original alerts gui and double "alerticon_startposition").
Icons will be tiny but usable... no known way to fix broken alerts.
Use .9 font size from mod to fix some overlapping (goes to gfx/fonts).


## Scaling

`TODO`: enhancing.

### .dds

```powershell
$imageFiles = Get-ChildItem -Path . -Include *.dds -File -Recurse # NOTE: ",*.tga" not included since some tga files may be old revisions...

# upscale inplace
foreach ($file in $imageFiles) {
    magick convert "$($file.FullName)" -scale 200% "$($file.FullName)"
}
```

### .tga

To handle unrecognized tga versions, use a Photoshop script:

```js
var folderPath = "<...>";

function processFolder(folder) {
  var files = folder.getFiles();

  for (var i = 0; i < files.length; i++) {
    if (files[i] instanceof File && files[i].name.match(/\.(tga)$/i)) {
      var doc = app.open(files[i]);

      doc.resizeImage(UnitValue(200, "%"), UnitValue(200, "%"));

      doc.save();

      doc.close(SaveOptions.DONOTSAVECHANGES);
    }
    else if (files[i] instanceof Folder) {
      processFolder(files[i]);
    }
  }
}

var initialFolder = new Folder(folderPath);
processFolder(initialFolder);
```
