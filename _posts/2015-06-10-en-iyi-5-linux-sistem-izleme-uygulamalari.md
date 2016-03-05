---
layout: post
title: En iyi 5 Linux Sistem İzleme Uygulamaları
date: 2015-06-10 12:55:37.000000000 +03:00
type: post
published: true
status: publish
categories: Linux
description: Herhangi bir linux sunucunuz var sağlıklı güzel bir şekilde çalışıyor ama siz sisteminizi kontrol etmek istiyorsunuz ve sağlığının bozulmasını
---

Herhangi bir linux sunucunuz var sağlıklı güzel bir şekilde çalışıyor ama siz sisteminizi kontrol etmek istiyorsunuz ve sağlığının bozulmasını istemiyorsunuz diyelim yada bir sunucu yöneticisisiniz ve sistemi izlemek istiyorsunuz bunlar için bilmeniz gereken bazı araç ve gereçler bulunmakta sunucu yöneticisi genel olarak Network,Disk Okuma ve yazma,CPU,RAM gibi kaynakları izlemek zorundadır.Bizde bu örnekleri göstermek için Ubuntu kullanıyor olacağız.Ayrıca bu makalede geçerli olan uygulamalar popüler olan uygulamalardır.

### Htop

Cpu ve Ram değerlerini anlık olarak izlemenize imkan verir top komutuna göre daha görsel ve detaylıdır.

    sudo apt-get install htop

![htopgorsel1](/assets/htopgorsel1.png)

### İostat

Sunucuya dair CPU ve ağ tabanlı istatistikleri izlemenize imkan sağlayan bir uygulamadır giriş ve çıkışları çok güzel bir şekilde kontrol edebilirsiniz.

    sudo apt-get install sysstat

- tps – Saniyede iletilen
- kB\_read – Saniyede okunan kB
- kB\_wrtn – Saniyede yazılan kB

![iostatgorsel](/assets/iostatgorsel.png)

Sunucuda bulunan işlemcinin istatistiklerini görmek için

    iostat -c

### Vmstat

Sanal bellek durumu hakkında detaylı bilgi alabilirsiniz.Bu uygulamayı iostat kurulumu yaptıysanız onunla birlikte zaten geliyor kısacası sysstat paketi kurulu ise sisteminizde bu uygulamada sisteminizde olacaktır.

    sudo apt-get install sysstat && vmstat

![vmstatgorsel](/assets/vmstatgorsel.png)

### Sar

Bu uygulama System Activity Report(Sistem Faaliyet Raporu)sysstat paketi ile birlikte geliyor.Bu araç oldukça önemli zaman içerisinde oluşan belirli olayları tarihsel olarak kayda alır "/etc/cron.d/sysstat" içerisinde cron ile bilgiler oluşturulur.

    cat /etc/cron.d/sysstat

###  ![sargorsel](/assets/sargorsel.png)
Tcpdump

Ağda yapılan tüm işlemleri izlemenize imkan tanıyan bir uygulamadır.Gelen ve giden paketleri tam zamanlı olarak analiz edebilirsiniz.Yapılan saldırıları tespit edebilir veya herhangi bir sorunu çözmek için kullanabilirsiniz.

    sudo apt-get install tcpdump

![tcpdumpgorsel](/assets/tcpdumpgorsel.jpg)

Kullanmak için ise aşağıdaki komutu kullanabilirsiniz.

    tcpdump -i eth0

Detaylı olarak tcpdump hakkında bilgi almak için ise [burada bulunan makalemizi okuyabilirsiniz.](https://mertcangokgoz.com/tcpdump-nasil-kullanilir/)
