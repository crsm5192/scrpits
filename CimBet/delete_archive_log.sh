#!/bin/sh
source /home/oracle/.bash_profile
/data/oracle/product/11.2.0/db_1/bin/rman target SYS/123456 << EOF
crosscheck archivelog all;
delete noprompt expired archivelog all;
delete noprompt archivelog until time 'sysdate-2';
exit
EOF

