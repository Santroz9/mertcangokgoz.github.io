---
layout: post
title: Wordpress Sitemap.xml Zafiyeti
date: 2015-12-31 19:21:12.000000000 +02:00
type: post
categories: Güvenlik
description: Başlığın ilginç geldiğinin farkındayım.Bu günkü yılbaşı özel yazımızda sizlere wordpress sitelerde kullanılan ve statik olarak tutulmayan
---

Başlığın ilginç geldiğinin farkındayım.Bu günkü yılbaşı özel yazımızda sizlere **wordpress** sitelerde kullanılan ve statik olarak tutulmayan sitemap eklentilerinin aslında sitelere nasıl zarar verebilecek birer saatli bombaya dönüştüğünü göstermek istiyorum.

İlk olarak kullanılacak ekipmanları ayarlamanız gerekiyor.

- 1 Adet linux tabanlı bilgisayar
- İnternet bağlantısı

ilk olarak bilgisayarınızı güzelce açıyorsunuz herşeyi hazırlıyorsunuz koltuğunuzu falan ayarlamanız lazım internete bağlanıyorsunuz.Daha sonrasında sisteminizde aşağıdaki uygulamayı kurmanız gerekiyor.

```
    sudo apt-get install parallel
```

bu uygulama size paralel olarak işlem yapma imkanı tanıyacak yani birden çok istek gönderebilmeye yarayacak kullanım amacınıza göre yapılacak işlemler tabikide değişiklik gösterecek ancak genel amacı paralel işlem yaptırma

Wordpress sitelerde genelde popüler olan üç&nbsp;adet sitemap eklentisi bulunmakta bunlar genellikle sitelerdeki içeriği **PHP** aracılığı ile sitemap oluştururlar yani bir bakıma sanal bir sitemap dosyanız olur. Bu 3 eklentinin de siteler üzerinde yükünün oldukça fazla olduğu ve ram kullanımını ciddi şekilde arttırdığı gözlemlenmiştir.Yapılacak olan işlemde bu dosyalar üzerinde yoğunlaştırılmıştır.

- Yoast SEO
- Google XML Sitemap
- All in One SEO Pack

Statik olarak oluşturulmayan sitemap her seferinde istek aldığında tekrar ve tekrar sistem tarafından **PHP** aracılığı ile oluşturulur.Bu her oluşturulma da 43 MB ram kullanımı demektir.

43\*1000=43000 MB Ram kullanımı demektir.Parametre değiştirilerek daha fazla RAM kullanımı sağlanabilir.Ayrıca sayfaya atılan her isteğin boyutu test için kullandığım bir web sitesinde 1.1MB buluyordu yaptığımız 1000 istekde ise karşı tarafdan 1.1\*1000= 1100 MB veri demektir.Hal böyle olunca sitedede ciddi şekilde bir trafik olduğu için isteklere cevap veremeyecek duruma gelmekte ve isteklere timed out vermektedir.

ilk olarak saldırı geldiği anda&nbsp; **CPU** yavaş yavaş artmaya gelen isteklere cevap verememeye başlıyor. **Ddos** koruması olan sunucularda bu şekilde sistemi kapatabilirsiniz.Çünkü bu basit bir HTTP saldırısıdır.Ancak engellenmesi kolaydır.

Saldırıya başladığımız ilk anda sistemden bir görüntü&nbsp;(Sisteme zarar vermemesi amacıyla 30 sn den sonra devam edilmemiştir.)

![sitemapzafiyetgorsel1](/assets/sitemapzafiyetgorsel1.png)

Saldırıya devam ettiğimizde **CPU** kullanımı **%100** RAM kullanımı da **%98** lere fırlıyor.Tabi sitede kullanılan eklentiye göre durum değişiyor misal all in seo kullanılıyor ise sadece **CPU** fırlıyor. **Google XML Sitemap** eklentisi ve **Yoast SEO** eklentisinde ki sitemap özelliği kullanılırsa hem **CPU** hemde **RAM** de ciddi derecede bir yükselme oluyor.

Saldırı anında ise web server tarafından tutulan loglara göz atabilirsiniz.Şu şekilde bir takım loglar ile karşılaşacaksınız.

![saldirianiloglar](/assets/saldirianiloglar.png)

Direk olarak **HTTP GET** saldırısını simule eden ilginç bir yapıya sahip olduk normalde pek çok site bu denli bir isteğe alışkındır ancak cache sistemi ile tutulmayan ve gelen her istek için yeniden sayfa oluşturan sistemlerde bu zafiyet oldukça etkili olacaktır. Tabi ki kullanılmasını önermiyoruz.

Parametremiz ise şu şekilde

```
    seq 100000 | parallel -j0 --joblog log curl -s siteadresi/sitemap.xml{} ">" {}.txt
```

bu komutu kullanırken mümkün olduğunca dizini rastgele seçmeyin oluşacak olan **txt** dosyalarını kontrol edemeyeceğiniz için sıkıntı çıkartabilir herhangi bir klasör oluşturup bu komutu da o klasör içerisinde vermenizi öneririm.

Peki bu sıkıntıdan nasıl kurtulursunuz.Herhangi birisinin **sitemap** üzerinden yaptığı bu saldırıyı durdurmanız için gelen istekleri limitlemeniz oldukça işinize yarayacak.

**nginx.conf** dosyanızın içerisine http{ } bloğu içerisine aşağıdaki 2 adet komutu ekliyorsunuz ilki gelen istekleri limitler ikinciside bağlantıyı limitler

```
    limit_req_zone $binary_remote_addr zone=one:10m rate=1r/s;
    limit_conn_zone $binary_remote_addr zone=addr:10m;
```

bu iki komut sonrasında **sitenizde kullandığınız conf** dosyasına aşağıdaki gibi bir satırı eklemeniz yeterli olacak.

```
    location = .xml{
            limit_req zone=one burst=10;
    }
```

aynı şekilde PHP uzantılı dosyalarada şöyle bir ekleme yapabilirsiniz.

```
    location ~ .php$ {
            limit_req zone=one burst=10;
            limit_conn addr 1;
    }
```

bu sayede sistemdeki dosyalarınıza gelen istekler sizin belirlemiş olduğunuz sınırı geçerse otomatik olarak yasaklanacak ve gereksiz yere sistem tüketmesi yaşanmayacak.Kesin bir çözüm olmasa da işinize oldukça yarayacağını düşünüyorum.

Yardımlarından dolayı **[Furkan Kalkan](http://furkankalkan.me/)** a Teşekkür ederim.

NOT:Yukarıdaki bahsettiklerim sistem yöneticileri tarafından unutulan ve yapılması gereken mutlak ayarlamaları içermekte ve bu ayarların yapılmaması dahilinde oluşabilecek basit ama zararlı zafiyeti göstermek amacı ile yazılmıştır.Site içerisinde bulunan ve uzantısı farklı olan dosyaların ve dinamik olarak oluşturulan tüm sayfaların korumaya alınması mecburidir.
