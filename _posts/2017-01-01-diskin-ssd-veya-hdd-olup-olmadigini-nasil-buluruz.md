---
layout: post
title: Diskin SSD veya HDD olup olmadığını nasıl buluruz
date: 2017-01-01
type: post
categories: linux
description: Disk IO belirli programlar için darboğaz yaratabiliyor. Bu tür programlarla uzaktaki sunucularda çalıştığımda, genelde böyle bir sıkıntı
---

Disk IO belirli programlar için darboğaz yaratabiliyor. Bu tür programlarla uzaktaki sunucularda çalıştığımda, genelde böyle bir sıkıntı karşıma çıkmasın diye HDD yerine SSD'leri daha çok tercih ediyorum.  Ben df komutunu kullanarak mevcut bölümleri ve dosya sistemlerini görebiliyorum bunda bir sorun yok ama hangi diskin HDD hangisinin SSD olduğunu göremiyorum.

Peki buz bunu nasıl anlayacağız ?

Muhtemelen `/dev/sda3` olarak listelenen bir bölüm diskin `/dev/sda` olduğunu biliyorsunuzdur. Yani, sayısal ekin bölümden kaldırılmasıyla diski elde edersiniz.

Şimdi bunun sonucunda aşağıdaki komutu verelim

```
cat /sys/block/sda/queue/rotational
```

Bu komutun çıktısı eğer aşağıdaki gibi olur ise;

* HDD ise yani dönen bir disk kullanıyorsanız haliyle `rotational` 1 olacaktır.
* SSD ise diskin içerisinde dönen herhangi bir şey olmadığı için `rotational` 0 olacaktır.
