---
layout: post
title: Centos 6.4 Üzerine Python Kurulumu
date: 2013-09-04 01:22:10.000000000 +03:00
type: post
published: true
status: publish
categories: Linux
description: sanal centos üzerine python ile çalışan bir uygulama yüklemem ve ısrarla 2.4 üstü olması lazım demesi ve beni çileden çıkartmasıdır ama  google
---

Bu makaleyi bana hazırlatan şey evdeki sanal **centos** üzerine python ile çalışan bir uygulama yüklemem ve ısrarla 2.4 üstü olması lazım demesi ve beni çileden çıkartmasıdır ama &nbsp;google da arama yaparak her **blogda** 5 er 10 ar bu tip makaleler bulmak mümkün bu furyaya bende katılmak istedim sanırım bilemiyorum. google app engine başta olmak üzere pek çok yerde **python** &nbsp;görmek mümkün oldu günümüzde e hal böyle olunca sunucularda **python** olmazsa olmaz bir hal almaya başladı

öncelikle sunucumuz un iyice güncel olması şahsen önemli bir durum bunun için

    yum update

komutunu vererek bi güncellemesini yapıyoruz(server yeni teslim almışsanız yada dosyaların eskidiğini düşünüyorsanız)ardından hemen kurulum aşamalarına geçelim

    yum -y groupinstall 'Development Tools'
    yum -y install openssl-devel* ncurses-devel* zlib*.x86_64
    yum -y install bzip2 bzip2-devel bzip2-libs
    curl -O http://www.python.org/ftp/python/2.7.5/Python-2.7.5.tgz
    tar xfz Python-2.7.5.tgz
    cd Python-2.7.5
    ./configure
    make
    make install

yum komutlarından hemen sonra gelen -y komutu " **yes**" anlamındadır ve size kurulsun mu kurulmasın mı diye sormayacak direk hepsini kuracaktır.

kurulup kurulmadığını ve versiyon bilgisini aşağıdaki komutları vererek almalısınız böylelikle kurulup kurulmadığını iyi bir şekilde anlamış olacaksınız.

    which python

komutunu vererek kurulu olduğu yeri görmüş oluyoruz böylelikle kullanılacak uygulamaları buna göre düzenleyebiliriz.
