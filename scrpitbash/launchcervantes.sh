ssh -A cervantes # se connecter à cervantes
rm -rf projet-cloud-virt
git clone git@github.com:schachouflash/projet-cloud-virt.git

network_interface = "vxlan100"

sudo apt-get update
sudo apt install keepalived -y

#supprimer les anciens fichiers de configuration
sudo rm /etc/nomad.d/nomad.hcl
sudo rm /etc/consul.d/consul.hcl
sudo rm /etc/keepalived/keepalived.conf

#copier les nouveaux fichiers de configuration
sudo cp ~/projet-cloud-virt/confignomadconsul/confconsulcervantes /etc/consul.d/consul.hcl
sudo cp ~/projet-cloud-virt/confignomadconsul/confnomadcervantes /etc/nomad.d/nomad.hcl
sudo cp ~/projet-cloud-virt/keepalived.conf /etc/keepalived/keepalived.conf

sudo systemctl restart nomad
sudo systemctl restart consul
sudo systemctl restart keepalived

consul join montagne-verte 
nomad server-join montagne-verte
exit