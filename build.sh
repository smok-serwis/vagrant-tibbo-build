#!/bin/bash
# first argument: name of .tpr file

vagrant ssh -c 'cd /home/vagrant/.wine/drive_c/users; export DISPLAY=:0.0; wine "C:\Program Files\Tibbo\TIDE\Bin\tmake.exe" $1 -b "C:\Program Files\Tibbo\TIDE\Bin" -p "C:\Program Files\Tibbo\TIDE\Platforms"'
