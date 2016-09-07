---
layout: post
title: Youtube-dl kurulumu ve kullanımı
date: 2016-09-07
type: post
categories: linux
description: Youtube videolarını indirmeniz gereken zamanlar elbet olmuştur bunun için farklı farklı pek çok uygulama bulunuyor ama bizim linux üzerinde oldukça güzel ve yıllardır
---

Youtube videolarını indirmeniz gereken zamanlar elbet olmuştur bunun için farklı farklı pek çok uygulama bulunuyor ama bizim linux üzerinde oldukça güzel ve yıllardır geliştirilmekte olan bir uygulama var bu uygulama sayesinde youtube üzerinde aklınıza gelen pek çok şeyi yapabiliyorsunuz.

Ben repodan pek fazla böyle uygulama kurma taraftarı olmadığım için direk olarak sitedeki kurulum aşamalarını göstereceğim oda şu şekilde olacak

```console
sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
sudo chmod a+rx /usr/local/bin/youtube-dl
```

Ya sen bana genede repoyu ver oradan kuracağım ben diyenler için ise

```console
sudo apt-get install youtube-dl
```

Kurulumumuz başarılı bir şekilde tamamlandıktan sonra hemen uygulamanın özelliklerine bir göz atıyoruz ne yapabiliriz falan diye bakıyoruz bunun için `youtube-dl --help` demeniz yeterli size uzunca bir liste sunacaktır zaten.

Ayrıca daha sonra güncellemek isterseniz şu komut sayesinde kolay bir şekilde bu işleminizi yerine getirebilir ve kolaylıkla youtube-dl uygulamasını güncelleyebilirsiniz.

```console
sudo youtube-dl -U
```

Direk olarak hiçbir şey bilmeden cahil haliniz ile şu komutu verseniz bile uygulama sizin için indirme işlemini başlatacak

```console
youtube-dl https://www.youtube.com/watch?v=4CEjay8qCIc
```

ancak unutulmamalıdır ki youtube videoları tek bir formatta yada tek bir ses formatında yüklemiyor. Bu sorunu çözmek için ise şöyle bir yol izleyeceğiz. İlk olarak `-F` ekleyeceğiz kodumuza ve youtube url üzerinde kaç tane formatı var ise önümüze getirecek

```console
youtube-dl -F https://www.youtube.com/watch?v=4CEjay8qCIc
```

Çıktı olarka ise karşımıza şöyle birşey çıktı

```
mertcan@mertcan ~> youtube-dl -F "https://www.youtube.com/watch?v=4CEjay8qCIc"                                                                                                                                                                                                1
[youtube] 4CEjay8qCIc: Downloading webpage
[youtube] 4CEjay8qCIc: Downloading video info webpage
[youtube] 4CEjay8qCIc: Extracting video information
[youtube] 4CEjay8qCIc: Downloading js player en_US-vflrza-6I
[info] Available formats for 4CEjay8qCIc:
format code  extension  resolution note
249          webm       audio only DASH audio   56k , opus @ 50k, 1.43MiB
250          webm       audio only DASH audio   78k , opus @ 70k, 1.88MiB
140          m4a        audio only DASH audio  127k , m4a_dash container, mp4a.40.2@128k, 3.57MiB
171          webm       audio only DASH audio  142k , vorbis@128k, 3.54MiB
251          webm       audio only DASH audio  151k , opus @160k, 3.72MiB
160          mp4        256x144    144p  112k , avc1.4d400c, 30fps, video only, 3.10MiB
278          webm       256x144    144p  129k , webm container, vp9, 15fps, video only, 2.88MiB
242          webm       426x240    240p  177k , vp9, 30fps, video only, 3.49MiB
134          mp4        640x360    360p  239k , avc1.4d401e, 30fps, video only, 6.43MiB
133          mp4        426x240    240p  247k , avc1.4d4015, 30fps, video only, 6.90MiB
243          webm       640x360    360p  318k , vp9, 30fps, video only, 6.87MiB
135          mp4        854x480    480p  500k , avc1.4d401f, 30fps, video only, 13.79MiB
244          webm       854x480    480p  535k , vp9, 30fps, video only, 11.44MiB
247          webm       1280x720   720p  920k , vp9, 30fps, video only, 21.54MiB
136          mp4        1280x720   720p 1034k , avc1.4d401f, 30fps, video only, 27.65MiB
17           3gp        176x144    small , mp4v.20.3,  mp4a.40.2@ 24k
36           3gp        320x180    small , mp4v.20.3,  mp4a.40.2
43           webm       640x360    medium , vp8.0,  vorbis@128k
18           mp4        640x360    medium , avc1.42001E,  mp4a.40.2@ 96k
22           mp4        1280x720   hd720 , avc1.64001F,  mp4a.40.2@192k (best)
mertcan@mertcan ~>
```

Burada benim indirmek istediğinizi gözünüze kestiriyorsunuz daha sonra `format code` yazan kısımdaki numarayı alıyorsunuz elinize ben burada `22` yı seçeceğ ve indirme işlemini başlatacağım.

```console
youtube-dl -f 22 https://www.youtube.com/watch?v=4CEjay8qCIc
```

Buradaki en önemli nokta büyük `F` ile küçük olan `f` nin karıştırılmamasıdır. Biri size formatı liste şeklinde verirken birisi format seçebilmenize ve o şekilde indirebilmenize imkan tanır.

Videoda alt yazı bulunuyor ise bu alt yazıları `--list-subs` komutuyla indirebilirsiniz. Sadece videoda bulunan alt yazıları indirmek istersenizde `--all-subs` seçeneği işinizi görecektir.

Videoyu `mp3` formatına çevirmek için oldukça basit olan şu işlemi yapıyorsunuz.

```console
youtube-dl --extract-audio --audio-format mp3 https://www.youtube.com/watch?v=4CEjay8qCIc
```

Video indirildikten sonra otomatik olarak ses çıkartılıyor ve mp3 formatına dönüştürülüyor. Bu işlemi yaparken aşağıdaki gibi bir hata mesajı ile karşılaşabilirsiniz

```console
ERROR: ffprobe or avprobe not found. Please install one.
```

Bu hatayı çözmek için ise şu komutları vererek paketi kurmanız yeterlidir.

```console
sudo apt-get install -y libav-tools
```

Daha sonra indirilen video otomatik olarak sisteminizden kaldırılıyor. Otomatik olarak silmek istemezseniz `-k` kullanarak video dosyasınıda sisteminizde tutabilirsiniz.

yapmış olduğunuz bir playlisti indirip otomatik olarak aşağıdaki komutu kullanarak kolay bir şekilde mp3 çevirebilirsiniz.

```console
youtube-dl -cit --extract-audio --audio-format mp3 https://www.youtube.com/watch?v=pVLmZMjxfjw&list=RDpVLmZMjxfjw
```

öptüm bye <3
