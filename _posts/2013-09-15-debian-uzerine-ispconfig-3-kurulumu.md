---
layout: post
title: Debian Üzerine ISPConfig 3 Kurulumu
date: 2013-09-15 01:51:50.000000000 +03:00
type: post
published: true
status: publish
categories: Linux
description: bizim size tavsiyemiz ispconfig 3 kurulumu için debian 7 seçmeniz.kurulumu gerçekten basit kurulum esnasında sizden sadece 3-4 adet bilgi
---

Cpanel e alternatif olarak geliştirilen,kullanımı kolay ve ücretsiz paneller arasında en popüler olanı diyebiliriz. cpanel lisansına tonla para dökmenize gerek kalmadan sitenizi kolaylıkla yönetebilirsiniz.bizim size tavsiyemiz **ispconfig** 3 kurulumu için **debian** 7 seçmeniz.kurulumu gerçekten basit kurulum esnasında sizden sadece 3-4 adet bilgi isteyecek ve sorunsuz bir şekilde kuracaksınız.

Kurulum parametresi

    cd /tmp; wget --no-check-certificate -O ISPConfig3.tgz https://github.com/dclardy64/ISPConfig-3-Debian-Installer/tarball/master; tar zxvf ISPConfig3.tgz; cd *Installer*; bash install.sh

yukarıdaki kodu kullanarak debian üzerine kolaylıkla kurulum yapabilirsiniz.aslında internette pek çok makale mevcut ancak fazlasıyla kafamızı yoracağı için uğraşmaya değmez.

Kurulum için **chmod +x** olan bir yer lazım olduğu için komutumuzun başınca **tmp** klasörüne giriş yapmamız gerekmektedir.(yukarıdaki kodu SSH ye aynen kopyalayınız.)

Kurulum tamamlandıktan sonra default olarak giriş bilgilerimiz

- **Kullanıcı adı : admin**
- **Şifre : admin**

Olarak giriş yaptıktan hemen sonra karşımıza aşağıdaki yer gelecek ve ayarlamalarımızı kolaylıkla yapabileceğiz.

![ispconfig3anamenu](/assets/ispconfig3anamenu-1024x7261.png)
