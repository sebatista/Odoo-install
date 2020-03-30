
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
addons_path = /opt/odoo/addons,/opt/odoo/odoo-server/addons,/opt/odoo/addons/ADHOC/account-analytic,/opt/odoo/addons/ADHOC/account-financial-tools,/opt/odoo/addons/ADHOC/account-invoicing,/opt/odoo/addons/ADHOC/account-payment,/opt/odoo/addons/ADHOC/aeroo_reports,/opt/odoo/addons/ADHOC/argentina-reporting,/opt/odoo/addons/ADHOC/argentina-sale,/opt/odoo/addons/ADHOC/hr,/opt/odoo/addons/ADHOC/manufacture,/opt/odoo/addons/ADHOC/miscellaneous,/opt/odoo/addons/ADHOC/multi-company,/opt/odoo/addons/ADHOC/multi-store,/opt/odoo/addons/ADHOC/odoo-argentina,/opt/odoo/addons/ADHOC/odoo-support,/opt/odoo/addons/ADHOC/partner,/opt/odoo/addons/ADHOC/patches,/opt/odoo/addons/ADHOC/product,/opt/odoo/addons/ADHOC/project,/opt/odoo/addons/ADHOC/purchase,/opt/odoo/addons/ADHOC/reporting-engine,/opt/odoo/addons/ADHOC/sale,/opt/odoo/addons/ADHOC/stock,/opt/odoo/addons/ADHOC/survey,/opt/odoo/addons/ADHOC/website,/opt/odoo/addons/OCA/account-analytic,/opt/odoo/addons/OCA/account-closing,/opt/odoo/addons/OCA/account-financial-reporting,/opt/odoo/addons/OCA/account-financial-tools,/opt/odoo/addons/OCA/account-invoice-reporting,/opt/odoo/addons/OCA/account-invoicing,/opt/odoo/addons/OCA/account-payment,/opt/odoo/addons/OCA/account-reconcile,/opt/odoo/addons/OCA/bank-payment,/opt/odoo/addons/OCA/commission,/opt/odoo/addons/OCA/contract,/opt/odoo/addons/OCA/credit-control,/opt/odoo/addons/OCA/crm,/opt/odoo/addons/OCA/currency,/opt/odoo/addons/OCA/ddmrp,/opt/odoo/addons/OCA/donation,/opt/odoo/addons/OCA/e-commerce,/opt/odoo/addons/OCA/event,/opt/odoo/addons/OCA/field-service,/opt/odoo/addons/OCA/geospatial,/opt/odoo/addons/OCA/hr,/opt/odoo/addons/OCA/hr-timesheet,/opt/odoo/addons/OCA/knowledge,/opt/odoo/addons/OCA/manufacture,/opt/odoo/addons/OCA/manufacture-reporting,/opt/odoo/addons/OCA/margin-analysis,/opt/odoo/addons/OCA/mis-builder,/opt/odoo/addons/OCA/multi-company,/opt/odoo/addons/OCA/OpenUpgrade,/opt/odoo/addons/OCA/operating-unit,/opt/odoo/addons/OCA/partner-contact,/opt/odoo/addons/OCA/pos,/opt/odoo/addons/OCA/product-attribute,/opt/odoo/addons/OCA/product-variant,/opt/odoo/addons/OCA/project,/opt/odoo/addons/OCA/project-reporting,/opt/odoo/addons/OCA/purchase-workflow,/opt/odoo/addons/OCA/queue,/opt/odoo/addons/OCA/reporting-engine,/opt/odoo/addons/OCA/rma,/opt/odoo/addons/OCA/sale-financial,/opt/odoo/addons/OCA/sale-reporting,/opt/odoo/addons/OCA/sale-workflow,/opt/odoo/addons/OCA/server-auth,/opt/odoo/addons/OCA/server-backend,/opt/odoo/addons/OCA/server-tools,/opt/odoo/addons/OCA/server-ux,/opt/odoo/addons/OCA/social,/opt/odoo/addons/OCA/stock-logistics-barcode,/opt/odoo/addons/OCA/stock-logistics-reporting,/opt/odoo/addons/OCA/stock-logistics-warehouse,/opt/odoo/addons/OCA/stock-logistics-workflow,/opt/odoo/addons/OCA/survey,/opt/odoo/addons/OCA/timesheet,/opt/odoo/addons/OCA/vertical-association,/opt/odoo/addons/OCA/vertical-hotel,/opt/odoo/addons/OCA/web,/opt/odoo/addons/OCA/website,/opt/odoo/addons/others/it-projects-llc-access-addons,/opt/odoo/addons/others/it-projects-llc-mail-addons,/opt/odoo/addons/others/it-projects-llc-sync-addons,/opt/odoo/addons/others/it-projects-llc-website-addons,/opt/odoo/addons/others/jobiols-odoo-addons,/opt/odoo/addons/others/regaby-odoo-addons,

logfile = /var/log/odoo/odoo-server.log
EOF

#GENERA ERROR: /opt/odoo/addons/OCA/report-print-send,

#Ésta ruta genera un error que no carga ninguno
#/opt/odoo/addons/OCA/report-print-send,

sudo cp ~/odoo-server.conf /etc/odoo-server.conf
sudo chown odoo: /etc/odoo-server.conf
sudo chmod 640 /etc/odoo-server.conf
