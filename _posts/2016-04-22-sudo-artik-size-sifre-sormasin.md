---
layout: post
title: Sudo Artık İşlem Yaparken Şifre Sormasın
date: 2016-04-22
type: post
categories: Linux
description: Sudo ile yetkilendirme işlemi yapılan işletim sistemlerinde benim en ucuz olduğum
---

Sudo ile yetkilendirme işlemi yapılan işletim sistemlerinde benim en uyuz olduğum her defasında şifre girmemiz ev kullanıcı iseniz bence bu sudo gereksiz şifre girmek çile oluyor bende dedim ya bu böyle olmaz biz buna bi çözüm bulup şu şifreyi kapatalım sormasın ama ne yapıyorsa yapsın

hemen **sudoers** düzenlemesine geçtim haliyle

```bash
sudo nano /etc/sudoers
```

aşağılara doğru indirğinizde bi root göreceksiniz onun hemen altındaki bir kaç satır zaten boş olacak şimdi bizim benim kullanıcı adım mertcan haliyle benim bu kullanıda şifreyi etkisiz hale getirmem lazım onuda şu şekilde bir ekleme ile çözeceğiz

```bash
mertcan ALL=NOPASSWD: ALL
```

kayıt edip çıkıyoruz bundan sonraki diğer tüm işlemlerde şifre sormayacak ve istediğinizi yapabileceksiniz aslında bu güvenlik açığı doğuracağı için biraz riskli bilgisayarınız devamlı evde ve sizden başka kimse kullanmıyor ise ama kullanabilirsiniz.

öptüm bye <3
