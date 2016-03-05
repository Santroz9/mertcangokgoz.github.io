---
layout: post
title: Apache için Sürüm bilgisini kapatma
date: 2015-01-25 13:05:43.000000000 +02:00
type: post
published: true
status: publish
categories: Güvenlik
description: Apachede Her ne kadar web server taraflı açıkların yarısından çoğu kapatılmış olsada hala piyasada eski açıklardan etkilenen sunucu ve sistemler
---
**Apachede** Her ne kadar web server taraflı açıkların yarısından çoğu kapatılmış olsada hala piyasada eski açıklardan etkilenen sunucu ve sistemler olduğu bilinmektedir.Özelikle Apache kullananların yapması gerekenlerden biri sürüm bilgisini hatalara karşı kapatmaktır.Peki bu ne demek oluyor. **Hatalı** sayfalar olduğu zaman **Apachede** eğer tanımlanmış birşey yoksa kendi hata sayfalarını gösterir bu gösterilen sayfalarda ise aşağıdaki gibi _sürüm bilgisi barınır_

![serversignatureoffgorsel1](/assets/serversignatureoffgorsel1.jpg)

Bunu kapatmak için yapmamız gerekenler oldukça basittir.Genelde **server** kuran **profesyonel** kişilerde zaten bu signature dediğimiz bilgiyi kapatırlar.Adımları takip edelim ve bizde sunucumuzda güvenliğimizi arttıralım

CentOS 6

    sudo nano /etc/httpd/conf/httpd.conf

Ubuntu

    sudo nano /etc/apache2/apache2.conf

ayar dosyamıza ekleyeceğimiz satırlar ise şu şekildedir.

    ServerSignature Off
    ServerTokens Prod

Sonrasında kayıt edip çıkıyoruz.Bundan sonra yapmamız gereken apache web sunucusunu yeniden başlatmak

CentOS 6

    sudo service httpd restart

CentOS 7

    sudo systemctl restart httpd.service

Ubuntu

    sudo service apache2 restart

En sonunda çıkan sonuç ise şu şekilde olacak ve hatalarınızda artık **sürüm** bilgisi bulunmayacak

![serversignatureoffgorsel2](/assets/serversignatureoffgorsel2.jpg)

Peki eklediğimiz kod satırları içerisinde "`ServerTokens Prod`" vardı diyeceksiniz ki bu ne işe yarıyor.Bu server tarafında Eğer bi **cURL** yada herhangi bi sorgulama işlemi uygulanırsa serverin sürüm bilgisini vermemesini sağlıyoruz.Böylelikle saldırganın işini bi nebze _zorlaştırmış oluyoruz._
