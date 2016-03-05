---
layout: post
title: VestaCP İçin Fail2Ban Kurulumu
date: 2015-07-06 14:42:48.000000000 +03:00
type: post
published: true
status: publish
categories: Lilnux
description: VestaCP popülerliği git gide artan bir panel olarak karşımıza
    çıkmakta hal böyle olunca şifre saldırılarına da direk olarak savunmasız kalmakadır.Ama
---

**VestaCP** popülerliği git gide artan bir panel olarak karşımıza çıkmakta hal böyle olunca şifre saldırılarına da direk olarak savunmasız kalmaktadır. Ama bir kaç ufak kurulum ve derleme yaparak bu şifre deneme saldırılarına(Brute-Force) karşı sisteminizi koruyabilirsiniz.Kurulumdan sonraki ayarlamalar size kalmış.

Öncelikli olarak hemen sisteminizde **SSH** bağlantısını kuruyorsunuz ve kurulum komutunu veriyorsunuz.

    sudo apt-get install fail2ban

Sonra panele uyumlu olarak çalışsın diye ayar dosyalarını indiriyoruz ve sisteme dahil ediyoruz.

    cd /etc
    wget http://c.vestacp.com/0.9.8/ubuntu/fail2ban.tar.gz -O fail2ban.tar.gz

İndirdiğimiz paketleri sıkıştırıldıkları yerden çıkartıyoruz.

    tar -xzf fail2ban.tar.gz
    rm -f fail2ban.tar.gz

**VestaCP** ayarlamaları içerisine yerini alması için ise aşağıdaki komutları giriyoruz böylelikle panel anlıyor ki **Fail2Ban** kuruldu

    sed -i "/FIREWALL_EXTENSION/d" /usr/local/vesta/conf/vesta.conf
    echo "FIREWALL_EXTENSION='fail2ban'" >> /usr/local/vesta/conf/vesta.conf

Başlangıç için eklemeleri yapıyoruz ve uygulamamızı başlatıyoruz.

    update-rc.d fail2ban defaults
    service fail2ban start

İşlemlerimiz tamam artık gönül rahatlığıyla panelinizi ve sitenizi yönetebilirsiniz.
