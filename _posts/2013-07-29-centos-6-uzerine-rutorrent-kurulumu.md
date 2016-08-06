---
layout: post
title: Centos 6 Üzerine Rutorrent Kurulumu
date: 2013-07-29
type: post
published: true
status: publish
categories: Linux
description: Herkesin merakla beklediği bir konu olan rutorrent ve seedbox kurulumunu sizlere burada kısaca açıklayacağım aslında gerçekten kurulumu çok
---

Herkesin merakla beklediği bir konu olan rutorrent ve seedbox kurulumunu sizlere burada kısaca açıklayacağım aslında gerçekten kurulumu çok ama çok basit ve bizimde ufak bir bash shell hazırlayarak tam otomatik bir kurulum scripti oluşturduk.önceden internette olan kurulum bilgileri eski yada gereksiz şeyler içeriyordu bunlarıda eledikten sonra ortaya böyle güzel bir şey ortaya çıktı bundan faydalanmak için tek yapmanız gereken aşşağıda yazdıklarımı yapmanız ve arkanıza yaslanıp otomatik kurulumun tadını çıkartmanız...

tarafıma gelen mail doğrultusunda dosyayı güncelleyip sorunsuz bir biçimde çalışmasını sağladım centos üzerinden permissionlardan kaynaklanabilecek sorunlarıda en aza indirmek için dosyayı 777 olarak çalıştırmanız gerekmektedir.

centos 5.9 ve centos 6 üzerinde scriptimi tekrardan test ettim sorunsuz bir biçimde çalışıyor. Sorun yaşayanlar mail yada yorum kanallarını kullanarak yardım alabilirler...

    wget https://mertcangokgoz.com/Downloads/setup.sh
    chmod +x setup.sh

Komutunu Girmek ve hemen ardından

    sh setup

Komutunu vererek scripti çalıştırıyoruz.Genel olarak ayarlaması çok kolay gelen kısımlardan kurmak istediğinizi seçiyorsunuz ve işlem başlıyor...

![rutorrent](/assets/13.png)

## Güncelleme 30 Temmuz 2013

- Dosyadaki şifreleme kaldırıldı
- Compile edilmiş hali silinip normale getirildi

## Güncelleme 13 Şubat 2016

- Kullanılan rutorrent ve diğer kütüphaneler güncellendi
- Script içerisindeki linklerin tamamı yenilendi
- Derleme yapılırken alınan hatalar kısmen giderildi

Yukarıdaki örnekte görmüş olduğunuz gibi ben apache server üstüne kurdum siz istediğiniz web server üstüne kurabilirsiniz...

# Scriptin Yapabildikleri

- Centos 6 İşletim Sistemini güncelleme
- rutorrente gerekli olan tüm eklentileri kurabilme
- Çoklu user desteği
- Gerekli olan tüm codecleri kurabilme
- Mediainfo eklentisini eksiksiz kurma
- Firewall ayarlarını yapabilme
- Gelişmiş Webmin Paneli
- Web sunucu seçebilme

Seedbox kurmak istemezmisiniz işte bu script tam size göre hazırlanmıştır.Sorunsuz ve zahmetsiz bir şekilde kurulumlarınızı tamamlar

Kurulumlar bittikten sonra Webmin paneline girmek için

    http://www.siteadiniz.com:10000

yada

    http://ipadresiniz:10000

Domain veya ip ye göre ayarları kendisi otomatik yapmaktadır.
