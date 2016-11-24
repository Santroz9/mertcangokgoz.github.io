---
layout: post
title: Carrier-Grade NAT Nedir ?
date: 2016-11-24
type: post
categories: genel
description: Büyük ölçekli NAT (LSN) olarak da bilinen Carrier-grade NAT (CGN), son sitelerin, özellikle konut ağlarının, genel ağa IPv4 adreslerine çevrilen
---

Büyük ölçekli NAT (LSN) olarak da bilinen Carrier-grade NAT (CGN), son sitelerin, özellikle konut ağlarının, genel ağa IPv4 adreslerine çevrilen özel ağ adresleriyle yapılandırıldığı, **IPv4** ağ tasarımına ait bir yaklaşımdır.

**Middlebox**(Trafiği, paket iletme dışında başka amaçlarla dönüştüren, denetleyen, filtreleyen ya da başka türlü yöneten bir ağ cihazı) ağ adres çeviricisi cihazlarını ağ operatörünün ağına gömülür ve pek çok son site arasında ortak adreslerin küçük havuzlarının paylaşılmasına izin verir. Bu, NAT işlevini ve yapılandırmasını müşteriden İnternet servis sağlayıcı ağına kaydırır.

![cgn ipv4 gorsel](/assets/CGN-IPv4.jpg)

**Carrier-grade NAT**, IPv4 adres tükenmesinin hafifletilmesi için bir yaklaşım olarak önerildi.

**Carrier-grade NAT**'ın eleştirmenleri aşağıdaki hususları savunuyor;

* NAT'ın herhangi bir biçimi gibi, uçtan-uca ilkesine son verir
* Durumlu olmasından ötürü, ölçeklenebilirlik ve önemli güvenilirlik sorunları vardır
* Adreslerin tercümesi kaydedilmezse, kolluk kuvvetleri işlemleri için kayıt tutma işlemini daha zor hale getirir.
* Hizmetleri barındırmanın imkansız olmasını sağlar.
* Web barındırma gibi genel bir IP adresi gerektiğinde IPv4 adres tükenme sorununu çözmez.

CGN'nin bir kullanım senaryosu **NAT444** olarak tanımlanabilir, çünkü bazı müşterilerin kamu sunucularına olan bağlantıları üç farklı **IPv4** adresleme alanından geçecektir; müşterinin kendi özel ağı, operatörün özel ağı ve kamusal İnternet ortamı

Bir başka CGN senaryosu, taşıyıcının ağının IPv6 kullandığı ve bu nedenle yalnızca iki IPv4 adresleme alanına ihtiyaç duyulan Dual-Stack Lite'dır.

## Paylaşılan adres alanı

Bir **ISS**(İnternet Servis Sağlayıcısı), bir CGN dağıttığında ve müşterilerini numaralandırmak için RFC 1918 adres alanını kullanıyorsa, müşteride bulunan donanım zaten RFC 1918 alanını kullanmanın durmasına neden olur. Bunun nedeni, aynı adreslerin hem ağ ara birimlerin içinde hem de dışında kullanılması durumunda yönlendirme ve NAT'ın çalışmamasıdır.

Bu, bazı İSS'lerin CGN'ler için yeni özel adres alanı tahsis etmek için **ARIN** içinde politika geliştirmelerini sağlamıştır, ancak ARIN, konunun tipik bir tahsis olmadığı, teknik amaçlı bir rezervasyon olduğunu (RFC 2860'a göre) gösteren politikayı uygulamadan önce IETF(Internet Mühendisliği Görev Gücü)'yi ertelemiştir.

IETF, ISP CGN dağıtımlarında hem gelen hem de giden ara yüzlerde aynı adresleri işleyebilen NAT aygıtlarında kullanılmak üzere **Paylaşılan Adres Alanını** ayrıntılandıran RFC 6598'i oluşturdu. ARIN, bu tahsisat için ihtiyaç duyduğu şekilde IANA'ya yer değiştirdi.

Ayrılan ve kullanılan adres bloğu 100.64.0.0/10' oldu. Böylelikle özel ip adreslerini dışarıya açmış oldular.

## Sorunlar

* Bir IPv4 adresinin herkese açık olup olmadığını anlamaya çalışan aygıtlar veya yazılımlar, yeni alanı tanımak için güncellenmelidir aksi taktirde açık veya kapalı olduğunu anlayamazlar.
* NAT aygıtları için daha fazla özel IPv4 adres alanı atamak, IPv6'ya geçiş sürecini uzatabilir.

### Dezavantajları

Carrier-grade NAT, genellikle ISS müşterilerinin port yönlendirme özelliğini kullanmasını engeller, çünkü ağ adresi çevirisi (NAT) genellikle ağdaki NAT aygıtlarının bağlantı noktalarını harici ara birimdeki diğer bağlantı noktalarına eşleyerek gerçekleştirilir.

Bu, yönlendiricinin yanıtları doğru cihaza eşleyeceği şekilde yapılır; Carrier-grade NAT ağlarında, tüketici tarafındaki yönlendirici port yönlendirmesi için yapılandırılmış olmasına rağmen, CGN'yi çalıştıran ISS'nin "ana yönlendiricisi", bu bağlantı noktasını iletmeyi engeller çünkü gerçek port müşterinin ayarladığı port değildir. Eski dezavantajın üstesinden gelmek için, Port Kontrol Protokolü (PCP) RFC 6887'de standartlaştırılmıştır.

Buna ek olarak, nadir bulunan durumlarda IP adreslerine dayanan bir yasak söz konusu olabilir;

Örneğin Wikipedia, spam kullanan bir kullanıcıyı temsil eden IP adresini yasaklayarak kullanıcıyı engelleyebilir. Bu kullanıcı operatör sınıfı NAT'ın gerisinde kalırsa, aynı genel IP'yi kullanan spamcı ile paylaşan diğer kullanıcıları yanlışlıkla engeller.

Kaynak: https://en.wikipedia.org/wiki/Carrier-grade_NAT
