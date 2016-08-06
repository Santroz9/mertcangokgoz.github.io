---
layout: post
title: Centos 6.5 Üzerine WebuzoCP Kurulumu
date: 2014-07-25 19:26:42.000000000 +03:00
type: post
published: true
status: publish
categories: linux
description: Webuzo bilindiği üzere Cpanel içerisindeki hani şu otomatik scriptlerin kurulumu ile tanıdığımız softaculous firmasına ait ve internette gördüğümüz
---
WebuzoCP bilindiği üzere Cpanel içerisindeki hani şu otomatik scriptlerin kurulumu ile tanıdığımız softaculous firmasına ait ve internette gördüğümüz neredeyse tüm yazılımları tek tık ile kurmamızı sağlıyor.Bunların içerisinde

- Memcached
- APC
- Varnish
- Nginx
- lighttpd
- MongoDB

Bulunmakta ve tıklayarak direk olarak sisteme dahil edebiliyorsunuz.Hemde bunu kullanıcısına ücretsiz olarak sunmuşlar burada sanırım ücretsiz sunmalarının amacı nasılsa bu adam panele alışınca illaki alır diye düşünmüşlerdir ha alırsanızda zaten yüksek bir fiyatı yok yaklaşık 2.5$ peki diyeceksiniz yahu zaten tüm özellikleri kullanıyoruz niye para verelim işte olay burada karmaşıklaşıyor verdiğiniz bu para ile 330 adet scripti kurabilme yetkisi alıyorsunuz hepsi bu el ile kurarım diyorsanız boşverin 2.5$ cebinizde kalsın

Öncelikle Sistemimizde Centos 6.5 kurduk sonrasında root şifresi ile SSH girişimizi yaptık kurulum parametrelerimizi sisteme verdik ama öncelikli olarak wgeti kurmamız lazım

    (test -e /usr/bin/wget || (yum update && yum install -y wget))
    wget http://files.webuzo.com/install.sh
    chmod 777 install.sh
    sh install.sh

![webuzocpkurulumugorsel1](/assets/webuzocpkurulumugorsel1.png)Kuruluma başlıyoruz sistem otomatik olarak gerekli olan kütüphane ve ekipmanları kuracak sonrasında siz kendinize ve kullanacağınız sitenize göre ayarlamalarınızı yapabilirsiniz.Tamamen özğürsünüz.

![webuzocpkurulumugorsel2](/assets/webuzocpkurulumugorsel2.png)

Sistemin tüm kütüphaneleri ve yardımcı bileşenleri kuruldu ve son olarak webuzo ve sistem uygulamalarının kurulması kaldı kurulmasını bekliyoruz sistem ve internet hızına göre değişiklik gösterecektir max 15 dk geçmez

![webuzocpkurulumugorsel3](/assets/webuzocpkurulumugorsel3.png)

Kurulumumuz tamamlandı şimdi son aşama olan panelin yapılandırma sayfası olan bize vermiş olduğu ip adresine gitmekte sıra kopyalayıp browserde bir güzel açıyorsunuz.

![webuzocpkurulumugorsel4](/assets/webuzocpkurulumugorsel4-e1406304934710-576x576.jpg)

Gerektiği gibi dolduruyorsunuz license key kısmı eğer 2.5$ vermediyseniz boş kalacak onun dışındaki her bir boşluğu gerektiği gibi doldurun nameserverlarıda sitenizin adına göre ve kafanıza göre oluşturun Mail adresinizi sakın yanlış girmeyin bir takım bilgiler mail adresinize gelecek.

![webuzocpkurulumugorsel5](/assets/webuzocpkurulumugorsel5-e1406304900970-557x576.png)

Kurulumumuz böylelikle son buldu artık gönül rahatlığıyla panelinizi kullanabilirsiniz.Asıl Paneliniz 2002 port numaralı olan link 2004 ise script kurulumları ve en başta belirttiğiniz ns de dahil temel ayarları değiştirmek isterseniz kullanacağınız panelinizdir.Bir adet web siteniz var ve yönetmek istiyorsanız webuoz tam size göre bir paneldir birden çok site barındırmaya her ne kadar elverişli olduğu görülsede mysql pid sorunları çıkartmaktadır.
