---
layout: post
title: Yum Komutları Nasıl Kullanılır
date: 2013-08-31 00:17:05.000000000 +03:00
type: post
published: true
status: publish
categories: linux
description: Yum(Yellowdog Updater Modified)rpm tabanlı bir paket yöneticisidir.Redhat,centos,fedora vb bir çok farklı Linux işletim sistemi
---
Yum nedir ?

Yum( **Yellowdog Updater Modified** )rpm tabanlı bir paket yöneticisidir.Redhat,centos,fedora vb bir çok farklı Linux işletim sistemi&nbsp; için kullanılan yum komutları yeni paket kurulumu eski kurulumların kaldırılması paketler hakkında bilgi almak ve versiyon kontrolü gibi pek çok işlevi yerine getirebilirsiniz.

## Yum komutları nasıl kullanılır ?

    yum [options] [command] [package]

1. **install** rpm paketlerini kurmanıza imkan verir
2. **remove** yüklü olan rpmleri silmenize yarar
3. **info** kurulu olan paket hakkında bilgi verir
4. **list** kurulu olan paket içeriklerini listeler
5. **search** paket araması yapabilirsiniz

**örnek 1** thunderbird kurulumunu örnek olarak görebilirsiniz.

    yum install thunderbird

![yuminstallcommand](/assets/yum7.jpg)

    yum -y install thunderbird

Komutun başına –y yazarsanız size yes mi yoksa no mu diye sormayacak çünkü –y = yes anlamındadır.

**Örnek 2** Yüklediğimiz paketi aşağıdaki kod ile silebiliriz

    yum remove thunderbird

![yumremovecommand](/assets/yum11.jpg)

Paketin güncelliğini kontrol etmek

    yum check-update

Komutunu vererek paketlerin güncel olup olmadıklarını anlayabilirsiniz.

**Örnek 3** paket hakkında bilgi almak

    yum info [paket ismi]

![yuminfocommand](/assets/yum21.jpg)

Görüldüğü gibi pakete dair ne varsa bize göstermiş oldu

**Örnek 4** bu komutumuzda yüklü olan rpm nin içeriğini göstermekte.

    yum list httpd

![yumlistcommand](/assets/yum31.jpg)

**Örnek 5** yüklü paketler içinde arama yapmayı sağlar

    Yum search all 'webmin'

![yumsearchcommand](/assets/yum41.jpg)

**Örnek 6** sağlayan paketi öğrenmek için kullanılır

    yum whatprovides /etc/inittab

![yumprovider](/assets/yum51.jpg)


**Örnek 7** grup şeklinde tüm paketlerin kurulmasını sağlar(tüm geliştirici malzemeleri)

    Yum groupinstall ‘Development tools’

Tüm grupları listelemek için

    Yum grouplist

**Örnek 8** komut ile eski tarihli bakabilirsiniz.

    yum history <info/list/packages-list/packages-info/summary>  paket-adı

![yuminfoall](/assets/yum61.jpg)

**Örnek 9** kritik sistem güncellemelerini yüklemek için aşağıdaki komutu kullanabilirsiniz.

    yum install yum-security

Listelemek için

    yum list-security
