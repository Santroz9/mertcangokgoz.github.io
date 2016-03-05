---
layout: post
title: Ubuntu 14.04 üzerine webmin kurulumu
date: 2015-02-07 15:06:28.000000000 +02:00
type: post
published: true
status: publish
categories: Linux
description: Açık kaynak kodlu webmin bünyesinde bir çok uygulamayı barındırıyor ve otomatik olarak kuruyor sizede kurulan bu uygulamaları yönetmek kalıyor bu
---
Açık kaynak kodlu webmin bünyesinde bir çok uygulamayı barındırıyor ve otomatik olarak kuruyor sizede kurulan bu uygulamaları yönetmek kalıyor bu iş için bugün ubuntu 14.04 seçtim gelin kurulumu hemen yapalım ve kullanmaya başlayalım.

ilk olarak paketleri çekeceğimiz yeri bi kaynak olarak **/etc/apt/sources.list** ekleyelim

    nano /etc/apt/sources.list

daha sonrasında içerisine en alt satıra aşağıdakileri ekliyoruz ve kayıt ediyoruz.

    deb http://download.webmin.com/download/repository sarge contrib
    deb http://webmin.mirror.somersettechsolutions.co.uk/repository sarge contrib

Sonra GPG keyini sisteme dahil ediyoruz.

    sudo wget http://www.webmin.com/jcameron-key.asc
    sudo apt-key add jcameron-key.asc

sistemin güncelleme listesini yenileyelim böylelikle eklediklerimizi görsün sistem

    sudo apt-get update

Şimdi kuruluma geçelim ve hızlıca kurulumu tamamlayalım aşağıdaki komutu verdikten sonra otomatik olarak tüm herşey kurulacak **https://ipadresi:10000/** olarak da panele giriş yapabilirsiniz.

    sudo apt-get install webmin

Bağlanamazsanız bilin ki güvenlik duvarı ortalığı karıştırıyor demektir.Aşağıdaki komutumuz ilede **10000** portuna izin veriyoruz.

    sudo ufw allow 10000

Kurulum başarıyla tamamlandı bundan sonrası yapacağınız işlem panele giriş yapıp gereken ayarları yapmak

![ubuntuwebminkurulumugorsel1](/assets/ubuntuwebminkurulumugorsel1.png)

Giriş yaptıktan sonra bizi böyle bir yer karşılayacak

![ubuntuwebminkurulumugorsel2](/assets/ubuntuwebminkurulumugorsel2.jpg)
