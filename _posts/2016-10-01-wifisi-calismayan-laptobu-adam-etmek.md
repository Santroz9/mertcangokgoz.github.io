---
layout: post
title: Wifisi Çalışmayan Laptobu Adam Etmek
date: 2016-10-01
type: post
categories: linux
description: Her zaman ki gibi uyandım direk bilgisayarımın başına geçtim sistemi çalıştırdım ve başladım beklemeye ben normalde ethernet üzerinden internete bağlanırım. Kablosuz interneti çok nadir
---

Her zaman ki gibi uyandım direk bilgisayarımın başına geçtim sistemi çalıştırdım ve başladım beklemeye ben normalde ethernet üzerinden internete bağlanırım. Kablosuz interneti çok nadir kullanırım anca dışarda yada kabloyu başka bir iş için kullanacaksam falan onun dışında kullanmam ama bugün nedense wifi ye bir bakasım geldi

Baktığımda wifinin çalışır olduğunu ama kablosuz ağ bulmadığını fark ettim. Bunun 2 nedeni olabilirdi

- ya kablosuzun driver yoktu
- yada crda tarafında regdomain kaydı yoktu

her ikiside önemli olduğu için hemen aşağıdaki kodu çalıştırdım.

```
lspci -nnk | grep -iA2 net
```

Aşağıdaki gibi bir çıktı aldım bu benim kartım kykda da sorun çıkartmıştı, ancak bu sefer hiç kablosuz ağ bulamadığı için o yöntemi yediremezdim

```
03:00.0 Network controller [0280]: Intel Corporation Wireless 3160 [8086:08b3] (rev cb)
	Subsystem: Intel Corporation Dual Band Wireless AC 3160 [8086:8170]
	Kernel driver in use: iwlwifi
--
04:00.0 Ethernet controller [0200]: Realtek Semiconductor Co., Ltd. RTL8111/8168/8411 PCI Express Gigabit Ethernet Controller [10ec:8168] (rev 0c)
	Subsystem: Toshiba America Info Systems RTL8111/8168/8411 PCI Express Gigabit Ethernet Controller [1179:f940]
	Kernel driver in use: r8169
	Kernel modules: r8169
```

Debian üzerinde sürücüleri kurulu bir şekilde böyle bir sorun çıkartıyorsa ki sürücülerü kurulu;

```
root@0x2e88ce4:~# dpkg -l | grep iwlwifi
ii  firmware-iwlwifi                      20160824-1                           all          Binary firmware for Intel Wireless cards
```

yukarıda da bahsettiğim 1 tek sorundan kaynaklanıyor demektir, onunda çözümü oldukça basit. Bende hemen crda yı düzenlemeye geçtim

```
sed -i "s/REGDOMAIN=/REGDOMAIN=TR/" /etc/default/crda
```

Ardından bir güzel aşağıdaki komutu verip tanımlamasını yapmak gerekiyordu

```
iw reg set TR
```

Bu sayede türkiye konumunda olduğumuzu wifi kartına söyledim. Kartda anlayış gösterdi tabi ve kontrol amacıyla şu kodu girdim tekrar `iw reg get` baktığımda TR de olduğumuz anlaşılıyordu aşağıdaki gibi bir çıktı verdi bana

```
country TR: DFS-ETSI
	(2402 - 2482 @ 40), (N/A, 20), (N/A)
	(5170 - 5250 @ 80), (N/A, 20), (N/A)
	(5250 - 5330 @ 80), (N/A, 20), (0 ms), DFS
	(5490 - 5710 @ 160), (N/A, 27), (0 ms), DFS
	(57000 - 66000 @ 2160), (N/A, 40), (N/A)
```

Ancak hala kablosuz ağları göremiyordum çünkü bunların geçerli olması için sistemin **yeniden başlatılması** gerekiyordu. Yeniden başlatma işlemini tamamlayınca artık sorunsuz bir şekilde kablosuz ağları bulduğunu gördüm.

öptüm bye <3
