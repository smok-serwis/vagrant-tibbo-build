#!/bin/bash
rm -rf ~/.wine/drive_c/$USER || true
mkdir ~/.wine/drive_c/$USER
cp -rf /$USER/* ~/.wine/drive_c/$USER/
env DISPLAY=:0.0
cd ~/.wine/drive_c/$USER
wine "C:\Program Files\Tibbo\TIDE\Bin\tmake.exe" $1 -b "C:\Program Files\Tibbo\TIDE\Bin" -p "C:\Program Files\Tibbo\TIDE\Platforms"
cp -f /.wine/drive_c/$USER/*.tpc /$USER
rm -rf ~/.wine/drive_c/$USER || true
