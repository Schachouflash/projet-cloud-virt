ssh -A observatoire # se connecter à cervantes
rm -rf projet-cloud-virt
git clone git@github.com:schachouflash/projet-cloud-virt.git

#supprimer les anciens fichiers de configuration
sudo rm /etc/nomad.d/nomad.hcl
sudo rm /etc/consul.d/consul.hcl

#copier les nouveaux fichiers de configuration
sudo cp ~/projet-cloud-virt/confignomadconsul/confconsulobservatoire /etc/consul/consul.hcl
sudo cp ~/projet-cloud-virt/confignomadconsul/confnomadobservatoire /etc/nomad/nomad.hcl

sudo systemctl restart nomad
sudo systemctl restart consul

consul join montagne-verte 
nomad server-join montagne-verte
exit