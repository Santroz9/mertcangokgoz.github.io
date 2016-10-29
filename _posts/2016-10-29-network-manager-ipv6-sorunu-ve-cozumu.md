---
layout: post
title: Network Manager IPv6 Sorunu ve Çözümü
date: 2016-10-29
type: post
categories: linux
description: Geçtiğimiz günlerde her ne hikmet ise ipv6 yı bulamıyorum havarrrr gençler diye feryat eden ve kernel mesajlarında aşağıdaki
---

Geçtiğimiz günlerde her ne hikmet ise ipv6 yı bulamıyorum havarrrr gençler diye feryat eden ve kernel mesajlarında aşağıdaki gibi bir çıktı veren bu ilginç durumun çözümü için uğraşacağız.

Şimdi `dmesg` de çıkan ve oldukça fazla olan çıktıya bir göz atalım

```
IPv6: ADDRCONF(NETDEV_UP): wlp3s0: link is not ready
IPv6: ADDRCONF(NETDEV_UP): wlp3s0: link is not ready
IPv6: ADDRCONF(NETDEV_UP): wlp3s0: link is not ready
IPv6: ADDRCONF(NETDEV_UP): wlp3s0: link is not ready
IPv6: ADDRCONF(NETDEV_UP): wlp3s0: link is not ready
IPv6: ADDRCONF(NETDEV_UP): wlp3s0: link is not ready
IPv6: ADDRCONF(NETDEV_UP): wlp3s0: link is not ready
IPv6: ADDRCONF(NETDEV_UP): wlp3s0: link is not ready
IPv6: ADDRCONF(NETDEV_UP): wlp3s0: link is not ready
IPv6: ADDRCONF(NETDEV_UP): wlp3s0: link is not ready
```

Bunlar sadece bir kaçtı dmesg kayıtlarını oldukça şişiriyor ve üstüne üstlük birde `networkmanager` kardeşi yeniden başlatmaya zorluyorlar yaklaşık 1 saat ile 10 dk da bir internetin kopmasına sebebiyet veriyor

Ben ilk olarak çözümü kernel ipv6 yı kapatarak bulduysam da ki şu şekildedir.

```
GRUB_CMDLINE_LINUX_DEFAULT="quiet"
```

şeklinde olan satıra şunu eklemiştik

```
ipv6.disable=1 
```

ve son hali şu şekildeydi

```
GRUB_CMDLINE_LINUX_DEFAULT="ipv6.disable=1  quiet"
```

Ancak bu tam olarak bir çözüm olamazdı ipv6 kullanmamızda gerekebilirdi gerçi kullanabildiğimiz zaman bu böceğin oluşacağını sanmıyorum ama herneyse

Şimdi gelelim daha güzel bir çözüm yöntemine şimdi sıkıntıyı yaratan bu arkadaş sistem başlangıcında başlayıp kapatılıncaya kadar devam ediyor. `boot` olurken bir servis ile ortaya çıkıyordur illaki bizde buna bir göz atıcaz.

```
systemd-analyze plot > /tmp/plot.svg
```

`.svg` şeklinde grafiğimizi isteyelim. Bunun içerisinde hangi süreç kaç saniye uğraşmış debelenmiş ve aktif olmuş hepsini görebileceğiz

![plotgrafik](/assets/plot.jpg)

grafiğe baktığımızda en çok sıkıntı çıkartanın aşağıdakiler olduğunu görüyoruz.

- networking.service (1.724s)
- systemd-timesyncd.service (1.525s)
- NetworkManager-wait-online.service (9.324s)

Şimdi bu sıkıntıyı yapan `systemd-timesyncd.service` servisi olamazdı geriye kalan iki tanesinden bir tanesiydi

hemen duruma bakmak için şöyle bir yol izledim.

```
systemctl status NetworkManager-wait-online.service
systemctl disable NetworkManager-wait-online.service
systemctl stop NetworkManager-wait-online.service
```

şimdi durumuna baktık pek iç açıcı gözükmedi gözümüze bizde hemen boş durmadık servisi başlangıçtan kaldırıp durdurduk.

Bu sorun aslında şundan kaynaklanıyordu yukarda bahsi geçen `NetworkManager-wait-online.service` devamlı süreçlerin online olmasını bekliyor ve buna göre davranıyor elimizdede IPv6 olmadığı için saçma salak bir şekilde `IPv6: ADDRCONF(NETDEV_UP): wlp3s0: link is not ready` uyarısını çıktı olarak veriyor ve hazır değil diyordu

Network manager de bunu fırsat bilip restart atıyor ve belki gelir umudu ile bir takım davranışlar sergiliyordu.

öptüm bye <3