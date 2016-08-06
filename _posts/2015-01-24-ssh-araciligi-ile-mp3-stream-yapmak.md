---
layout: post
title: SSH aracılığı ile MP3 Stream yapmak
date: 2015-01-24 13:52:45.000000000 +02:00
type: post
published: true
status: publish
categories: linux
description: SSH yardımıyla uzak sunucuda bulunan MP3 dosyalarınızı sisteminize indirmeden Stream etmeniz mümkün bunu yapabilmek için sisteminizde vlc player
---
**SSH** yardımıyla uzak sunucuda bulunan **MP3** dosyalarınızı sisteminize indirmeden Stream etmeniz mümkün bunu yapabilmek için sisteminizde vlc player yada her hangi stream destekleyen bütünleşik bi player lazım sonrasında ise dinleyecek **mp3**

default olarak sistemde bulunan mplayer ile açmak isterseniz aşağıdaki komutu kullanabilirsiniz

    ssh root@178.33.2.134 /home/music/mp3/* | mplayer -

yada sisteminizde VLC kuruludur ve VLC üzerinden dinlemek istersiniz o zaman ise komutumuz

    ssh root@178.33.2.134 /home/music/mp3/* | cvlc -

Bağlanırken sizden uzak sunucunun **root** adresini yada bağlantı _kuracağınız kullanıcı adının şifresini isteyecek şifreyi girdikten sonra ise program açılacak_ ve uzak sunucunuzdaki **MP3** leri kolaylık ile dinleyecek yani **Stream** etmiş olacaksınız.
