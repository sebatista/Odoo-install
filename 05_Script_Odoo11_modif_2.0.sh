
# Creamos carpeta para Log
sudo mkdir /var/log/odoo
sudo chown -R odoo:root /var/log/odoo

# Creamos el archivo de configuracion de odoo
cat <<EOF > ~/odoo-server.conf
[options]
; admin_passwd = admin
db_host = False
db_port = False
db_user = odoo
db_password = False
addons_path = /opt/odoo/odoo-server/addons,/opt/odoo/addons/account-financial-tools-11.0,/opt/odoo/addons/argentina-sale-11.0,/opt/odoo/addons/reporting-engine-11.0,/opt/odoo/addons/account-payment-11.0,/opt/odoo/addons/miscellaneous-11.0,/opt/odoo/addons/stock-11.0,/opt/odoo/addons/aeroo_reports-11.0,/opt/odoo/addons/odoo-argentina-11.0,/opt/odoo/addons/argentina-reporting-11.0,/opt/odoo/addons,
logfile = /var/log/odoo/odoo-server.log
EOF

sudo cp ~/odoo-server.conf /etc/odoo-server.conf
sudo chown odoo: /etc/odoo-server.conf
sudo chmod 640 /etc/odoo-server.conf


# SERVICIO ODOO ver 2.0
cat <<EOF > ~/odoo-server.service
[Unit]
Description=Odoo Open Source ERP and CRM

[Service]
Type=simple
PermissionsStartOnly=true
SyslogIdentifier=odoo-server
User=odoo
Group=odoo
ExecStart=/opt/odoo/odoo-server/odoo-bin --config=/etc/odoo-server.conf
WorkingDirectory=/opt/odoo/odoo-server/

[Install]
WantedBy=multi-user.target
EOF

sudo cp ~/odoo-server.service /lib/systemd/system/
sudo chmod 755 /lib/systemd/system/odoo-server.service
sudo chown root: /lib/systemd/system/odoo-server.service

# Inicializamos
sudo systemctl start odoo-server

# Detenemos
sudo systemctl stop odoo-server

# Inicializar Automáticamente
sudo systemctl enable odoo-server.service



