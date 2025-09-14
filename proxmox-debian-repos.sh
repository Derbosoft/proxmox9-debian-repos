#!/bin/bash
# Sauvegarde des fichiers existants
mkdir -p /root/apt-backup
cp /etc/apt/sources.list.d/* /root/apt-backup/ 2>/dev/null || true

# Nettoyage des dépôts enterprise
rm -f /etc/apt/sources.list.d/pve-enterprise.sources /etc/apt/sources.list.d/ceph.sources

# Création des dépôts Debian (Trixie + sécurité + updates)
cat >/etc/apt/sources.list.d/debian.sources <<'EOF'
Types: deb
URIs: http://deb.debian.org/debian
Suites: trixie trixie-updates
Components: main contrib non-free non-free-firmware
Signed-By: /usr/share/keyrings/debian-archive-keyring.gpg

Types: deb
URIs: http://security.debian.org/debian-security
Suites: trixie-security
Components: main contrib non-free non-free-firmware
Signed-By: /usr/share/keyrings/debian-archive-keyring.gpg
EOF

# Création du dépôt Proxmox no-subscription
cat >/etc/apt/sources.list.d/proxmox.sources <<'EOF'
Types: deb
URIs: http://download.proxmox.com/debian/pve
Suites: trixie
Components: pve-no-subscription
Signed-By: /usr/share/keyrings/proxmox-archive-keyring.gpg
EOF

# Mise à jour des clés au cas où
apt install -y debian-archive-keyring proxmox-archive-keyring

# Mise à jour des paquets
apt update
