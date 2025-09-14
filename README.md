# Proxmox Debian Repos

Script Bash pour remplacer les dépôts **entreprise** de Proxmox par les dépôts **Debian Trixie** + **Proxmox no-subscription**.

## 📌 Utilisation

Sur votre serveur Proxmox :
```bash
wget https://raw.githubusercontent.com/Derbosoft/proxmox-debian-repos/main/proxmox-debian-repos.sh
chmod +x proxmox-debian-repos.sh
./proxmox-debian-repos.sh

📜 Détails
Sauvegarde des fichiers existants dans /root/apt-backup
Suppression des dépôts enterprise (pve-enterprise, ceph)
Ajout des dépôts Debian + Proxmox no-subscription
Mise à jour des clés et des paquets

⚖️ Licence
Distribué sous licence MIT.
