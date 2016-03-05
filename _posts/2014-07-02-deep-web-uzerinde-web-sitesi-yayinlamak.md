---
layout: post
title: Deep web üzerinde web sitesi yayınlamak
date: 2014-07-02 23:45:14.000000000 +03:00
type: post
published: true
status: publish
categories: Güvenlik
description: deep web az çok nedir biliyorsunuzdur ancak size bu ortamda bir web sitesi nasıl yayınlanır bunu anlatacağım ister evinizde ister işinizde
---
[deep web az çok nedir biliyorsunuzdur](https://mertcangokgoz.com/deepwebdarknet-hakkinda-her-sey.html) ancak size bu ortamda bir web sitesi nasıl yayınlanır bunu anlatacağım ister evinizde ister işinizde kullandığınız bir bilgisayar ile çok rahatlıkla deep web de site açabilirsiniz.Hem masrafsız hemde kolaydır.Ne yapacağınıza bağlı olarak içeriğinizi&nbsp; düzenleyin.Yayınlamaya hazırsanız toru açın gerisini ona bırakın...

# Gerekenler

- [Tor Browser](https://www.torproject.org/) yada direk olarak [Tor](https://www.torproject.org/)uygulaması
- Her hangi bir bilgisayar
- Sunacağınız legal yada illegal içerik
- iyi bir işlemci
- [XAMP](https://www.apachefriends.org/tr/index.html)

Şimdi herşey tamamda niye iyi bir işlemci istiyordun mübarek diyorsanız bu noktada .onion uzantısını istediğiniz şekilde almak için yani mertcanx7d3azumt.onion şeklinde yapmak istendiği taktirde baya bi uğraşmanız gerekecek işte bu noktada iyi bir işlemciye ihtiyacınız olacak ha ben açar rastgele gelen hostname yi kullanırım diyorsanız o ayrı içeriğinizi özenle seçin illegal birşey satacaksanız ona göre düzenleyin legal bir şekilde blog açacaksanız o şekilde devam edin bu arada türkiyeden hiç .onion site bulunmamakta idi taki benim sitemin bir yansısı olarak açtığım&nbsp;6hkpswsst2zf4yxw.onion olana kadar.web serveri olarakda XAMP ile bir gelen Apacheyi tercih ettim pek fazla bi teferruat gerektirmiyor direk olarak sitesinden indirip kuruluma geçin ve Apacheyi başlatın hepsi bu kadar.

Ulaşmak isterseniz

> 6hkpswsst2zf4yxw.onion

Ben evimdeki bilgisayarıma XAMP + Wordpress kurarak bir yansı oluşturdum sunucu üzerinden bir yönlendirme yapmadım.Gelelim kuruluma bu güzel işlemi nasıl yapacağıksınız.Bahsettiğim gibi oldukça basit İndirmiş olduğunuz torun dosya yoluna ilerliyorsunuz.Masaüstündeki simgesine tıklayarak ulaşabilirsiniz.

![deepwebsiteacmagorsel11](/assets/deepwebsiteacmagorsel11.png)

yukarıda görmüş olduğunuz gibi bir sürü dosyamız var bizim ayarlamalarımızı yapacağımız dosya **"torrc"** içerisini açıyoruz satırların bittimine gerekli parametreleri ekliyerek işlemimize başlıyoruz.Burada yapacağınız eksik bir ayar torun çalışmasını engellemektedir o yüzden oldumu olmadımı diye şüpheniz olmasın hata verirse zaten tor bile başlamayacak...

![deepwebgorsel3](/assets/deepwebgorsel3.png)

Burada satırın sonuna satırlarımızı ekledik ve kayıt edip çıktık dosya yolu olarak sitemizde yayınladığımız dosyaların yerini yazmamız gerekiyor ben xampp üzerine kurulu bir sistem oluşturdum dosya yoluda xampp nin default olarak gelen dosya yoludur.Eğer xampp kullanırsanız sizde ayarları yukarıdaki gibi yapabilirsiniz.

    # Hidden Service
    HiddenServiceDir C:\xampp\htdocs
    HiddenServicePort 80 127.0.0.1:8080

![deepwebgorsel4](/assets/deepwebgorsel4.png)

![deepwebgorsel5](/assets/deepwebgorsel5.png)

ve işlemimiz tamamlanıyor.Toru açtığınız zaman tanımlamış olduğunuz dosya yolu içerisine _**hostname(sitenizin .onion ismi bu dosyada bulunuyor.) ve private\_key**_ adında 2 tane dosya oluşturacak bunları sakın silmeyin silerseniz eski .onion bağlantınız üzerinden giremezsiniz yenisini oluşturur.Tüm Ayarlamalardan sonra yayına aldığımız sitemizin son hali

![deepwebsiteacmagorsel1](/assets/deepwebsiteacmagorsel1-e1404321961322-992x576.png)
