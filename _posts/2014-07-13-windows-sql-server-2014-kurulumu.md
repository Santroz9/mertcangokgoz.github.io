---
layout: post
title: Windows SQL Server 2014 Kurulumu
date: 2014-07-13 21:35:27.000000000 +03:00
type: post
published: true
status: publish
categories: Programlama
description: SQL server 2014 ün hem yeni çıkması hemde kurulumunun pek net de görmediğimden kurulumunun nasıl olduğunu göstermek istiyorum. Ben SQL
---

**SQL** server 2014 ün hem yeni çıkması hemde kurulumunun pek net de görmediğimden kurulumunun nasıl olduğunu göstermek istiyorum. Ben SQL Server i **C#** da kodlama yaparken kullanacak olmamdan dolayı kurulumunu gerçekleştirdim.Kurulum genel olarak Sistem hızınıza göre değişiklik gösterecektir programcı iseniz sisteminizin özellikle iyi olması gerekmektedir.

Elimde Development Edition vardı lisanslı olarak bende bunu sistemime kurmaya geçtim sırasıyla anlatacağım öncelikle sistemimizde **firewall** varsa kurulum sırasında kapatın kapatmazsanız sorun çıkmaz ancak dışarıdan ulaşacaksınız ulaşamazsınız bunu da bilesiniz.

1-Açtığımızda sol tarafta " **installation**" a tıklıyoruz gelen seçeneklerden en üst de yazan " **New SQL Server stand-alone ..."** tıklıyoruz ve biraz bekliyoruz kurulum otomatik olarak başlayacak zaten

![SQLServer2014KurulumGorsel1](/assets/SQLServer2014KurulumGorsel1-e1405274892394-765x576.png)

2-Lisans giriş kısmına geliyoruz varsa girin yoksa üst seçenekten İstediğinizi seçebilirsiniz...

![SQLServer2014KurulumGorsel2](/assets/SQLServer2014KurulumGorsel2-e1405274935886-773x576.png)

3-Güncellemelerin denetlenip onlarla bir kurulsun mu diye burada soracak internet hızınız iyiyse seçeneği seçmenizde fayda var.

![SQLServer2014KurulumGorsel3](/assets/SQLServer2014KurulumGorsel3-e1405274995810-772x576.png)

4-Sisteminizin teknik özelliklerini denetlemesini bir süre bekleyeceksiniz uyumlu mu değil mi bi kontrol etsin

![SQLServer2014KurulumGorsel4](/assets/SQLServer2014KurulumGorsel4-e1405275050730-769x576.png)

5-Tarama Sonucu sadece güvenlik duvarını warning olarak gösteriyor dediğim gibi dışarıdan ulaşacaksınız kapatıp kuruluma öyle devam edin eğer local de sadece kullanacaksanız gerek yok şuan için sistem içerisinde engelleme yaparsa kapatabilirsiniz.

![SQLServer2014KurulumGorsel5](/assets/SQLServer2014KurulumGorsel5-e1405275140109-770x576.png)

6-Kuralların ve programın yüklemesinin nasıl yapılması gerektiğini buradan seçebilirsiniz.

![SQLServer2014KurulumGorsel6](/assets/SQLServer2014KurulumGorsel6-e1405275182495-768x576.png)

7-Burada hepsinin seçili olmasına dikkat edin değilse select all deyip hepsini seçiyorsunuz.

![SQLServer2014KurulumGorsel7](/assets/SQLServer2014KurulumGorsel7-e1405275237264-768x576.png)

8-Burada default olarak bırakıp devam ediyoruz. **Default** olarak yapılacak olan bir kurulum her zaman daha iyidir diye düşünüyorum.

![SQLServer2014KurulumGorsel8](/assets/SQLServer2014KurulumGorsel8-e1405275337403-769x576.png)

9-Kullanıcıların ve sistemdeki **SQL** olaylarının nasıl gerçekleşmesini istiyorsanız ona göre hareket etmeniz gerekmekte ancak önerilen olarak gelen ayarlar bu şekilde

![SQLServer2014KurulumGorsel9](/assets/SQLServer2014KurulumGorsel9-e1405275433898-772x576.png)

10-Kullanıcı tanımlaması yapıyoruz ben kodlamalarda kullanacağım için kurulumu default olarak gerçekleştirdim ve kullanıcı adı da sistem mod da windows olarak ayarlı **"add current user"** ile sisteminizdeki kullanıcıyı seçebilirsiniz.

![SQLServer2014KurulumGorsel10](/assets/SQLServer2014KurulumGorsel10-e1405275511209-771x576.png)

11-Analiz servisleri içinde bi kullanıcı tanımlamamız gerekiyor bunun içinde sistemdeki kullanıcı tercih ettim **"add current user"** seçeneği ile

![SQLServer2014KurulumGorsel11](/assets/SQLServer2014KurulumGorsel11-e1405275670739-764x576.png)

12-Burada raporların yapılmasını vs seçeceksiniz.nasıl ve ne şekilde kim tarafından yapılsın nasıl raporlar tutulsun vs install only seçiyorsunuz ikisini de

![SQLServer2014KurulumGorsel12](/assets/SQLServer2014KurulumGorsel12-e1405275765134-765x576.png)

13-Deneletleyicilerimize de kullanıcı atamayı unutmuyoruz bunun içinde gene **add current user** seçeneğini seçmemiz yeterli olacak

![SQLServer2014KurulumGorsel13](/assets/SQLServer2014KurulumGorsel13-e1405275950240-766x576.png)

14-Bunlara bir isim ve yol belirlememiz gerekiyor istediğiniz yeri seçebilirsiniz ve aynı şekilde istediğiniz ismi verebilirsiniz.

![SQLServer2014KurulumGorsel14](/assets/SQLServer2014KurulumGorsel14-e1405276077836-768x576.png)

Bundan sonra hiçbir işlemimiz kalmıyor.Sistemi bir kez daha özellikler için tarama gerçekleştiriyor.Sonraki adımda da zaten kurulum başlıyor.Sisteminizin hızına göre 40 ile 1 saat sürebilir SSD varsa dahada hızlı bir kurulum gerçekleştirebilirsiniz.&nbsp;_ **Ayrıca bu anlatımda yapılan kurulum sadece localde proje geliştiren arkadaşlar içindir.Bu ayarlaaamalar ile Web Server yada Game Server için SQL Server Kurulumu gerçekleştirmenizi kesinlikle önermiyorum.** _
