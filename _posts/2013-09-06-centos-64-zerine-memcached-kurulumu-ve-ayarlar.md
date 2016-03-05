---
layout: post
title: Centos 6 Üzerine Memcached Kurulumu
date: 2013-09-06 21:10:59.000000000 +03:00
type: post
published: true
status: publish
categories: Linux
description: Sitelerinde yüksek performans isteyenlerin olmazsa olmazı memcached,memcache sayesinde veritabanı üzerindeki yükleri azaltarak gerekse dinamik
---

Sitelerinde yüksek performans isteyenlerin olmazsa olmazı memcached sayesinde veritabanı üzerindeki yükleri azaltarak gerekse dinamik web sitelerinin hızını artırmak için tasarlanmıştır.&nbsp; **Memcached** sadece dinamik web uygulamaları dışında, diğer durumlarda çok yararlıdır.Türkiye de fazla yaygın olmamasının nedenini kurulumunun zor olmasından diye düşündüm çünkü eskiden biraz uğraştırıcıdır ancak şu son zamanlarda rpm lerin çıkması kurulumunun özellikle **centos** açısından kolay olmasını sağlamıştır.

**Kurulum İşlemi**

Öncelikle bize lazım olan rpmleri sistemimize eklemek ile başlıyoruz.

    rpm -Uvh http://dl.fedoraproject.org/pub/epel/5/i386/epel-release-5-4.noarch.rpm
    rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-5.rpm
    yum update

diyoruz ve rpmler sitemize iyice işlenmiş oluyorbu işlemden sonra kurulum sadece tek bir parametreye bakıyor.

    yum -y install memcached

komutunu verdikten sonra bizim yapacak tek bir işimiz kalıyor oda ince ayarları zaten zor olanda işte burası ben bu örnek ayarları verirken sistemimizin ram değerlerinin yüksek olduğunu düşünerek yapacağım ancak siz **VPS** kullanıyorsanız ve ram değerleriniz kısıtlı ise kendinize göre bir ayarlama çıkartmak zorunda kalabilirsiniz.

##### cache için ayrılacak olan ramı belirlemek için yapmamız gereken

    nano -w /etc/sysconfig/memcached

komutunu veriyoruz ve açılan kısımda gereken ayarlamaları yapacağız ben ramı **512 mb** olarak almayı düşündüm

    PORT="11211"
    USER="memcached"
    MAXCONN="1024"
    CACHESIZE="512"
    OPTIONS=""

**CTRL + X** komutunu veriyoruz ve kayıt ediyoruz.sıra memcached i çalıştırmaya geldi

    /etc/init.d/memcached start

yada

    service memcached start

ve cache sistemimiz çalışmaya başladı sistem her başlatıldığında otomatik başlamasını istiyorsanız ki bu önemlidir(sunucuya reset atıldığı zamanlarda)

    chkconfig memcached on

herşeyin yolunda olduğunu anlamaya geldi sıra

    echo stats | nc localhost 11211

stat şeklinde bir çıktı vermesi lazım zaten sorun olursa belirtecektir ve işlemleri ona göre düzenleyebilirsiniz.gelelim en önemli noktaya centos güvenlik duvarında bu porta izin vermemiz gerekiyor yoksa memcached de hatalarla karşılaşacağız.bu yüzden hemen iptables düzenlemelerini yapmamız lazım

**Centos 6 memcached firewall ayarları**

    nano -w /etc/sysconfig/iptables

girişimizi yapıyoruz en alt satıra iniyoruz ve aşağıdaki kodu ekliyoruz ve kayıt edip çıkıyoruz.

    -A INPUT -m state --state NEW -m tcp -p tcp --dport 11211 -j ACCEPT

Kayıt etmek ve çıkma işlemi için CTRL+X tuşunu kullanacağız.

    /etc/init.d/iptables restart

yada

    service iptables restart

ayarların olup olmadığını test etmek için

    echo stats | nc siteadiniz yada ip adresi 11211

#### Centos için memcached modüllerinin kurulması

memcache modülleri hakkında bilgi almak için [Tıklayın](http://tr2.php.net/memcache)

memcached modülleri hakkında bilgi almak için [Tıklayın](https://code.google.com/p/memcached/wiki/NewStart?tm=6)

iki modülünde kurulumu aşağıda belirtilmiştir.

    yum -y install php php-pecl-memcache
    yum -y install php php-pecl-memcached

hemen ardından web serveri yeniden başlatıyoruz.

    /etc/init.d/httpd restart

yada

    service httpd restart

işlemimiz sona erdi artık siteleriniz daha hızlı bir şekilde açılacak ve daha hızlı işlemler yapabileceksiniz.
