---
layout: post
title: Ubuntu Üzerine OnlyOffice Kurulumu
date: 2015-03-05 14:40:18.000000000 +02:00
type: post
published: true
status: publish
categories: Linux
description: OnlyOffice ücretsiz ve açık kaynak kodlu bir office uygulamasıdır online olarak ekip çalışmaları yapabilir arkadaşlarınız ile dokümanlarınız üzerinde
---

OnlyOffice ücretsiz ve açık kaynak kodlu bir office uygulamasıdır online olarak ekip çalışmaları yapabilir arkadaşlarınız ile dokümanlarınız üzerinde çalışabilirsiniz.Ücretsiz olmasının dışında linux sistemler için iyi bir alternatifdir.

- Çevrim için bulut depolama sistemlerini bütünleşik olarak kullanabilirsiniz.Google Drive,Box,OneDrive,Dropbox,SharePoint
- [Grantt Çizelgesi](https://tr.wikipedia.org/wiki/Gantt_%C3%A7izelgesi) ile projelerinizi yönetebilirsiniz.
- Müşteri ilişkileri yönetimini yapabilirsiniz aynı zamanda faturalarınız ve günü gelmiş işlemlerinizide OnlyOffice ile yapabilirsiniz.
- Uygulama içerisinde bir çok araç ile gelir başka uygulamaya gerek duymadan işlemler yapabilirsiniz
- Uygulamaya dahil birde E-Mail aggregator ile birlikte gelir

Bu uygulamayı Ubuntu dahil tüm debian tabanlı işletim sistemlerine kolaylıkla kurabilirsiniz.

Kurulum

    sudo wget http://download.onlyoffice.com/repo/onlyoffice.key
    sudo apt-key add onlyoffice.key

daha sonra kaynaklardan ufak bir ayar yapmamız gerekiyor kuru kuruya kurulum gerçekleşmiyor **sources.list** içerisine ekleme yapacağız

    sudo nano /etc/apt/sources.list

Eklenecek satır ise

    deb http://download.onlyoffice.com/repo/debian squeeze main

sonrasında ise sıradan kurulum prosedürlerini yerine getirmelisiniz

    sudo apt-get update
    sudo apt-get install onlyoffice

![onlyofficegorsel1](/assets/onlyofficegorsel1.png)

Sisteme Uygulamayı kurduktan sonra sıra geldi arayüzünde yapılacak olan ayarlara istenilenleri doğru bir şekilde giriniz

![onlyofficegorsel2](/assets/onlyofficegorsel2-e1425069507577.jpg)

![onlyofficegorsel3](/assets/onlyofficegorsel3.jpg)
