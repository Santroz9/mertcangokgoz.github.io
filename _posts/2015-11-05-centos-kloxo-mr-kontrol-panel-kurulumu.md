---
layout: post
title: Centos Kloxo-MR Kontrol Panel Kurulumu
date: 2015-11-05 19:17:16.000000000 +03:00
type: post
published: true
status: publish
categories: Linux
description: Kloxo-MR açık kaynak kodlu bir kontrol panelidir kullanımı diğer paneller gidi değildir biraz daha kolay bir yapıya sahiptir ve otomatik
---

[Kloxo-MR](https://github.com/mustafaramadhan/kloxo) açık kaynak kodlu bir kontrol panelidir kullanımı diğer paneller gidi değildir biraz daha kolay bir yapıya sahiptir ve otomatik olarak **LAMP** kurmaktadır sizin önceden bir kurulum yapmanız gerekmez sunucunuzu yeni oluşturduktan sonra komutları vererek kurulum aşamasına geçebilirsiniz. **Centos 5.x ve 6.x desteği bulunmaktadır.**

## Özellikleri

- Mail Sunucusu için ise sistemde özelllikle Qmail toaster kullanılmış
- Veritabanı sistemi için mysql veya mariaDB kullanabilme
- Veritabanı yönetim sistemi için phpmyadmin, adminer, Mywebsql kullanabilme
- DNS yönetimi için ise BIND yada djbdns kullanabilme imkanı
- FTP sunucusu için pure-ftpd modülleri
- Sistem için kurulmasada olur bir kaç ek paket bunlar arasında ClamAV,Rkhunter ve Spamassassin bulunmaktadır
- Webmail 3 adet bilinen mail yapısını destekler bunlar horald , Roundcube
- Faturalama özelliği için ise Blesta ve AccountLAB gibi servislerden faydalanılmış

Panelin kurulumu centos üzerine oldukça basittir.herhangi bir derleme yapmanıza gerek yoktur. **Kloxo-MR** kurulumuna geçmeden önce sisteminizin güncel olup olmadığını bir kontrol etmeniz gerekiyor kurulacak paketler olabilir.

    yum update -y

herhangi bir güncelleme yok ise **Kloxo-MR** nin ihtiyaç duyduğu bir kaç paketi kurmamız gerekiyor bunun için

    yum install -y yum-utils yum-priorities vim-minimal subversion curl zip unzip yum install yum-utils yum-priorities vim-minimal subversion curl zip unzip

Paketlerimiz kurulduktan sonra asıl kontrol paneli kurulumuna geçebiliriz.Bize gerekli olan paketi indiriyoruz.

    wget https://github.com/mustafaramadhan/kloxo/raw/rpms/release/neutral/noarch/mratwork-release-0.0.1-1.noarch.rpm --no-check-certificate

Belirtmemde fayda var normal **Kloxo** sürümünden farklı özelliklere sahiptir ve forklanmış bir sürümünü kullanacaksınız bilinen sorunlar giderilmiş ve eklemeler yapılmış.Asıl kurulum parametresine geçiyoruz.

    yum install mratwork-release-0.0.1-1.noarch.rpm -y

daha sonra klasör değiştiriyoruz burada varsayılan klasör root olarak gözükeceğini varsayıyorum o yüzden ben ana dizine geçiyorum.

    cd /

ve parametremizi giriyoruz.

    yum update mratwork-* && yum install kloxomr7 -y

kurulum tamamlandıktan sonra bize kurulumun tamamlanması için şu komutu girmeniz gerekmektedir demekte bunu özellikle yapmanız gerekiyor yoksa panelimiz çalışmaz

![kloxo-mrgorsel1](/assets/kloxo-mrgorsel1.png)

Bahsi geçen komutu yazdıktan sonra kurulum tamamlanıyor.

    sh /script/upcp

Sitemizin İP adresini kullanarak panele giriş yapabiliriz.Port olarak ise **7777** tanımlamamız gerekiyor.

Ön tanımlı kullanıcı bilgilerimiz ise şu şekilde

- Kullanıcı Adı : admin
- Şifre : admin

https://ipadresimiz:7777 şeklinde panelimize ilk girişi yapıyoruz.

![kloxo-mrloginscreen](/assets/kloxo-mrloginscreen.png)

ön tanımlı kullanıcı bilgileri ile giriş yaptıktan sonra sizi çok güzel bir arayüz karşılayacak daha sonra ise tüm ayarlarınızı bu panel yardımı ile yapabileceksiniz.

![kloxo-mrmainpage](/assets/kloxo-mrmainpage.png)

**Kloxo-MR** yeni yeni popüler olmaya başlasada normal kloxo ya göre daha iyi olduğu bilinmektedir.Bazı özellikleri resmi kloxo sürümünde bulunmamaktadır.Hali hazırda geliştirilmeye devam edilen **Kloxo-MR** oldukça düşük miktarda ram kullanımı nedeniyle tercih edilebilir.Ayrıca sistem içerisindeki istediğiniz hizmetleri durdurup,yeniden başlatma gibi özellikleri yerine getirebilirsiniz.Panel üzerinde bulunan **Advanced** sekmesi ile güvenlik ayarlarını yapabilirsiniz **Kloxo-MR** nin en önemli özelliklerinden bir taneside budur.
