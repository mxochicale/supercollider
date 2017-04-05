# SuperCollider

SuperCollider is a platform for audio synthesis and algorithmic composition,
used by musicians, artists, and researchers working with sound.
It is free and open source software available for Windows, macOS, and Linux.
http://supercollider.github.io/

Audio Examples   
http://supercollider.github.io/examples/audio-examples.html


# Example
Go to the example path

# Resources

http://funprogramming.org/138-Processing-talks-to-SuperCollider-via-OSC.html

http://doc.sccode.org/Classes/BeatTrack.html

http://opensoundcontrol.org/


# Installation

## First trial
Wed Nov 18 11:02:23 GMT 2015 @ Miguel Perez-Xochicale

https://launchpad.net/~supercollider/+archive/ubuntu/ppa


Stable releases of SuperCollider.

For a standard install on Ubuntu, run these terminal commands, one line at a time:

```
sudo add-apt-repository ppa:supercollider/ppa
sudo apt-get update
sudo apt-get install supercollider supercollider-gedit supercollider-plugins
```

```
$ sudo apt-get install supercollider supercollider-gedit supercollider-plugins
Reading package lists... Done
Building dependency tree       
Reading state information... Done
E: Unable to locate package supercollider-plugins
```

Then I have installed supercollider from the Ubuntu software center
supercollider-ide. IT get stuck the installation


## Second Trial
https://launchpad.net/~supercollider/+archive/ubuntu/ppa


Add the following lines to  
```
sudo vim /etc/apt/sources.list
deb http://ppa.launchpad.net/supercollider/ppa/ubuntu trusty main
deb-src http://ppa.launchpad.net/supercollider/ppa/ubuntu trusty main
```
```
E: dpkg was interrupted, you must manually run 'sudo dpkg --configure -a' to correct the problem.

map479-admin@eee320:~$ sudo dpkg --configure -a
Setting up jackd (5) ...
Setting up jackd2-firewire (1.9.9.5+20130622git7de15e7a-1ubuntu1) ...
Setting up qjackctl (0.3.10-2) ...
Setting up supercollider-server (1:3.6.6-0ubuntu1~trusty1) ...
Processing triggers for libc-bin (2.19-0ubuntu6.6) ...
Setting up supercollider (1:3.6.6-0ubuntu1~trusty1) ...
Setting up supercollider-ide (1:3.6.6-0ubuntu1~trusty1) ...

$  sudo apt-get install supercollider supercollider-gedit supercollider-plugins
E: Unable to locate package supercollider-plugins
```

## Third Trial and Successful Installation

```
sudo apt-get install supercollider supercollider-gedit supercollider-ide
```
