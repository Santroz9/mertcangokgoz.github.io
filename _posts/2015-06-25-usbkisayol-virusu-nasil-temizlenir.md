---
layout: post
title: USB/Kısayol Virüsü Nasıl Temizlenir
date: 2015-06-25 23:15:14.000000000 +03:00
type: post
published: true
status: publish
categories: Windows
description: Genelde okulda USB belleği taktığımız zaman bu virüs hemen belleğe yapışır sonrasında ise dosya içeriğimizi göremeyiz bize gösterdiği kısayollar
---

Genelde okulda **USB** belleği taktığımız zaman bu virüs hemen belleğe yapışır sonrasında ise dosya içeriğimizi göremeyiz bize gösterdiği kısayollar olur sonrasında dosyayı o an aradığında bulamazsın oldukça sinir bozucu bir durum hadi bi sunum yapıcan bi işin var çıktı alıcaksın çat insanın burnundan getiriyor.

Bu sorunu çözüm olarak ise **USB** bellek takılı halde iken aşağıdaki komutu **Çalıştır** kısmına **cmd** yazıp enter diyerek girelim

    attrib -h -r -s /s /d H:\*.*

Sonda bulunan **H:\*.\*** ifadesi **USB** belleğin adı sizde farklı olabilir ona göre düzenleyin enter bastığınız zaman virüs ortadan kalkıcak dosyalarınızı rahatlıkla görebileceksiniz. **Linux** ve diğer sistemlerde ise bu virüs çalışmıyor.Ayrıca **USB** içerisinde uzantısı **.exe** olan ve tanımadığınız tüm dosyaları silin
