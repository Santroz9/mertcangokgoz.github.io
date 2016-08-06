---
layout: post
title: Ubuntu'da unutulan şifreyi sıfırlama işlemi
date: 2015-02-10 15:50:38.000000000 +02:00
type: post
published: true
status: publish
categories: linux
description: Ubuntu işletim sistemi kullanıyorsunuz ve şifrenizi unuttunuz diyelim ne yapmanız gerekiyor bu gün sizlere bundan bahsetmek istiyorum.Unutulan
---
![ubuntugorseli1](/assets/ubuntugorseli1.jpg)

**Ubuntu** işletim sistemi kullanıyorsunuz ve şifrenizi unuttunuz diyelim ne yapmanız gerekiyor bu gün sizlere bundan bahsetmek istiyorum.Unutulan şifreyi ubuntu ve diğer linux dağıtımlarında sıfırlamak aşırı şekilde kolaydır sadece yapmanız gereken ufak bir kaç işlem var hepsi bu uzatmadan işlemimize başlayalım.

![ubuntusifresifirlamagorsel1](/assets/ubuntusifresifirlamagorsel1.jpg)

öncelikle sistemi yeniden başlatıyoruz. yeniden başlama esnasında **"e" tuşuna** basıyoruz ve **grub** ekranına geçip seçimimizi yapıyoruz.

![ubuntusifresifirlamagorsel2](/assets/ubuntusifresifirlamagorsel2.jpg)

arama yapıyoruz gözümüze **linux** ile başlayan ve devamında **/boot/** ile devam eden bir satır görmemiz lazım bu satıra geldikten sonra en sonuna **init=/bin/bash&nbsp;** ekliyorsunuz böylelikle yetkilendirmeyi elimize almış oluyoruz.

![ubuntusifresifirlamagorsel3](/assets/ubuntusifresifirlamagorsel3.jpg)

ekledikten sonra **CTRL + X** yada **F10** ile kayıt edip boot edebilirsiniz.Bu işlemlerden sonra komut ekranı karşınıza gelecek burada yapacağınız işlem

    mount -o remount,rw /

diski yazılabilir şekilde tekrar **mount** etme işlemi yapmak ve ardından

    passwd

komutu ile şifreyi sıfırlamaktır bundan sonra yapacağınız şifre sisteminize giriş yapabilmenizi doğrudan sağlayacaktır.Yeni şifrenizi tanımladıktan sonra sistemi yeniden başlatmayı unutmayın

    reboot -f

yeni şifreniz artık kullanıma hazır...
