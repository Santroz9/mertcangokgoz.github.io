---
layout: post
title: Ubuntu üzerine varnish kurulumu
date: 2015-02-19 12:26:00.000000000 +02:00
type: post
published: true
status: publish
categories: Linux
description: Ubuntu üzerine varnish kurulumu oldukça basittir bir kaç komut yardımıyla kurabilirsiniz ancak size bu makalemizde ayarlamaları konusunda
---
**Ubuntu** üzerine **varnish** kurulumu oldukça basittir bir kaç komut yardımıyla kurabilirsiniz ancak size bu makalemizde ayarlamaları konusunda yardımcı olamayacağım sadece kuracağız ayarlamalarımızı bir sonraki makalede anlatmaya çalışacağım ama ilk olarak kuralım sağlıklı bir şekilde

    sudo apt-get install apt-transport-https

**https** desteğini sistemimize ekleyelim

    curl https://repo.varnish-cache.org/GPG-key.txt | apt-key add -
    echo "deb https://repo.varnish-cache.org/ubuntu/ precise varnish-4.0" >> /etc/apt/sources.list.d/varnish-cache.list

curl ile GPG keyi indirelim sisteme dahil edelim sonrasında paketi **sources.list.d** klasörüne eklemesini yapalım

    apt-get update
    apt-get install varnish

yeni paket yada güncelleme varmı yokmu bakalım ve ardından **varnish** kurulumumuzu yapabiliriz.

![varnishkurulumugorsel1](/assets/varnishkurulumugorsel1.png)
