---
layout: post
title: Linux Sistemlerde Dig Komutu Kullanımı
date: 2013-09-08 23:52:30.000000000 +03:00
type: post
published: true
status: publish
categories: linux
description: Dig(domain information groper)Linux sistemlerde DNS kayıtlarına bakmak için kullanılır.DNS adreslerine bakmak istediğiniz siteyi dig komutu
---

Dig(domain information groper)Linux sistemlerde **DNS** kayıtlarına bakmak için kullanılır. **DNS** adreslerine bakmak istediğiniz siteyi dig komutu ile aratma yapmanız mümkün ve sitede kullanılan tüm DNS kayıtları karşınıza çıkacaktır.Kullanım kolaylığından dolayı dig komutunu çoğu kişi kullanmaktadır.

**dig komutunu nasıl kullanılır ?**

**Örnek 1**

dig \<siteadi\> olarak kullanıldığında size domaine bağlı olan **A** Kaydını göstermektedir.

    dig mertcangokgoz.com

**Örnek 2**

dig \<siteadi\> -t NS olarak kullanıldığı zaman **NS** kayıtlarını listelemektedir.

    dig mertcangokgoz.com -t NS

**Örnek 3**

dig \<siteadi\> -t MX olarak kullanıldığı zaman **MX** kayıtlarını listelemektedir.

    dig mertcangokgoz -t MX

**Örnek 4**

dig \<siteadi\> -t txt olarak kullanıldığı zaman **TXT** kayıtlarını listelemektedir.

    dig mertcangokgoz -t TXT

**Örnek 5**

dig -x \<ipadresi\> +short olarak kullanıldığı zaman eskiden kullanılan kayıtları listelemektedir. Bir nevi kazı işlemi yapar

    dig -x 85.64.22.1 +short

geriye doğru tam bilgi almak için +short parametresini kaldırmanız yeterlidir.

**Örnek 6**

dig \<dns adresi\> \<siteadi\> -t \<aratmak istediğiniz kayıt tipi\> şeklindeki aramalarda **/etc/resolv.conf** da kayıtlı dns yi kullanmadan bilgi almanızı sağlar

    dig 8.8.8.8 mertcangokgoz.com -t MX

**Örnek 7**

dig \<siteadi\>+nocomments +noquestion +noauthority +noadditional +nostats

- +nocomments bilgileri kapatır
- +noauthority yetki alanını kapatır
- +noadditional ek bölümleri kapatır
- +nostats istatistikleri kapatır.

Bunlarla uğraşmak istemiyorsanız size uzun geliyorsa

**dig \<siteadi\> +noall +answer** komutunu kullanarak **+noall** yani yukarıda yazılanların kapatılması işlemi cevap içinde + answer yazıyoruz.

    dig mertcangokgoz.com +noall +answer

**Örnek 8**

belirtilen txt dosyasından dig komutu ile toplu dns kayıt sorgulama işlemlerinde aşağıdaki parametreleri kullanabilirsiniz.

    cat  kayitlar1.txt

google.com
yahoo.com
centos.org

oluşturulan txt kaydının sorgulanma işlemi

    dig -f <dosya adi>  +noall +answer

**dig -f kayit1.txt -t MX +noall +answer** olarak kullanıldığında txt dosyasındaki **MX** kayıtlarını tek tek bakarak komut dizininde size listeleyecektir.
