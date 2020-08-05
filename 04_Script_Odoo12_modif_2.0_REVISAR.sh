#CORTAR EL SCRIPT PONERLO EN OTRO LADO
sudo su - odoo -s /bin/bash
git clone --depth 1 --branch 12.0 --single-branch https://github.com/odoo/odoo odoo/
#pip3 install -r odoo/requirements.txt
#pip3 install -r odoo/doc/requirements.txt
exit

pip3 install -r /opt/odoo/odoo/requirements.txt
pip3 install -r /opt/odoo/odoo/doc/requirements.txt

#Lo anterior se intenta reemplazar por:
#sudo su - odoo -s /bin/bash -c "git clone --depth 1 --branch 12.0 --single-branch https://github.com/odoo/odoo odoo-server/"
#sudo su - odoo -s /bin/bash -c "pip3 install -r odoo-server/requirements.txt"
#sudo su - odoo -s /bin/bash -c "pip3 install -r odoo-server/doc/requirements.txt"

#REVISAR 2 Paquetes tiran error de permisos
# Creo que muchos otros
# sphinxcontrib_jsmatch-1.0.1-py3.7-nspkg
#Falló PyPDF2
pip3 install PyPDF2
# Falló lxml
pip3 install lxml
# Falló pyldap
pip3 install pyldap
# Falló passlib
pip3 install passlib
#Falló werkzeug
pip3 install werkzeug
