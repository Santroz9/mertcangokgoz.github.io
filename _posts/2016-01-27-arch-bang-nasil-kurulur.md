---
layout: post
title: Arch Bang Nasıl Kurulur
date: 2016-01-27 12:39:25.000000000 +02:00
type: post
published: true
status: publish
categories: Linux
description: Arch Bang Arch Linux tabanlı ve OpenBox Ekipmanını kullanan kurulumu kolay oldukça sade,güçlü ve stabil bir Arch Linux dağıtımıdır. tint menu ile ve conky
---

**Arch Bang** Arch Linux tabanlı ve **OpenBox** Ekipmanını kullanan kurulumu kolay oldukça sade,güçlü ve **stabil** bir Arch Linux dağıtımıdır. tint menu ile ve conky ile ön tanımlı olarak gelir. Arch kurulumunda zorluk çeken arkadaşlar bu yöntem ile kolaylıkla Arch linux kurabilirler yada [Manjaro 15.12 Kurulumu](https://mertcangokgoz.com/manjaro-15-12-kurulumu/) yapabilirler.

Ama her şey den önce Arch Bang Sürümünü internet üzerinden [indirme işlemini](http://sourceforge.net/projects/archbang/files/archbang-031215-x86_64.iso/download) yapıyoruz.

Öncelikli olarak **USB** belleğimizi hazırlayalım.

    dd if=/home/mertcan/Desktop/archbang-031215-x86_64.iso of=/dev/sdb

USB Belleği sisteminizde daha sonra Arch bang kurulumu için kullanacağız direk olarak boot ettiğimizde karşımıza şu şekilde bir ekran çıkacak

![archbanggorsel0main](/assets/archbanggorsel0main.jpg)

Karşımıza bir sürü seçenek çıkıcak bunlar içerisinden ilkini yani **ArchBang Linux [Openbox]** Seçiyoruz.

![archbanggorsel2](/assets/archbanggorsel2.png)

Ekranı karşımıza çıkıyor.Sağ tarafta ön tanımlı olarak gelen **Conky** görüyorsunuz masaüstünün her hangi bir yerine ise sağ tıklama yaptığınızda kurulum ve diğer uygulama ekranı gelecek

![archbanggorsel3](/assets/archbanggorsel3.png)

Kurulum işin **LXTerminal** karşımıza çıkacak **ENTER** tuşu ile kuruluma devam ediyoruz.

![archbanggorsel4](/assets/archbanggorsel4.png)

Bu aşamadan sonra ise kurulum aşamalarının olduğu ve sırasıyla kurulumunu yapacağımız kısım karşımıza çıkıyor.

![archbanggorsel5](/assets/archbanggorsel5.png)

İlk seçeneği seçiyoruz ve disk şemasını ayarlıyoruz.Şifreli olarak oluşturabilirsiniz veya ön tanımlı olan modeli kullanabilirsiniz.Ben bu aşamada şifresiz normal kurulumu tercih ettim.İlk aşamada disk şemasını oluşturacağınız editörü seçiyorsunuz burada size 3&nbsp;seçenek sunuyor sistem.
e-3821" src="/assets/archbanggorsel16done_cm5ega.png" alt="archbanggorsel16done" width="772" height="576" /></p>

- Cfdisk
- Gdisk

**Cfdisk** seçiyoruz ve ikinci aşamaya geçiyoruz burada diskin bölüm şemasını seçiyoruz.

- gpt
- dos

**GPT** ye hiç gerek yok o yüzden biz dos yani **MBR** bölüm şemasını seçiyoruz.

![archbanggorsel6diskpartition](/assets/archbanggorsel6diskpartition.png)

Bu aşamada disk yapılandırmasını yapacağız misal diskimiz **240 GB** olsun biz bunun bir kısmını normal dizin bir kısmını takas alanı bir kısmını ise other olarak ayarlıyoruz yada siz kendi düşündüğünüz ve her zaman yaptığınız ayarlamayı kullanabilirsiniz.Kayıt etmeyi unutmayın

Hemen ardından 2.seçeneği seçiyoruz ve arch bang kurulmasını izliyoruz. İki veya üç dakikaya sistem kurulmuş olacak

![archbanggorsel7install](/assets/archbanggorsel7install.png)

Ana bilgisayar adımızı yani **Hostname** ayarlıyoruz.Uyumlu olan istediğiniz bir şeyi yazabilirsiniz.

![archbanggorsel8hostname](/assets/archbanggorsel8hostname.png)

Ardından sistemin zaman dilimini ayarlamamız gerekiyor.Bu aşamada Türkiye için **Europe/Istanbul** seçeceğiz

![archbanggorsel9timezone](/assets/archbanggorsel9timezone.png)

Donanım saatini ayarlayalım ben bunun için **Localtime** seçtim siz **UTC** seçebilirsiniz.

![archbanggorsel10hardwareclock](/assets/archbanggorsel10hardwareclock.png)

Locales ayarları olarak yani dil ayarı olarak **tr\_TR** yi seçiyoruz.Kurulumda bu **255** denk geliyor.

![archbanggorsel11locales](/assets/archbanggorsel11locales.png)

Sıra geldi klavye düzenimize kod ile yapabileceğimiz gibi aynı şekilde bunu seçerek de yapabilirsiniz. **tr** olarak seçimi yapalım **86** tekabül ediyor.

![archbanggorsel12keyboard](/assets/archbanggorsel12keyboard.png)

**Bootloader** seçeneğine geliyoruz burada 2&nbsp;seçenek çıkacak

- Grub2
- Syslinux

**Grub2** olarak seçip devam ediyoruz.

![archbanggorsel13bootloader](/assets/archbanggorsel13bootloader.png)

Şimdi ise **Root** kullanıcısının şifresini ayarlıyoruz.

![archbanggorsel14rootpass](/assets/archbanggorsel14rootpass.png)

Bir **Kullanıcı** Ayarlıyoruz.

![archbanggorsel15username](/assets/archbanggorsel15username.png)

Tüm İşlemlerimiz artık tamamlanıyor **d** tuşu ile sistemi yeniden başlatıyoruz.Kurulumu yaptığınız **USB** belleği sisteminizden çıkartmayı unutmayınız.

![archbanggorsel16done](/assets/archbanggorsel16done.png)
