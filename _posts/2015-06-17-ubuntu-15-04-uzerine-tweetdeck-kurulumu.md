---
layout: post
title: Ubuntu 15.04 Üzerine TweetDeck Kurulumu
date: 2015-06-17 23:01:59.000000000 +03:00
type: post
published: true
status: publish
categories: linux
description: Ubuntuya hali hazırda TweetDeck bulunmuyor.Twitter yapmamış sanki linux işletim sistemleri yokmuş gibi ama chromede bulunan uygulama çok işimize
---

Ubuntuya hali hazırda **TweetDeck** bulunmuyor. **Twitter** yapmamış sanki linux işletim sistemleri yokmuş gibi ama chromede bulunan uygulama çok işimize yarayacak burada **chrome** kullanmayacağız ama uygulamasını kullanacağız

Google Chromeyi kurma ile başlayalım bunun için aşağıdaki adımları izleyin

    wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
    sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
    sudo apt-get update
    sudo apt-get install google-chrome-stable

Kurulumumuzu tamamladık şimdi karşımıza bilindik chrome açıldı hemen uygulama merkezine geçtik ve [TweetDeck dedik karşımıza 1 adet uygulama çıkıyor](https://chrome.google.com/webstore/detail/tweetdeck-by-twitter/hbdpomandigafcibbmofojjchbcdagbl)

Şimdi bu uygulamayı chromeye ekledik **chrome://apps/** giriyoruz ve uygulamamız karşımıza çıkıyor.

![tweetdeckgorsel1](/assets/tweetdeckgorsel1.png)

Şimdi bu gelen **TweetDeck** by Twitter uygulamasının üzerine gelip sağ tıklıyoruz. karşımıza bir çok seçenek çıkacak bunlardan Kısayol oluştur'a tıklıyoruz.

![tweetdeckgorsel2](/assets/tweetdeckgorsel2-e1434570371188.png)

Buradanda Masaüstü seçeneğine basarak işlemi sonlandırıyoruz artık uygulamamız hazır istediğiniz gibi kullanabilirsiniz.

![tweetdeckubuntugorsel3](/assets/tweetdeckubuntugorsel3.png)

**Oluştur** dediniz işleminiz sonlandı tek kalan uygulamaya giriş yapmak giriş yaptıktan sonrada normal uygulamayı kullanabilir hale geldiniz.Birden fazla hesabınızı bu şekilde yönetebilirsiniz.
