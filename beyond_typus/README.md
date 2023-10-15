# unit sizes

0.35 seems to fit best since some provinces are minuscule.

```bash
find . -type f -name "*unit*.gfx" -exec sed -i -E 's/scale = 0\.[0-9]+/scale = 0.35/g' {} \;
# for dlc files, check get_dlc_units.ps1
```
