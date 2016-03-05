---
layout: post
title: CentOS üzerine Oracle Express Kurulumu
date: 2015-05-14 12:38:28.000000000 +03:00
type: post
published: true
status: publish
categories: Linux
description: Oracle Express kurulumunu geçen bir arkadaşın isteği üzerine centos bir sisteme kurdum ama internetdeki çoğu makale eski olduğu için hafif
---
Oracle Express kurulumunu geçen bir arkadaşın isteği üzerine centos bir sisteme kurdum ama internetdeki çoğu makale eski olduğu için hafif zorlandım ama hata bende kendi sitesine bakmalıydım bakmadığım için sıkıntı çıktı ve uğraştık şimdi size kullandığım yöntemi göstereceğim oldukça basit kurulumu hemen yapıp kullanabilirsiniz.

Öncelikle sisteme çekelim paketi

    wget http://download.oracle.com/otn/linux/oracle11g/xe/oracle-xe-11.2.0-1.0.x86_64.rpm.zip

Sisteme paket indirdikten hemen sonra zip açma ve ekipmanını kuralım

    yum install unzip bc

Oracle Express hostname ve buna bağlı olan ip ye takıntılı olduğu için önce hostname sonrada ona bağlı ip yi yazmamız lazım hosts dosyasına bunun için ise

    sudo nano /etc/sysconfig/network

yukarıya giriş yaptığınızda hemen hostname tanımlıyoruz kayıt edip çıkıyoruz standartlara uygun birşey yazarsanız işiniz kolaylaşmış olur.Hostnameyi ayarladıktan sonra Hosts içerisine tanımlamasını yapalım

    sudo nano /etc/hosts

İçerisine

    ipadresi hostname

olacak şekilde kayıtı yapıp çıkın şimdi indirdiğimiz paketi rardan çıkartma vakti geldi bunun için

    unzip oracle-xe-11.2.0-1.0.x86_64.rpm.zip

sonrasında paketimizi bi kuralım güzelce ve sisteme dahil olsun

    rpm -ivh oracle-xe-11.2.0-1.0.x86_64.rpm

Ayarlamalar için çalıştıracağımız parametremiz var burada dikkat etmeniz gereken söylediklerini harfiyen yapmak söylediği portları girmek ve ilerlemek bilginiz yoksa bu şekilde kurmak sizin işinize daha çok yarayacaktır.

    /etc/init.d/oracle-xe configure

Kodu girer girmez karşınıza çıkan yerde haliyle çoğu ayarı aynı bırakacaksınız zaten değiştirdiğiniz zaman yapacağımız ayarlar komple değişebiliyor.Ama biz default ayarlamalar ile yapacağız ve centosda güvenlik duvarını kapatacağız yoksa yapacağımız işlemleri engelliyor olacak

    lokkit --disabled

SQLPlus lokal hostdan giriş yapın ve aşağıdakileri harfiyen yapın bu ayarlamaları yapmak için genelde /etc/profile yolunu takip edebilirsiniz centos sürümünüze göre değişiklik gösterebiliyor kimi zaman ay ben bulamadım göremedim yok iyi arayacaksın

    export ORACLE_SID=XE
    export ORACLE_BASE=/u01/app/oracle
    export ORACLE_HOME=$ORACLE_BASE/product/11.2.0/xe
    export ORACLE_TERM=xterm
    export TNS_ADMIN=$ORACLE_HOME/network/admin
    export ORA_NLS33=$ORACLE_HOME/ocommon/nls/admin/data
    export LD_LIBRARY_PATH=$ORACLE_HOME/lib
    export PATH=$ORACLE_HOME/bin:$PATH

Sonunda kurulumumuz tamamlandı bu sayede Oracle Express veritabanı uygulamasını kurmuş oldunuz güle güle kullanbilirsiniz.Unutmadan hatırlatayım lisans istiyorum diye bas bas bağırabilir kişisel kullanımda gerek yok ama canınızı sıkabilir dikkat etmenizde fayda var.
