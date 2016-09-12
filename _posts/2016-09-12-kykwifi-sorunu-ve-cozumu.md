---
layout: post
title: Kykwifi Sorunu
date: 2016-09-12
type: post
categories: genel
description: Bir arkadaşım için KYK ya uğramam gerekti ankarada bir üniversite kazandı ve kendisi gelemediği içinde bir kaç yurt işini benim halletmem gerekiyordu kyk ya gittiğimde
---

Bir arkadaşım için **KYK** ya uğramam gerekti ankarada bir üniversite kazandı ve kendisi gelemediği içinde bir kaç yurt işini benim halletmem gerekiyordu kyk ya gittiğimde bağlanabileceğim bir wifi olduğunuda gördüm işim biraz süreceği için laptobumu açtım ve bağlanmaya çalıştım.

Anladığım kadarıyla sadece KYK da kalanlar sisteme bilgileri ile girebiliyorlardı. Beni otomatik olarak giriş sayfasına yönlendirdiysede haliyle hesabım yoktu bende hemen bir başka arkadaşı arayıp bilgilerini geçici olarak aldım. Sisteme dahil oldum ancak bir sorun vardı kykwifi paneline giriş yapamıyordum DNS hatası veriyordu interfaceleri sıfırlamama rağmen internete çıkamıyordum.

2016 senesinde böyle bir saçmalık görmek beni rahatsız etti açıkçası biraz araştırmalarımdan sonra bu soruna 802.11n modundan kaynaklanabileceğine dair bilgiler gördüm.

Aşağıdakileri uyguladığımda ise sorun çözülmüştür artık kykwifi bağlanabiliyordum.(INTEL olan wifi kartlarında geçerlidir.)

```console
lspci -nnk | grep -iA2 net
```

Komutunu vererek sistemimdeki wireless kartının driverini öğrenmem gerekiyordu ki 802.11n modunu kapatabileyim bana aşağıdaki gibi bir çıktı döndürdü

```console
03:00.0 Network controller [0280]: Intel Corporation Wireless 3160 [8086:08b3] (rev cb)
	Subsystem: Intel Corporation Dual Band Wireless AC 3160 [8086:8170]
	Kernel driver in use: iwlwifi
--
04:00.0 Ethernet controller [0200]: Realtek Semiconductor Co., Ltd. RTL8111/8168/8411 PCI Express Gigabit Ethernet Controller [10ec:8168] (rev 0c)
	Subsystem: Toshiba America Info Systems RTL8111/8168/8411 PCI Express Gigabit Ethernet Controller [1179:f940]
	Kernel driver in use: r8169
	Kernel modules: r8169
```

bu toshibanın driver sıkıntısı olduğunu touchpad den dolayı biliyordum ancak böyle şifre vs isteyen sistemlerde wifinin sıkıntı çıkaracağını hiç düşünmemiştim. Zaten böyle birşeyin olmasıda saçma ancak bağlanmak için geçici olarak 802.11n modunu kapattım.

Driver olarak `iwlwifi` kullanıyormuşum bu güzel bir haber değişikliği yapacağımız yer ise driverin adına göre beliriyor zaten otomatik olarak şöyleki `/etc/modprobe.d/iwlwifi.conf` yolu bizim ayarlarımızı yapacağımız kısım

```console
sudo nano /etc/modprobe.d/iwlwifi.conf
```

diyerek dosyamızı açıyoruz ve içerisine aşağıdaki değerleri giriyoruz.

```console
options iwlwifi 11n_disable=1
options iwlwifi swcrypto=1
```

kayıt edip çıkıyorsunuz ve sistemi yeniden başlatıyorsunuz ardından wifi normal bir şekilde çalışmaya tekrar başlayacak tekrar bağlanmaya çalıştığınızda ise yüksek oranda çalışacak.

Ancak bu ayarları yaptığınız taktirde wifi kartınızda bir sorun olması durumunda ayarları eski haline gelip tekrar yeniden başlatmanız sorununuzu çözecektir. Telaşa kapılmaya gerek yok

Eve geçtiğimde ise bir daha kyk nın wifi sisteminde bir işim olmadığını düşünerek yaptığım tüm değişiklikleri geri alarak normal hale döndürdüm 802.11n tekrar açtım. Bu yaptıklarım bende çözdü yok efendim ben yaptımda sorunum çözülmedi derseniz yapacak birşey yok başka çözümler aramaya başlamanız gerekiyor.

öptüm bye <3
