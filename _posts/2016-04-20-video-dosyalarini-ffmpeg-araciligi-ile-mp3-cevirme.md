---
layout: post
title: Video Dosyalarını FFMPEG ile MP3 Çevirme
date: 2016-04-20
type: post
categories: linux
description: Geçtiğimiz günlerde elimde bulunan oldukça fazla FLV ve MP4 dosyalarını MP3 olarak dönüştürüp
---

Geçtiğimiz günlerde elimde bulunan oldukça fazla **FLV** ve **MP4** dosyalarını **MP3** olarak dönüştürüp sistemimde saklamak istiyordum youtube üzerinden indirdiğim için de dosyaların boyutları fazlaydı bende düşündüm ne yapabilirim diye aşağıdaki kodu hazırladım(daha önceden hazırladığım bir kod olsada flv için düzenledim tekrardan)

```bash
#!/bin/bash
MP4FILE=$(ls ~/Desktop/music |grep .flv)
for filename in $MP4FILE
do
 name=`echo "$filename" | sed -e "s/.flv$//g"`
 ffmpeg -i ~/Desktop/music/$filename -b:a 256K -vn ~/Desktop/Muzikler/$name.mp3
done
```

Tabi bu hazırladığım kod türkçe karaktere her ne kadar uyumlu olsada sed ile aldığımız için boşluklarda patlıyordu.Zaten youtubeden indirdiklerimizde aralarında bolca boşluk ve ilginç karakterler oluyor buna çözümü ise şu şekilde bulduk

```bash
#Thanks Onur Aslan
find ~/Desktop/music -maxdepth 1 -name '*.flv' -exec ffmpeg -i {} -b:a 256K -vn {}.mp3 \;
```

yukarıdaki kod ile flv uzantılı dosyaları direk olarak mp3 çevirebilirsiniz kalite olarak 256 öntanımlı ayarlı ayrıca gördüğü her flv dosyayı çevireceği için karakter sıkıntısı yada whitespace sıkıntısı yaratmaz.Dosya uzantınız ney ise ona göre **.flv** yi değiştirip mp3 çevirme işlemini yaptırabilirsiniz.Tabi ffmpeg in desteklediği video dosyaları için bu işlem geçerli.

Öptüm bye <3
