---
layout: post
title: Virtualmin/Webmin Cgi Ayarları Detaylı
date: 2013-07-30 03:32:42.000000000 +03:00
type: post
published: true
status: publish
categories: linux
description: cgi konfigure etmek gerçekten de zor bir olay permission yani izinleri insanları deli edebilecek kadar zor diyemem lakin birazcık ayarlarken
---

cgi **konfigure** etmek gerçekten de zor bir olay **permission** yani izinleri insanları deli edebilecek kadar zor diyemem lakin birazcık ayarlarken insanları zorluyor .cgi scriptlerini çalıştırırken gerçekten zorluk çektiğim için ve çözüm bulurken de gerçekten çok zorlandığım için ve kullanacak kişilerin bu duruma düşmemeleri sinirlerinin bozulmaması adına en azından kendim kullanmış olduğum **webmin** panelinde gereken ayarları&nbsp;göstermek istedim.inşallah bu rehberden faydalanarak çoğu kişi sorunundan kurtulmuş olur.bu sorun panel kullanmayan site sahiplerinde 3 saat gibi ciddi zamanlarda anca çözülebilir. sunucunun&nbsp;ayarlarına ve güncelliği ile doğrudan ilgilidir.şimdi gelelim nasıl yapacağımıza arkadaşlar bildiğiniz gibi cgi yanlış ayarlandığı zaman ciddi güvenlik problemleri yaratacak bir scripting dilidir.

root olarak sunucumuza giriş yaptıktan sonra sol menüden **webmin** panelini seçiyoruz Gelen yerden **Servers** \> **Apache Web Servers** Seçiyoruz.(farklı bir web server kullanıyorsanız ayarları neredeyse aynı sorun olmayacaktır.)

![cgi setup and configure](/assets/cgiconfig1.png)

giriş yaptıktan sonra Karşımıza domainlerin olduğu yer gelecek buradan **cgi** ayarlamalarını yapacağınız domaine tıklıyoruz.

![apache server cgi image1](/assets/apache-server-cgi-image1.png)

Karşımıza bir çok ayar gelecek bizim buradaki çoğu yer ile alakamız yok bize lazım olan şuan için **"Document Options"** tıklıyoruz

![documenoptionimage1](/assets/documenoptionimage1.png)

ve karşımıza hemen ayarlarımız geliyor. buradan 2 kısmı değiştirmemiz gerekiyor diğerleri default olarak kalacak tabiki de

- Execute CGI Programs "yes"
- Generate directory indexes "yes"

Olarak ayarlıyoruz. ve Kaydediyoruz.

![executecgiimage1](/assets/executecgiimage1-1024x4771.png)

Sıra geldi tüm siteler için **cginin** ufak bir ayarını yapmaya bu kısma girmek için domain seçtiğimiz yere geliyoruz tablardan **"Global Configuration"** Kısmını Seçiyoruz.

![mimeapplicationtypeimage1](/assets/mimeapplicationtypeimage1-1024x2921.png)

Buradan **MIME Types** Seçiyoruz ce Cgi için belirlenecek olan app yi yazacağız webminde **default** olarak application/cgi yoktur bizde bunu el manual olarak belirleyeceğiz

![definemime1](/assets/definemime1-1024x2221.png)

Belirlemiş olduğumuz **MİME Type** den bir görünüm eklediğiniz zaman en altta böyle gözükmesi lazım.

![applicationdefinedmimeimage](/assets/applicationdefinedmimeimage-1024x881.png)

Bundan sonra yapacağımız son bir ayar kaldı bunu yaptıktan sonra **Cgi** uygulamalarımız sorunsuz olarak çalışacaktır.ve tekrar Eski geldiğimiz yere geliyoruz ve değişimini tamamlayacağımız domainin ayarlarına tekrar giriyoruz.

![apache server cgi image1](/assets/apache-server-cgi-image1-1024x2291.png)

Şimdide Buradan **MİME Type** Belirleyeceğiz.

![documenoptionimage1](/assets/documenoptionimage1-1024x6651.png)

Gördüğünüz gibi **Mime** kısmında **"Content handlers"** kısmını görüldüğü gibi dolduruyoruz

![Mimetype image1](/assets/Mimetype-image1-1024x2951.png)

ve en son olarak **Apache** ye restart komutunu veriyoruz.ve işlem tamamlanmış oluyor. en son yapacağınız işlem ise **FTP** ye girerek .cgi uygulamalarına 755 permissionlarını vermek böylelikle sorunsuz cgi uygulamalarınız çalışacaktır.
