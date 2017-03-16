## VULAMP - Vagrant Ubuntu LAMP

## Assuming your project directory structure

	project
    └── frontend
          └── www
            	├── assets
            	└── index.php

## From "project" directory
	git clone git@github.com:stepanzarubin/vulamp.git

## In order to start working:
<hr>

1. Install Vagrant https://www.vagrantup.com/
2. Install Virtual Box https://www.virtualbox.org/. Make sure the disk with virtual machines has at least 50GB of free space
3. **On Windows (optional)** I recommend [https://conemu.github.io/](https://conemu.github.io/) as a console emulator
4. Install Vagrant plugins `vagrant plugin install [plugin_name]`
    1. [https://github.com/smerrill/vagrant-rsync-back](https://github.com/smerrill/vagrant-rsync-back)
    2. Default `rsync` alternatives:
        3. [https://github.com/asyrjasalo/vagrant-syncer](https://github.com/asyrjasalo/vagrant-syncer)
        4. [https://github.com/smerrill/vagrant-gatling-rsync](https://github.com/smerrill/vagrant-gatling-rsync)
        5. [https://keylocation.sg/blog/vagrant-and-unison-without-a-plugin/](https://keylocation.sg/blog/vagrant-and-unison-without-a-plugin/)

    Official plugins [https://github.com/mitchellh/vagrant/wiki/Available-Vagrant-Plugins](https://github.com/mitchellh/vagrant/wiki/Available-Vagrant-Plugins)
    you can install any other which work better for your host OS
    
    Call `vagrant plugin update` in order to update installed plugins

5. **On Windows Only** path fix required (can be actual for any plugin)
	1. Find these 2 files
        2. `C:\HashiCorp\Vagrant\embedded\gems\gems\vagrant-1.8.1\plugins\synced_folders\rsync\helper.rb`
        3. `C:\Users\YOUR USER\.vagrant.d\gems\gems\vagrant-rsync-back-0.0.1\lib\vagrant-rsync-back\command\rsync_back.rb`
	4. Both of them have this code
	```
		# rsync for Windows expects cygwin style paths, always.
		hostpath = Vagrant::Util::Platform.cygwin_path(hostpath)
	```
	3. Replace `hostpath` to be
	```
		hostpath = "/cygdrive" + Vagrant::Util::Platform.cygwin_path(hostpath)
	```

6. **On Windows Only** `Rsync` install options:
	1. Try `vulamp\extra\windows\Rsync_3.0.9.rar`
	2. `rsync` on host and VM must be compatible so get a version which works for you
	3. [https://www.cygwin.com/](https://www.cygwin.com/)
	4. [https://github.com/fdcastel/cygrsync](https://github.com/fdcastel/cygrsync) (`RSync.exe` to system `PATH` variable)
    
7. Place database file `db.gz` under `project\vulamp\db\db.gz`
8. Create `project\vulamp\Vagrantfile` based on `vagrant\Vagrantfile.example`, open it and update `virtualbox` provider setup, set as big values as you can for `memory` and `cpus` based on your hardware
9. Run Vagrant from console
    1. Go to `project\vulamp\`
    2. Run `vagrant up`
    3. Run `vagrant rsync-auto` and keep this running in the background
    
10. Import project database (**potential problem on Windows** with running `<command>` can be fixed by `dos2unix` file converter, .e.g inside Git Bash `dos2unix.exe importDb.sh importDb.sh`)
    1. Run `vagrant ssh` or connect to `vagrant@192.168.33.11` using any ssh client
    2. Run inside VM `/vulamp/sh/db/importDb.sh` or `/vulamp/sh/db/importDbPowerOff.sh` (last will also power off VM, after importing big database most likely you will restart your computer)

11. Working with database migrations
    1. Run inside guest VM migration command
    2. Run on host `vagrant rsync-back` in order to copy generated migration files back to host
    
12. Bootstrapping additional software supposed to happen via `sh/bootstraps` directory
13. Configure your host OS hosts file, e.g. on Windows add `192.168.33.11 vg.project` to `C:\Windows\System32\drivers\etc\hosts`
14. `192.168.33.11` is defined in `Vagrantfile` as `config.vm.network "private_network", ip: "192.168.33.11"`

### Start working, access project via `http://vg.project/`
