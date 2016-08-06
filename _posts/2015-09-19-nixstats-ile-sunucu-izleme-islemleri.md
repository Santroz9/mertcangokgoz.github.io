---
layout: post
title: NixStats ile Sunucu İzleme İşlemleri
date: 2015-09-19 13:02:10.000000000 +03:00
type: post
published: true
status: publish
categories: genel
description: Sunucu yada domain bazında izleme işlemi yapmak istiyorsunuz ama pek fazla bilginiz yok ise nixstats sizin işinize oldukça yarayacak monitoring
---

**Sunucu** yada **domain** bazında izleme işlemi yapmak istiyorsunuz ama pek fazla bilginiz yok ise **nixstats** sizin işinize oldukça yarayacak monitoring işlemi için size oldukça güzel 2 tane yöntem sağlıyor bunlardan ilki domain izleme ikincisi ise sunucu kaynak ve işlem izlemesi. **Domain monitoring** ayarlandığı taktirde domaine ulaşılamadığı zaman uptime oranınız ciddi derecede etkilenecektir. **Server monitoring** işlemi ise oldukça etkili çalışan tüm işlemlerden kullanılan sistem kaynağına kadar herşeyi gözlemleyebilirsiniz üstelik kurulumuda oldukça basit bilgi sahibi olmayanlar bile komut sayesinde kurabilecek.Üye olabilmek için [buraya tıklayarak](https://nixstats.com/login) gerekli yönergeleri yerine getiriniz davetiye kodu olarak **BETA** yazmanız yeterlidir.

İlk olarak domain ekleme işlemi yapalım.Domainimiz üzerinden **monitoring** işlemini gerçekleştirelim.Sistemden domain ekleme kısmına geçelim ve " **add a domain**" diyelim.Domain name kısmına eklemek istediğiniz alan adını giriyorsunuz kullandığınız **protokolüde** belirtmeyi unutmayın ben https kullandığım için tanımlamamıda o şekilde gerçekleştirdim.

 ![addadomaingorsel1](/assets/addadomaingorsel1.jpg)

 **Add Domain** dedikten sonra ise sistem otomatik olarak alan adımızı izlemeye alıyor.Günlük, aylık ve haftalık olarakda uptime oranlarını görebilirsiniz.

![adddomaingorsel1](/assets/adddomaingorsel1.jpg)

&nbsp;

detayları görmek istiyorsanız alan adınızın üzerine tıklamanız yeterli burada sizi detaylı bir ekran karşılayacak.Kesinti durumu benchmark testleri vs

![domaindetaygorsel1](/assets/domaindetaygorsel1.jpg)

**Sistemin** nereden izleneceğinizde belirtebilirsiniz sunucunuzun konumuna göre seçmeyi unutmayın.Fransa lokasyon kullandığım için en yakın olan firmayı yani **OVH** seçtim.Şimdi ise sunucuyu izlemek için gerekenleri yapalım.Soldaki menüden **"add a server"** diyoruz.

![sunucuizlemekurulum](/assets/sunucuizlemekurulum.jpg)

yukarıdaki komutu sistemimize giriyoruz.Kurulum yaklaşık 5 dakika sürecek sisteminizde **python** olmasına dikkat edin yoksa üstdeki yöntem ilede kurabilirsiniz.Kurulumdan sonra ise tüm detayları görebilirsiniz örnek olarak sunucumuzdan bir sörünüm.

![sunucudetaylari](/assets/sunucudetaylari.jpg)

Bunların dışında sitenize gelen ziyaretçilere durumu gösterebilirsiniz yamanız gereken sol sekmede yer alan " **Status Page**" sekmesi altında yeni bölüm oluşturmak.

    https://nixstats.com/report/558c876165689e44648b4568
