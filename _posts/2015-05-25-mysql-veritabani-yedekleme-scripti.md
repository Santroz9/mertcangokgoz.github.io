---
layout: post
title: MySQL Veritabanı Yedekleme Scripti
date: 2015-05-25 12:42:15.000000000 +03:00
type: post
published: true
status: publish
categories: linux
description: Sunucunuzda kullanabileceğiniz oldukça kullanışlı bir script'dir.Mysql ve MariaDB(percona dahil) pek çok sistemin yedeğini kolaylıkla alabilirsiniz.
---

Sunucunuzda kullanabileceğiniz oldukça kullanışlı bir script'dir.Mysql ve MariaDB(percona dahil) pek çok sistemin yedeğini kolaylıkla alabilirsiniz.Yedeği alırken sistemde ön tanımlı olarak gelen veritabanlarını dahil etmez.Yedekler alınırkende tarih ve zamana göre tutulurlar isterseniz günlük isterseniz haftalık bir şekilde yedeklerinizi alabilirsiniz tabi bunu gerçekleştirmek için crontab özelliğini kullanmanız gerekiyor.

**şifreniz** yazan kısmı doldurmayı ihmal etmeyin.Sonrasında dosyamızı oluşturalım ve çalıştıralım.

    #! /bin/bash

    TIMESTAMP=$(date +"%F")
    BACKUP_DIR="/backup/$TIMESTAMP"
    MYSQL_USER="root"
    MYSQL=/usr/bin/mysql
    MYSQL_PASSWORD="şifreniz"
    MYSQLDUMP=/usr/bin/mysqldump

    mkdir -p $BACKUP_DIR/mysql

    databases=`mysql --no-defaults --user=$MYSQL_USER --password=$MYSQL_PASSWORD -e "SHOW DATABASES;" | grep -Ev "(Database|information_schema)"`

    for db in $databases; do
            if [$db != "performance_schema"]&&[$db != "mysql"];then
                    echo -e "Backing up: '$db' to $BACKUP_DIR/mysql/$db.sql n"
                    ##uncomment to enable gzip
                    #$MYSQLDUMP --force --opt --user=$MYSQL_USER -p$MYSQL_PASSWORD --databases $db | gzip > "$BACKUP_DIR/mysql/$db.gz"
                    ##comment to enable gzip
                    $MYSQLDUMP --no-defaults --force --opt --user=$MYSQL_USER --password=$MYSQL_PASSWORD --databases $db | gzip > "$BACKUP_DIR/mysql/$db.gz"
            fi
    done

Dosyayı oluşturmak için

    cd /usr/local/bin
    nano sqlbackup.sh
    chmod +x sqlbackup.sh

Sonrasında Oluşturulan dosyayı çalıştırmak için Aşağıdaki komutu veriniz.

    ./sqlbackup.sh
