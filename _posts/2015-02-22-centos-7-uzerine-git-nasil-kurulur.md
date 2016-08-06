---
layout: post
title: Centos 7 üzerine git nasıl kurulur
date: 2015-02-22 14:38:09.000000000 +02:00
type: post
published: true
status: publish
categories: linux
description: Git geliştiricilerin büyük bir çoğunluğunun kullandığı versiyon kontrol uygulamasıdır.Hızlı ve kullanışlı olmasıyla popülerliğini korumakta ve
---

Git geliştiricilerin büyük bir çoğunluğunun kullandığı versiyon kontrol uygulamasıdır.Hızlı ve kullanışlı olmasıyla popülerliğini korumakta ve pek çok kişi tarafından kullanılmaktadır.

her zaman ki gibi geliştirici araçlarını kurmak ile başlayalım işe

    yum install "Development Tools"

bu kod çalışmaz ise aşağıdaki komutu verebilirsiniz yüzde 90 aşağıdaki kod çalışacaktır.

    yum groupinstall -y "Development Tools"

Bu komutu verdiğimizde 100 MB ye yakın bir indirme işlemi yapılacak sonrasında indirilenler sisteme kurulacak kurulumlardan sonra git kullanırken hata almamak adına ve gitin kullanacağı paketleri şimdiden indirmek adına komutumuzu sisteme verelim

    sudo yum install gettext-devel openssl-devel perl-CPAN perl-devel zlib-devel

sıra geldi git uygulamasının son sürümünü kurmaya github dan bakıyoruz ve son sürüm olarak 2.3.0 gözüküyor hemen indirme işlemini yapıyoruz.

    wget https://github.com/git/git/archive/v2.3.0.tar.gz

indirdiğimiz dosyamızı aşağıdaki komut ile çıkartıyoruz.

    tar xvf v2.3.0.tar.gz

Dosyanın içerisinde git klasörü olarak terminal aracılığı ile alt klasöre iniyoruz.

    cd git*

Şimdi burada kurulum işlemini gerçekleştirmemiz gerekiyor aşağıdaki adımları sırasıyla yapıyoruz.

    make configure
    ./configure --prefix=/usr/local
    make install

Adımlarımızdan sonra kurulumumuz başarılı bir şekilde tamamlanmış olması gerekiyor olası bir hata ile karşılaşırsanız [buradan bana ulaşabilirsiniz.](https://mertcangokgoz.com/soru-cevap)

Sağlıklı bir şekilde kurulduğunu ise

    git --version

Komutunu vererek versiyon bilgisi ile anlayabilmeniz mümkün.
