---
layout: post
title: Ddos Saldırılarındaki Doğru Bilinen Yanlışlar
date: 2015-05-12 12:24:37.000000000 +03:00
type: post
published: true
status: publish
categories: guvenlik
description: DDos(Distributed Denial-Of-Service) sistemleri etkisiz hale getirmek için uzun yıllardan beri kullanılan bir teknik olarak karşımıza çıkmaktadır
---
DDos(Distributed Denial-Of-Service) sistemleri etkisiz hale getirmek için uzun yıllardan beri kullanılan bir teknik olarak karşımıza çıkmaktadır ve son zamanlarda saldırı türleri oldukça gelişmiştir.Saldırıların çoğu Application Layer katmanına yapılırken aynı zamanda geliştirilen yeni teknikler ile saldırılar direk olarak **Network ve Transport** katmanlarınada yapılabilmektedir.Bu saldırılardan kurtulmak öncelikle o kadar kolay değil bu konuda profesyonel bir firma ile çalışmıyorsanız saldırı olduğunda yapacak pek birşeyiniz yok o yüzden firmanızı iyi seçmeniz gerekiyor.

Yeni Yeni Popüler olan

- NTP
- SSDP
- NTP-AMP
- SNMP
- uQuake
- VSE
- Chargen
- OVH Exploit
- Dominate
- HTTP Attack

Ve devamı şeklinde sıralayabilmemiz mümkün yazılımsal olarak hiçbirine çözüm yok ancak donanımsal olarak çözüm bulabilirsiniz yada servislerden faydalanabilirsiniz.Eskiden baya bi efor sarfetmek gerekiyordu ancak saldırı **protokol** bazına inince zahmetsizce yüksek boyutlarda saldırılar yapılabiliyordu.Özellikle Spoofed işi için kiralanan sunucularında işe girmesi ise saldırı 520 Gbit kadar çıkartılabiliyordu örnekleri mevcut ve bu saldırı boyutu hiçde küçümsenecek bir boyut değil.

Türkiye şartlarında yurtdışından saldırı almıyorsanız yurt içinde saldırı maximum 120Gbite kadar çıkmakta ki bu türkiye pazarında oldukça yüksek bir rakam **TTnet Ddos** koruması var ancak piyasaya sorunlu olarak girdi kullanmak isteyen arkadaşlar firmaları ile iletişime geçerek kullanabilirler ücretleri oldukça yüksek

Bunun yanında türkiyede bilinen yanlışlardan ilkine geçmek istiyorum.Bir site sahibi saldırıyı fark ediyor ve birşeyler yapmak istiyor webmaster forumlarına konu açıyor yada firmasını arıyor.Firma ilk başlarda araya firewall alıyor saldırının yüzde bilmem kaçını bu şekilde engelliyor.Sonra saldırgan bakıyorki aa bunlar birşeyler yapmış teknik değiştiriyor hemen sonra bir bakıyoruz site uçmuş.

![ddosgorsel1](/assets/ddosgorsel1-e1431380314760.jpg)

Daha sonra bu arkadaşa bir tavsiye veriliyor **CloudFlare** firmasına geç saldırılardan kurtulursun diye.Öncelikle şunu belirtmekde yarar var **CloudFlare** Ddos Protection firması değil CloudFlare bir **CDN** yani içerik dağıtma servisidir.Business sürümü hariç hiçbirinde Saldırı koruması yoktur. **CloudFlare** Business paketi içinde ise Layer 3/4 koruma türleri bulunmaktadır.CloudFlare Free ve Pro paketlerinde ise Sadece **Layer 7** den gelen saldırılar için koruma vardır.Büyük boyutlu bir saldırı geldiği anda siteniz yerlebir olacaktır ve ulaşılamayacaktır.Zaten saldırı sonrasında CloudFlare size bir mail atacak ve paketinizi yükseltmenizi isteyecek sizde işi bilmiyorsanız 250 dolara varan fiyatlarda koruma sahibi olacaksınız ki bu çok yüksek bir mebla

Bir başka bilinen yanlış ise sitenin proxylere girişinin kapatılmasıdır bu gerçekten çok ciddi bir sorun yaratır sitenizde internetin yarısı proxy ve **VPN** ağlarından oluşmaktadır.Ayrıca saldırıyı kesme gibi bir olasılığıda yoktur proxy saldırıları artık tercih edilen bir yöntem değildir.

Eğer saldırı alıyorsanız direk olarak yapacağınız iş saldırının yurt içinden mi yoksa yurt dışındanmı geliyor olduğunu tespit etmek eğer saldırı yurtdışından yoğun bir şekilde geliyor ise 1 saatlik olmak üzere yurtdışından girişleri kapatmanız sitenizi rahatlatacaktır.Ancak **Google** konusunda sıkıntı yaşayacaksınız bağlanamadığı için indexlenmeyecek yada bağlantılarda 404 hatası alacaklardır.Yandex için böyle bir sıkıntı bulunmamaktadır.

Bunlarla beraber artık saldırılar ciddi oranlarda olabilir herşeye hazırlıklı olun ayrıca saldırı almamaya bakın kimseye bulaşmayın tavuğuna kış demeyin sonra başınız çok ağrır.
