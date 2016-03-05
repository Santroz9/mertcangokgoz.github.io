---
layout: post
title: Nginx'de Spam Referrer Trafiği Yasaklama
date: 2015-06-02 12:37:15.000000000 +03:00
type: post
published: true
status: publish
categories: Nginx
description: Nginx Web Server kullanmaya başladığınız zaman yasaklamış olduğunuz tüm Spam trafikler bir anda tekrar sitenize gelmedi başladı değil
---

Nginx Web Server kullanmaya başladığınız zaman yasaklamış olduğunuz tüm Spam trafikler bir anda tekrar sitenize gelmedi başladı değil mi ? gerçektende böyle sıkıcı bir durum hakim Nginx de allahdan bunu kolaylıkla yasaklayabiliyoruz.Üstelik öyle fazlasıyla uğraştırmıyor ancak etki etmesi biraz zaman alacak yaklaşık 24 saat kadar.Tabi bu işlemleri yaptıktan sonra Nginx yeniden başlatmayı unutmayınız.

Ekleyeceğiniz yer sitenizin kod blockları ancak orada kalabalık yaptırmayalım ayrı bir dosya şeklinde kayıt edin şöyle ki

**Dosya** : /etc/nginx/global/referer-blocker.conf

    ##
    # Referrer Blocker Modified Mertcan Gokgoz
    ##

    if ($http_referer ~* "(buttons-for-website\.com|darodar\.com|econom\.co|ilovevitaly\.co|kambasoft\.com|lumb\.co|7makemoneyonline\.com|ranksonic\.info|savetubevideo\.info|see-your-website-here\.com|semalt\.com|priceg\.com|srecorder\.com|descargar-musica-gratis\.net|54\.186\.60\.77|lomb\.co)") {
      return 403;
    }
    if ($http_referer ~* "(medispainstitute|sq01|alienpayday|artobox|axisalternativementalhealthsharebutton\.net|torontoplumbinggroup\.com|tasteidea\.com|paparazzistudios\.com\.au|76brighton\.co\.uk|powitania\.pl|ilovevitaly\.ru|ilovevitaly\.com|blackhatworth\.com|hulfingtonpost\.com)") {
      return 403;
    }
    if ($http_referer ~* "(cenoval\.ru|bestwebsitesawards\.com|sitevaluation\.org|howtostopreferralspam\.eu|100dollars-seo\.com|event-tracking\.com|get-free-traffic-now\.com|guardlink\.org|dailyrank\.net)") {
      return 403;
    }

Bu kodları ekledikten sonra kayıt edip çıkın metriklerde her yeni gördüğünüz site için yukarıdaki gibi ekleme yapmanız yeterli buralardan gelen trafik otomatik olarka 403 yönlendirilecek ve sitenize uğramayacaklar.

Kodların kabul olması için server blockları içerisine aşağıdaki kodu eklemeyi unutmayınız.

    include /etc/nginx/global/*;

Eklendikten sonraki görünümü ise

    server {
    [...]

      include /etc/nginx/global/*;
    }

Başarılı bir şekilde spam trafiklerden kurtulmuş oldunuz unutmamanız gereken bir noktada var bu yöntem hepsini yok etmeyecektir sadece belirli trafik kaynaklarını engelleyecektir.Adı sanı bilinmeyen spam yöntemlerini ise **CloudFlare** kullanarak engelleyebilirsiniz.
