---
layout: post
title: HTTP/2 Hakkında Bilgilendirme
date: 2015-03-25 14:06:20.000000000 +02:00
type: post
published: true
status: publish
categories: genel
description: HTTP/1.1 istemcisi 1999 yılında tanıtılan ve günümüze kadar kullanılan bir HTTP istemcisidir.Ancak gelişen teknolojiye ayak uydurması açısından
---

![http2hakkindabilgilendirmegorsel](/assets/http2hakkindabilgilendirmegorsel.jpg)

**HTTP/1.1** istemcisi 1999 yılında tanıtılan ve günümüze kadar kullanılan bir **HTTP** istemcisidir.Ancak gelişen teknolojiye ayak uydurması açısından geçtiğimiz yıllarda HTTP/2 formatı duyurulmuştur.Daha fazla insan web sitelerine giriş yaptığında sayfa yüklenme boyutlarının artması,mobil web sitelerinin artması,nispeden daha yavaş bir web keyfi olmasından bıkan insanlar bu **HTTP/2** formatını geliştirdiler aslına bakarsanız.

## **SPDY ile HTTP / 2 Arasındaki Fark Ne ?**

SPDY **Google** tarafından 2009 yılında duyurulan web gecikme sürelerini azaltmak ve güvenliği arttırmak amacıyla geliştirilmiş bir network protokolüdür.(istek ve yanıt arasındaki zaman aralığının minimuma indirilmesi)

HTTP/2 SPDY nin bir klonudur.Google **SPDY** nin geliştirilmesi aşamasına bir son verip aynı fikirler ile **HTTP/2** üzerinde çalışmalarını yoğunlaştırmıştır.

## **HTTP/2 Amaçları**

- Gecikmeyi Azaltmak
- Toplam TCP bağlantı sayısını azaltmak ve yanıt sürelerini düşürmek
- Daha iyi web güvenliği sağlanması
- HTTP/1.1 istemcileri ve sunucuları ile tam uyumluluğu sağlamak
- HTTP/1.1 tüm platformlarda korumak kullanılabilirliğini arttırmak ve geliştirmek
- Daha hızlı web deneyimi

## **HTTP/2 Özellikleri**

- **Multiplexing:** Tek bir TCP Bağlantısı üzerinden asenkron HTTP istekleri
- **Server Push:** Tek istek için birden fazla yanıt
- **Header Compression:** İçerik ile birlikte HTTP başlıklarının sıkıştırılması işlemi
- **Request prioritization:** Çoklu isteklerin önceliklendirilme işlemi(domain bazlı)
- **Binary Protocol:** HTTP/2 0 ve 1 gibi ikilik bir protokoldür HTTP/1.1 ise bir metinsel protokoldür

## **HTTP/2 Protokolü HTTP/1.1 de bulunan hangi sorunları gideriyor.**

- **HTTP Pipelining** : HTTP/1.1 de TCP bağlantılarını sınırlamak adına bir takım işlemler yapıldığını biliyoruz.Ardışık ve birden çok gelen TCP bağlantılarında sistemin hepsine yanıt vermesi gerekmekte ve buda sistemi kitlemekle kalmayıp sitenin çalışılmaz hale gelmesini sağlamaktadır.Muhasebedeki gibi ilk giren ilk çıkar mantığı ile hareket etmekte aslında muhasebedeki sistemden farklı olsada burada gönderilen cevabın gecikmesi diğer tüm isteklerin gecikmesi demektir.İşte bu uyumsuzluğu HTTP/2 çözemektedir ve ardışık yapılan isteklere asenkron bir şekilde network cevap verebilecek hale gelecektir.
- **Multiple TCP Connections for Same Domain** : HTTP/1.1 birden çok HTTP isteklerini karşılamak için birden çok TCP bağlantısı istemekte. Ama HTTP/2 yapılan istek başına tek TCP bağlantısına izin verir ve tüm HTTP istekleri buradan devam eder.
- **TCP Connection Close Time:** HTTP/1.1 TCP bağlantısı kısa sürede HTTP istekleri bitmiş ise kapatılabilir. Ama HTTP/2&nbsp; de TCP bağlantısı uzun bir süre daha canlı tutulabilir.
- **Header Compression:** HTTP/1.1 üzerinde hiçbir başlık sıkıştırma yöntemi yoktu ama HTTP/2 ye bu özellik getirildi. Böylelikle gecikme süreleri azaltıldı.
