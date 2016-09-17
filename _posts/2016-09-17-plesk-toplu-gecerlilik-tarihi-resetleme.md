---
layout: post
title: Plesk - Toplu Abonelik Geçerlilik Tarihi Sıfırlama
date: 2016-09-17
type: post
categories: linux
description: Plesk paneldeki aboneliklerin geçerlilik tarihlerini uzatmak için aşağıdaki komutu kullanabilirsiniz.
---

Plesk aboneliklerin geçerlilik tarihlerini uzatmak için aşağıdaki komutu kullanabilirsiniz. Kullanmış olduğunuz abonelikler sırasıyla yeniden başlatılacak ve kullanmaya devam edebileceksiniz.


```bash
#!/bin/bash

for LIST in `/usr/local/psa/bin/subscription --list`;
 do /usr/local/psa/bin/subscription_settings --update $LIST -expiration -1;
done;
echo "Reset Subscription Expire Date Complete..."
```
