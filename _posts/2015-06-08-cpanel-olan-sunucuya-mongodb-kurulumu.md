---
layout: post
title: Cpanel Olan Sunucuya MongoDB Kurulumu
date: 2015-06-08 22:09:40.000000000 +03:00
type: post
published: true
status: publish
categories: linux
description: MongoDB veritabanları ile etkileşimli bir şekilde çalışabilen bir uygulama biz kurulumumuzu Centos üzerinde yapacağız ve sunucumuzda Cpanel
---
**MongoDB** veritabanları ile etkileşimli bir şekilde çalışabilen bir uygulama biz kurulumumuzu Centos üzerinde yapacağız ve sunucumuzda Cpanel kurulu olduğu varsayılacak. **MongoDB** BSON alt yapısı sayesinde **MySQL** gibi sistemler ile çabucak etkileşime girebilen ve ayarlanabilen bir yapıya sahip en önemli özelliklerinden bir taneside büyük ölçekli sitelerin vaz geçilmezi

**RPM** den kurulumu yapacağımız için ilk önce düzenlememiz gereken yerleri düzenleyelim.Bunlardan bir taneside yum repo kısmı komutu verdikten sonra yeni bir **repo** oluşturuyoruz.

    cd /etc/yum.repos.d
    nano -w mongodb.repo

İçerisine aşağıdaki satırları yerleştirip kayıt ediyoruz.

    [mongodb]name=MongoDB Repo
    baseurl=http://downloads-distro.mongodb.org/repo/redhat/os/x86_64/
    gpgcheck=0
    enabled=1

**CTRL + X** ile kayıt ediyoruz ve çıkışımızı yapıyoruz.Daha sonra kurulum için parametreleri giriyoruz.

    yum install mongo-10gen mongo-10gen-server

Yüklendikten sonra direk olarak **Cpanelinizde** göreceksiniz bu yüzden cpanel kısmında bir sıkıntı çıkmayacak ancak restart vs oldumu otomatik olarak başlamayacak bunu başlatmak için ise

    chkconfig mongod on

Standart olarak çalıştırma parametremizi girelim

    service mongod start

**PHP** uzantısını kurmamızda lazım bunun için ise

    pecl install mongo

**PECL** komutunu verdik kurulum falan birşeyler o orda debelendi falan işlem bitti hemen **apacheyi** resetliyoruz.

    service httpd restart

Tamamdır bitti gitti php uzansıtınıda kurduk olup olmadığına bakmak için ise aşağıdaki komutu verip gözlemleyebilirsiniz.

    php -i | grep mongo -i
