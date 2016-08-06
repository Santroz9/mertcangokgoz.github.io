---
layout: post
title: Wordpress İçin Push Notification Özelliği
date: 2016-01-30 18:57:41.000000000 +02:00
type: post
categories: genel
description: Chrome üzerinde hali hazırda bulunan Push Notification özelliğini geçtiğimiz günlerde Firefox bir güncelleme ile betadan çıkartarak getirmişti
---

**Chrome** üzerinde hali hazırda bulunan **Push Notification** özelliğini geçtiğimiz günlerde **Firefox** bir güncelleme ile betadan çıkartarak getirmişti bende bunu fırsat bilerek sitem üzerinde isteyen kullanıcılara istedikleri zaman abone olabilecekler aynı zamanda yayınlanan yazılardan haberdar olacaklar bunun için ise Push notification servisi gerekiyor bize ben **Cloud** olarak hizmet veren ve Facebook'un hizmeti olan [parse'nin](https://parse.com/) kapanmasının ardından [OneSignal](https://onesignal.com/) adlı firmayı tercih ettim.

**OneSignal** tamamen ücretsiz olarak kullanıcıların otomatik olarak push notification gönderebilmeleri'ne imkan tanıyor.Üstelik bu bildirimler **İOS** ve **Android** cihazlarda da oldukça etkili ve anlık bildirim imkanı sağlıyor.

![onesignalucretgorsel1](/assets/onesignalucretgorsel1.png)

Belirli bir kullanıcı kayıt olduktan sonra size Enterprise geçmenizi isteyecek ancak support kısmından ulaşırsanız.Ve kişisel olarak kullandığınızı kanıtlarsanız herhangi bir ücret ödemeyeceksiniz.Bunun dışında sistemi kullanabilmeniz için tek yapmanız gereken siteye üye olmak bu işlemi yaparkende **Github** hesabınızı kullanmanızı öneririm.

![onesignallogingorsel2](/assets/onesignallogingorsel2.png)

Üyelik aşamasını geçtiğinizde sistemden **Push Notification** için bir uygulama yaratmamız gerekiyor. **"Add a new app"** dedikten sonra uygulama ismini vermeniz için size bir alan açılacak istediğiniz bir ismi verebilirsiniz.

![onesignalgorsel3](/assets/onesignalgorsel3.png)

Bu aşamadan sonra uygulama seçtirmesi gerekiyor ise **Google** ve **Firefox** simgelerini göreceksiniz tıklayıp devam ediyorsunuz ve ayarlamalar için bir sayfa daha çıkıyor.Buraya gereken ayarlamaları yapıyorsunuz.

![onesignalayargorsel4](/assets/onesignalayargorsel4.jpg)

**Google Server API Key** Almak için ise [Google Geliştirici konsolu](https://console.developers.google.com/project)'na gitmeyi ve [OneSignal'ın](https://documentation.onesignal.com/docs/website-generating-a-gcm-push-notification) size gösterdiği ayarları yapmayı unutmayın.Ardından ikinci aşamada hangi platform için ne şekilde yapılacağının seçilmesi gerekiyor ben wordpress için yaptığımdan dolayı " **Wordpress"** seçerek devam ediyorum.

![onesignalgorsel5](/assets/onesignalgorsel5.png)

**Wordpress** seçip **next** dedikten sonra dokümantasyon sayfasından bir link verecek bize bu link ile **Wordpress** üzerinde gerekli olan eklentisini indireceğiz. Eklentimiz [OneSignal - Free Web Push Notifications](https://wordpress.org/plugins/onesignal-free-web-push-notifications/) sitenizin sistemine indirip aktif edin.

Daha sonra ise ayarlarını yapmamız gerek her şey yolunda giderse bildirimler çıkacak ve kullanıcılarınız'a abonelik hizmeti sunabileceksiniz böylelikle kullanıcılarınız yeniliklerden haberdar olmuş olacak

![onesignalwordpressgorsel6](/assets/onesignalwordpressgorsel6-1-e1454166111745.png)


Wordpress ayarlamaları da şu şekilde **OneSignalin** size verdiklerini sıralı bir biçimde girdiğinizde işleminiz tamamlanıyor olacak Ayrıca bu bildirim olayını yapabilmeniz içinde sitenizin **HTTPS** olması gerekiyor.Eğer SSL/TLS yani **HTTPS** kullanmıyorsanız.Direk olarak bildirim çıkmayacak bu sistemden faydalanabilmeniz için sitenizin mutlaka **SSL** sertifikasının olması gerekmekte

Eğer ki Sitenizde **HTTPS** desteği bulunmuyor ise kullanıcılara tam ekran olarak izin gösterilecek kullanıcılar için hoş olmasada yapabileceğiniz birşey bulunmuyor tek çareniz SSL sertifikası edinmek olacak
