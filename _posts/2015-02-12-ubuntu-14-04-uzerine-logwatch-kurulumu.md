---
layout: post
title: Ubuntu 14.04 üzerine LogWatch kurulumu
date: 2015-02-12 14:07:59.000000000 +02:00
type: post
published: true
status: publish
categories: Linux
description: Logwatch sisteminizdeki logların analizinde kullanabileceğiniz bir uygulama aslına bakarsanız.Bu uygulama sistem loglarını iyi bir biçimde sizlere
---
**Logwatch** sisteminizdeki logların analizinde kullanabileceğiniz bir uygulama aslına bakarsanız.Bu uygulama sistem loglarını iyi bir biçimde sizlere sunmayı amaçlıyor.kurulumu oldukça basit olan bu uygulamayı ubuntu 14.04 üzerine kurup ayarlarını yapacağız.

İlk olarak kurulum komutumuzu veriyoruz.

    sudo apt-get install logwatch -y

![logwatchgorsel1](/assets/logwatchgorsel1.png)

Postfix üzerine bir kaç ayarlama ve gerekli yapılandırmaları yapması için onaylayıp devam edeceğiz

![logwatchgorsel2](/assets/logwatchgorsel2.png)

Internet Site ayarını seçiyoruz ki direk olarak **SMTP** kullansın ve bize mail atabilsin sistem

![logwatchgorsel3](/assets/logwatchgorsel3.png)

Sistemde kullanılan hostnameyi buraya girmeniz gerekmekte ve bu gireceğiniz hostname **FQDN** kurallarına uymak zorunda ben yukardaki gibi bir seçimde bulundum.Zaten **hostname** de o şekilde ayarlıydı bende

![logwatchgorsel4](/assets/logwatchgorsel4.png)

İşlemler bittikten sonra kurulum aşamasına geçiliyor ve 1 dk sonra uygulama sisteminize kurulmuş oluyor.Bundan sonra bir kaç ufak ayarlama yapacağız ki mailler bize ulaşsın ve uygulamada mail atabilsin

    sudo su
    nano /usr/share/logwatch/default.conf/logwatch.conf

İçerisine giriyoruz ve aşağıdaki yerleri gerektiği gibi değiştiriyoruz.

![logwatchgorsel5](/assets/logwatchgorsel5.png)

    Output = mail
    Format = html
    MailTo = mail adresiniz
    Range = Today

Kayıt edip çıkış yapıyorsunuz logların tarafımıza ne şekilde geleceği ve gelirken hangi formatta olacağını belirlemiş olduk şimdi bir tek ayar kaldı uygulamanın bize mail göndermesine bunun için

    nano /etc/cron.daily/00logwatch

Komutunu veriyoruz ve aşağıdaki gibi ayarlamaları yapıyoruz mail adresi logwatch.conf ayarladığınız ile aynı olmalı birden fazlada mail ekleyebilirsiniz.

![logwatchgorsel6](/assets/logwatchgorsel6.png)

Kayıt edip çıkıyorsunuz bu işlemde başarılı bir şekilde gerçekleştiğine göre terminalden komutumuzu verebiliriz.

    logwatch

Biraz bekletiyor sistem ve logları tarafınıza mail olarak gönderiyor eğer ayarlamaları eksik yada yanlış yaptıysanız mail tarafınıza ulaşmayacaktır.Ayrıca bunu belli aralıklarla göndermesini istersenizde cronjob ayarlaması yapabilirsiniz.

    crontab -e

Komutumuzu verip hangi editör ile açacağımızı seçeceğiz ben nano sevdiğim için nano seçiyorum ve ayarlamayı aşağıdaki gibi yapıyorum.

    0 15 * * * /usr/sbin/logwatch

![logwatchgorsel7](/assets/logwatchgorsel7-e1423139781635.png)

Bundan sonra ayarladığınız saat aralığında göndericek ben 15 saat olarak ayarladım.Her 15 saatte bir uygulama mail olarak logları bana göndericek.Şüpheli bir durum olduğunda ise gereken ayarları yapabileceğim
