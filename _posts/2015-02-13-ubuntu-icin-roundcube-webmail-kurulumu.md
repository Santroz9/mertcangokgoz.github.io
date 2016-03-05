---
layout: post
title: Ubuntu için RoundCube Webmail Kurulumu
date: 2015-02-13 14:30:18.000000000 +02:00
type: post
published: true
status: publish
categories: Linux
description: RoundCube Webmail açık kaynak kodlu ücretsiz tarayıcı tabanlı bir IMAP uygulaması RoundCube aynı zamanda kullanıcı dostu olduğu için kullanırken
---
**RoundCube Webmail** açık kaynak kodlu ücretsiz tarayıcı tabanlı bir **IMAP** uygulaması **RoundCube** aynı zamanda kullanıcı dostu olduğu için kullanırken pek bir sıkıntı çıkartmıyor ve aradığınız herşeyi kolaylıkla bulabiliyorsunuz üstelik fazla hızlı bir arayüzü var uzatmadan kurulumu yapalım.

ilk olarak bi lamp kurmak lazım aslında çünkü **mysql** kullanıcaz gidicez mail alıcaz göndericez falan filan bi kuralım şunu

    sudo apt-get install lamp-server^

Kurulumu yaparken sizden mysql için _root_ şifresi isteyecek istediğinizi yapın ama kolay bulunabilecek birşey olmasın kurulum tamamlandığında ise komut satırına geçip bi database oluşturalım.

    mysql -u root -p

**root** kullanıcı adı ile girişimizi yapalım mysql sonrasında _db_ oluşturalım

    create database round_db3s1c;

_ **round\_db3s1c** _ isminde databasemizi oluşturuyoruz.

    create user rounduser1;

Database kullanıcımızıda oluşturalım ismi **rounduser1** olsun

    set password for 'rounduser1' = password('cNowg%59Hv1bbcJ^');

Şifresini oluşturup kullanıcımızıda hazır ediyoruz.

    grant all privileges on round_db3s1c.* to rounduser1@localhost

kullanıcının yetkilendirmesinide yapalım ve son olarak **_flush_** komutumuzu verip çıkışımızı yapalım

    FLUSH PRIVILEGES;
    exit

kurulumun yarısını tamamladık sora geldi **RoundCube** nin adam akıllı olarak kurulmasına

    cd /tmp && wget http://sourceforge.net/projects/roundcubemail/files/roundcubemail/1.0.5/roundcubemail-1.0.5.tar.gz
    sudo tar -xzvf roundcubemail-1.0.5.tar.gz -C /var/www
    sudo mv /var/www/roundcubemail-1.0.5/ /var/www/webmail

ilk olarak **/tmp** dosyayı wget aracılığı ile indiriyoruz **/var/www** klasörüne **tar.gz** içerisindekileri çıkarttıktan sonra dosyanın içindekilerinin hepsini **/var/www/webmail** klasörüne taşıyoruz.sizde **/var/www/webmail** klasörü yok ise dert etmeyin oluşur zaten

    sudo chown -R www-data:www-data /var/www/webmail/*
    sudo chown -R www-data:www-data /var/www/webmail/

ve dosyaların sahiplik ayarlarını yapmamız lazım yoksa ciddi ciddi sorun çıkartır ve webmail giriş yapamayız. **www-data** olarak hem kullanıcı hemde grup ayarlamasını yapıyoruz.

    mysql -u root -p round_db3s1c < /var/www/webmail/SQL/mysql.initial.sql

son olarak _ **sql import ediyoruz** _ ve webmailimize girişimizi yapabiliriz artık ama öncelikle web üzerinden son kurulumuda gerçekleştirmek gerekiyor.

    http://siteadresiniz/webmail/installer/

![roundcubegorsel1](/assets/roundcubegorsel1-e1423421892448.jpg)

bu ilk kısmı direk olarak geçiyoruz.gerekenler zaten kurulu olarak duruyor. **Mcrypt** ve **Intl** yi siz sonradan kurabilirsiniz şuan için bir önermi yok

![roundcubegorsel2](/assets/roundcubegorsel2-e1423422028293.jpg)

bu kısım size ne şekilde geliyor ise olduğu gibi bırakın ve devam edin.daha sonra **SMTP** ve **İMAP** ayarları karşınıza gelecek mysqlde oluşturduğumuz veritabanı ve veritabanı kullanıcısını tanımlıyoruz ve kullanacağınız imap hostunuz ney ise onuda yazıyorsunuz ben Gmail tercih ettim

![roundcubegorsel3](/assets/roundcubegorsel3-e1423422323343.jpg)

Kurulum başarılı bir şekilde tamamlandıktan sonra yapmanız gereken **/installer** klasörünü silmek çünkü tekrardan bir kuruluma yeltenilmesini istemeyiz

    sudo rm -rf /var/www/webmail/installer
