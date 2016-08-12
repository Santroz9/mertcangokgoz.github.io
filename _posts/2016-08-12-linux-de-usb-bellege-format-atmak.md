---
layout: post
title:  Linux'de USB Bellege Format Atma
date: 2016-08-12
type: post
categories: Linux
description:  Bizim öyle bazı işletim sistemlerindeki gibi usb formatlamayı kolaylaştıran bir uygulamamız yok normalde mint işletim sisteminde usb formatlayıcı
---

Bizim öyle bazı işletim sistemlerindeki gibi usb formatlamayı kolaylaştıran bir uygulamamız yok normalde mint işletim sisteminde usb formatlayıcı diye bir tool geliyor ama diğer sistemlerde pek bu mümkün değil sonradan kurabiliyor muyuz bilmiyorum. Çünkü ben el ile yapmayı tercih ediyorum genelde

Şimdi ilk önce usb belleğimizin nereye `mount` olduğunu bulalım bunu boyuta göre yapabilirsiniz. Sonra belleği `umount` işleminden geçiriyoruz.

```console
umount /dev/sdb1
```

Sonra belleğin içerisindeki veriyi yok etmek için sıfır ile yazdırma işlemi yapalım

```console
sudo dd if=/dev/zero of=/dev/sdb bs=1M conv=sync
```

`dmesg` mesajlarını kontrol etmeyi unutmayın usb belleğiniz hata veriyorsa yapacak bir şey yok tekrar deneyin

Şimdi içi sıfır ile doldurulmuş boş olan USB belleğimize `fdisk` ile partition oluşturalım

```console
sudo fdisk /dev/sdb
```

Aşağıdaki gibi gelen sorulara yanıt verin ve devam edin

```console
Command (m for help): n
Select (default p): p
Partition number (1-4, default 1): 1
First sector (2048-7796735, default 2048): <return>
Last sector, +sectors or +size{K,M,G} (2048-7796735, default 7796735): <return>
Command (m for help): t
Hex code (type L to list codes): 6
Command (m for help): w
```

İşlem tamamladıktan sonra format işlemini başlatıyoruz.

```console
sudo mkfs.vfat /dev/sdb1
```

Ardından USB belleği yuvasından söküyorsunuz ve bir kaç saniye sonra tekrar takıyorsunuz artık USB belleğiniz kullanıma hazır. Bu işlemi sisteminizde `Gparted` kurulu ise onunla da yapabilirsiniz.

<blockquote class="twitter-tweet" data-conversation="none" data-cards="hidden" data-partner="tweetdeck"><p lang="tr" dir="ltr">Başka bir yöntemde umount ettikten sonra &quot;sudo mkdosfs -F 32 -I /dev/sdxx&quot; <a href="https://twitter.com/mertcangokgoz">@mertcangokgoz</a></p>&mdash; Gökhan Kaya (@0x90kh4n) <a href="https://twitter.com/0x90kh4n/status/764123521748459521">August 12, 2016</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>
