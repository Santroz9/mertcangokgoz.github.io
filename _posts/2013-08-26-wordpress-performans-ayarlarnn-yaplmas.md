---
layout: post
title: Wordpress Performans Ayarlamaları
date: 2013-08-26 16:36:49.000000000 +03:00
type: post
published: true
status: publish
categories: Genel
description: Merhaba arkadaşlar beklide wordpress in en önemli ve yapılması gereken işlemlerinden birisidir performans ayarları kullanıcıya hızlı bir şekilde
---

Merhaba arkadaşlar beklide wordpress in en önemli ve yapılması gereken işlemlerinden birisidir performans ayarları kullanıcıya hızlı bir şekilde sitedeki içerikleri sunmak ve sunucuyu yormamak bilindiği üzere wordpress serverları bazı zamanlar kasmaktadır özellikle eklenen pluginler ve artan hitlerden dolayı bir süre sonra wordpress şişmektedir.bunu engellemek için bence 3 aylık yada aylık olmak üzere performans analizi yapmaktır.bu işlemi bazı web siteleri aracılığı analiz edebilir ve gereken ayarları yapabilirsiniz.

- [http://developers.google.com/speed/pagespeed/insights/](http://developers.google.com/speed/pagespeed/insights/)&nbsp;google site hız standartları
- [http://developer.yahoo.com/yslow/](http://developer.yahoo.com/yslow/)&nbsp;yahoo site hız standartları
- [http://www.webpagetest.org/](http://www.webpagetest.org/) Detaylı bir analiz verir sizlere benim favorilerim arasında yer alır.
- [http://loadimpact.com/](http://loadimpact.com/) anlık ziyaretçi testi
- [http://gtmetrix.com/](http://gtmetrix.com/) herkesçe bilinen ve popüler olan bir performans analiz sitesidir farovilerim arasında bu sitede yer almaktadır.
- [http://tools.pingdom.com/fpt/](http://tools.pingdom.com/fpt/) hız testi yapabileceğiniz web sitesidir.

Bu sitelerden almış olduğunuz raporlar ile gereken performans ayarlarını daha iyi bir şekilde yapabilirsiniz.bunlar dışında önemli olan bazı etkenler bulunuyor bunların en önemlisi de

## 1.Hosting

Kullanacağınız firmanın geçmişinin araştırılması yaşanan kesintilerdeki tavırları ve destek taleplerine verdikleri önem dikkat edilmelidir.bunun dışında barındırma işlemi yaparken VPS/Dedicated alabilir kendi site güvenliğinizi sağlayabilir yapılandırmalarınızı ona göre düzenleyebilir ve en iyi performansı alabilirsiniz.

## 2.Trafik

Düşük ölçekli web siteleri ile yüksek ölçüde trafiğe sahip olan sitelerin performansları da o ölçüye göre değişecektir.anlık aktif bin kullanıcı ile anlık aktif 100 kullanıcının sunucu ve hatta yapacağı etkiler farklıdır.her site genel olarak kullanıcılarına performans açısından daha üstün bir hizmet vermek ister ancak çoğu sitede trafik yüzünden bu mümkün değildir

## 3.Amaç ve Sitenin türü

Aslında performans içerisine bunu da dahil edebiliriz belli bir amacı olan web siteleri ile amaç sahibi olmayan web sitelerini bir tutmak tabi ki olmaz hedefi olan siteler belirlenen keyword ve içeriklerde yüksek sıralara gelirken karışık şekilde hazırlanmış bir sitenin yüksek mertebelere gelmesi daha zor olacaktır.misal e-ticaret sitelerinde performans önemlidir yada bir medya sitesinden bahsedelim daha hızlı açılan sayfalar kullanıcılar için her zaman daha iyi olacaktır.

Genel olarak internet ortamında yazılanlar her hangi bir web sitesi için yazılmış olmakla birlikte wordpress ile uyumsuz olabilir.sizler web siteleriniz de deneme yanılma yöntemleri yaparak performans açısından iyi sonuçlar alabilirsiniz unutmayınız ki internet ortamında kullanılan ayarlar ile sizin kendi belirleyeceğiniz ayarlar arasında dağlar kadar fark olacaktır.

Sitenizin performansını en yüksek düzeylere çıkartmak için server bazında ayarlamalar da yapmanız gerekebilir MYSQL,CDN,APACHE,DNS ayarlamaları gibi pek çok yerde ince ayar yapmanız gerekebilir siteniz büyüdükçe ve geliştikçe kullanıcılara sunacağınız performans da doğru orantıda olması gerekmektedir.

### 1-Yönlendirmeleri en aza indirin

Yerli yersiz sayfanızda yönlendirme yapmayın,kalıcı linklerde değişiklik yaptıysanız mutlaka bunu htaccess ile yönlendirin

### 2-404 Hataları ve diğer hataları ortadan kaldırın

Sayfa bulunamadı gibi hataları ve sayfa açılışlarında oluşan diğer hataları ortadan kaldırmaya çalışın.mümkünse günlük yada haftalık sitenizde hataları vs kontrol edin

### 3-cookie-free etkinleştirmeyi deneyin

Cookie web siteleri için iyidir resimler,videolar için gereksizdir ancak performansa etkisi azda olsa vardır.

### 4-Siteniz için bir karakter kümesi belirleyin

Bu işlemi yapmak sayfalarınızın düzgün görüntülendiğinden emin olmak için size yardımcı olur.böylelikle gereksiz karakter sorunları yaşamazsınız. karakter kümesi belirtmenin en kolay yolu **htaccess** yöntemidir.

Bunlar dışında cache yöntemini kullanmanız sitenizin performansı açısından iyi olacaktır.cache işlemini ister eklentiler ile yapabilir istersenizde htaccess düzenlemesi ile yapabilirsiniz.wordpress **cache** ile **browse cache** farklıdır.

Eklenti olarak **W3 Total Cache** öneririm kullanımı biraz zor olsa da en iyi etkiyi bu eklenti ile alırsınız.&nbsp;Siteleriniz de dosya sıkıştırmayı etkinleştirin düşük boyutlardaki dosyalar ile sayfalarınız ve resimleriniz her zaman daha hızlı açılacaktır.
