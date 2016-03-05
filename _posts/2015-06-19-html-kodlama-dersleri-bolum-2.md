---
layout: post
title: HTML Kodlama Dersleri - Bölüm 2
date: 2015-06-19 19:19:43.000000000 +03:00
type: post
published: true
status: publish
categories: Programlama
description: Birinci Dersimizde temel HTML kodlarına giriş yaptık ve kodların neler olduğundan kısaca bahsettik birer adım daha ilerleyerek devam
---

[Birinci Dersimizde](https://mertcangokgoz.com/html-kodlama-dersleri-bolum-1/) temel **HTML** kodlarına giriş yaptık ve kodların neler olduğundan kısaca bahsettik birer adım daha ilerleyerek devam ediyoruz.Yazmış olduğumuz **HTML** son sürüm olup bu tarihe kadar yeni bir sürüm gelmedi kısacası **HTML5** devam ediyoruz.Yeni gelen özellikler oldu ve eskiden beri kullanılan kodlardada bir kaç değişikliğe gidildi haliyle bazı eski kodlar desteklenmemektedir.

Öncelikle geçen dersimizde yazdığımız Merhaba Dünya yazısını değişik ve farklı şekillerde yazabiliriz herhangi bir yazım aracı ile açıyoruz ve içerisine.

    <html>
      <body>
      <b>Merhaba Dünya</b><br/>
      <i>Merhaba Dünya</i><br/>
      <u>Merhaba Dünya</u><br/>
      <del>Merhaba Dünya</del><br/>
      </body>
    </html>

İçerisinde kullandığımız kodlar ise kısaca açıklamamız gerekirse

- \<b\> \</b\> yazıların kalın gözükmesini sağlar.
- \<i\>\</i\> yazıların italik görünmesini sağlar.
- \<u\>\</u\> yazıların altını çizili gösterir.
- \<del\>\</del\> yazıların üstünü çizili gösterir.

buraya kadar herşey tamam şimdi birazda içeriğimize resim ekleyelim.

    <!DOCTYPE html>
    <html>
    <body>
    <img src="herhangigorsel.jpg" alt="gorsel yazi" style="width:450px;height:233px;">
    </body>
    </html>

resim ekleme ve bu tarz işlemler için daima img tağını kullanacağız içerisine ise gereken bilgileri yani dosya yolun resmin alt yazısı yada boyutlarını belirleyeceğiz.Gereken resmi ekledik şimdi ise bu resme misal veriyorum bir link eklememiz gerekti işte şuraya tıklayıp şu konuya ulaşabilirsiniz şeklinde yada direk bir sitenin linkini vermek istediniz o zaman ise

    <a href="https://mertcangokgoz.com">Bilgisayar ve Teknoloji Blogu</a>

bu tarz bir kullanım ile menüler oluşturabilir yada kullanıcıları yönlendirebilirsiniz.Şimdide sayfaya bir arka plan ekleyelim

    <html>
      <body background="world.jpg">
      </body>
    </html>

Dizinimizde bulunan görseli yukarıdaki kod ile sayfamızın arkaplanına yerleştirdik.Bunu istersek renk kodu ile yapabiliriz.

    <html>
     <body bgcolor="yellow">
     </body>
    </html>

ben sarı bir renk seçtim ancak gözümüzün bebeğini yok edebilecek bir renk aslında o yüzden daha koyu tonlar seçebilirsiniz.Sayfalarınızı bu şekilde oluşturabilirsiniz.
