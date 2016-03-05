---
layout: post
title: Linux Sistemler için Sentora Kurulumu
date: 2015-07-13 21:23:57.000000000 +03:00
type: post
published: true
status: publish
categories: Linux
description: Sentora indirmesi ve kullanması ücretsiz olan ve eski Zpanel geliştiricileri tarafından yazılan açık kaynak kodlu bir kontrol panelidir. Linux,
---

Sentora indirmesi ve kullanması ücretsiz olan ve eski **Zpanel** geliştiricileri tarafından yazılan açık kaynak kodlu bir kontrol panelidir. **Linux** , **UNIX** ve **BSD** tabanlı tüm sistemler ile sıkıntısız çalıştığı söylenmektedir.

Sentora kullanıcı dostu bir arayüze sahiptir kullanılması kolaydır. Kurulumu ilk kez yapıyorsanız biraz sıkıntılar çekebilirsiniz ancak bir kaç gün kurcaladıktan sonra sorunlarınız ortadan kalkacaktır.

Panel aşağıdaki uygulamalar ile tam uyumlu olarak çalışmaktadır ve bunlara göre hazırlanmıştır;

- Apache HTTPd
- PHP
- ProFTPd
- MySQL/MariaDB
- Postfix
- Dovecot

## Özellikleri

1. Sunucu üzerinden birden çok web sitesi barındırabilirsiniz böylelikle insanlara shared hosting hizmeti sunabilirsiniz.
2. Tek bir web sitesi barındırabilme imkanı ile kendi sitenizi yönetebilirsiniz.
3. Reseller özelliği sayesinde birden çok kişiye yetki verebilir ve sistem üzerinde birden çok web sitesi barındırabilirsiniz.

## Gereklilikler

- **CentOS 6,&nbsp;CentOS 7,&nbsp;Ubuntu 12.04** veya&nbsp; **Ubuntu 14.04** işletim sistemlerinden herhangi bir tanesi
- 20GB Boş disk alanı
- Minimum 1 GB RAM
- Ve haliyle bir internet bağlantısı

Sonunda kuruluma ulaşabildiniz aşağıdaki komutlar ile yukarıda belirttiğimiz sistemlerden herhangi bir tanesine kurabilirsiniz.Ben kurulum için **Ubuntu 15.04** kullanacağım.Kurulumları yaparken dikkat etmeniz gereken şey kesinlikle **root** kullanıcısı izinleriniz olmasıdır bunu sağlamak için ise **"sudo su"** yada **"sudo -s"** komutunu kullanabilirsiniz.

    cd /root/
    wget http://sentora.org/install
    chmod +x install.sh
    ./install.sh

Komutunu'da verdikten sonra kurulum sihirbazı başlıyor ilk olarak sizden yaşadığınız bölgeyi yani region bilginizi istiyor **Europe** diyoruz.Buna bağlı olarak tarih ve saat ayarlaması yaptırabilir.

![sentoragorsel1](/assets/sentoragorsel1-e1436811886266.jpg)

Bu kısımda ise sentora panele ulaşmak için bir adet **subdomain** belirlememiz gerekiyor istediğiniz bir şey yapabilirsiniz ben venus.mertcangokgoz.com kullanacağım onun altında ise sunucunuzun ip sini yazmanız gerekiyor.

 ![sentoragorsel2](/assets/sentoragorsel2-e1436811898649.jpg)

İşlem tamamlandı sunucuya **reset atılıp atılmasın mı** diye soracak evet diyoruz devam ediyoruz ve panelimizin kurulumu tamamlanmış oluyor artık sunucunuz kendine geldikten sonra istediğiniz ayarlamaları yapabilmekte özgürsünüz.

 ![sentoragorsel3](/assets/sentoragorsel3-e1436811909655.jpg)

Kurmuş olduğumuz panelimizden bir görsel Zpaneli andıran bir görünüşü olsada **Sentora** Zpanelin devamı niteliğindedir ve hala gelişim aşamasındadır.

 ![sentoragorsel4](/assets/sentoragorsel4-e1436811925815.jpg)

Şifrelerinizi kayıt etmediysenizde üzülmeyin sentora sizin için bunları sizin için bir **text** dosyasında tutuyor.Bunlara ulaşmak için ise **/root/password.txt** ye bakmanız yeterli olacaktır.
