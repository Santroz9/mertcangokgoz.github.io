---
layout: post
title: Wordpress Otomatik Full Yedek Alma İşlemi
date: 2015-06-04 20:27:23.000000000 +03:00
type: post
published: true
status: publish
categories: Güvenlik
description: Paylaşacağım betik Wordpress dışında genel olarak tüm scriptlerden yedek almaya yarar.Basitleştirilmiş yapısı ve kullanım kolaylığı ile tercih edilebilir.
---

Paylaşacağım betik Wordpress dışında genel olarak tüm scriptlerden yedek almaya yarar.Basitleştirilmiş yapısı ve kullanım kolaylığı ile tercih edilebilir.Script sadece dizini ve veritabanını yedeklemektedir.Bunlar dışında yedeklenecek dosyalarınız varsa lütfen bu scripti kullanmayınız.

**Dosya** : /usr/local/bin/files.sh

    #!/bin/sh

    backup_files="/home/mrt/publich_html"

    dest="/yedekler"

    if [! -d $dest]
    then
    mkdir -p $dest >/dev/null 2>&1 && echo "Dizin $dest Olusturuldu." || echo "Hata: Belirtilen Dizin $dest Olusturulamadi."
    else
    echo "$dest Dizin Bulunuyor!"
    fi

    day="$(date +"%Y-%m-%d_%H-%M-%S")"
    host=$(hostname -s)
    archive_file="$host-$day.tgz"
    rm -f $dest/$archive_file
    tar -czf $dest/$archive_file $backup_files

    find $dest/ -maxdepth 1 -type f -mtime +7 -exec rm -f "{}" \;

**Dosya** : /usr/local/bin/database.sh

    #!/bin/sh

    PATH=/usr/sbin:/sbin:/bin:/usr/bin

    user="dbkullanici"
    pass="dbsifre"
    host="localhost"

    sub="$(date +"%Y-%m-%d")"
    dest="/yedek"
    #mdb="$dest/db/$sub"

    mdb="$dest"
    if [! -d $mdb]
    then
    mkdir -p $mdb >/dev/null 2>&1 && echo "Dizin $mdb Olusturuldu." || echo "Hata: Belirtilen Dizin $mdb Olusturulamadi."
    else
    echo "$mdb Dizin Bulunuyor!"
    fi

    now="$(date +"%Y-%m-%d_%H-%M-%S")"

    file=""

    #dbs="$(mysql -u $user -h $host -p$pass -Bse 'show databases')"
    dbs="dbadi"
    for db in $dbs
    do
    file="$mdb/$db.$now.sql.gz"
    mysqldump -u $user -h $host -p$pass --complete-insert $db | gzip -9 > $file
    echo "Yedek $file.....Tamamlandi"
    done

    find $dest/ -maxdepth 1 -type f -mtime +7 -exec rm -f "{}" \;

Eski Yedekler 7 Günün sorununda sırasıyla silinirler.Yedeklerimizi aldırmak için kullanabileceğimiz betiklerimizi tanımladık şimdi sıra geldi bunları otomatik bir şekilde almaları için yapılandırmaya bunun için ise

    crontab -e

Komutunu veriyoruz ve 2 ye basıyoruz böylelikle **cronjob** ayarlamaları için bir yer geliyor bize günlük yedek alacağımız için ise aşağıdaki adımları uyguluyoruz.

    45 0 * * * /bin/sh /usr/local/bin/files.sh >/dev/null 2>&1
    45 0 * * * /bin/sh /usr/local/bin/database.sh >/dev/null 2>&1

Kayıt edip çıkıyoruz işlem tamamdır bundan sonra her gün gece 00:45 de yedeklerimiz **/yedek** klasörüne alınacak.
