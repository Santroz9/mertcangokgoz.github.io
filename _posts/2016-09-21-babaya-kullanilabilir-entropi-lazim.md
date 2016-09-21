---
layout: post
title:  Baba'ya Kullanılabilir Entropi Lazım 
date: 2016-09-21
type: post
categories: linux
description:  Cihazların gürüldütüsünden sistemde entropi biriktirmemiz gerektiğini genelde çoğu kişi bilmez. Normal sistemi kullanırken
---

Cihazların gürüldütüsünden sistemde entropi biriktirmemiz gerektiğini genelde çoğu kişi bilmez. Normal sistemi kullanırken bu entropileri biriktirmek daha sonra yapacağımız kriptografik işlemleri hızlandırır. Mesala web siteniz için **SSL** oluşturacağınız zaman bu entropi yardımı ile çok kısa sürede `dhparam' oluşturabilirsiniz. Aynı şekilde çok kısa sürede SSL key için gizli anahtar oluşturabilirsiniz.

**Gpg key** oluştururken sisteminizde aşağıdaki gibi bir uyarı verirse bu makalede yapacağımız işlemler onada yarayacak ve bundan sonra o uyarıyı da görmeyeceksiniz.

```
**We need to generate a lot of random bytes. It is a good idea to perform
some other action (type on the keyboard, move the mouse, utilize the
disks) during the prime generation; this gives the random number
generator a better chance to gain enough entropy.
Not enough random bytes available.  Please do some other work to give
the OS a chance to collect more entropy! (Need 210 more bytes)**
```

Şimdi tüm bunların tek bir çözümü tabi ki de yok sistemde **entropi** biriktirmek için pek çok yöntem mevcut örneğin; arka planda bir video oynatmak, klavyede yazı yazmak, yapılan mouse hareketleri, internet tarayıcısı ile internette dolaşmak sadece bunlardan bazılarıdır. Ancak sunucularda ve kimi zaman kişisel bilgisayarınızda bunları yapamıyor olabilirsiniz. İşte bizim bu yöntemimizde burada başlıyor aslında

Ama hepsinden önce sistemimizde ne kadar kullanılabilir entrpi olduğunu görelim bunun için aşağıdaki şu komutu kullanmanızı öneriyorum.

```
cat /proc/sys/kernel/random/entropy_avail
```

Bunun çıktısı genelde yeni açılmış ve pek fazla işlem yapılmamış sistemde 500 ila 1000 arasında bir değer ile gelmektedir. Kimi zaman 500 den düşük olduğu bile görülmüştür. Bu durum sistemde kriptografik işlemler yapacağımız zaman yaptığımız işlemlerin sürelerinin oldukça yüksek olmasına neden olur. Düşük seviyeli olarak buna bir çözüm bulmak ve sistemi başlattığınızda entropinin belirli bir seviyeden başlamasına da faydası olan `haveged` uygulamasını kurabilirsiniz. Bir önceki makalemizde detaylarını anlatmıştık. [Haveged Uygulaması Ne işe yarar](https://mertcangokgoz.com/haveged-uygulamasi-ne-ise-yarar/) Vakit kaybetmeden testimize başlıyoruz.

Örneğin sistemde 4096 bitlik bir `dhparam` dosyası oluşturalım.

```
time openssl dhparam -out dhparam.pem 4096
```

Süreyi takip etmek için `time` komutundan faydalanıyor olacağız komutu çalıştırıyor ve bitmesini bekliyoruz. Benim sistemimde entropi olmadığından aşağıdaki gibi oldukça yüksek bir sürede tamamlandı

```
real	12m0.666s
user	12m0.152s
sys		0m0.080s
```

Şimdide aynı komutu sistemde entropi kaynaklarını doldurduktan sonra deniyoruz. Tekrar aynı komutu çalıştırıyoruz ve bu sefer gözle görülür bir şekilde sürenin kısaldığını görüyoruz

```
real 3m2.815s
user 3m2.792s
sys 0m0.008s
```

Peki bu işlemi nasıl yapabildik bu kadar kısa bir sürede entropi oranını nasıl arttırdık, ilk olarak sistemimize `rng-tools` ekledik bu sayede sistemimize bir daemon daha eklemiş olduk ve **TRNG** (true random number generator) işlemi yaptırır olduk genelde test için kullandığımız bu uygulamadan oldukça faydalanacağız.

İlk olarak uygulamayı sistemimize ekliyoruz.

```
sudo apt-get install rng-tools
```

Uygulama kurulduğu zaman `/etc/default/` klasörü içerisine `rng-tools` adı altında bir dosya geldiğini göreceksiniz. Bu dosyayı şu şekilde açıyoruz.

```
sudo nano /etc/default/rng-tools
```

içerisinde şu şekilde ayarlamalar bulunuyor.

```
# Configuration for the rng-tools initscript
# $Id: rng-tools.default,v 1.1.2.5 2008-06-10 19:51:37 hmh Exp $

# This is a POSIX shell fragment

# Set to the input source for random data, leave undefined
# for the initscript to attempt auto-detection.  Set to /dev/null
# for the viapadlock and tpm drivers.
#HRNGDEVICE=/dev/hwrng
#HRNGDEVICE=/dev/null

# Additional options to send to rngd. See the rngd(8) manpage for
# more information.  Do not specify -r/--rng-device here, use
# HRNGDEVICE for that instead.
#RNGDOPTIONS="--hrng=intelfwh --fill-watermark=90% --feed-interval=1"
#RNGDOPTIONS="--hrng=viakernel --fill-watermark=90% --feed-interval=1"
#RNGDOPTIONS="--hrng=viapadlock --fill-watermark=90% --feed-interval=1"
#RNGDOPTIONS="--hrng=tpm --fill-watermark=90% --feed-interval=1"
```

Biz burada `HRNGDEVICE` yazanların hemen altına şu satırı ekliyoruz ve kayıt edip çıkıyoruz.

```
HRNGDEVICE=/dev/urandom
```

bir süre sonra tekrar entropilerimizi kontrol ediyoruz. 

```
cat /proc/sys/kernel/random/entropy_avail
```

Gördüğünüz gibi aşağıdaki değeri verdi bize buda demek oluyor ki kullanılabilir entropilerimiz oldukça arttı 

```
4256
```

Bu kullanılabilir entropiler size her zaman lazım olacak özellikle çokça kriptografik işlemler yapıyor ve SSL oluşturuyorsanız veya **GPG key** oluşturacaksanız yada her hangi bir şekilde entropi ye lazım olan bir işlem yaptığınızda yukarıdada bahsettiğim gibi kullanabileceksiniz.

Testleri yaparken kullandığım sistem bilgileri şu şekildedir.

```
mertcan@0x2e88ce4:~$ screenfetch
                          ./+o+-       mertcan@0x2e88ce4
                  yyyyy- -yyyyyy+      OS: Ubuntu 16.04 xenial
               ://+//////-yyyyyyo      Kernel: x86_64 Linux 4.4.0-38-generic
           .++ .:/++++++/-.+sss/`      Uptime: 9h 16m
         .:++o:  /++++++++/:--:/-      Packages: 2057
        o:+o+:++.`..```.-/oo+++++/     Shell: bash 4.3.46
       .:+o:+o/.          `+sssoo+/    Resolution: 1920x1080
  .++/+:+oo+o:`             /sssooo.   DE: XFCE
 /+++//+:`oo+o               /::--:.   WM: Xfwm4
 \+/+o+++`o++o               ++////.   WM Theme: Numix
  .++.o+++oo+:`             /dddhhh.   GTK Theme: Numix [GTK2]
       .+.o+oo:.          `oddhhhh+    Icon Theme: Numix-Circle
        \+.++o+o``-````.:ohdhhhhh+     Font: Hack 10
         `:o+++ `ohhhhhhhhyo++os:      CPU: Intel Core i7-4720HQ CPU @ 3.6GHz
           .o:`.syhhhhhhh/.oo++o`      GPU: Mesa DRI Intel(R) Haswell Mobile 
               /osyyyyyyo++ooo+++/     RAM: 2914MiB / 15958MiB
                   ````` +oo+++o\:    
                          `oo++.      
mertcan@0x2e88ce4:~$ 
```

öptüm bye <3