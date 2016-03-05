---
layout: post
title: Skype'de Kullanıcı İPsini Öğrenmek
date: 2015-07-03 06:46:15.000000000 +03:00
type: post
published: true
status: publish
categories: Güvenlik
description: Skype bilindiği gibi dünya üzerinde popüler olarak kullanılan
    bir yazışma,sesli konuşma uygulaması popüler olmasından dolayıda saldırılar ve
    buna bağlı
---

**Skype** bilindiği gibi dünya üzerinde popüler olarak kullanılan bir yazışma,sesli konuşma uygulaması popüler olmasından dolayıda saldırılar ve buna bağlı olarak sızıntılarında kaynağı örnek vermek gerekirse bu makalede de göreceğiniz gibi ip adresiniz belirlenebiliyor.Buna bağlı olarak **ip** adresinize saldırı alabiliyorsunuz yada ip adresiniz belli ise bu adres üzerinden skype adresiniz çözümlenebiliyor.

Kullanıcı Adı ile **ip** adresinin çözülenme işlemi için aşağıdaki adımları izleyebilirsiniz.Bunun için size bir linux dağıtımı lazım önerim centos yada ubuntu

    sudo su
    cd /usr/local/bin
    wget https://mertcangokgoz.com/Downloads/skypersolver.sh
    chmod +x skypersolver.sh
    ./skypersolver.sh

Sonrasında uygulamaya ip adresini çözümleyeceğiniz kişinin kullanıcı adını girmeniz yeterlidir.Sonrasında otomatik olarak ip adresi belirlenecektir.Peki bu **İp** belirleme işleminden nasıl korunacağız.Aslında pek mümkün olmasa da yapabileceğimiz 2 yöntem var bunlardan birincisi çözümlenen **portu** kapatmak

Windows için

    netsh advfirewall firewall add rule name="Skype Anti Resolver TCP" dir=in action=block protocol=TCP localport=32535
    netsh advfirewall firewall add rule name="Skype Anti Resolver UDP" dir=in action=block protocol=UDP localport=32535
    netsh advfirewall firewall add rule name="Skype Anti Resolver TCP" dir=in action=block protocol=TCP localport=40031
    netsh advfirewall firewall add rule name="Skype Anti Resolver UDP" dir=in action=block protocol=UDP localport=40031
    netsh advfirewall firewall add rule name="Skype Anti Resolver TCP" dir=out action=block protocol=TCP localport=32535
    netsh advfirewall firewall add rule name="Skype Anti Resolver UDP" dir=out action=block protocol=UDP localport=32535
    netsh advfirewall firewall add rule name="Skype Anti Resolver TCP" dir=out action=block protocol=TCP localport=40031
    netsh advfirewall firewall add rule name="Skype Anti Resolver UDP" dir=out action=block protocol=UDP localport=40031

Linux için(Ubuntu,Debian)

    sudo ufw deny 32535/tcp
    sudo ufw deny 40031/tcp
    sudo ufw deny 32535/udp
    sudo ufw deny 40031/udp

Yaptığınız bu işlemler sonucunda skyp'ye bağlanamayabilirsiniz.Bunlar dışında yapacağınız işlemler ise

1. **Upnp** devre dışı bırakmak
2. Kişi listenizdekiler dışındaki isteklere cevap vermemek

![skyperesolver](/assets/skyperesolvergorsel1-e1435895247884.jpg)

İkincisi&nbsp;ise **skype** üzerinde **proxy** kullanmaktır pek önermesemde kullanmanızda fayda var çünkü yukarıdaki yöntemler yapılsa bile bazı kişiler ve bazı sistemlerde ip adresiniz hala çözümlenmeye devam edecektir.
