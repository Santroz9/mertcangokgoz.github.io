---
layout: post
title: MariaDB 10.x ve MySQL 5.x InnoDB Kapatmak
date: 2015-05-07 18:34:36.000000000 +03:00
type: post
published: true
status: publish
categories: programlama
description: MySQL de performans ayarları yaparken innodb yi kapatmak için MariaDB de ayarlamalar yapmam gerekiyordu çünkü ben Veritabanını MyISAM şeklinde
---
**MySQL** de performans ayarları yaparken innodb yi kapatmak için **MariaDB** de ayarlamalar yapmam gerekiyordu çünkü ben Veritabanını **MyISAM** şeklinde kullanıyordum InnoDB olmadığı içinde boşa çalışmasın kapatalım gitsin performans açısından etkisi haliyle olacak.

MariaDB 10.x

    [mysqld]
    skip-innodb
    default-storage-engine=MyISAM

MySQL 5.x İçin

    default-storage-engine=MyISAM
    default-tmp-storage-engine=MyISAM
    innodb=OFF

Yukarıdaki kodu **/etc/mysql/my.cnf** içerisine ekliyorsunuz Aşağıdaki komut ilede yeniden başlattığımızda artık **innoDB** çalışmayacak ve **MyISAM** kullanımına tamamen geçmiş olacaksınız.

    service mysql restart

İşlemimiz böylelikle son buluyor.
