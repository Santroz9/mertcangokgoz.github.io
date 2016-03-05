---
layout: post
title: Linux Sistemlerde Memory Cache Temizliği
date: 2015-06-16 16:54:40.000000000 +03:00
type: post
published: true
status: publish
categories: Linux
description: Ram üzerinde biriken önbellek aslında çok faydalı yani bu elmanın vitaminin kabuğunda olması gibi birşey ancak kimi durumlarda temizlememiz
---

Ram üzerinde biriken önbellek aslında çok faydalı yani bu elmanın vitaminin kabuğunda olması gibi birşey ancak kimi durumlarda temizlememiz gerekiyor.Yüksek Ram kullanımı gözlemlenen sunucu ve sistemlerde kullanılması önerilir.Ancak bu yol ile birden CPU artışı olacağı için pek hoş olmaz yaparken bir daha düşünün

## Yüksek ram kullanımına neler neden olur ?

- Optimize edilmeyen sistem
- Optimize edilmeyen uygulamalar
- Hazır ayarların kullanılması
- gereksiz paketlerin silinmemesi

gibi pek çok neden rami şişirmeye yetecektir.Böyle bir durumla karşılaştığınızda kısa süreli bir çözüm olarak cachenin silinmesi işimizi görecektir bunun için aşağıdaki adımları uygulamanız yeterlidir.

Öncelikle bir dosya oluşturuyoruz.

    cd /usr/local/bin/
    nano ramcleaner.sh

Bu dosya içerisine aşağıdaki komutu ekleyiniz.

    #!/bin/sh
    sync; echo 3 > /proc/sys/vm/drop_caches

şimdi ramimizi temizledik ancak bunu otomatiğe alıp crontab ile istediğimiz vakitte sildirelim bunun için yapacağımız şey

    nano /etc/crontab

hemen ardından alt satıra ekleyip her daim sildirelim

    0 * * * * root /usr/local/bin/ramcleaner.sh

şimdi geçerli olması için servisi yeniden başlatalım

    service crond restart

Bundan sonra artık şişen ram sorunu çıkmayacak sisteminizde sonrasında ise sorunu çözmek için çözüm arayışına geçebilirsiniz bu yöntem sizi birazcık idare edecektir.
