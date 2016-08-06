---
layout: post
title: Web Sitesi Girişlerini Belirli Ülkelere Kapatma
date: 2015-06-01 20:29:11.000000000 +03:00
type: post
published: true
status: publish
categories: guvenlik
description: Son zamanlarda saldırıların artması üzerine potansiyel gereksiz ülkeleri güvenlik duvarı ile yasaklamanız mümkün bende biraz analiz ettikden sonra
---

Son zamanlarda saldırıların artması üzerine potansiyel gereksiz ülkeleri **güvenlik duvarı** ile yasaklamanız mümkün bende biraz analiz ettikden sonra saldırıların geldiği ülkelere bakarak yasaklamalarda bulunuyordum.bu Yasaklamaları yaparkende aşağıdaki betik dosyasını kullanıyorum.

Sunucunuzda **UFW** ile birlikte iptables kullanıyorsanız aşağıdaki betik işinize oldukça yarayacak engellemeleri yaparken programa ülkelerin **ISO** kodlarını girmeniz gerekiyor ben aşağıdaki gibi düzenleme yaptım.Saldırıların yoğun olarak çıktığı ülkelerden girişleri tamamen yasakladım.

    #!/bin/bash
    ISO="af cn vn ru vn ye ae sy sa qa hk ua"
    WGET=/usr/bin/wget
    EGREP=/bin/egrep
    ZONEROOT="/root/ufwzones/"
    DLROOT="http://www.ipdeny.com/ipblocks/data/countries"
    # create a dir
    [! -d $ZONEROOT] && /bin/mkdir -p $ZONEROOT
    for c in $ISO
    do
            # local zone file
            tDB=$ZONEROOT/$c.zone
            echo "Downloading $c.zone .."
            # get fresh zone file
            $WGET -O $tDB $DLROOT/$c.zone >> /dev/null 2>&1
            BADIPS=$(egrep -v "^#|^$" $tDB)
            for ipblock in $BADIPS
            do
               echo "Blocking IP $ipblock.."
               /usr/sbin/ufw deny from $ipblock
            done
    done
    exit 0

Yukarıdaki kodları **/usr/local/bin/** klasörü içerisine

    nano ctry-block.sh

Açıyorsunuz ve içerisine yapıştırıyorsunuz kod içerisinde gözüken

    ISO="af cn vn ru vn ye ae sy sa qa hk ua"

Kısımlarını değiştiriniz eklemeler ve çıkartmalar yapabilirsiniz.Oluşturduğumuz dosyamızın izinlerinide son olarak düzenliyoruz.

    chmod 777 ctry-block.sh

Çalıştırmak istediğiniz zamanda **./ctry-block.sh** yazmanız yeterli otomatik olarak ip aralıklarını teker teker güvenlik duvarınıza girecek.Bu biraz uzun sürebilir bittiğini görmeden işlemi yarıda bırakmayın.Ayda bir olacak şekilde cronjob ayarlaması yapabilirsiniz böylelikle ip aralıklarını güncel tutabilirsiniz.
