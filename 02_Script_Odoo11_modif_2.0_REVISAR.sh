
# Creamos usuario, grupo y home para odoo
sudo adduser --system --home=/opt/odoo --group odoo
sudo usermod -aG sudo odoo
sudo passwd odoo


# PROBAR pip install gdata que en la página de python dice que se puede así. Es para aplicaciones Google
# https://pypi.org/project/gdata/
#pip3 install gdata
#o
#pip install gdata

#CORTAR EL SCRIPT PONERLO EN OTRO LADO
# Instalamos Gdata
#cd /opt/odoo
#sudo wget https://pypi.python.org/packages/a8/70/bd554151443fe9e89d9a934a7891aaffc63b9cb5c7d608972919a002c03c/gdata-2.0.18.tar.gz
#sudo tar zxvf gdata-2.0.18.tar.gz
#sudo rm gdata-2.0.18.tar.gz
#sudo chown -R odoo: gdata-2.0.18
#sudo -s
#PROBAR
#sudo -s /bin/bash -c "python /opt/odoo/gdata-2.0.18/setup.py install"
#cd /opt/odoo/gdata-2.0.18/
#python setup.py install
#exit
