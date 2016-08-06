---
layout: post
title: VMware Workstation 12.0 Linux Kurulumu
date: 2015-10-28 01:53:40.000000000 +03:00
type: post
published: true
status: publish
categories: linux
description: Linux sistemler üzerinde zorunlu olarak kimi zaman windows kullanmamız gerekir.Özellikle C# geliştirilecek bir iş size verildiği zaman oldukça
---

**Linux** sistemler üzerinde zorunlu olarak kimi zaman windows kullanmamız gerekir.Özellikle C# geliştirilecek bir iş size verildiği zaman oldukça zorlanırsınız mono ile yazılan kodlar çalışmaz kimi zaman işte bu gibi durumları çözmek için sanal bir makina üzerine windows kurmak gerekir hal böyle oluncada **VMware** workstation işimize oldukça yarayacaktır.Sistem özellikleriniz iyi olmasada linux bu konuda yanınızda olacak ve mükemmel yapısı sayesinde kasmadan sanal bilgisayarınızda çalışabileceksiniz 4GB ramıniz varsa tamamsınız demektir. 2GB lik bir bölümünü windowsa vermeniz her iki sistem içinde sıkıntısız bir kullanım imkanı demektir.

İlk olarak Linux sistemimize kurmak amacıyla resmi sitesinden gerekli dosyayı indiriyoruz.

    wget https://download3.vmware.com/software/wkst/file/VMware-Workstation-Full-12.0.0-2985596.x86_64.bundle

İnternet hızınıza göre indirme farklılık göstereceğinden ortalama 30 dk da dosyanız elinizde olacaktır.Herhangi bir key gerekmiyor.Aşağıdaki komutu veriyoruz ve kurulum aşamasına geçiyoruz.

    chmod +x VMware-Workstation-Full-12.0.0-2985596.x86_64.bundle
    ./VMware-Workstation-Full-12.0.0-2985596.x86_64.bundle

Kurulum sisteminizin özelliklerine göre değişkenlik gösterecektir kurulum tamamlandıktan sonra istediğiniz işletim sistemini sanal bilgisayarınız üzerine kurabilirsiniz.İşlemleriniz bittikten sonra uygulaması sisteminizden tamamen silmek için ise aşağıdaki komutu vermeniz yeterli olacaktır.

    vmware-installer -u vmware-workstation

Tüm bu işlemleri yaparken kök yetkilendirmenizin olmasına dikkat etmeniz gerekmektedir. **sudo su** komutu ile gerekli olan bu yetkilendirmeyi yapabilirsiniz.
