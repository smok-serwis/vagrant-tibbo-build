# Legal

**[TIDE](/redist/tide-tibbo-lite-5.1.3-win32.zip) is (c) [Tibbo Technology Inc.](http://tibbo.com/). By 
using this you accept Tibbo Technology's EULA for it.**

**By using this you accept Microsoft's EULA's for Core Fonts and .NET 4.0 Framework (2 licenses)**

**Other licenses may apply as well, but I'm not a lawyer**

**[LICENSE](/LICENSE) applies for sure :)**

# Compile with this project
1. Copy Vagrantfile and all .sh files to your project directory.
2. `vagrant up`
3. `vagrant ssh -c 'tibbo_build YOURFILE.tpr`
4. `vagrant destroy -f`
5. Enjoy _.tpc_s!

# Make a Vagrant box with TIDE
```bash
vagrant up
vagrant package --out tide.box
vagrant destroy -f
```

Enjoy!
