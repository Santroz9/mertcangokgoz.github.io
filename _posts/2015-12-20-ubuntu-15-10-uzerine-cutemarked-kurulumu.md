---
layout: post
title: Ubuntu 15.10 Üzerine CuteMarkEd Kurulumu
date: 2015-12-20 14:02:52.000000000 +02:00
type: post
published: true
status: publish
categories: Linux
description: Qt tabanlı bir şekilde geliştirilen ve Markdown yazmanızı kolaylaştıran bir uygulamadır CuteMarkEd dedikleri gibi tatlı bir uygulama bir
---

Qt tabanlı bir şekilde geliştirilen ve **Markdown** yazmanızı kolaylaştıran bir uygulamadır CuteMarkEd dedikleri gibi tatlı bir uygulama bir kaç hatası olsada işinize oldukça yarayacaktır.Github yada bir takım **Markdown** kabul edilen siteler için idealdir.

![cutemarkedgorsel1](/assets/cutemarkedgorsel1.png)

```
    git clone --recursive https://github.com/cloose/CuteMarkEd.git
```

İndirmiş olduğunuz kaynak dosyasının içerisine giriyorsunuz.

```
    cd CuteMarkEd
```

Daha sonra derleme yapacağınız ekipmanları indiriyorsunuz bunun için aşağıdaki komutu kullanabilirsiniz.

```
    sudo apt-get install build-essential checkinstall
```

Bağımlılıklarıda kurmamız gerekiyor.Eğer kurmaz isek derleme sırasında sorunlara neden olacaktır.O yüzden hataları almadan kurulumunu yapıyoruz.

```
    sudo apt-get install libqt5webkit5-dev qttools5-dev-tools qt5-default
                         discount libmarkdown2-dev libhunspell-dev
```

Bağımlılık sorununuda çözdüğümüze göre çevirileri toplarlamaya başlıyoruz.Yazarken hemde yan tarafında ne yaptığınızı tam olarak görebilirsiniz ve **grafiksel işlemleride** yapabilirsiniz.

![markdowngorsel2](/assets/markdowngorsel23.png)

Aşağıdaki komutlar ile desteklediği dilleri düzenliyoruz.Tabiki içinde türkçe yok

```
    lrelease app/translations/cutemarked_de.ts -qm app/translations/cutemarked_de.qm
    lrelease app/translations/cutemarked_cs.ts -qm app/translations/cutemarked_cs.qm
```

çevirileri düzenledik asıl aşama şimdi başlıyor direk olarak derliyoruz **Qt** ye göre derleneceği için aşağıdaki komutları girmemiz gerekiyor.

```
    qmake CuteMarkEd.pro
    make
```

oluşturulan paketimizede ufak bir ayar çekmemiz lazım dosyanın ne olduğunun tanımlanması ve gereken bir kaç paketide bu komut ile kuruyoruz.

```
    echo "A Qt-based Markdown editor with live HTML preview and syntax highlighting of markdown document." > description-pak
    sudo checkinstall --requires "libqt5webkit5, libmarkdown2, libhunspell-1.3-0, discount"
```

sembolik olarak linkleme işlemi yapıyoruz.Çalışmasında bir sıkıntı yaratmaması açısından önemli

```
    sudo ln -s /usr/lib/x86_64-linux-gnu/qt5/bin/cutemarked /usr/local/bin/
```

**Cutemarked** için icon yüklemesi yapıyoruz.

```
    sudo mkdir -p /usr/local/share/icons
    sudo cp app/icons/scalable/cutemarked.svg /usr/local/share/icons/cutemarked.svg
```

Uygulamayı açtığınızda herhangi bir hata veriyorsa **Qt** eklentisini kurmanız gerekiyor bunun için ise

```
    sudo apt-get install fcitx-libs-qt5
```

Komutunu vererek kurulumu sonlandırıyorsunuz.Artık markdown düzenleyebilmeniz için bir editörünüz oluyor çok fonksiyonlu hemde hafif bir uygulamanız.
