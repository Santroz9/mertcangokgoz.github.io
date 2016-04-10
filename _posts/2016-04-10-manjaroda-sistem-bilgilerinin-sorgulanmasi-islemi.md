---
layout: post
title: Manjaro'da Sistem Bilgilerini Sorgulama İşlemi
date: 2016-04-10
type: post
categories: Linux
description: Ben her ne kadar manjaro desemde aslında arch linux tabanlı tüm sistemlerde
---

Ben her ne kadar manjaro desemde aslında arch linux tabanlı tüm sistemlerde aşağıdaki yöntemler aracılığı ile sistem bilgilerinizi sorgulayabilirsiniz.Ulan bunu bilmeyen varmıdır demeyin olabilir her ne kadar kendimi biliyor olarak saysamda aslında bilmediğimide dün fark ettim.

Temel sistem bilgileri

```
inxi -Fxz
```

Örnek bir çıktı

```
System:    Host: mertcan Kernel: 4.4.6-1-MANJARO x86_64 (64 bit gcc: 5.3.0) Desktop: Xfce 4.12.3 (Gtk 2.24.28)
           Distro: ManjaroLinux 15.12 Capella
Machine:   System: TOSHIBA (portable) product: SATELLITE P50-B-11P v: PSPNUE-02L00PTE
           Mobo: TOSHIBA model: VG20SQ Bios: TOSHIBA v: 1.50 date: 12/09/2014
CPU:       Quad core Intel Core i7-4720HQ (-HT-MCP-) cache: 6144 KB
           flags: (lm nx sse sse2 sse3 sse4_1 sse4_2 ssse3 vmx) bmips: 20762
           clock speeds: max: 3600 MHz 1: 2600 MHz 2: 2599 MHz 3: 2600 MHz 4: 2600 MHz 5: 2600 MHz 6: 2600 MHz
           7: 2600 MHz 8: 2600 MHz
Graphics:  Card-1: Intel 4th Gen Core Processor Integrated Graphics Controller bus-ID: 00:02.0
           Card-2: Advanced Micro Devices [AMD/ATI] Venus PRO [Radeon HD 8850M / R9 M265X] bus-ID: 01:00.0
           Display Server: X.Org 1.17.4 driver: intel Resolution: 1920x1080@60.02hz
           GLX Renderer: Mesa DRI Intel Haswell Mobile GLX Version: 3.0 Mesa 11.1.2 Direct Rendering: Yes
Audio:     Card-1 Intel 8 Series/C220 Series High Definition Audio Controller
           driver: snd_hda_intel bus-ID: 00:1b.0
           Card-2 Intel Xeon E3-1200 v3/4th Gen Core Processor HD Audio Controller
           driver: snd_hda_intel bus-ID: 00:03.0
           Sound: Advanced Linux Sound Architecture v: k4.4.6-1-MANJARO
Network:   Card-1: Intel Wireless 3160 driver: iwlwifi bus-ID: 03:00.0
           IF: wlp3s0 state: down mac: <filter>
           Card-2: Realtek RTL8111/8168/8411 PCI Express Gigabit Ethernet Controller
           driver: r8168 v: 8.040.00-NAPI port: d000 bus-ID: 04:00.0
           IF: enp4s0 state: up speed: 100 Mbps duplex: full mac: <filter>
Drives:    HDD Total Size: 240.1GB (22.1% used) ID-1: /dev/sda model: SanDisk_SDSSDHII size: 240.1GB
Partition: ID-1: swap-1 size: 18.41GB used: 0.00GB (0%) fs: swap dev: /dev/sda2
Sensors:   System Temperatures: cpu: 52.0C mobo: N/A gpu: N/A
           Fan Speeds (in rpm): cpu: N/A
Info:      Processes: 225 Uptime: 1:27 Memory: 2039.5/15963.4MB Init: systemd Gcc sys: 5.3.0
           Client: Shell (bash 4.3.421) inxi: 2.2.36
```

Kurulu Grafik Sürücülerinin listelenmesi

```
mhwd -li
```

Örnek bir çıktı

```
--------------------------------------------------------------------------------
                  NAME               VERSION          FREEDRIVER           TYPE
--------------------------------------------------------------------------------
         network-r8168            2013.12.07                true            PCI
video-hybrid-intel-ati-bumblebee            2016.01.28                true            PCI
```

Kurulu kernellerin listelenmesi

```
mhwd-kernel -li
```

Örnek bir çıktı

```
Currently running: 4.4.6-1-MANJARO (linux44)
The following kernels are installed in your system:
   * linux41
   * linux44
```

öptüm bye <3
