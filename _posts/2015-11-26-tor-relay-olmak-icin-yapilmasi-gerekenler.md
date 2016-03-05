---
layout: post
title: Tor Relay Olmak için Yapılması Gerekenler
date: 2015-11-26 12:57:13.000000000 +02:00
type: post
categories: Güvenlik
description: Tor(The Online Routing) yıllardır kullanıcıların internet üzerindeki faliyetlerini anonimleştirmek için geliştirilmiş bir yazılım projesidir.Kendi
---

**Tor(The Online Routing)** yıllardır kullanıcıların internet üzerindeki faliyetlerini anonimleştirmek için geliştirilmiş bir yazılım projesidir.Kendi nodeleri üzerinden kullanıcıların gerçek kimliklerini gizleyip şifreler işte biz bu yapıya dahil olacağız hem nimetlerinden faydalanmış olacağız hemde ağa katılmış olacağız.Tor bilindiği üzere kötü bir şekilde ünlendi illegal faliyetlerin tor üzerinden yapılmasıda bunun tuzu biberi oldu

Bu yazımda ise sizlere bu ağ içerisinde relay olma imkanı sunacağım yani aracı olacaksınız.Trafik sizin bağlantınız üzerindende geçecek böylelikle **Tor** bir katkıda sizler sağlamış olacaksınız.Korkmayın **tor** üzerinde yapılanlardan siz sorumlu olmazsınız sonuç itibariyle aracısınız bağlantı sadece üzerinizden direk olarak geçecek sonrasında **Exit Relay** aracılığı ile son bulacak biz ise sadece Relay olacağız yani sadece aradaki bir unsur olacağız

Öncelikli olarak yapmanız gereken sisteminize ntp kurmak sistem saatinizin güncel olması ve senkronize olması önemli.Bunun için

    sudo apt-get install ntp

komutunu vermek daha sonradan ise sunucuları tanımlamak bunun için türkiye sunucularını seçebiliri fark etmiyor yeterki uyumlu olsun

    sudo nano /etc/ntp.conf

içerisine ise şu satırları ekleyip sunucuları güncelleyeceksiniz.Eski kayıtları

    server 0.tr.pool.ntp.org
    server 1.tr.pool.ntp.org
    server 2.tr.pool.ntp.org
    server 3.tr.pool.ntp.org

Evet saatde tamamen rayına girdiğine göre gereken asıl işlemlere başlayalım.Torun sisteminizde kurulu olması lazım daha sonra ise kurulu olan bu torun relay olması için gerekli ayarların yapılım tamamlanmış olması gerekiyor.

    sudo apt-get install tor

tor paketi yanında birkaç ek paket daha kurulacaktır.Bu kurulumdan sonra ise **relay** aşaması için yapılandırma yapmamız gerekiyor.yapılandırma yapılmamış ise kullanmış olmuyorsunuz.

    sudo nano /etc/tor/torrc

dosya içerisi ön tanımlı olarak bir takım parametreler ile doldurulmuş ancak çalışır durumda değil çalışır hale getirmek için aşağıdaki gibi düzenleme yapmanız gerekiyor.

![torrcayarlarigorsel1](/assets/torrcayarlarigorsel1.png)

    RunAsDaemon 1
    ORPort 9001
    DirPort 9030
    ExitPolicy reject *:*
    Nickname ox2e88ce4
    RelayBandwidthRate 1 MB
    RelayBandwidthBurst 2 MB
    AccountingStart month 1 00:00
    AccountingMax 100 GB
    DisableDebuggerAttachment 0

yukarıdaki parametreleri ise şu şekilde tanımlayabiliriz.

- **RunAsDeamon** - sistemde servislerini tanımlar
- **ORPort** - torun çıkış portu diğer istemciler ile iletişimini sağlar
- **DirPort** - tor dizinini duyurabileceğiniz bağlantı noktasıdır.Trafiğiniz sınırsız veya yeterli ise kullanmanız önerilir
- **ExitPolicy** - Çıkış unsuru olup olmayacağınızı bu komutlar ile belirleyebilirsiniz biz reject \*:\* diyerek sadece relay yani ara unsur olmayı seçtik
- **Nickname** - Sistemde kullanabileceğiniz bir takma isim
- **RelayBandwidthRate** - unsur olarak torun kullanabileceği ağ hızını tanımlar
- **RelayBandwidthBurst** - unsur olarak torun kullanabileceği maximum ağ hızını tanımlar
- **AccountingStart** - hesabınızın trafik sayacının saat kaçda başlamasını istiyorsanız bunu girebilirsiniz aylık haftalık veya günlük olarak tanımlama yapabilirsiniz.
- **AccountingMax** - torun sisteminizde kullanabileceği maximum toplam trafiği belirtir.
- **DisableDebuggerAttachment** - hata ayıklama modunu kapatır.

Belirtmiş olduğum parametreler **Relay** olabilmeniz için olmazsa olmaz diyebileceğimiz parametrelerdir.Eğer herhangi bir sunucunuz varsa ve bunu **Exit Relay(Çıkış unsuru)** yapmak istiyorsanız daha farklı bir yol izlemeniz gerekiyor.

<script src="https://gist.github.com/MertcanGokgoz/2e81447a95af5cabec2a.js"></script>

**Exit Relay** olurken dikkat etmeniz gerekiyor zira tüm trafik sizde sonlanacak yani adam her hangi bir illegal iş gerçekleşirse son olarak sizin ip adresiniz gözükecek bu noktada sunucunuza kurarken yapılandırmanızı ona göre ve iyi bir şekilde yapmanız gerekiyor.

Ayarlamalarınız bitti ise tor sürecini yeniden başlatmanız gerekecek ki yeni tanımladığınız ayarlar geçerli olsun

    sudo service tor restart

Çalışıp çalışmadığını yada işlemin nasıl ilerlediğini sistemdeki log kayıtlarına bakarak anlayabilirsiniz.Aşağıdaki gibi bir çıktı vermiş ise doğru yoldasınız demektir.

![logciktisigorsel2](/assets/logciktisigorsel2.png)

buraya kadar sorunsuz bir şekilde geldiyseniz artık tor ağı üzerinde bir relay olarak gözüküyorsunuz ve tarafınıza uniq bir kimlik tanımlayıcı verilmiş demektir.Bunu yönetmek ve görüntülemek istiyorsanız aşağıdaki paketi kurmanız yeterlidir.

    sudo apt-get install tor-arm

kurulumu yaptıktan sonra ise aşmanız gereken bir sorun bulunuyor **tor-arm** belirli bir kullanıcı tarafından kullanılmak zorunda buda kendi içerisinde tanımlı olarak gelen **debian-tor** kullanıcısı yani izleme işlemi yaparken direk olarak **arm** diyip açmanız bir işe yaramaz istatistikleri doğru bir şekilde alamazsınız.Doğru olan komut ise şu şekilde;

    sudo -u debian-tor arm

Komutumuzu verdik ve artık ne kadar trafik harcadığını görebilir ayarlamaları buradan yapabilirsiniz.

![torrelaygorsel3](/assets/torrelaygorsel3.png)
