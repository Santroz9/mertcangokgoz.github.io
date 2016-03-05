---
layout: post
title: Htaccess yöntemiyle Uploads klasörünün korunması
date: 2013-08-25 19:43:47.000000000 +03:00
type: post
published: true
status: publish
categories: Güvenlik
description: Merhaba arkadaşlar biliyorsunuz ki wordpress de resimler vs vs kullanacağınız materyalleri eklemeniz gereken bir klasördür uploads klasorunu
---

Merhaba arkadaşlar biliyorsunuz ki wordpress de resimler vs vs kullanacağınız materyalleri eklemeniz gereken bir klasördür uploads ve bildiğiniz gibi dosya izinleri **chmod +x yani 777** olarak ayarlıdır.Buda herkesin dosyalar üzerinde işlem yapabilmesi gibi pek çok güvenlik ihlaline neden olmaktadır ki bu wordpress açısından oldukça **tehlikelidir**.Ancak saldırganları kolaylıkla püskürtmek çok ama çok kolay sadece birkaç ” **.htaccess** ” eki ile **Uploads** klasörünü koruyabilirsiniz zahmetsiz ve kullanışlıdır.yani demek istediğim belirlediğiniz dosyalar haricinde Uploads klasörüne dosya kabul edilmeyecektir.

Yapmanız gereken **Uploads** klasörüne girerek.htaccess oluşturmak ve içerisine aşağıdaki kodu eklemek olucaktır.

    # secure uploads directory
    <Files ~ ".*\..*">
    Order Allow,Deny
    Deny from all
    </Files>
    <FilesMatch "\.(jpg|jpeg|jpe|gif|png|tif|tiff|mov|wmv)$">
    Order Deny,Allow
    Allow from all
    </FilesMatch>

Ekledikten sonra kayıt edip çıkın bundan sonra **uploads** klasörüne belirledikleriniz harici kesinlikle alınmayacak.bunlar dışında ekleme yapmak istiyorsanız.

    <FilesMatch "\.(jpg|jpeg|jpe|gif|png|tif|tiff|mov|wmv|zip|pdf)$">
