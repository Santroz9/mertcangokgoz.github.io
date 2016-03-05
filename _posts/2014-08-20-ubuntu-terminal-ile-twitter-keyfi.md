---
layout: post
title: Ubuntu Terminal ile Twitter Keyfi
date: 2014-08-20 20:26:13.000000000 +03:00
type: post
published: true
status: publish
categories: Linux
description: başlıktada belirttiğim gibi ubuntu terminalden twitter kullanabilirsiniz.nasıl olacak lan bu diyorsanız adamlar yapmış aga twitter API ile python üzerinde
---
başlıktada belirttiğim gibi ubuntu terminalden twitter kullanabilirsiniz.nasıl olacak lan bu diyorsanız adamlar yapmış aga twitter API ile python üzerinde geliştirmişler ve gerçekten kaliteli bir ürün ortaya çıkmış bende böyle birşeyin olduğunu twitterdan öğrendim açıkcası.

Kullanmamız için sistemimizde python kurulu olmalı ve ya 2.7 yada 3 serisinden olmalı ki kullanabilelim bakalım versiyonumuz neymiş

![rainbowstreamtwittergorsel1](/assets/rainbowstreamtwittergorsel1.png)

gördüğünüz üzere versiyonumuz programı kullanabilmemiz için uygundur.hemen bir sonraki adımda pip kurulumu yapmamız gerekiyor ki asıl kuruluma geçebilelim bunun için ise

    $sudo apt-get install python-pip python-dev build-essential
    sudo pip install --upgrade pip
    sudo pip install --upgrade virtualenv

![rainbowstreamtwittergorsel2](/assets/rainbowstreamtwittergorsel2.png)

Kurulum tamamlandıktan sonra pip aracılığı ile bi kurulum yapmamız lazım bunun için

    sudo pip install rainbowstream
    ////Python 3 için
    sudo pip3 install rainbowstream

Sonrasında kurulum için gerekli olan son paketide indiriyoruz ve kuruyoruz.

    sudo apt-get install python-virtualenv

pip bi derleme işlemi yapıyoruz aslında onuda kuruyoruzda derliyoruz sayın siz.

    virtualenv venv

![rainbowstreamtwittergorsel3](/assets/rainbowstreamtwittergorsel3.png)

Kurulumlar tamamlandıktan sonra sisteminize bi restart atın sonrasında aşağıdaki komutu verin

    sudo su
    rainbowstream

![rainbowstreamtwittergorsel4](/assets/rainbowstreamtwittergorsel4.png)

Burada pin istiyor telaşlanmayın hemen bi oauth kısmı açılacak sisteminizde karşınıza ıd ve pw kısmı gelecek girişimizi yapıp uygulamaya izin veriyoruz.

![rainbowstreamtwittergorsel5](/assets/rainbowstreamtwittergorsel5-904x576.png)

onayladıktan sonra karşınıza pin ekranı gelecek bu pinide terminalde gireceğiz ve uygulamaya izin vereceğiz sonrasında cayır cayır twit atabilirisniz.

![rainbowstreamtwittergorsel6](/assets/rainbowstreamtwittergorsel6-e1408554374442-904x576.png)

Sonuç olarak giriş yaptık

![rainbowstreamtwittergorsel7](/assets/rainbowstreamtwittergorsel7.png)Resimleri göremiyom ne edecem diosanız olay basit

    rainbowstream --image-on-term

Komutumuzu veriyoruz ve twitimizi atıyoruz. gayet basit ve kullanışlı

![rainbowstreamtwittergorsel8](/assets/rainbowstreamtwittergorsel8.png)

Twittera gitmişmi diye kontrol edelim

![rainbowstreamtwittergorsel9](/assets/rainbowstreamtwittergorsel9.png)

Komutlarımız

- t = twitter atmanıza olanak sağlar
- rt 1 = id numarası 1 olan twiti retweet yapar idleri programdan görebilirsiniz turuncu olarak işaretlenmiştir.
- quote 1 = id numarası 1 olan twitden alıntı yapmanıza yardımcıdır.
- fav 1 = id numarası 1 olan twiti fav atarsınız
- ufav 1= id numarası 1 olan twiti favdan kaldırırsınız.
- del 1 = id numarası 1 olan twiti siler
- open 1 = id numarası 1 olan twiti tarayıcıda açar

Genel olarak komutlar bunlardır geri kalan tüm komutlar için [RainbowStream Official Web Page](http://rainbowstream.readthedocs.org/en/latest/)
