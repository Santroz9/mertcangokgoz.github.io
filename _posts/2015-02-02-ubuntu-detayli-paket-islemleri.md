---
layout: post
title: Ubuntu detaylı paket işlemleri
date: 2015-02-02 14:15:15.000000000 +02:00
type: post
published: true
status: publish
categories: linux
description: Ubuntu yada Debian işletim sistemli sunucularınıza paket yüklerken genelde apt-get yada dpkg bir uygulamayı yüklemek yada silmek için kullanıyorsunuz
---

**Ubuntu** yada **Debian** işletim sistemli sunucularınıza paket yüklerken genelde **apt-get** yada **dpkg** bir uygulamayı yüklemek yada silmek için kullanıyorsunuz diye tahmin ediyorum peki **Debian** tabanlı sistemlerde kurulumdan sonra paketin tam olarak kurulup kurulmadığını hiç kontrol ediyormusunz ? _Cevabınız hayır ise bu makalemiz sizler için geldi_

Test etmek için standart bir şekilde kurulu gelen **firefox** kullanalım

    dpkg -s firefox

![ubuntukontrolgorsel1](/assets/ubuntukontrolgorsel1-e1422541074173.png)

Çıktıda gözüktüğü üzere firefoxumuz kurulmuş bunada **Status** kısmında yazandan anlıyoruz.

Bu komutumuzda ise firefox üzerine paketsel olarak hangi işlemleri yapabiliriz onları gösteriyor bize kısacası komutları öğrenmiş oluyoruz.

    dpkg-query -l firefox

![ubuntukontrolgorsel2](/assets/ubuntukontrolgorsel2.png)

Sisteminizde kurulu olan paketleri görmek isterseniz aşağıdaki komutu verebilirsiniz ne var ne yok ise terminal ekranına yazdıracaktır.

    dpkg --get-selections

![ubuntukontrolgorsel3](/assets/ubuntukontrolgorsel3.png)

hata aldığınız yada silmek istediğiniz paketin tam adına ulaşmak istiyorsanız aşağıdaki komutu kullanabilirsiniz.

    dpkg --get-selections | grep python

![ubuntukontrolgorsel4](/assets/ubuntukontrolgorsel4.png)

Bulduğunuz paketin hangi konumda olduğunu görmek istiyorsanız ise aşağıdaki komut tam size göre

    dpkg -L firefox

![ubuntukontrolgorsel5](/assets/ubuntukontrolgorsel5.png)
