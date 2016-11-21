---
layout: post
title: DNSCurve Nedir ?
date: 2016-11-21
type: post
categories: linux
description: DNSCurve, Daniel J. Bernstein tarafından tasarlanan ve Etki Alanı Adı Sistemi (DNS) için önerilen yeni ve güvenli bir protokoldür.
---

**DNSCurve**, Daniel J. Bernstein tarafından tasarlanan ve Etki Alanı Adı Sistemi (DNS) için önerilen yeni ve güvenli bir protokoldür.

**DNSCurve**, tarafından kullanılan `Curve25519` , `Salsa20` ve `Poly1305` MAC işleviyle eşleşen anahtarları, çözümleyiciler ve yetkili sunucular arasındaki **DNS** paketlerini şifrelemek, doğrulamak ve bağlantı kurmak için eliptik eğri şifrelemesi kullanılır. Uzak yetkili sunucular için ortak anahtarlar NS kayıtlarına yerleştirilir, bu nedenle recursive çözümleyiciler sunucunun DNSCurve'u destekleyip desteklemediğini bilir. Olay `uz5` ile başlar ve sunucunun 255 bitlik genel anahtarının 51 baytlık bir `Base32` kodlamasını izler.

Örneğin, **BIND** biçiminde;

```
mertcangokgoz.com. IN NS uz5xo1ymn4mw5oodb4mxixn3e2ntnqzjnndxl3ejdjbxl.mertcangokgoz.com.
```

Çözümleyici daha sonra sunucuya **DNSCurve** genel anahtarını, 96 bit **nonce**(Kriptografi'de bir nonce, yalnızca bir kez kullanılabilen keyfi rastgele bir sayıdır.) ve sorguyu cryptographic box içeren bir paket halinde gönderir. Cryptographic box, çözümleyici özel anahtarı, sunucunun genel anahtarı ve **nonce** kullanılarak oluşturulur.

Sunucudan gelen yanıt, farklı bir 96-bit **nonce** ve sorunun cevabını içeren kendi Kriptografik bilgiyi içerir.

DNSCurve'de kullanılan şifreleme araçları, TCP'ye benzer, ancak verileri şifrelemek ve doğrulamak için eliptik eğri şifreleme kullanan UDP tabanlı bir iletişim kuralı olan **CurveCP'de** kullanılanla aynıdır. Bir benzetme yapalım, **DNSSEC**, PGP ile bir web sayfası imzalamak isterken **CurveCP** ve DNSCurve, SSL'yi kullanarak kanalı şifrelemek ve doğrulamak için ve Tıpkı PGP imzalı web sayfaları şifreli bir kanal üzerinden SSL kullanarak gönderilebileceği gibi, **DNSSEC** verileri de DNSCurve kullanılarak korunabilir.

**DNSCurve**, önceki DNS hizmetlerine göre avantajları;

* **Gizlilik** - normal DNS, istekleri ve yanıtları şifrelemez ve herhangi bir saldırgana bu bilgileri yayınlayabilir.
* **Bütünlük** - normal DNS, bazı korumalara sahiptir ancak sabırlı bir şekilde sniffing ile saldırganlar DNS kayıtlarını yeniden oluşturabilir; Bu, **DNSCurve**'nin Kriptografik kimlik doğrulaması ile engellenir.
* **Kullanılabilirlik** - normal DNS, saniyede birkaç sahte paket gönderen sniffing saldırganlarından ve hizmet reddine (DoS) lara karşı koruma sağlamaz. **DNSCurve** ise sahte DNS paketlerini tanır ve atar; SMTP, HTTP, HTTPS gibi bazı protokoller DoS'a karşı savunmasızdırlar.


### Güvenlik

DNSCurve, **NIST**(Ulusal Standartlar ve Teknoloji Enstitüsü)'nin kabaca 3072-bit RSA'ya eşdeğer olduğunu tahmin ettiği 256-bit eliptik eğri şifrelemeyi kullanır. `ECRYPT` benzer bir eşdeğerliği bildirir. Sorgu başına sorguya açık anahtarlı şifreleme (SSH ve SSL gibi) ve tekrar çalma saldırılarına karşı koruma sağlamak için 96 bitlik şifreler kullanır.

Google güvenlik sorumlusu Adam Langley;

> Çok yüksek bir ihtimalle kimse büyük bir kuantum bilgisayar olmadan curve25519'un tek bir örneğini çözemez

diyor.

### Hız

Adam Langley kişisel web sitesinde, test edilen eliptik eğriler arasında en hızlı olması için DNSCurve tarafından kullanılan **curve25519**'u gösteren hız testleri yayınladı. <sup>[1](https://www.imperialviolet.org/2010/12/21/eccspeed.html)<sup>

NSA'ya göre, eliptik eğri kriptografisi, anahtar boyutları arttıkça `RSA` ve `Diffie-Hellman` 'a göre geometrik bir oranda çok daha üstün performans sunar.

Kaynak: https://en.wikipedia.org/wiki/DNSCurve
