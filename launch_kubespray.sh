

cd ./kubespray
source venv/bin/activate

eval $(ssh-agent)

chmod 600 ../id_stagiaire/id_stagiaire
ssh-add ../id_stagiaire/id_stagiaire

ansible-playbook -i inventory/k8slaab/inventory.ini -u root cluster.yml