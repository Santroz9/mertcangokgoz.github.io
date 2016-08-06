---
layout: post
title: Sunucuda Rescue Mode Kullanımı
date: 2015-12-22 12:54:09.000000000 +02:00
type: post
published: true
status: publish
categories: linux
description: Geçtiğimiz günlerde sistemsel olarak bir sorun yaşadım bunun sonucundada sunucuya hiçbir şekilde bağlanamıyordum.Rescue Mode sağolsun çözüme
---

Geçtiğimiz günlerde sistemsel olarak bir sorun yaşadım bunun sonucundada sunucuya hiçbir şekilde bağlanamıyordum. **Rescue Mode** sağolsun çözüme kavuşmama yardımcı oldu **KVM** den ulaşabilirdim lakin şifreyi girmek oldukça zahmetli olduğu için böyle bir şey yapmak istemedim bende direk olarak kurtarma moduna geçirdim sistemi

bu işlem yaklaşık olarak 3 dakika sürdüğü için uptime da biraz kesinti oldu lakin cloudflare sağolsun kullanıcılarımıza hata sayfası göstermek yerine yansımızı gösterdik.Çıkan sorun ise şu şekildeydi

1. Psad ayarlarından dolayı güvenlik duvarı hardcore moda geçmiş ve portların tamamını engellemişti
2. Ayrıca kök kullanıcı şifresi otomatik olarak sıfırlanmış ve kendiliğinden değişmişti ki bu güvenlik gerekçesi ile otomatik sistem yapmış (yanlış ayarlama kurbanı olduk :( kısacası)

Kullandığınız firmadan firmaya genellikle aşamalar değişse bile temelde tüm firmalar rescue mode de diski söküp başka bir sistemde mount etmeyi amaçlar ki bu özellikle sunucudan veri kurtarma yada hatayı çözmek için baya iyi bir özellik tabi güvenlik konusunda sıkıntı yaşatabilir lakin sorunları çözme konusunda üzerüne yoktur **KVM** den etkilidir.

Öncelikle mail adresinize yeni bir **SSH** şifresi göndermesi gerekiyor kullanılan firmaya göre bu hız değişebiliyor. **Dedicated** sunucuda kullansanız **VPS** de kullansanız rescue mode de illaki diskleri farklı bir sistemde mount edebiliyorsunuz.(Türkiyedeki çoğu firmada bu yok)

Aldığınız yeni şifre ile login olduktan sonra fark edeceğiniz gibi normal komutlar çalışıyor olacak tek sıkıntı diski eklemediğiniz için yapacaklarınızı yapamayacaksınız bunu çözmek için ise sisteme normal sunucunuzda kullandığınız diskin mount edilebilir olması

```
    fdisk -l
```

diyerek diskleri listeleyecektir zaten sistem farklı bi yerde bağlı gözüktüğü içinde tek bir tane disk göreceksiniz.bu diski komut aracılığı ile **mount** ediyoruz.

```
    mount /dev/xda1 /mnt
```

geçici mount klasörümüzü **/mnt** ile belirledik artık diskimiz **mount** edildiğine göre gerekenleri yapalım hızlıca **chroot** gibi güzel bir komutumuz var mount ettiğimiz alan içerisinde işlem yapmamızı sağlayacak

```
    chroot /mnt /bin/bash
```

root olarak bağlandığımıza göre ve diskde işlemleri yapabiliyor olduğumuzu gördüğümüze göre hemen ne yapacağımızı seçiyoruz.Ben Güvenlik duvarını yapılandırıp **SSH** şifresini değiştireceğim bu yüzden şu şekilde bir yol izliyorum.

```
    passwd şifre
```

SSH şifremi değiştirmiş oldum.Sıra geldi güvenlik duvarında ayarlama yapmaya ben sistem olarak ubuntu seçmiştim.Güvenlik duvarı olarakda iptables yanında ufw vardı.Bunuda kapatıp gereken işlemi yapayım dedim

```
    sudo ufw disable
```

iki işlemide yerine getirdiğime göre şimdi sistemden çıkmamız ve diski tekrar gerçek sunucuda **mount** etmemiz gerekiyor aşağıdaki işlemleri uygulayarak bunu yapabilirsiniz.Bazı firmalarda sistemi tekrar eski yerinde mount edebilmek için panel üzerinden **reboot** aşamasını yapmanız gerekiyor.Onun dışında aşağıdaki komutları vermenizde işinize yarayacaktır.

```
    exit
```

komutu ile **chroot** olunun dizinden kullanıcımızı çıkartıyoruz ve normal kurtarma sisteminin bir kullanıcısı oluyoruz.Bu aşamada **mount** ettiğimiz diski unmount etmemiz gerekiyor.

```
    umount /mnt
```

disk başarılı bir şekilde **umount** edildiğine göre artık bu sistemdende kurtulmamız gerekiyor panel üzerinden **reboot** atıp bu aşamayı geçebilirsiniz.Yada direk olarak aşağıdaki komutu vererekde yeniden başlatabilirsiniz böylelikle sistem eski yerinde **boot** edilecek ve sisteminiz sorunsuz bir şekilde açılacak daha sonra siz sisteme bağlanıp yaptığınız hataları düzeltebilir yada yedek alma işlemi yapabilirsiniz.

```
    reboot
```
