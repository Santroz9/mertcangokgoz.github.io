---
layout: post
title:  Cloudflare ile Github Pages'de SSL Kullanımı
date: 2016-08-04
type: post
categories: genel
description:  Github Pages de kullandığım SSL konusu bazı arkadaşların dikkatini çekmiş custom domain de SSL kullanmamdan
---

Şubat ayında blogumu statik bir şekilde github pages getirmiştim hatta bunu nasıl yaptığımı da sırasıyla anlatmıştım. Ancak **Github Pages** de kullandığım SSL konusu bazı arkadaşların dikkatini çekmiş custom domain de **SSL** kullanmamdan dolayı, aslında bunu yapabileceğiniz 1 adet firma bulunuyor oda **Cloudflare** bu hizmeti özellikle sağlıyorlar ve bilindiği gibi uzun zamandır da ücretsiz **SSL** vermekteler. Uzatmanın anlamı yok yapacaklarımız aslında çok kısa bize gerekenler ise şu şekilde;

* Hali hazırda oluşturulmuş 1 adet Github pages
* Cloudflare üzerinde oluşturulmuş 1 adet ücretsiz hesap
* İngilizce okuyabilme ve regexp konusunda az buçuk bilgiye sahip olma
* Sabır ve okuduğunu anlama

Cloudflare hesabınıza giriş yaptığınız andan itibaren size neler yapabileceğinizi ve bu sistemin ne kadar güzel olduğunu anlatan bir takım görseller karşınıza çıkacak bu özelliklerden biz sitemiz için 3 tanesini kullanacağız bunlar

1.  Universal SSL
2. CDN
3. Cache

Ayrıca bu sistemlere bağlı olarak kullanılacak bir takım ek özelliklerimiz de bulunuyor. Bu makaledeki gereken her şeyi yapan kişilerin web sitesi 1 saniyenin altında açılacaktır. (Sitenin tamamen statik olması gerekmektedir. Dinamik içerikli sitelere uygulandığı taktirde siteleriniz haliyle sağlıklı çalışmaz)

**Universal SSL** içerisinde Cloudflarenin bize sunduğu **SPDY/HTTP-2** desteği ve tüm sayfaları 301 ile https şeklinde yönlendirmeyi

CDN özelliği ile sitemiz üzerinde bulunan tüm içeriği dağıtık yapıda dünyanın her yerine dağıtmayı

Cache özelliği ile de içeriğimizi kullanıcılara normalinden hızlı bir şekilde sunmayı amaçlıyoruz.

İlk önce oluşturduğunuz hesap ile **Cloudflare** sistemine giriş yapıyorsunuz. Yukarıda hiçte alışık olmadığınız yönlendirme yerleri geliyor. Zamanla alışacağınızı düşünerek pas geçiyor ve gereken ayarlarımızın yapılacağı yere geliyorum.

![cloudgithubsslgorsel1](/assets/cloudgithubsslgorsel1.png)

DNS alanına tıklıyorsunuz. karşınıza DNS bilgilerinizi girmenizi istediği yerler geliyor buradan siteniz için kullandığınız **github.io** ile biten domaini ekliyorsunuz şu şekilde olmalı

| Türü  | Ad             | Değeri                 | TTL      | Durum |
|-------|----------------|------------------------|----------|-------|
| CNAME | `siteadiniz.com` | kullaniciadi.github.io | Otomatik | Aktif |
| CNAME | `www`            | kullaniciadi.github.io | Otomatik | Aktif |

Ayarlamalarınızı yukarıdakini referans alarak yapıyorsunuz ek olarak sisteminizde mail vs kullanıyorsanız yada kullanacaksanız herhangi bir firmadan MX hizmeti alabilirsiniz ve tekrar bu DNS sayfasına ekleme yaparak kullanabilirsiniz anında aktif olacak daha sonra **Cloudflarenin** size sunmuş olduğu nameserverları domain adresinizi aldığınız firmanın paneline giriyorsunuz ve aktif olmasını bekliyorsunuz bu işlem firmadan firmaya göre değişmekte olup genelde 24 saatte tamamen aktarılmaktadır. Ancak **cloudflare** hızlı olduğu için genelde bu 6 saate düşüyor firmanız işgüzarlık yapmaz ise kullanıcılarınız'a bir sıkıntı yapmadan yeni nameserver ile yayına geçebilirsiniz.

Ayarlarınız aktif olduktan sonra yani yaklaşık 5 dakika sonra üst menüde bulunan **Crypto** sekmesine geçiyorsunuz burada kullanacağımız SSL yi ayarlayacağız SSL seçimini yaparken `Full` yerine `Full(strict)` seçeneğini kesinlikle seçmeyiniz

| Adı                                   | Değeri |
|---------------------------------------|--------|
| SSL                                   | FULL   |
| HTTP Strict Transport Security (HSTS) | ON     |
| Authenticated Origin Pulls            | ON     |

HTTP Strict Transport Security (HSTS) ayarları ise aşağıdaki gibi değiştirilmesi gerekmektedir.

* Status: ON
* Max-Age: 6 months (recommended)
* Include subdomains: On
* Preload: On
* No-sniff: On

Ayarlamalar neticesinde SSL sertifikanız **Cloudflare** tarafından oluşturulacak ve kullanıma başlayacaksınız **SSL** nin imzalanması yaklaşık bi *12-24* saat alabiliyor **https** niye çalışmıyor diye paniklemeyin.

Ardından Speed sekmesine geçiyorsunuz burada yapacaklarınız oldukça önemli çünkü sitenizde kullanacağınız JS kodları buna göre düzenlenecek misal adsense kullanıyorsanız özellikle buraların ayarlanması gerekiyor aksi taktirde reklamlarınız gözükmeyecek

| Adı            | Değeri       |
|----------------|--------------|
| Auto Minify    | Hepsi Seçili |
| Rocket Loader™ | OFF          |

Ardından Cache sekmesine geçiyoruz buradaki ayarları da aşağıdaki tabloya göre yapıyorsunuz dikkat edilmesi gereken özellikle bir nokta var burada çok agresif bir cache işlemi uygulayacağız sitenizde yapacağınız değişiklikler gözükmeyebilir. Anasayfa otomatik olarak cachesi temizlense bile diğer sayfalarda yapacaklarınız değişmez bu yüzden cacheyi el ile temizlemeniz gerekebilir.

| Adı                      | Değeri          |
|--------------------------|-----------------|
| Caching Level            | No Query String |
| Browser Cache Expiration | 1 Year          |
| Always Online™           | ON              |

Şimdi sıra bu yaptıklarımızı kalıcı bir şekilde kullandığımız domaine uygulamada peki yapacaklarımız neler

* Tüm domaindeki içerik için **Cache** özelliğinin aktif edilmesi
* Tüm domain için kalıcı olarak **Always Online** özelliğinin aktif edilmesi
* Tüm **http://** linklerinin **https://** kalıcı bir şekilde yönlendirilmesini sağlama

Hemen Page Rules kısmına geçiş yapıyorsunuz 3 tane hakkınız bulunuyor bunu güzel bir şekilde değerlendirmemiz gerekiyor ilk olarak benim yaptıklarım şu şekilde

| Domain                        | Özellik                                          |
|-------------------------------|--------------------------------------------------|
| `https://mertcangokgoz.com/*`   | Always Online: ON, Cache Level: Cache Everything |
| `https://*.mertcangokgoz.com/*` | Always Use HTTPS                                 |

Bu işlemlerden sonra ücretsiz bir şekilde web sitenizi barındırırken aynı zamanda da ücretsiz bir şekilde **SSL** sahibi olacaksınız ve web siteniz oldukça hızlı açılmaya başlayacak
