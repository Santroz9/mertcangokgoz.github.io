---
layout: post
title: Ubuntu 15.04 Bumblebee Kurulum ve Ayarları
date: 2015-06-23 22:22:36.000000000 +03:00
type: post
published: true
status: publish
categories: linux
description: "Çift ekran kartı olan laptoplar için kurulmasını şiddetle önerdiğimiz bir uygulama var oda Bumblebee bu uygulama sayesinde intel"
---

Çift ekran kartı olan laptoplar için kurulmasını şiddetle önerdiğimiz bir uygulama var oda Bumblebee bu uygulama sayesinde intel ve Nvidia kartınız arasında geçiş yapabilirsiniz.hatta uğraşırsanız ikisini birden bile kullanabilirsiniz.

Kurulumu oldukça basit ilk olarak gereken uygulama paketlerini indirelim

    sudo apt-get install bumblebee bumblebee-nvidia primus nvidia-346

yaklaşık bi 400 MB yakın indirme olacak tabi sisteminizde nvidia ekran kartının sürücüsü kurulu ise sadece bumblebee paketlerini indireceği için oldukça kısa sürecek indirme işlemi

Kurulum esnasında hata alırsanız kurmanız gerekenler

    sudo apt-get install python-appindicator
    sudo apt-get install git

Kullanıcı grup ve kullanıcı ayarları için ufak bi ayarlama yapalım

    sudo adduser bumblebee $USER

Ubuntu 15.04 de ise otomatik olarak başlatılması için aşağıdaki komutu girin ubuntu 14.10 sürümlerine kadar otomatik olarak çalışan bu güzelim uygulama 15.04 de cıvıtmış ve illa bizim açmamızı istiyor.

    sudo systemctl enable bumblebeed

Modüllerini eklemeye geldi 2 tane modül ekleyeceğiz birtanesi geçişleri kontrol eden bir diğeride çakışmaları engelleyen bir modül bunlardan 2 sinide `/etc/modules-load.d/modules.conf` ekleyeceğiz bunun için

    nano /etc/modules-load.d/modules.conf

Hemen içerisine modüllerin bitimine direk olarak **i915** ve **bbswitch** eklemelerini yapıyoruz.

![modulesgorsel1](/assets/modulesgorsel1.png)

CTRL+X diyerek kayıt ediyoruz.Sıra geldi bumblebee ayarlarına bu ayarları yapmazsak çalışmayacak çünkü hangi driver ile çalışacağını bilemeyecek ve haliyle servisi başlatamayacaksınız bu ayarları düzenlemek için ise aşağıdaki adımları takip etmeniz yeterli

    sudo nano /etc/bumblebee/bumblebee.conf

![bumblebeegorsel1](/assets/bumblebeegorsel1.png)

yukarıdaki görselde görüldüğü gibi düzenleyeceğimiz 4 yer var bunlar sırasıyla

    Driver=nvidia
    KernelDriver=nvidia-346
    LibraryPath=/usr/lib/nvidia-346:/usr/lib32/nvidia-346
    XorgModulePath=/usr/lib/nvidia-346/xorg,/usr/lib/xorg/modules

bu satırları kurmuş olduğunuz nvidia sürücü sürümü ile güncelleyeceksiniz.bu 346 olur 349 olur bilemem değiştirmezseniz uygulama çalışmaz hata alırsınız ve işinize hiçde yaramaz.Şimdi sıra geldi listeye eklemeye güncel sürücüler listede olmadığı için her gelen güncellemede yenisini ekleyeceğiz ara güncellemeler harici yapınız.

    sudo nano /etc/modprobe.d/bumblebee.conf

![bumblebeegorsel2](/assets/bumblebeegorsel2.png)

Görüldüğü gibi ben aşağıdaki satırları ekledim.Benim ekran kartımda en son çıkan buydu ve bende direk olarak eklemesini yaptım

    blacklist nvidia-346
    blacklist nvidia-346-updates
    blacklist nvidia-experimental-346

Şimdi Sisteminize komut satırından **reboot** komutunu vererek yeniden başlatın tekrar masaüstüne sistem geldiğinde ise aşağıdaki paketi kurun

    sudo apt-get install mesa-utils

Kurulumumuz başarılı bir şekilde tamamlandı aşağıdaki komutu verdiğiniz zaman ekran kartınızın sürücü sürümünü ve detaylarını görebilmeniz gerekli oyunlarda ve diğer işlemlerde sorunsuz çalışacaktır.

    primusrun glxinfo | grep OpenGL
