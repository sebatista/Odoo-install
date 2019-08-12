
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
addons_path = 

/opt/odoo/addons,/opt/odoo/odoo-server/addons,/opt/odoo/addons/account-financial-tools-11.0,/opt/odoo/addons/account-payment-11.0,/opt/odoo/addons/aeroo_reports-11.0,/opt/odoo/addons/argentina-reporting-11.0,/opt/odoo/addons/argentina-sale-11.0,/opt/odoo/addons/miscellaneous-11.0,/opt/odoo/addons/odoo-argentina-11.0,/opt/odoo/addons/partner_identification,/opt/odoo/addons/reporting-engine-11.0,/opt/odoo/addons/stock-11.0,/opt/odoo/addons/oca/oca-account-analytic,/opt/odoo/addons/oca/oca-account-financial-reporting,/opt/odoo/addons/oca/oca-account-financial-tools,/opt/odoo/addons/oca/oca-account-invoicing,/opt/odoo/addons/oca/oca-account-payment,/opt/odoo/addons/oca/oca-commission,/opt/odoo/addons/oca/oca-contract,/opt/odoo/addons/oca/oca-crm,/opt/odoo/addons/oca/oca-e-commerce,/opt/odoo/addons/oca/oca-hr,/opt/odoo/addons/oca/oca-hr-timesheet,/opt/odoo/addons/oca/oca-knowledge,/opt/odoo/addons/oca/oca-manufacture,/opt/odoo/addons/oca/oca-margin-analysis,/opt/odoo/addons/oca/oca-partner-contact,/opt/odoo/addons/oca/oca-product-attribute,/opt/odoo/addons/oca/oca-product-variant,/opt/odoo/addons/oca/oca-purchase-workflow,/opt/odoo/addons/oca/oca-reporting-engine,/opt/odoo/addons/oca/oca-sale-financial,/opt/odoo/addons/oca/oca-sale-workflow,/opt/odoo/addons/oca/oca-server-tools,/opt/odoo/addons/oca/oca-social,/opt/odoo/addons/oca/oca-stock-logistics-warehouse,/opt/odoo/addons/oca/oca-stock-logistics-workflow,/opt/odoo/addons/oca/oca-web,/opt/odoo/addons/oca/oca-website,/opt/odoo/addons/others/others-akretion-odoo-usability,/opt/odoo/addons/others/others-it-projects-llc-website-addons,

logfile = /var/log/odoo/odoo-server.log
EOF

#Ésta ruta genera un error que no carga ninguno
#/opt/odoo/addons/oca/oca-report-print-send,

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



