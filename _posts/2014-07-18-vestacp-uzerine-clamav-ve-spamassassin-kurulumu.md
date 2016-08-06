---
layout: post
title: VestaCP Üzerine ClamAV ve SpamAssassin Kurulumu
date: 2014-07-18 22:16:25.000000000 +03:00
type: post
published: true
status: publish
categories: linux
description: VestaCP Kurulu sunucunuza ClamAV ve SpamAssassin kurmak isteyebilirsiniz. Hem güvenliğiniz hemde spam maillerden kurtulmak isterseniz bu makalede
---
**VestaCP** Kurulu sunucunuza **ClamAV** ve **SpamAssassin** kurmak isteyebilirsiniz. Hem güvenliğiniz hemde spam maillerden kurtulmak isterseniz bu makalede yapacağınız ayarlamalar tam size göre olacaktır. Ancak şimdiden belirtmemde fayda var daha iyi çalışmaksı için sunucunuzda **3GB** den düşük ram olmaması gerekiyor.

ClamAV Kurulumu RHEL/Centos

    yum install clamd
    wget http://c.vestacp.com/0.9.8/rhel/clamd.conf -O /etc/clamd.conf
    wget http://c.vestacp.com/0.9.8/rhel/freshclam.conf -O /etc/freshclam.conf
    gpasswd -a clam exim
    gpasswd -a clam mail
    freshclam
    chkconfig clamd on
    service clamd start

SpamAssassin Kurulumu RHEL/Centos

    yum install spamassassin
    chkconfig spamassassin on
    service spamassassin start

Exim ayarlamalarının yapılması eğer bu işlemi yapmazsanız spamassasins hiçbir işe yaramayacak ve spam mail almaya devam edeceksiniz.

    sed -i "s/^#SPAMASSASSIN/SPAMASSASSIN/g" /etc/exim/exim.conf
    sed -i "s/^#CLAMD/CLAMD/g" /etc/exim/exim.conf
    service exim restart

**VestaCP** ayarlamalarınıda yapmayı unutmayınız aksi taktirde Panel üzerinden kesinlikle işlem yapamazsınız

    sed -i "s/ANTIVIRUS.*/ANTIVIRUS_SYSTEM='clamav'/" /usr/local/vesta/conf/vesta.conf
    sed -i "s/ANTISPAM.*/ANTISPAM_SYSTEM='spamassassin'/" /usr/local/vesta/conf/vesta.conf

Kurulumumuz tamamlanmıştır sunucunuza hiçbir şekilde **reboot** atmanıza gerek yoktur. Ayarlamaları eksiksiz yaptıysanız otomatik olarak sistem algılar ve işlemlere başlar.
