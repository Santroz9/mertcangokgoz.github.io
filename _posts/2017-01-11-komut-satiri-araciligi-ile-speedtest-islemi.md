---
layout: post
title: Komut Satırı Aracılığı İle Speedtest İşlemi
date: 2017-01-11
type: post
categories: linux
description: SpeedTest web sitesi geçtiğimiz aylarda yasaklanan flash programları ile hız testi yapmanıza imkan sağlıyor. Hal böyle olunca da çalıştıramıyoruz
---

SpeedTest web sitesi geçtiğimiz aylarda yasaklanan flash programları ile hız testi yapmanıza imkan sağlıyor. Hal böyle olunca da çalıştıramıyoruz. Türkiye şartlarında da sağlam bu hizmeti veren bir yer olmadığı için bende dedim bunun komut satırı versiyonunu niye kullanmayayım bunun için aşağıdaki şu yolu izledim ve ben bu makaleyi yayınlayana kadarda hız testi yapmıyordum sırf sitede flash istiyor diye

Şimdi uygulamayı sisteme dahil ediyoruz.

```
pip install speedtest-cli
```

Kurulum tamamlandıktan sonra şu şekilde çalıştırabilirsiniz.

```
speedtest-cli
```

Şu şekilde bir çıktımız oluyor.

```
mertcan@0x2e88ce4:~/Desktop$ speedtest-cli
Retrieving speedtest.net configuration...
Testing from Turksat Kablo (46.197.xxx.xxx)...
Retrieving speedtest.net server list...
Selecting best server based on ping...
Hosted by Turksat Uydu Haberlesme Kablo TV ve Isletme A.S. (Ankara) [03.41 km]: 19.765 ms
Testing download speed................................................................................
Download: 23.84 Mbit/s
Testing upload speed....................................................................................................
Upload: 2.12 Mbit/s
```
