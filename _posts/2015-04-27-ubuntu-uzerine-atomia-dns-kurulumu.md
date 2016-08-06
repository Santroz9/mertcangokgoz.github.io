---
layout: post
title: Ubuntu Üzerine Atomia DNS Kurulumu
date: 2015-04-27 12:03:12.000000000 +03:00
type: post
published: true
status: publish
categories: linux
description: Atomia DNS Sistemdeki DNS serverların yönetilmesinde kullanılabilir.Bir veya birden çok sistemde kullanılabilir.Local kurallar üzerinde etkisi büyüktür
---
Atomia DNS Sistemdeki DNS serverların yönetilmesinde kullanılabilir.Bir veya birden çok sistemde kullanılabilir.Local kurallar üzerinde etkisi büyüktür yerel bir veritabanı oluşturarak sorguların o veritabanı üzerinden akmasını sağlar yönetilebilirlik açısından oldukça kolaydır.Hiyararşik bir yapıya sahip olursunuz.

![atomiadnsyenilogo](/assets/atomiadnsyenilogo-e1429924485586.jpg)

Tüm sunuculardan bilgi içeren ana bir veritabanı ile sistem beslenir sonradan oluşturacağınız kurallar bu veritabanına göre şekillenir.Ölçeklenebilir olması bakımından AtomiaDNS güzel bir sistemdir.Bunun ile birlikde AtomiaDNS güncelleştirmeleri yapabileceğiniz birde APİ desteği ile birlikte gelir.

Atomia DNS programlı bir şekilde SOAP arayüzü üzerinden DNS bölgelerini kolaylıkla yönetimini sağlayan bir DNS sistemidir. Sistem, aşağıda tarif edilen bir kaç parçadan oluşur.

![atomiadnsgorsel1](/assets/atomiadnsgorsel1-e1429924727540.jpg)

## Atomia DNS Özellikleri

- **Program arayüzü** : Atomia DNS SOAP arabirimini kullanarak bir başka uygulama ile Atomia DNS'yi entegre edebilirsiniz.
- **Ölçeklenebilirlik** : Daha fazla sunucu ekleyerek DNS sistemini daha fazla ölçeklendirebilirsiniz.
- **Gerçek zamanlı güncellemeler** : Yeniden yapılandırılması kesinti yaratmayan yapısı
- **Her zaman geçerli bir DNS-verileri** : veritabanına yanlış DNS kaydı ekleyememe.
- **Farklı veri merkezleri** : Farklı veri merkezlerinde DNS sunucularını yönetebilirsiniz

Kurulum için aşağıdaki aşamaları yapmanız yeterli olacaktır.

    sudo su
    repo="$(wget -q -O - http://public.apt.atomia.com/setup.sh.shtml | sed s/%distcode/`lsb_release -c | awk '{ print $2 }'`/g)"; echo "$repo"
    echo "$repo" | sh

Paket ekleme ve ufak bir kaç işlemden sonra kurulum parametremiz

    apt-get install atomiadns-masterserver

Uygulamayı başlatmadan hemen önce yapmanız gereken bir kaç ayar var kullanıcı adı ve şifre belirlemekde bunlardan bazıları "`/etc/atomiadns.conf`" dosyasını açıyoruz aşağıdaki satırları istediğiniz şekilde doldurabilirsiniz.

    soap_uri = http://localhost/atomiadns
    soap_username = Kullanıcı Adı
    soap_password = Şifre
