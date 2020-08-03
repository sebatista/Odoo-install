# SERVICIO ODOO ver 2.0
cat <<EOF > ~/odoo.service
[Unit]
Description=Odoo Open Source ERP and CRM

[Service]
Type=simple
PermissionsStartOnly=true
SyslogIdentifier=odoo
User=odoo
Group=odoo
ExecStart=/opt/odoo/odoo/odoo-bin --config=/etc/odoo.conf
WorkingDirectory=/opt/odoo/odoo/

[Install]
WantedBy=multi-user.target
EOF

sudo cp ~/odoo.service /lib/systemd/system/
sudo chmod 755 /lib/systemd/system/odoo.service
sudo chown root: /lib/systemd/system/odoo.service

# Inicializamos
sudo systemctl start odoo.service

# Detenemos
sudo systemctl stop odoo.service

# Inicializar Automáticamente
sudo systemctl enable odoo.service
