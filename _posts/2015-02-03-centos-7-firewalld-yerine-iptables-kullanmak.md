---
layout: post
title: Centos 7 firewalld yerine Iptables kullanmak
date: 2015-02-03 14:39:48.000000000 +02:00
type: post
published: true
status: publish
categories: Linux
description: Centos işletim sistemlerinde eskisi gibi iptables özelliği olmadan geliyor yerine firewalld kullanılmış durumda ancak çoğu kullanıcı firewalld
---
Centos işletim sistemlerinde eskisi gibi **iptables** özelliği olmadan geliyor yerine **firewalld** kullanılmış durumda ancak çoğu kullanıcı firewalld alışabilmiş değil hal böyle olunca yerine **iptables** kullanmak isteyen kullanıcıların sayısı oldukça fazla ilk olarak **centos** sistemimizin güncel olup olmadığına bakıyoruz ve mümkünse son sürüm olarak herşeyin yüklenmiş olduğuna özen gösteriyoruz

Ardından firewalld yi sistemden kapatmamız gerekiyor bunun için

    systemctl stop firewalld
    systemctl mask firewalld

Kapatma işlemini yaptıktan sonra iptables kurulumunu yapalım ki kullanabilelim

    yum install iptables-services

yüklediğimiz iptables böyle kuru kuruya çalıştırmak olmaz çünkü bi reboot atımında tekrar servisi çalıştırmanız gerekecek bu gibi durumlarla uğraşmamak için **boot** kısmına ekliyelim

    systemctl enable iptables

Daha sonra standart kuralların ekli olup olmadığına bir bakın bende ekli olanlar şu şekilde

    -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
    -A INPUT -p tcp -m tcp --dport 80 -j ACCEPT
    -A INPUT -p tcp -m tcp --dport 22 -j ACCEPT
    -A INPUT -i lo -j ACCEPT

yaptığınız ayarları kayıt edip çıkıyorsunuz aktif olması için ise

    service iptables restart

şimdi sistemde iptables çalışıyormu çalışmıyormu bi bakalım bunun için komutumuz

    systemctl status iptables

iptablesin kurallarının aktif olduğunu görmek istersenizde aşağıdaki komutu kullanabilirsiniz.

    iptables -L

_Bu işlemlerin sonunda sisteminiz artık firewalld den tamamen kurtulmuş olacak ve iptablesi tam anlamıyla kullanmaya başlıyor olacaksınız._
