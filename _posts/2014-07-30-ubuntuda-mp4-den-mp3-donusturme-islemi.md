---
layout: post
title: Ubuntuda MP4 den MP3 Dönüştürme işlemi
date: 2014-07-30 23:32:20.000000000 +03:00
type: post
published: true
status: publish
categories: linux
description: Ubuntu sisteminizde MP4 olan dosyalarınızı kolay bir şekilde MP3 dönüştürebilirsiniz bunun için yapmanız gereken sadece ffmpeg kurmak ve gerekli
---
Ubuntu sisteminizde MP4 olan dosyalarınızı kolay bir şekilde MP3 dönüştürebilirsiniz bunun için yapmanız gereken sadece ffmpeg kurmak ve gerekli paremetreleri çevrilecek olan dosyalar için vermek.Program kullanmak istersenizde google yardımıyla pek çok programa ulaşabilirsiniz.

ffmpeg ve bileşenlerinin kurulumu için

    sudo add-apt-repository ppa:jon-severinsson/ffmpeg
    sudo apt-get update
    sudo apt-get install ffmpeg

![ffmpegubuntukurulumugorsel1](/assets/ffmpegubuntukurulumugorsel1.png)

Başarıyla kurduktan sonra en basit kodu olan

    ffmpeg -i dosyaadi.mp4 dosyaadi.mp3

kullanabilirsiniz.Belirlediğiniz dosyayı -i komutu ile mp3 çevirebilirsiniz.Ses kalitesini ayarlamak isterseniz bunun için aşağıdaki komutu kullanabilirsiniz.

    ffmpeg -i dosyaadi.mp4 -b:a 256K -vn dosyaadi.mp3

Burada önemli olan türkçe karekter kullanılmamasıdır kullanırsanız.program sapıtabiliyor 1 kez yaşadım ama genelde sorun çıkartmıyor ama temkinli olmakda fayda var.

Toplu Olarak dönüştürmek istersenizde aşağıdaki bash scripti kullanabilirsiniz.Zahmetsizdir

    #!/bin/bash
    MP4FILE=$(ls ~/MP3/ |grep .mp4)
    for filename in $MP4FILE
    do
     name=`echo "$filename" | sed -e "s/.mp4$//g"`
     ffmpeg -i ~/MP3/$filename -b:a 256K -vn ~/MP3/$name.mp3
    done

MP3 dosyası içerisindekileri mp4 formatındakileri mp3 çevirmektedir.MP3 dosyasını oluşturmayı unutmayınız.
