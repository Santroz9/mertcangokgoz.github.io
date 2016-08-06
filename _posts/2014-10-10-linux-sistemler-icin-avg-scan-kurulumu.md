---
layout: post
title: Linux Sistemler için AVG Scan Kurulumu
date: 2014-10-10 16:30:01.000000000 +03:00
type: post
published: true
status: publish
categories: linux
description: Genelde herkes linux de virüs taraması için clamav kullanır evet mantıklıdır ancak bazı virüsleri clamav bulmaz bunun için meldet tabanlı
---
Genelde herkes **linux** de virüs taraması için **clamav** kullanır evet mantıklıdır ancak bazı virüsleri clamav bulmaz bunun için **meldet** tabanlı bir şeyler lazım bize tamam bulduk ama bi baktık oda tam bulamadı o zaman bizde **AVG** Scanı bulduk bu konuda **AVG** Scan gerçekten de muazzam bir uygulamadır lafı uzatmayalım sistemimize bunu kuralım biz.Kurulumu centos için açıklayacağız...

    wget http://aa-download.avg.com/filedir/inst/avg85lms-r874-a3473.i386.rpm
    rpm -i avg85lms-r874-a3473.i386.rpm
    avgctl --register 8LESRV-AL7LJ-XW4KK-YW8EA-6FUJP-SYDDC-DT0T
    /etc/init.d/avgd start
    avgupdate

Kurulumda hata alırsanız aşağıdakileri yapmanı yeterli

    yum install glibc.i686
    then start the avg service
    #/etc/init.d/avgd start

Tarama İşemini başlatmak için ise

    avgscan /*

yada

    avgscan dosya yolu

Buney la böyle üşendim bana klasik birşeyler ver diyorsanız ise

    yum install clamav clamd

Sistemi Clamav otomatik tarasın ve başlatalım diyorsanız...

    /etc/init.d/clamd on
    chkconfig clamd on
    /etc/init.d/clamd start

Son Olarak Kurulumunu yapmış olduğunuz uygulamalar yaklaşık olarak **110MB** civarında ram tüketmektedir.Eğer sistem kaynaklarınız yüksek değilse kurmadan önce birkez daha düşünün sonra vay efendim benim sitem niye yavaşladı sayfalar niye ağır açılıyor niye kitleniyor demeyin." **AVG** nin keyini nerden buldun la"diyorsanızda Googlede her yerde çıkmakta
