# Drivers / hardware (maurisio desktop)

- GPU: NVIDIA GeForce RTX 3050 6GB (GA107) -> driver `nvidia-open` 615.x (+ `libva-nvidia-driver`), módulos `nvidia_drm`
- CPU: AMD (Ryzen, chipset Matisse/X570) -> `amd-ucode`
- Audio: pipewire + wireplumber (`pipewire-alsa/-pulse/-jack`), `pwvucontrol`
- Bluetooth: `bluez`, `bluez-utils`
- Kernel: `linux` + `linux-firmware`
- Red: cable `enp4s0`
- Mouse: `accel_profile = flat`, `sensitivity = 0` (ver .config/caelestia/hypr-user.lua)
- Teclado: layout `us`, repeat 250ms / 35

## En Omarchy (ya trae NVIDIA configurado)
Omarchy detecta NVIDIA en la instalación (instala nvidia-open + variables env de Hyprland).
Solo verificar tras instalar: `nvidia-smi` y `pacman -Q nvidia-open`.
