# eu4-modpack-4k

![GitHub repo size](https://img.shields.io/github/repo-size/danicc097/eu4-modpack-4k)

Europa Universalis IV opinionated modpack with adhoc 4k compatibility patches. All
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

### Windows

```powershell
git clone https://github.com/danicc097/eu4-modpack-4k # anywhere within your machine, need not be same disk. approx 6GB uncompressed
cd eu4-modpack-4k
.\setup.ps1 "<your mod folder>"
# follow instructions
```

## Useful links

### Mod downloads
Steer clear from steam workshop downloaders (obsolete, incomplete or suspicious
content).

Alternative links:
  - https://catalogue.smods.ru/


## 4K settings

`Paradox Interactive/Europa Universalis IV/settings.txt`: ``game_ui_scale=1.100``

## Dev

### Fixing `PROPER 4K UI` on new patches:

Delete all `alerticon*.dds` files from the mod and change alerts.gui (copy paste original alerts gui and double "alerticon_startposition").
Icons will be tiny but usable... no known way to fix broken alerts.
Use .9 font size from mod to fix some overlapping (goes to gfx/fonts).



