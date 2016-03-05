---
layout: post
title: Ubuntu 15.04 Üzerine Spotify Kurulumu
date: 2015-06-24 18:37:08.000000000 +03:00
type: post
published: true
status: publish
categories: Linux
description: Ubuntu 15.04 üzerine sizlerden gelen istek doğrultusunda Spotify kurulumunu göstermek istiyorum hala beta olarak yayında bulunan Spotify

---

**Ubuntu** 15.04 üzerine sizlerden gelen istek doğrultusunda **Spotify** kurulumunu göstermek istiyorum hala beta olarak yayında bulunan **Spotify** linux sürümünü sistemimize kuracağız ve ortaya çıkan bir kaç sorunu çözeceğiz aslında verdiği hata bir sorundan kaynaklanmıyor bilindiği gibi spotify müzikleri şifreli bir şekilde bize ulaştırıyor indirilmesin yada çözülemesin diye anlayacağınız Telif haklarından dolayı Açık kaynak kodlu sistemlerede bunu entegre etmişler haliyle bu yüzden bir kaç şifreleme kütüphanesinide kurmamız gerekli ilk olarak onları kurmak ile başlayalım.

[64-bit için libgcrypt11](https://launchpad.net/ubuntu/+archive/primary/+files/libgcrypt11_1.5.3-2ubuntu4.2_amd64.deb)

[32-bit için libgcrypt11](https://launchpad.net/ubuntu/+archive/primary/+files/libgcrypt11_1.5.3-2ubuntu4.2_i386.deb)

İndirdiğiniz paketleri çift tıklayarak kolaylıkla kurabilirsiniz.Kurulumlar tamamlandıktan sonra ise asıl kurulum aşamasına rahatlıkla geçebiliriz.Bunun için aşağıdaki adımları takip etmeniz yeterli kuruluma geçebilmek için yönetici izinlerine geçiş yapıyoruz.

    sudo su

Şimdi ise uygulamanın kurulması için gereken depoyu tanımlıyoruz.

    sudo add-apt-repository "deb http://repository.spotify.com stable non-free"

İndirebilmemiz için gerekli olan güvenlik şifresinide sisteme ekleyelim

    sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 94558F59 D2C19886

Yeni eklediğimiz depoları sistemin algılaması lazım depo önbelleğini yeniliyoruz.

    sudo apt-get update

İşlemlerimiz neredeyse bitti şimdi **Spotify** kurulumunu tamamlıyoruz.

    sudo apt install spotify-client

Kurulumumuz tamamlandı giriş yapıyoruz ve önünüzde milyonlarca müzik oluyor istediğinizi dinleyebilirsiniz **premium** edinerekde reklamlardan kurtulabilirsiniz.

![spotifyornekgorsel1](/assets/spotifyornekgorsel1.png)
