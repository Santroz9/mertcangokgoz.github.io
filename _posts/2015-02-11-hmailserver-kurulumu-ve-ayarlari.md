---
layout: post
title: hMailServer kurulumu ve ayarları
date: 2015-02-11 14:42:22.000000000 +02:00
type: post
published: true
status: publish
categories: windows
description: hMailServer açık kaynak kodlu ve ücretsiz windows için yapılmış bir mail sunucusudur.Tüm maillerinizi almanıza ve göndermenize izin verir üstelik
---
**hMailServer** açık kaynak kodlu ve ücretsiz windows için yapılmış bir mail sunucusudur.Tüm maillerinizi almanıza ve göndermenize izin verir üstelik herhangi bir firma ile çalışmanıza gerekde yok desteklediği protokoller ise standart olarak **IMAP** , **SMTP** , **POP3** kolaylıkla ayarlanabilir ve entegre edilebilmektedir.

Bunların yanında uygulamada spam filtresi ve virüs tarama özelliğide bulunuyor gelen ve giden mailler için bu özelliği aktif edebilirsiniz.

## _ **Desteklediği Sistemler** _

- Microsoft Windows 2012
- Microsoft Windows 2008
- Microsoft Windows 2003
- Microsoft Windows 7
- Microsoft Windows Vista
- Microsoft Windows XP Professional Service Pack 3

## _ **Desteklediği Veritabanları** _

- Microsoft SQL Server 2000 ve üstü
- Microsoft SQL Server Compact Edition
- MySQL 4 ve üstü
- PostgreSQL

Tabiki bunlar içerisinde **SQL** Server ve **MySQL** kullanmanız önerilir.

Uygulamayı [İndirmek için Tıklayın](http://www.hmailserver.com/?page=download)

Gelelim Kuruluma oldukça basit bir kuruluma sahiptir aşağıdaki adımları tekip ederek kurabilirsiniz.

![hmailservergorsel1](/assets/hmailservergorsel1.jpg)

Next diyerek kurulumumuza devam ediyoruz.

![hmailservergorsel2](/assets/hmailservergorsel2.png)

Lisans Sözleşmesini kabul ediyoruz ve next diyerek bir sonraki aşamaya geçiyoruz.

![hmailservergorsel3](/assets/hmailservergorsel3.png)

Kurulumun yapılacağı dosya yolunu seçiyoruz yada olduğu gibi bırakıyoruz.

![hmailservergorsel4](/assets/hmailservergorsel4.png)

Server ve Admin araçlarının kurulu olması gerekiyor burayı ellemiyoruz Tam kurulum seçiyoruz eğer seçili değilse

![hmailservergorsel5](/assets/hmailservergorsel5.png)

Hangi SQL türünü kullanıyorsanız uygulamanın ona göre derlenmesini sağlamanız gerekiyor ben MSSQL kullandığım için en alttakini seçtim.

![hmailservergorsel6](/assets/hmailservergorsel6.png)

Başlat menüsüne eklensinmi ne olsun diye soruyor hiç ellemeden devam edelim

![hmailservergorsel7](/assets/hmailservergorsel7.png)

Güvenlik ayarlarına geldik admin kullanıcısının hangi şifre ile sisteme giriş yapacağının ayarı buradan yapılıyor.Burada ayarlamış olduğunuz şifreyi kesinlikle unutmayın.

![hmailservergorsel8](/assets/hmailservergorsel8.png)

Son olarak kurulumu onaylıyoruz ve kur dediğimiz andan itibaren kuruluma geçiyor.hMailServer kurulumumuz bu kadar şimdi isterseniz gelin ayarlamalarını yapalım

![hmailserverayarlarigorsel1](/assets/hmailserverayarlarigorsel1.png)

Bağlanılacak olan hostname ve mail server tanımlamasını daha önceden kendisi yapıyor.

![hmailserverayarlarigorsel2](/assets/hmailserverayarlarigorsel2.jpg)

Bu aşamadan sonra Windows 8.1 de çalıştırmayı başaramadığım için sanal bilgisayardan Windows 7 ye geçiş yaptım.Ayarları eskisi gibi yapıp sonunda bağlanabildim.Şifre olarak başta ayarladığımız şifreyi istiyor.

![hmailserverayarlarigorsel3](/assets/hmailserverayarlarigorsel3-e1423136267532.jpg)



Bu kısımda ise domain ekliyoruz.örnek olarak **localhost** kullanacağız

![hmailserverayarlarigorsel4](/assets/hmailserverayarlarigorsel4-e1423136314377.jpg)

eklediğimiz domaine hesap eklemeye geldi sıra soldan **account** kısmını seçiyoruz.Ardından **Add** diyoruz.

![hmailserverayarlarigorsel5](/assets/hmailserverayarlarigorsel5-e1423136741533_k7awrh.jpg)

Ekleme işlemimiz tamamlandığına göre artık **test@localhost.com** mailini kullanabilirsiniz tabi bu senarya olarak mümkün bunun yerine geçerli bir **domaine** kurduğunuz taktirde hiçbir sıkıntı çıkmadan sisteminizde mail alıp gönderebileceksiniz.Windows sunucunuz varsa artık mail konusunda sıkıntı çekmenize gerek yok
