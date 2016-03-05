---
layout: post
title: Geleceğin Tarayıcı Motoru Servo
date: 2016-01-02 13:06:42.000000000 +02:00
type: post
categories: Linux
description: Bundan yaklaşık 3 yıl önce mozilla tarafından başlatılan bir proje olan servo tarayıcıların yavaşlığına çare olmak için geliyordu. Rust
---

hızlı bir tarayıcı olmasının yanında ciddi anlamda az kaynak tüketimi de sağlıyor.Hala test aşamasında olsada ilerleyen zamanlarda çıkacağı ve dengeleri alt üst edeceğine adım gibi eminim öncelikle yazılan dil optimize edilmiş bir dil olduğu için C dilinden bile hızlı olup yapılan işlemlere daha çabuk tepki vermekte ve istenilen işi daha kısa sürede yapmaktadır.

Rust dili ile yazıldığından bahsetmiştik sadece 64 bit OS X, Linux, Android ve Gonk(Firefox OS) çalışan **servo** yardımlarınızı bekliyor.Geleceğin tarayıcısına neden katkı sağlamayasınız ki ?

Öncelikle Servoyu indirip kurayım denerim gibi bir şey yok kullanabilmek için derleme yapmanız gerekiyor.Biraz uzun sürse de sonuçları oldukça güzel bağımlılık sorunlarını çözerseniz derleme işlemi başarılı olacak ve tarayıcıyı deneyebileceksiniz.

```
    sudo apt-get install curl freeglut3-dev
        libfreetype6-dev libgl1-mesa-dri libglib2.0-dev xorg-dev
        gperf g++ cmake python-virtualenv python-pip
        libssl-dev libbz2-dev libosmesa6-dev libxmu6 libxmu-dev
        libglu1-mesa-dev libgles2-mesa-dev libegl1-mesa-dev
```

kurulumları ve bağımlılık sorunlarının **%60** bir kısmını yukarıdaki parametreler ile çözdüysek de geldik derleme kısmına

```
    git clone https://github.com/servo/servo
    cd servo
    ./mach build --release
```

komutu ile derlemeye başlayacaksınız sisteminizin hızına göre derleme işlemi biraz vakit alabilir.(yaklaşık 30 dk civarı)

![compileservo](/assets/compileservo.png)

Bu işlem bittiğinde test sayfasını servo ile açmak için aşağıdaki komutu kullanabilirsiniz.

```
    ./mach run tests/html/about-mozilla.html
```

![servotestpage](/assets/servotestpage.png)

Test sayfamız sorunsuz çalışıyor ise gelelim şimdi sitelerde gezmeye her sitede çalışmayacağını belirteyim tam olarak da gezme işlemi yapamazsınız ama size oldukça güzel bir deneyim sunar çünkü sayfaları işleme hızı vs oldukça fazla gözle görülür bir şekilde chromeden hızlı sayfaları açıyor hatta kendisi bile bu haliyle hızlı açılıyor.

Bir takım siteleri gezmek için aşağıdaki komutu kullanabilirsiniz.

```
    ./mach run https://mertcangokgoz.com/
```

Çıkan sonuç ise şu şekilde olacak

![servocalisma1](/assets/servocalisma1.png)

Kendi sitemde çalışmadığını gördüğüm için manjaronun sitesinde denedim ve çalışıyor tabi resimleri ve diğer linkleri göstermiyor ancak bu haliyle bile oldukça sevimli.Gözlemlediğim sorunlar;

- https desteği yok
- temel javascript hariç diğer javascript komutlarını çalıştırmıyor.
- linklerde sorun yaşatabiliyor
- tam ekran yaparken kendini kapatabiliyor
- tepsiye küçültemiyorsunuz arada patlıyor
- çok görselli bir siteyi açmaya kalkarsanız uygulama kitlenebiliyor (CTRL+C ile çözülür)
