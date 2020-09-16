
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
addons_path = /opt/odoo/addons,/opt/odoo/odoo-server/addons,/opt/odoo/addons/ADHOC/account-financial-tools-11.0,/opt/odoo/addons/ADHOC/account-invoicing-11.0,/opt/odoo/addons/ADHOC/account-payment-11.0,/opt/odoo/addons/ADHOC/aeroo_reports-11.0,/opt/odoo/addons/ADHOC/argentina-reporting-11.0,/opt/odoo/addons/ADHOC/argentina-sale-11.0,/opt/odoo/addons/ADHOC/miscellaneous-11.0,/opt/odoo/addons/ADHOC/multi-store-11.0,/opt/odoo/addons/ADHOC/odoo-argentina-11.0,/opt/odoo/addons/ADHOC/partner_identification,/opt/odoo/addons/ADHOC/reporting-engine-11.0,/opt/odoo/addons/ADHOC/sale-11.0,/opt/odoo/addons/ADHOC/stock-11.0,/opt/odoo/addons/OCA/OCA-account-analytic,/opt/odoo/addons/OCA/OCA-account-financial-reporting,/opt/odoo/addons/OCA/OCA-account-financial-tools,/opt/odoo/addons/OCA/OCA-account-invoicing,/opt/odoo/addons/OCA/OCA-account-payment,/opt/odoo/addons/OCA/OCA-commission,/opt/odoo/addons/OCA/OCA-contract,/opt/odoo/addons/OCA/OCA-crm,/opt/odoo/addons/OCA/OCA-e-commerce,/opt/odoo/addons/OCA/OCA-hr,/opt/odoo/addons/OCA/OCA-hr-timesheet,/opt/odoo/addons/OCA/OCA-knowledge,/opt/odoo/addons/OCA/OCA-manufacture,/opt/odoo/addons/OCA/OCA-margin-analysis,/opt/odoo/addons/OCA/OCA-operating-unit,/opt/odoo/addons/OCA/OCA-partner-contact,/opt/odoo/addons/OCA/OCA-product-attribute,/opt/odoo/addons/OCA/OCA-product-variant,/opt/odoo/addons/OCA/OCA-purchase-workflow,/opt/odoo/addons/OCA/OCA-queue,/opt/odoo/addons/OCA/OCA-reporting-engine,/opt/odoo/addons/OCA/OCA-report-print-send,/opt/odoo/addons/OCA/OCA-sale-financial,/opt/odoo/addons/OCA/OCA-sale-reporting,/opt/odoo/addons/OCA/OCA-sale-workflow,/opt/odoo/addons/OCA/OCA-server-tools,/opt/odoo/addons/OCA/OCA-server-ux,/opt/odoo/addons/OCA/OCA-social,/opt/odoo/addons/OCA/OCA-stock-logistics-warehouse,/opt/odoo/addons/OCA/OCA-stock-logistics-workflow,/opt/odoo/addons/OCA/OCA-web,/opt/odoo/addons/OCA/OCA-website,/opt/odoo/addons/others/others-akretion-odoo-usability,/opt/odoo/addons/others/others-it-projects-llc-website-addons,/opt/odoo/addons/others/jobiols-odoo-addons,/opt/odoo/addons/others/regaby-odoo-addons,

logfile = /var/log/odoo/odoo-server.log
EOF

#Ésta ruta genera un error que no carga ninguno
#/opt/odoo/addons/oca/oca-report-print-send,

sudo cp ~/odoo-server.conf /etc/odoo-server.conf
sudo chown odoo: /etc/odoo-server.conf
sudo chmod 640 /etc/odoo-server.conf
