---
layout: post
title: Virtualmin/Webmin İçin Nginx Kurulumu
date: 2014-06-21 12:45:31.000000000 +03:00
type: post
published: true
status: publish
categories: linux
description: Sitenizin hiti yükselmiştir yada sitenizde birazda olsa performans artışı istiyorsunuzdur işte o zaman Nginx yani benim deyimimle engin abimiz biçilmiş
---
Sitenizin hiti yükselmiştir yada sitenizde birazda olsa performans artışı istiyorsunuzdur işte o zaman Nginx yani benim deyimimle engin abimiz biçilmiş bir kaftan diğer panelleri bilemem ancak virtualmin/webmin çatısı altında gerçekten çok işinize yarayacağını düşünüyorum ama hepsinden önemlisi düşük RAM kullanımı belkide nginx in en büyük özelliklerinden bir tanesi ve bu makalemizde virtualmin/webmin için nginx kurulumunu göstereceğim

ilk önce sunucumuza bağlanmamız gerekiyor tabi bu duygusal anlamda değil SSH üzerinden olacak ben ubuntu kullandığım için

      ssh root@ipadresi

nginx kurulumuna geçiyoruz.

      yum install nginx

sonra nginxi virtualminin nginx eklentisini kurmamız gerekiyor bunun için

      yum install wbm-virtualmin-nginx wbm-virtualmin-nginx-ssl

hemen ardından root olarak virtualmin panelimize giriş yapıyoruz.

![virtualminnginxkurulumugorsel1](/assets/virtualminnginxkurulumugorsel1-e1403212978907-761x576.png)

yukarıdaki webmin sekmesine giriş yapıyoruz ve hemen ardından Servers \> Nginx web server yolunu kontrol ediyoruz gözüküyorsa ve ayarlamaları gözüküyorsa sorunumuz yok demektir.eğer sorun çıkarsa module config diyerek ayarlamalarınızı gerçekleştirebilirsiniz.

Şimdi geldi sıra virtual hostları eklerkende nginx web server ile eklenen hostların yapılandırılmasına default olarak apache olacağından bunu kapatıp tamamını nginx geçirmemiz gerekecek bunun içinde

Virtualmin sekmesine giriş yapıyoruz ardından System settings \> Features and plugins kısmına giriş yapıyoruz ve aşağıdaki gibi seçimleri gerçekleştirip onaylıyoruz.

![virtualminnginxkurulumgorsel2](/assets/virtualminnginxkurulumgorsel2-e1403213242653-1024x458.png)

yani burada apacheden arta kalanları temizlememiz gerekiyor sırasıyla kaldırılacaklar aşağıda listelenmiştir.

1. Apache Website
2. SSL Website
3. DAV Login
4. Mailman
5. Protected web directories
6. AWStats Reporting
7. Subversion repositories

Nginx için seçilecek olanlar ise aşağıda listelenmiştir.

1. Nginx website
2. Nginx SSL website

kayıt ettiğinizde apachesiz kullanılamıyor diyip karşısında bir özelliği gösterirse onuda seçip kayıt ediyorsunuz ve devam ediyorsunuz.hemen ardından System informatin kısmına giriş yapıyoruz. Sağ üst köşede Refresh system information diyoruz ve status kısmında artık nginx webserverimiz gözükmeye başlıyor.bundan böyle apache yerine nginx kullanabilirsiniz bunun içinde create virtual server kısmından apache yerine nginxin ayarlarının seçili olması yeterli geri kalan herşeyi zaten virtualmin kendisi yapacaktır.
