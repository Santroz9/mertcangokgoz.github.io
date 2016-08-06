---
layout: post
title: Wordpress Site Optimizasyonu
date: 2015-03-23 17:44:40.000000000 +02:00
type: post
published: true
status: publish
categories: genel
description: Bu makalemizde Wordpress CMS kullanan web sitelerini daha performanslı hale nasıl getirebileceği daha az nasıl CPU kullanılabileceği gibi
---
Bu makalemizde Wordpress **CMS** kullanan web sitelerini daha performanslı hale nasıl getirebileceği **daha az nasıl CPU kullanılabileceği** gibi bir takım bilgiler vereceğim böylelikle Host firmanızdan **Aşırı CPU** kullanıyorsunuz sitenizi optimize ediniz laflarınıda duymamış olacaksınız **Wordpress** site sahipleri illaki duymuşlardır.

## **1.Önbellek Eklentileri Kurun**

Cache Eklentileri(önbellek) sitenizin her sayfa gösterim işleminde MySQL sunucusuna istek göndermeksizin verinin 1 defa alınıp işlenmesi aşamasıdır.Bu aşamadan sonra bir daha MySQL sorgusuna kullanıcı takılmaz ve önbellekden herşey gösterilir.Sitenin kaynaklarını daha iyi kullanmada önemli ölçüde etkilidir.Kullanabileceğiniz Popüler Cache Eklentileri

1. [WP Fastest Cache](http://wordpress.org/plugins/wp-fastest-cache/)
2. [W3 Total Cache](https://wordpress.org/plugins/w3-total-cache/)
3. [WP Super Cache](https://wordpress.org/plugins/wp-super-cache/)

## **2.Gereksiz Eklentilerden ve Sorgulardan Kurtulun**

PHP de bazı kütüphaneleri kullanan eklentiler var öncelikle bunlardan bi kurtulun boş yere sorgu gönderip kasılmasına sebebiyet vermeyin.Wordpress temalarına entegre olarak gelen ve sitenin kasmasına sebep olan Timthumb gibi kütüphaneleri temanızdan silin.Cache eklentileri bu tarz temaya entegre olan kütüphanelere etki etmemekdedir.Buda sitenizde sorunlara sebebiyet verebilir.Gereksiz sorgulardanda MySQL sorgu gönderen genelde temada bulunan satırları el ile girebilirsiniz bunlar meta,site desq,blog urli,bazı csslerin yolları vs

## **3.Görselleri Boyutlandırın**

İlk olarak temanıda kullanılan default görsel boyutlarına bir bakın.Yükleyeceğiniz resimleri bu boyuta göre şekillendirin bu şekilde resimlerin kapladığı alanı azaltabilirsiniz.Aynı şekilde resimlerinizi sıkıştırabilirsiniz bunu Photoshop ile yapabilirsiniz dilersenizde sıkıştırma eklentilerini kullanabilirsiniz.

## **4.Çok Fazla Eklenti Kullanmayın**

Sitenizde her yaptığınız işi ilk olarak eklentiler ile yapmaya çalışmayın eğer bir iletişim formu ekleyeceksiniz sitenizi eklenti kullanmayın sayfa şablonu ile yapmaya çalışın yada ücretini ödeyerek yaptırın.Sitenin istatistiklerini alması için kullanacağınız sistemlerin eklentilerini kesinlikle kullanmayın izleme kodlarını el ile ekleyin bu sitenizde performansı büyük ölçüde arttıracaktır.

## **5.CDN Kullanın**

Sitenizin Açılma hızı için büyük oranda önemli olan CDN aynı zamanda sitenizin kaynakları içinde oldukça etkilidir.peki bu ne demek oluyor.Kullanıcılar sizin site dizininiz yerine dosyaları eğer CDN den çekerse sitenizden hiç kaynak tüketilmeyecek istekler CDN den yanıtlanacak ve sitenizdeki CPU oranı oynamayacak yazdıklarımdan birşey anlamamış olabilirsiniz ama imkanınız varsa kullanın CDN içinde yukarıdaki popüler cache eklentilerinin CDN özelliklerini kullanabilirsiniz.

Bu işlemlerden sonra sitenizde %20-%35 oranda daha fazla bir performans alacaksınız.
