---
layout: post
title: Debian Tabanlı Sistemlerde Logrotate İşlemi
date: 2015-10-04 13:02:04.000000000 +03:00
type: post
published: true
status: publish
categories: linux
description: Logların aşırı bir şekilde yer kaplamasından dolayı diskimizde yer kalmadı benden logrotate işlemi istenmediği için haliyle yapmadım ve sunucu
---

**Logların** aşırı bir şekilde yer kaplamasından dolayı diskimizde yer kalmadı benden **logrotate** işlemi istenmediği için haliyle yapmadım ve sunucu şişip bugün sorun çıkartmış. Normalde yapılması gereken ya **log** tutmayı kapatmak yada belirli bir boyuta ulaştığında temizlemek yada **aylık** , **haftalık** olarak silmek biz bunları yapmadık, evde kullandığım bilgisayarda zaten ubuntu olunca kendi sistemimdede aynı sorunu yaşadığım için düzeltelim dedik

ilk önce sistemin log tutmasını düzenlemek için ufak bir uygulamamızı kuralım server sisteminde ön tanımlı olarak gelen **isolar** mevcut ancak yok ise aşağıdaki komut ile kurabilirsiniz.

    sudo apt-get install logrotate

kurulumu yaptığınız teyit etmemiz gerekiyor kurmadan öncede teyit edebilirsiniz.Dediğim gibi kurulu olarak gelebiliyor.Eski sürümlerde gelmeyecektir.

    logrotate

komutu verdiğimizde ekrana sürüm ve kullanabileceğiniz kodlar hakkında bilgilendirme kısmı gelecek

![logrotateconfirmationgorsel](/assets/logrotateconfirmationgorsel.jpg)

demekki sistemimizde var zaten gereken işlemlere geçelim aktif edelim düzenleyelim bir güzellik yapalım.Aşağıdaki dosya yoluna ilerliyoruz.

**Dosya:** /etc/logrotate.conf

    nano /etc/logrotate.conf

![logrotateconfgorsel](/assets/logrotateconfgorsel.jpg)

Şimdi dosya içeriğimizde işlem yapılacak loglara dair satırlar göreceksiniz.Bizde şişme işlemi yapan loglar şu şekildeydi

    Delete 5,49GB /var/log/syslog.1
    Delete 14,62GB /var/log/ufw.log.1
    Delete 14,62GB /var/log/kern.log.1

gördüğünüz gibi boyutları oldukça yüksek ufw ve kern loglarının içeriği aslına bakarsanız birebir çıkabilir çünkü güvenlik duvarının yaptığı loglama işlemini birde kernel in logları yapmakta ne ilginçtirki syslogdada görebilirsiniz örnek olarak içeriğinden bir kaç satır.

    Oct 4 12:13:52 0x2e88ce4 kernel: [4617.129012] [UFW AUDIT] IN=lo OUT= MAC=00:00:00:00:00:00:00:00:00:00:00:00:08:00 SRC=127.0.0.1 DST=127.0.0.1 LEN=72 TOS=0x00 PREC=0x00 TTL=64 ID=47419 DF PROTO=UDP SPT=59513 DPT=53 LEN=52
    Oct 4 12:13:52 0x2e88ce4 kernel: [4617.129067] [UFW AUDIT] IN= OUT=lo SRC=127.0.0.1 DST=127.0.0.1 LEN=108 TOS=0x00 PREC=0x00 TTL=64 ID=47420 DF PROTO=UDP SPT=53 DPT=59513 LEN=88
    Oct 4 12:13:52 0x2e88ce4 kernel: [4617.129073] [UFW AUDIT] IN=lo OUT= MAC=00:00:00:00:00:00:00:00:00:00:00:00:08:00 SRC=127.0.0.1 DST=127.0.0.1 LEN=108 TOS=0x00 PREC=0x00 TTL=64 ID=47420 DF PROTO=UDP SPT=53 DPT=59513 LEN=88
    Oct 4 12:13:52 0x2e88ce4 kernel: [4617.131536] [UFW AUDIT] IN= OUT=lo SRC=127.0.0.1 DST=127.0.0.1 LEN=70 TOS=0x00 PREC=0x00 TTL=64 ID=47421 DF PROTO=UDP SPT=56888 DPT=53 LEN=50
    Oct 4 12:13:52 0x2e88ce4 kernel: [4617.131544] [UFW AUDIT] IN=lo OUT= MAC=00:00:00:00:00:00:00:00:00:00:00:00:08:00 SRC=127.0.0.1 DST=127.0.0.1 LEN=70 TOS=0x00 PREC=0x00 TTL=64 ID=47421 DF PROTO=UDP SPT=56888 DPT=53 LEN=50
    Oct 4 12:13:52 0x2e88ce4 kernel: [4617.131626] [UFW AUDIT] IN= OUT=lo SRC=127.0.0.1 DST=127.0.0.1 LEN=70 TOS=0x00 PREC=0x00 TTL=64 ID=47422 DF PROTO=UDP SPT=37883 DPT=1064 LEN=50
    Oct 4 12:13:52 0x2e88ce4 kernel: [4617.131634] [UFW AUDIT] IN=lo OUT= MAC=00:00:00:00:00:00:00:00:00:00:00:00:08:00 SRC=127.0.0.1 DST=127.0.0.1 LEN=70 TOS=0x00 PREC=0x00 TTL=64 ID=47422 DF PROTO=UDP SPT=37883 DPT=1064 LEN=50
    Oct 4 12:13:52 0x2e88ce4 kernel: [4617.131688] [UFW AUDIT] IN= OUT=eth0 SRC=192.168.0.14 DST=213.202.215.23 LEN=540 TOS=0x00 PREC=0x00 TTL=64 ID=27465 PROTO=UDP SPT=47808 DPT=5353 LEN=520
    Oct 4 12:14:42 0x2e88ce4 kernel: [4667.270430] show_signal_msg: 24 callbacks suppressed

evet içerik olarak baktığımızda dns sorguları ve ufw ye takılan kurallar göze çarpıyor.gereken rotate işlemini gerçekleştirelim örnek olarak

    /var/log/kern.log {
    	monthly
    	rotate 6
    	compress
    	delaycompress
    	missingok
    	notifempty
    	create 644 root root
    }

yukarıdaki örnekde ne yaptık ilk olarak logları aylık bir şekilde tutulacağını belirttik **rotate 6** ilede 6 günlük periyotlar halinde işlem yapılmasını tercih ettik kısacası elinizde 6 kopya olacak geri kalanların hepsi temizlenecek.Tabiki compress komutu ilede logumuzu sıkıştırmayı unutmadık gzip formatına sıkıştıracak loglarımızı uygulayacağınız loglara bunları tek tek belirterek işlemleri gerçekleştirebilirsiniz.Sunucunuz günlük çok fazla log tutuyor ise rotate komutunu 2 verebilirsiniz. yada boyut olarak söyleyebilirsiniz **"Size 100M" işlemleri buna göre yapacak ve aylık periyotlara takılmayacaktır.**

logrotate kontrolü yapalım bakalım işlemimiz kayda alınmış mı komutumuz şu şekilde

    cat /var/lib/logrotate/status

![logrotatestatusgorsel](/assets/logrotatestatusgorsel.jpg)

## Logları tamamen kapatmak isterseniz

Siteniz oldukça büyük ve deli gibi log tutuyor ise yada spam saldırısı alıyorsanız access.log dosyanız şişiyor ise ilk başta yukarıdaki yöntemi uygulayabilirsiniz.Yada birader ben kafamı fazla yormak istemiyorum dersenizde direk sistemin log tutmasına engel olalım tabiki **bu access.logların tutulmasına engel değil bunu web sunucunuzdan kapatmanız gerekiyor.**

    service rsyslog stop

Bu işlemleri tamamladıktan sonra **/var/log** dosyasında temizlik işlemi yapmanızı öneririm.

    rm -rf *.log
    rm -rf *.1

2 şekildede tutulan eski **logları** temizleyebilirsiniz.
