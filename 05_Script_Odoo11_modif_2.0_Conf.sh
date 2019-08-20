
# Creamos carpeta para Log
if [ -d /var/log/odoo/ ];
then
	echo "El directorio /var/log/odoo/ ya existe."
else
	sudo mkdir /var/log/odoo
	sudo chown -R odoo:root /var/log/odoo
	echo "Directorio /var/log/odoo/ creado."
fi

# Creamos el archivo de configuracion de odoo
cat <<EOF > ~/odoo-server.conf
[options]
; admin_passwd = admin
db_host = False
db_port = False
db_user = odoo
db_password = False
addons_path = /opt/odoo/addons,/opt/odoo/odoo-server/addons,/opt/odoo/addons/ADHOC/account-financial-tools-11.0,/opt/odoo/addons/ADHOC/account-payment-11.0,/opt/odoo/addons/ADHOC/aeroo_reports-11.0,/opt/odoo/addons/ADHOC/argentina-reporting-11.0,/opt/odoo/addons/ADHOC/argentina-sale-11.0,/opt/odoo/addons/ADHOC/miscellaneous-11.0,/opt/odoo/addons/ADHOC/odoo-argentina-11.0,/opt/odoo/addons/ADHOC/partner_identification,/opt/odoo/addons/ADHOC/reporting-engine-11.0,/opt/odoo/addons/ADHOC/stock-11.0,/opt/odoo/addons/oca/oca-account-analytic,/opt/odoo/addons/oca/oca-account-financial-reporting,/opt/odoo/addons/oca/oca-account-financial-tools,/opt/odoo/addons/oca/oca-account-invoicing,/opt/odoo/addons/oca/oca-account-payment,/opt/odoo/addons/oca/oca-commission,/opt/odoo/addons/oca/oca-contract,/opt/odoo/addons/oca/oca-crm,/opt/odoo/addons/oca/oca-e-commerce,/opt/odoo/addons/oca/oca-hr,/opt/odoo/addons/oca/oca-hr-timesheet,/opt/odoo/addons/oca/oca-knowledge,/opt/odoo/addons/oca/oca-manufacture,/opt/odoo/addons/oca/oca-margin-analysis,/opt/odoo/addons/oca/oca-partner-contact,/opt/odoo/addons/oca/oca-product-attribute,/opt/odoo/addons/oca/oca-product-variant,/opt/odoo/addons/oca/oca-purchase-workflow,/opt/odoo/addons/oca/oca-reporting-engine,/opt/odoo/addons/oca/oca-sale-financial,/opt/odoo/addons/oca/oca-sale-workflow,/opt/odoo/addons/oca/oca-server-tools,/opt/odoo/addons/oca/oca-social,/opt/odoo/addons/oca/oca-stock-logistics-warehouse,/opt/odoo/addons/oca/oca-stock-logistics-workflow,/opt/odoo/addons/oca/oca-web,/opt/odoo/addons/oca/oca-website,/opt/odoo/addons/others/others-akretion-odoo-usability,/opt/odoo/addons/others/others-it-projects-llc-website-addons,

logfile = /var/log/odoo/odoo-server.log
EOF

#Ésta ruta genera un error que no carga ninguno
#/opt/odoo/addons/oca/oca-report-print-send,

sudo cp ~/odoo-server.conf /etc/odoo-server.conf
sudo chown odoo: /etc/odoo-server.conf
sudo chmod 640 /etc/odoo-server.conf
