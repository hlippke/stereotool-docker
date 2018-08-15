# stereotool-docker
Running Stereotool in a Docker container.

Stereotool is a shareware broadcast audio processor running on your PC. Visit www.stereotool.com for more information. 

Currently Stereotool in Linux does not allow to run multiple instances simultaneously. You can run more than one instance of the ALSA version, but both will grab its settings from a single stereo_tool.rc file in your home-dir.
Additionaly, the ALSA version which uses PortAudio, won't play nice with Jack - it does chose more or less random names.
To solve this, this Docker image can be used to run Steretool on top of Jack1 running as a netONE slave.

## Prerequisites
Host machine with jackd2 oder jackd1 and Docker >= 18.x installed, I recommend jackd2.

Allow X Window requests:
```bash
# xhost local:root
```
Run Jack on your preferred soundcard and add a slave: 
```bash
$ jack_netsource -H 127.0.0.1 -N Docker1
```
Run the container:
```bash
# docker run -d --network host --privileged=true --cap-add=ALL --ulimit rtprio=99 -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix$DISPLAY --name stereotool stereotool
```
