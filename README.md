# stereotool-docker
Running Stereotool in a Docker container.

Stereotool is a shareware broadcast audio processor running on your PC. See www.stereotool.com for more information. 

Currently Stereotool in Linux does not allow to run multiple instances simultaneously. You can run more than one instance of the ALSA version, but both will grab its settings from a single stereo_tool.rc file in your home-dir.
Additionaly, the ALSA version which uses PortAudio won't play nice with Jack - it does chose more or less random names.
To solve this, this Docker Image can be used to run Steretool on top of Jack1 as a netONE slave.
