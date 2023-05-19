sh launchcervantes.sh
sh launchrotonde.sh
sh launchobservatoire.sh

ssh montagne-verte # se connecter à rotonde
cd projet-cloud-virt
cd nomad
nomad job run nomadconf.hcl