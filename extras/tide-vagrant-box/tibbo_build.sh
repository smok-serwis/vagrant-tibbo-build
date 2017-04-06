#!/bin/bash
rm -rf \$USER/.wine/drive_c/comp || true
mkdir \$USER/.wine/drive_c/comp
cp -rf /vagrant/* \$USER/.wine/drive_c/comp/
env DISPLAY=:0.0
cd \$USER/.wine/drive_c/comp
wine "C:\Program Files\Tibbo\TIDE\Bin\tmake.exe" $1 -b "C:\Program Files\Tibbo\TIDE\Bin" -p "C:\Program Files\Tibbo\TIDE\Platforms"
cp -f /.wine/drive_c/comp/*.tpc /vagrant
rm -rf \$USER/.wine/drive_c/comp || true
