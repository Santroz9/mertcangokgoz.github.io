---
layout: post
title: CloudFlare'de DNSSEC Ayarlama İşlemi
date: 2015-11-13 00:16:57.000000000 +02:00
type: post
categories: Güvenlik
description: DNS sistemindeki güvenlik eksikliklerini tamamlamak amacıyla geliştirilmeye başlanan DNSSEC sayısal verinin imza ile tamamlanmasını sağlayan
---

DNS sistemindeki güvenlik eksikliklerini tamamlamak amacıyla geliştirilmeye başlanan **DNSSEC** sayısal verinin imza ile tamamlanmasını sağlayan bir teknolojidir.DNSSEC sadece isim sunucusunda kullanılan İP adresini doğrulamaya yarar.

Verinin güvenliğini sağlamak için aktif etmenizde fayda var.Aynı zamanda Ortadaki adam(MITM Attack) saldırılarına ve önbellek zehirleme(Arp Spoofing) saldırılarına karşıda koruma sağlamaktadır.Ancak unutulmaması gerekiyor herhangi bir Ddos(Denial-of-service attack) ve veri değişiminde gizliliği garanti etmez phishing saldırılarına karşı **koruma sağlamaz** web site verilerini şifrelemez. **SSL** ile birlikte aktif edildiği taktirde oldukça güvenli bir sistem haline geldiği görülmüştür.

Geçtiğimiz günlerde ise **Cloudflare** bu teknolojiyi sistemlerinde aktif ettiklerini duyurdu.Bizde elimizi çabuk tutup bu teknolojiden faydalanalım peki ne yapmamız gerekiyor ?

Öncelikli olarak **Cloudflare** sitesine üye olmuş olmanız ve hali hazırda kullanıyor olmanız ve NS bilgilerinizin cloudflarenin belirlemiş olduğu adreslerin olması gerekiyor.Bu aşamadan sonrası ise oldukça basit cloudflare her zaman ki gibi bize kullanıcı arayüzü konusundada yardım sağlıyor.Sisteme giriş yaptığınızda yukarıdaki seçeneklerden DNS seçiyorsunuz.

![cloudflarednssecgorsel1](/assets/cloudflarednssecgorsel1.png)

Bu seçenek altında siteniz ile ilgili capsulleme yaptığınız **DNS** bilgileri bulunuyor bu alan altında en alta geliyorsunuz.DNSSEC diye bir yer geldiğini göreceksiniz.Buradan Setup DNSSEC diyorsunuz ve kuruluma geçiyorsunuz sistem otomatik olduğu için sizin yerinize Key bilgilerinizi oluşturuyor.Burada size birkaç bilgi gerekiyor Domain kayıt ettiğiniz yerinde **DNSSEC** desteklemesi gerekiyor **namecheap** gibi bir yerden aldıysanız eğer böyle bir imkanınız olmayacak o yüzden baştan kayıp ediyorsunuz.

![cloudflarednssecgorsel3](/assets/cloudflarednssecgorsel3.png)

Yukarıdaki bilgileri ben domain adresimi kayıt ettiğim firmanın sitesine giderek ekleme yapıyorum.Her zaman ki gibi name.com dan aldığım için **DNSSEC** desteğimizin olduğunu nameserver panelinde görüyoruz. **"Edit Nameserver"** bölümüne giriş yapıyorsunuz en aşağıda şu şekilde bir bölüm göreceksiniz.Diğer domain sağlayıcılarında yapılacak [adımlar için Tıklayınız](https://support.cloudflare.com/hc/en-us/articles/209114378)

![cloudflarednssecgorsel4name](/assets/cloudflarednssecgorsel4name.png)

**DNSSEC** yönetim sayfasına geçiş yapıyoruz buraya cloudflarenin bize vermiş olduğu DS kayıtlarını tanımlamamız gerekiyor.Bu işlemleri yanlış yaparsanız domain adresinize erişemezsiniz tekrar doğru kayıtları girdiğinizde erişim tekrar geleceğini unutmayınız.Burada dikkat etmeniz gereken nokta Digest Type kısmını cloudflare şifreleme algoritmasını yazarak vermiş bu algoritma name.com sistemlerinde 2 numaraya denk geliyor. İki olarak düzenlediğinizde hata almayacaksnız aksi taktirde **"syntax error"** şeklinde hatalar alabiliriniz.

![cloudflarednssecgorselson](/assets/cloudflarednssecgorselson.png)

Kayıtlarımızı doğru bir şekilde girdikten sonra **DNSSEC** artık aktif hale geldi bundan sonra veri bütünlüğünüz sağlanmış olacak ama unutmayın SSL ile birleştirdiğinizde daha güvenli bir platform elde edeceksiniz.

![cloudflarednssecgorsel2](/assets/cloudflarednssecgorsel2.png)

İşlem tamamlandıktan sonra DNSSEC sisteminin aktif olup olmadığını kontrol etmek için aşağıdaki sitelerden bir tanesini kullanabilirsiniz.

- [verisignlabs](http://dnssec-debugger.verisignlabs.com/mertcangokgoz.com)
- [dnsviz.net](http://dnsviz.net/d/mertcangokgoz.com/dnssec/)

Aktif olduktan sonraki DNSSEC Diagramı ise şu şekilde görüyoruz.

![dnssecdiagram](/assets/dnssecdiagram.png)
