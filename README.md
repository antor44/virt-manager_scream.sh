# virt-manager_scream_bash.sh
This is a Bash script that automatically launches and stops Scream along with Virt Manager, scream and bash script should be in the same directory. You can replace the default shortcut of Virt Manager with this script.

Scream provides high-quality sound in Virt Manager, mostly for GPU passthrough (IOMMU) virtual machines. Scream is one of the sound options for Windows guests without the need to add sound cards. The sound is played through Pulseaudio, JACK or ALSA daemon on the host machine via a local network transmission. To use it, a local network bridge between the host and virtual machines should be configured. Otherwise, you can configure IVSHMEM alternative mode. Scream supports high sample rates and up to 7.1 channels, the limit is imposed by your host sound card.


Scream repository:

https://github.com/duncanthrax/scream
