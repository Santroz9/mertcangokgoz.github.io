---
layout: post
title: Centos 6.4 Üzerinde SSHPASS Kullanımı
date: 2013-09-25 00:33:04.000000000 +03:00
type: post
published: true
status: publish
categories: Linux
description: Normalde Linux root kullanıcıları ya ssh server üzerinden yada key based ile giriş yaparlar. SSHPASS işlemi yaparak otomatik olarak şifre
---

Normalde Linux root kullanıcıları ya ssh server üzerinden yada key based ile giriş yaparlar. **SSHPASS** işlemi yaparak otomatik olarak şifre tedarik edebilir Özel bir **TTY** kullanılarak Şifre istemi gerçekleştirilebilir.

- uzakta bulunan bir sunucuya yedek alma işlemi
- belirli zamanda belirli komutların kullanılması

gibi görevleri yerine getirebilirsiniz.

## SshPass Kurulumu

Centos 6.4 üzerine kurmamız daha iyi olacağından anlatım için işletim sistemini centos 6.4 seçtim işlemi yaparken root olarak sisteme giriş yapınız

    yum -y install sshpass

**-y**"yes" anlamındadır. Kurulsun mu diye sormayacaktır.

## Parametreleri Tanıyalım

sshpass -h diyerek "help" komutunu çalıştırıyoruz.

- **-f** parola almak için kullanılacak dosya
- **-d** şifre alınacak olan dosyadan tanıtıcı bir kaç numara
- **-p** belirlenecek olan düşük güvenlikli şifre
- **-e** şifre env-var "SSHPASS" olarak aktarılır
- **-h** yardım almak için
- **-V** versiyonu gösterir

Örnek 1

    sshpass -p 'test123' ssh sv1.mertcangokgoz.com -l root -o StrictHostKeyChecking=no

Burada kullanılan  **StrictHostKeyChecking=no ** adındanda anlaşılacağı gibi kontrol edememesi

Örnek 2 Uzak server da bazı komutların çalıştırılabilmesi için uptime ve uname kontrolü

    sshpass -p 'test123' ssh sv1.mertcangokgoz.com -l root -o StrictHostKeyChecking=no "uptime;uname -a"

bize çıktı olarak

    22:23:34 up 21 days, 22:23,  22 users,  load average: 0.08, 0.00, 0.00 
    Linux sv1.mertcangokgoz.com 2.6.32-220.el6.x86_64 #1 SMP Tue Dec 6 21:48:22 GMT 2011 x86_64 x86_64 x86_64 GNU/Linux

Örnek 3 rsync kullanarak bir sunucuya dosya kopyalamak

    # sshpass -p 'password' rsync -av --progress sshpass.tar.gz root@sv1.mertcangokgoz.com:/tmp/
