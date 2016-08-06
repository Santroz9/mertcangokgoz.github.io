---
layout: post
title: Centos 7 Üzerine Zabbix Kurulumu
date: 2015-08-14 14:36:15.000000000 +03:00
type: post
published: true
status: publish
categories: linux
description: Zabbix açık kaynak kodlu kurumsal düzeyde bir izleme uygulamasıdır aktif ve pasif bir şekilde izleme yapılabilmektedir.Zabbix ile sunucular,ağ cihazları
---

**Zabbix** açık kaynak kodlu kurumsal düzeyde bir izleme uygulamasıdır aktif ve pasif bir şekilde izleme yapılabilmektedir. **Zabbix** ile sunucular,ağ cihazları, sanal sunucu gibi sistemleri izleyebilirsiniz. **Zabbix** çok büyük işlemler için ölçeklendirilebilmektedir. **BT** alt yapılarının ihtiyaçlarını karşılamakta üzerine yoktur.Tüm popüler işletim sistemleri ile çalışmaktadır.Otomatik cihaz denetimi ile kolay bir şekilde ekleme çıkartma yapabilirsiniz.Aynı zamanda sistemde bir sorun olduğu zaman yada sistemin durumunu size **Mail** ve **SMS** ilede ulaştırabilmektedir aynı zamanda web üzerindende ulaşabilirsiniz.

# Gerekenler

**Zabbix** kurulumu için sistemde **LAMP** yada **LEMP** olması gerekmektedir.

[Centos 7 Üzerine Nginx, MySQL, PHP (LEMP) Kurulumu](https://mertcangokgoz.com/centos-7-uzerine-nginx-mysql-php-lemp-kurulumu/)

## Sunucu Taraflı Yapılandırma

Ön tanımlı olarak yum ile kurayım gibi birşey yapamıyoruz bu yüzden **EPEL** kütüphanesini sisteme eklememiz gerekiyor.

    yum install epel-release

Ardından zabbix için gerekenleri ekleyip kuruluma başlayacağız

    rpm --import http://repo.zabbix.com/RPM-GPG-KEY-ZABBIX
    rpm -Uv http://repo.zabbix.com/zabbix/2.4/rhel/7/x86_64/zabbix-release-2.4-1.el7.noarch.rpm

**Zabbix** ve geri kalan ayarlar için kurulumu yapıyoruz.

    yum install zabbix-server-mysql zabbix-web-mysql zabbix-agent zabbix-java-gateway

**Zabbix** için Veritabanı kurulumunu yapalım

    mysql -u root -p

giriş yaptıktan sonra mysql komutlarını yazalım veritabanını oluşturalım ve gerekli olan kullanıcıyı veritabanına ekleyelim

    create database zabbixd character set utf8;
    grant all privileges on zabbixd.* to 'zabbixdbuser'@'localhost' identified by 'sifre';
    flush privileges;
    exit

veritabanını oluşturduk ve kullanıcıyı ekledik.Veritabanını sisteme ekleme zamanımız geldi bunun için aşağıdaki komutları kullanabilirsiniz 3 tane **SQL** eklemesi yapacağız

    mysql -u zabbixdbuser -p zabbixd < /usr/share/doc/zabbix-server-mysql-2.4.5/create/schema.sql
    mysql -u zabbixdbuser -p zabbixd < /usr/share/doc/zabbix-server-mysql-2.4.5/create/images.sql
    mysql -u zabbixdbuser -p zabbixd < /usr/share/doc/zabbix-server-mysql-2.4.5/create/data.sql

Server ayarlarına gelelim vhost ayarlaması yapmamız gerekiyor aşağıdaki örnek yapılandırmadan faydalanabilirsiniz.

    server {
      listen 80;

      server_name zabbix.mertcangokgoz.com;

      root /home/mertcangokgoz.com/zabbix;

            location / {
                index index.php index.html index.htm;
                try_files $uri $uri/ /index.php?$args;
            }

        location ~ \.php$ {
            try_files $uri =404;
            fastcgi_pass unix:/var/run/php-fpm/php5-fpm.sock;
            fastcgi_index index.php;
            fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
            include fastcgi_params;
        }

      location ~ /\.ht {
        deny all;
      }
    }

zabbixe veritabanı ayarlarını yapalım ve bilgileri girelim

**Dosya** : /etc/zabbix/zabbix\_server.conf

    DBName=zabbixd

    DBUser=zabbixdbuser

    DBPassword=şifre

**PHP** için ayarları yapalım.

**Dosya** : /etc/php.ini

    max_execution_time = 600
    max_input_time = 600
    memory_limit = 256M
    post_max_size = 32M
    upload_max_filesize = 16M
    date.timezone = Europe/Istanbul

PHP yeniden başlatalım ve yaptığımız ayarlamalar geçerli olsun böylelikle zabbix php taraflı hata vermesinin önüne geçeceğiz.

    systemctl restart php-fpm

daha sonradan **firewalld** üzerinden izin verme işlemini gerçekleştiriyoruz.

    firewall-cmd --permanent --add-port=10050/tcp
    firewall-cmd --permanent --add-port=10051/tcp
    systemctl restart firewalld

Tüm herşey bitti sistemdeki servislerini başlatalım bazılarınıda yeniden başlatıp ayarların geçerli olmasını sağlayalım.Bundan sonra web tarafında işlemler yapacaksınız.Veritabanı ayarı kullanıcı giriş ayarı vs

    systemctl start zabbix-server
    systemctl start zabbix-agent
    systemctl restart nginx
    systemctl restart mysqld
    systemctl enable zabbix-server
    systemctl enable zabbix-agent

web taraflı ayarlamalar için ise nereyi belirlediyseniz orayı kullanacaksınız daha açık bir şekilde söyleyeyim nasıl ya ip adresinden yada ayarladığınız domain/subdomainden ayarları yapacaksınız.

**http://ipadresi/zabbix** yada **http://siteadresi.com/zabbix** yada **http://zabbix.siteadresi.com** yada **http://ipadresi/**

Web taraflı ayarlarını anlatmayacağım çünkü el ile yapılacak olan ayarları biz sunucu tarafında yaptık.Onaylayıp tamamlamanız yetecek ve sadece kullanıcı oluşturmanız işlemi tamamlatacak.Bilgileri toplayacak ana sunucu dışında başka sistemleride izlemek isteyebilirsiniz.Bunun için aşağıdakileri yapabilirsiniz.Zabbixin sadece Agent paketini kurmanız yeterli

    rpm --import http://repo.zabbix.com/RPM-GPG-KEY-ZABBIX
    rpm -Uv http://repo.zabbix.com/zabbix/2.4/rhel/7/x86_64/zabbix-release-2.4-1.el7.noarch.rpm
    yum install zabbix-agent -y

Debian tabanlı sistemlere kurmak istersenizde

    sudo apt-get install zabbix-agent

Clientlerin ayarlamalarını yapmak içinde

    nano /etc/zabbix/zabbix_agentd.conf

içerisindeki şu satırları sunucunuzun ip adresine göre düzenleyin

    [...]
    Server=24.78.9.223
    ServerActive=24.78.9.223
    #agent kurulu olduğu sunucunun ana bilgisayar adresi #
    Hostname=sv2.mertcangokgoz.com
    [...]

Kayıt edip çıkıyoruz daha sonra servisleri başlatıyoruz.

**Debian** tabanlı sistemler için

    sudo service zabbix-agent start

**Centos 7** için

    systemctl start zabbix-agent
    systemctl enable zabbix-agent

Sisteme Dahil etmek için ise aşağıdakileri yapalım

**Configuration -\> Hosts**. kısmına giriş yapıyoruz ve **Create Host** butonuna basıyoruz.Açılan panelde **Hostname** kısmına agent kullandığınız hostnameyi giriyorsunuz.Gruplama seçeneklerinden sunucunuz ney ise artık onları seçiyorsunuz **linux servers,virtual machine,templates** vs vs bir sürü seçenek olarak sunucunuz ne ile ilgili ise onu seçin

Tamplates kısmından **Link New Templates** kısmından **Select** diyip açılan panelden

- Template App SSH Service
- Template OS Linux

**Add** diyip **Update** seçeneğine basıyorsunuz.

Artık eklediğiniz client sistemde gözükecek ve sistem bilgileri toplamaya başlayacak.Detaylı olarak neler yapabileceğinizi merak ediyorsanız [Zabbix Dokümantasyonuna](https://www.zabbix.com/documentation/2.4/manual) bakabilirsiniz.
