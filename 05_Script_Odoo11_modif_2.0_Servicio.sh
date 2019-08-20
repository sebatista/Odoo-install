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



