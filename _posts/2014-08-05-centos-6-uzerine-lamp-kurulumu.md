---
layout: post
title: Centos 6 Üzerine LAMP Kurulumu
date: 2014-08-05 16:03:10.000000000 +03:00
type: post
published: true
status: publish
categories: Linux
description: Centos 7 üzerine LEMP Kurulumu gerçekleştirdiğimiz konumuzu görmüşsünüzdür.Centos 6 kullanmak isteyen arkadaşlarımızıda unutmadık haliyle
---
**Centos 7** üzerine **LEMP** Kurulumu gerçekleştirdiğimiz konumuzu görmüşsünüzdür.Centos 6 kullanmak isteyen arkadaşlarımızıda unutmadık haliyle onlar içinde bir rehber hazırlayalım dedik hiç bir panel kullanmadan **LAMP** kurulumu gerçekleştireceğiz panel gereksiz diye düşünmekteyim. [LAMP](https://en.wikipedia.org/wiki/LAMP_%28software_bundle%29) nedir diyecek olursanız web server için kuracağımız programların isminin baş harflerinden oluşmuştur.

- **L** inux Operation System
- **A** pache
- **M** ySQL
- **P** HP

İlk olarak hostnamamizi ayarlamamız gerekiyor kurarken ayarlayabiliyorsanız ayarlayın yoksa sonrasında komut ile ayarlamada yapabilirsiniz.Ben bu Sefer başta ayarlamadım bu yüzden aşağıdaki şekilde ayarlıyorum.

    echo "HOSTNAME=mertcangokgoz.com" >> /etc/sysconfig/network

Sonrasında olmuşmu olmamışmı bu kodcuk ne yapmış sistemde diye bi göz atmak istiyorsak eğer

    hostname
    hostname -f

ve karşımızda bizim tanımladığımız hostname gözüküyor.Şimdi sırada web server uygulamamızı kurmamız lazım ki sitemizi yayına sokabilelim bunun için apacheyi seçtim hepsinden önce beleş ve sitemiz yeni ise işimize çokca yarar zaten trafiğimiz artar ise nginx geçebiliriz.

    yum update
    yum install httpd

Şimdi yapılması gereken bir işlem var sunucunuzun yada vps inizin kaynaklarına göre bi ayarlama yapmamız lazım ki sistemi daha efektif kullanabilelim.10-15k arası hitli bir siteniz var ise yapacağınız çok iyi bir ayarla 512 mb ramlı bir vps dahi yetecektir.

    cp /etc/httpd/conf/httpd.conf ~/httpd.conf.backup

httpd.conf öncelikle bi yedekliyoruz bozarsak sonra googlede fellik fellik nerede lan bu **httpd.conf** dememek açısından bu yapacağımız aşırı bir şekilde önemli

Ayrıca **/etc/httpd/conf.d/** dizininde aradığınız tüm&nbsp; **.conf** kulabilirsiniz.

Nano,pico,vim hangisini kullanmayı seviyorsanız onunla dosyayı açıyoruz.ben nanoya alıştığım için nano seçiyorum.

    nano /etc/httpd/conf/httpd.conf

İçerisinde satır satır bir sürü komut vardır bunlar içerisinde bizim değiştireceklerimiz sadece bir kaç kod

ilk olarak

    KeepAlive Off

yapıyoruz.Böylelikle [TCP](https://tr.wikipedia.org/wiki/TCP) bağlantısı her daim açık kalmıyor böylelikle Apachenin yükünü biraz daha azaltıyoruz.

Sonrasında prefork.c modülünden bir kaç ayarlama yapmamızda bence gerekli aşağıdaki ayarlamayı ben 512 MB vps için kullanıyordum.

    <IfModule prefork.c>
    StartServers 4
    MinSpareServers 12
    MaxSpareServers 12
    MaxClients 120
    MaxRequestsPerChild 2600
    </IfModule>

Şimdi ayarlamamızı yapmamız gerekiyor. kaç tane site barınacak ne yapılacak ne tür birşey sunulacak vs seçin işte kafanızdan ben wordpress kurup tek sitede kullanacağım için.Bu Ayarlamaları da gene **/etc/httpd/conf.d/** içerisindeki **vhost.conf** ile gerçekleştiriyoruz.ben bu conf gene nano ile açıyorum ve ayarlamaları aşağıdaki gibi yapıyorum.Sisteminizde yoksa oluşturabilirsiniz fark etmez

    nano /etc/httpd/conf.d/vhost.conf

Benim sitemin örnek ayarlaması aşağıdaki gibidir.

    NameVirtualHost *:80

    <VirtualHost *:80>
         ServerAdmin webmaster@example.com
         ServerName mertcangokgoz.com
         ServerAlias www.mertcangokgoz.com
         DocumentRoot /var/www/mertcangokgoz.com/public_html/
         ErrorLog /var/www/mertcangokgoz.com/logs/error.log
         CustomLog /var/www/mertcangokgoz.com/logs/access.log combined
    </VirtualHost>

    <VirtualHost *:443>
         ServerAdmin webmaster@example.com
         ServerName mertcangokgoz.com
         ServerAlias www.mertcangokgoz.com
         SSLEngine on
         SSLCertificateFile /etc/ssl/crt/primary.crt
         SSLCertificateKeyFile /etc/ssl/crt/private.key
         SSLCertificateChainFile /etc/ssl/crt/intermediate.crt
         DocumentRoot /var/www/mertcangokgoz.com/public_html/
         ErrorLog /var/www/mertcangokgoz.com/logs/error.log
         CustomLog /var/www/mertcangokgoz.com/logs/access.log combined
    </VirtualHost>

Sitenizin trafiği günden güne artarsa ve kaynaklarınız yetmez ise apachenin log tutma durumunu değiştirebilirsiniz sadece acil durumlara ayarlayıp %10 performans sağlayabilirsiniz.Ayrıca yahu public\_html klasörünü oluşturdum ama apacheyi başlattığımda hala tık yok diyorsanız. oluşturamamışzsınız demektir o zaman aşağıdaki komut ile oluşturmanız gerekecek haliyle ki sorun çıkartmasın

    mkdir -p /var/www/mertcangokgoz.com/public_html
    mkdir /var/www/mertcangokgoz.com/logs

Bu işlemlerden sonra ya apacheye restart atıyoruz çalışıyorsa yada çalışmıyorsa çalıştırıyoruz.(tekerleme gibi oldu :D)

    /etc/init.d/httpd start
    //yada
    service httpd start

Sunucuya reset attım httpd başlamadı her restart attığımda başlatmak zorundamıyım elle bune arkadaşım diyorsanız öyle bir zorunluluğunuzun olmadığını bilmenizi isterim otomatik bootda başlatmaya eklerseniz otomatik kendi açılacaktır.

    /sbin/chkconfig --levels 235 httpd on

Şimdi sıra geldi database kurulumumuza bunun için mysql seçtiğimizi yukarıda biliyorsunuzdur unutmadınız umarım kurulum parametremiz aşağıdaki gibidir.

    yum install mysql-server

Bunda önceden belirtmemde fayda var database bir sitenin can damarı olduğundan boot da direk olarak açılması önemlidir bu yüzden direk boot a ekliyoruz.

    /sbin/chkconfig --levels 235 mysqld on

Hemen Şimdi Kurmuş olduğumuz **MySQL** başlatalım ve kurulumunu tamamlayalım

    /etc/init.d/mysqld start
    //yada
    service mysqld start

my.cnf yi kurcalayacağımızı biliyorum. **1GB** sunucumuz için varsayılan ayarlara [buradan ulaşabilirsiniz](https://mertcangokgoz.com/1gb-sunucular-icin-mysql-optimizasyonu.html).hepsinden önce yedeklemek için ise

    cp /etc/my.cnf ~/my.cnf.backup

Şimdi kuruluma geçelim aşağıdaki komutu verin **SSH** ye gitsin sonrasında mevcut root şifresini soracak mysqlin varsa yazın yoksa enter diyip geçin kendiniz el ile belirleyin

    mysql_secure_installation

şimdi bildiğimiz gibi panel kurmuyoruz **SSH** den hepsini halledeceğimizi söylemiştim mysql kurulumunu tamamladıysanız root olarak sisteme bi giriş yapalım ki databse oluşturup kullanıcı tanımlaması yapalım

    mysql -u root -p

Şimdi mysqlimize bağlantık SQL biliyorsanız ne mutlu size buraya bakmanıza bile gerek kalmadı bilmiyorsanız kodlarımız aşağıda

    create database databaseismi;
    grant all on databaseismi.* to 'kullanici' identified by 'şifre';

[SQL](https://tr.wikipedia.org/wiki/SQL) söz dizimi hoş olan bir dildir ama normal **SQL** lerde bilindiği gibi satır sonuna birşey eklenmez ama [SSH](https://tr.wikipedia.org/wiki/SSH) da sonuna ; eklemelisiniz yoksa sapıtır.Aman ha unutmayın.Sonrada **quit** diyoruz ve mysql den çıkış yapıyoruz.

Veritabanınızı oluşturduğunuz veritabanına artık istediğiniz bir uygulama ile atabilirsiniz benim önerim php destekli olarak popüler olan bigdump kullanmanız.

[PHP](https://tr.wikipedia.org/wiki/PHP) kurulumuna geldik [ASP](https://tr.wikipedia.org/wiki/ASP) kullanacak halimiz yok linux üzerine kurulum yapıyoruz sonuçta **GNU** felsefesini benimsedik ve hepsi açık kaynak olacak

    yum install php php-pear

kurulum tamamlandıktan sonra php.ini haricinde yapılacak bir ayar yok zaten php.ini ye ulaşmak için ve düzenlemek için nano kullandım gene ben

    nano /etc/php.ini

yapacağımız değişiklikler sırasıyla şöyle

    error_reporting = E_COMPILE_ERROR|E_RECOVERABLE_ERROR|E_ERROR|E_CORE_ERROR
    display_errors = Off
    log_errors = On
    error_log = /var/log/php/error.log
    max_execution_time = 30
    memory_limit = 128M
    register_globals = Off
    max_input_time = 30

php nin ram kullanımını ayarlayabilirsiniz sistem kaynağınıza göre ama 128 MB öneriyorum ben fazlasına hiç gerek yok yetmiyor ise tabikide arttırmanız gerekecek Şimdi logların tutulacağı yeri oluşturmamız lazım ön tanımlı olarak var log da php ye ait birşey yoktur ve sonrasında apacheye izinde vereceğiz

    mkdir /var/log/php
    chown apache /var/log/php

Mysql in php yi desteklemesi gerekiyor bunun içinde sisteme aşağıdaki komut ile desteği veriyoruz.Bildiğim kadarıyla mysql kurulumunda otomatik bunu kurmuyordu.

    yum install php-mysql

bununda kurulumu bittiği zaman yapılacak birşey zaten kalmadı **LAMP** kurulumumuz başarıyla sonuçlandı ve sunucumuz,vps miz kullanıma hazır bir hale geldi diyeceksiniz la biz **FTP** kurmadık dosyayı nasıl atacaz oda sizin marifetiniz olsun diyerek sonlandırıyorum.Ha unutmayın apacheye son bir kez daha restart atmanız gerekmektedir.

    /etc/init.d/httpd restart
    //yada
    service httpd restart
