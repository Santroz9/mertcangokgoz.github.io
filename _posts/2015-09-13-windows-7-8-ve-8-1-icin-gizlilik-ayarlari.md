---
layout: post
title: Windows 7, 8 ve 8.1 için Gizlilik Ayarları
date: 2015-09-13 21:23:49.000000000 +03:00
type: post
published: true
status: publish
categories: windows
description: Arkadaşlar bildiğiniz gibi Windows 10 hakkında aynı içerikli bir makale yayınlamıştım.Microsoft boş durmuyor ve diğer sistemlerdede veri madenciliği

---

![prismlogo](/assets/prismlogo.jpg)

Arkadaşlar bildiğiniz gibi [Windows 10 hakkında aynı içerikli bir makale yayınlamıştım](https://mertcangokgoz.com/donotspy10-windows-10-gizlilik-ayarlari/).Microsoft boş durmuyor ve diğer sistemlerdede veri madenciliği adı altında gizliliğinizi tehdit etmeye devam ediyor.Windows 7, 8 ve 8.1 geçtiğimiz haftalarda gelen bir güncelleme ile artık bu sistemlerde bile **windows** tarafından izleneceksiniz ve bilgileriniz **M$** kardeşe gidecek makalemizde işte bu sızıntıları önlemek için sizlere bir kaç ipucu vereceğim.

İlk olarak otomatik güncellemeleri bundan sonra kapatmanız gerekiyor.Ha ben kapatmayacağım diyenler olabilir saygı duymak lazım bundan sonrada yapacağınız şey bahsedeceğim güncelleştirmeleri silmek ve daha sonrasında bu güncellemeleri gizlemek ancak gizlendiği zaman kurulmayacak olması bunun her zaman böyle kalacağı anlamına gelmez bir güncelleştirme ile bununda icabına bakabilirler.

## Silinmesi Gereken güncelleştirmeler

- [KB306870](https://support.microsoft.com/en-us/kb/3068708) - Bu güncelleme varolan cihazların bilgilerini ve metrik bilgilerini M$ kardeşe gönderir.
- [KB3022345](https://support.microsoft.com/en-us/kb/3022345) - Bu güncelleme varolan cihazlar hakkında bilgi verir ve pazarlama çalışmalarına yardım edilebilmesi için özelleştirilmiştir ve bilgileri M$ kardeşe gönderir.
- [KB3075249](https://support.microsoft.com/en-us/kb/3075249) - Bu güncelleme **UAC** kullanan kullanıcıların uyanmasına engel olacak yapılandırmalar içerir ve bilgileri M$ kardeşe gönderir.
- [KB3080149](https://support.microsoft.com/en-us/kb/3080149) - Bu güncellemede mevcut cihazlar üzerindeki bilgileri gönderilmesi konusunda geliştirilmiş en son güncellemedir.geliştirilmiş özellikleri olduğu söylenir.

Yukarıdaki güncelleştirmeleri silmeniz gerekiyor bunu yapabilmek içinde güncelleme geçmişi(Kurulu olan güncelleştirmeleri gösteren yerimiz) denen sekmeye geçmelisiniz arama kısmına yazarak bulabilirsiniz paketleri ve kaldırabilirsiniz daha sonrasında günvelleştirmeleri kontrol ettirip.Bulunan bu güncellemeleri tekrar kurmamasını unut ederek gizlemek.Ayrıca komut yöneticisi ilede paketleri kaldırabilirsiniz.

    wusa /uninstall /kb:3068708 /quiet /norestart
    wusa /uninstall /kb:3022345 /quiet /norestart
    wusa /uninstall /kb:3075249 /quiet /norestart
    wusa /uninstall /kb:3080149 /quiet /norestart

Yukarıdaki parametreleri komut satırına gireceksiniz unutmamanız gereken bir nokta ise bunları silerken yönetici izinlerinin elinizde olması lazım kısacası yönetici olarak komut satırını açın.Tüm bu işlemler bittikten sonra sisteminizi yeniden başlattığınız zaman artık rahat bir nefes alabilirsiniz. **Bir süre M$ kardeş sizi izlemeyecektir.** Bunu devam ettirmek için güncelleştirmeleri kapatsanız iyi olur
