---
layout: post
title: Cloudflare Site İp Adresini Çözümleme
date: 2015-07-04 10:19:02.000000000 +03:00
type: post
published: true
status: publish
categories: Güvenlik
description: CloudFlare kullanara bilindiği üzere sitenizi koruma altına alabilirsiniz ip adresinizi gizleyebilir ve gelecek olan saldırılardan bir nebzede
---

**CloudFlare** kullanara bilindiği üzere sitenizi koruma altına alabilirsiniz ip adresinizi gizleyebilir ve gelecek olan saldırılardan bir nebzede olsa korunabilirsiniz. **Ddos** ve **Botnet** saldırılarına ise pro paket sayesinde korunabilirsiniz. **Cloudflare** aslında ip capsüllemek için ideal bir platform sitenizin **ip** adresini gizlemeniz güvenliğiniz açısından büyük önem taşıyor.Ancak hatalarınız sonucu ip adresiniz tekrardan bulunabilir. **Cloudflare** işte bu noktada işinize asla yaramayacaktır. Sitemin **ip** adresi nasıl bulunuyor yada bulunabiliyor mu gibi düşünceleriniz varsa bu uygulaması kullanabilirsiniz.Başarı oranı %80 dir.

    sudo su
    cd /usr/local/bin
    wget mertcangokgoz.com/Downloads/cloudflare.sh
    chmod +x cloudflare.sh
    ./cloudflare.sh

Komutu verdiğimizde seçimli bir ekran gelecek buradan istediğiniz yöntemi seçerek ipleri bulabilirsiniz.Eğer ip adresiniz çözümlenebiliyorsa gereken adımları bu yünde atabilirsiniz ve saldırganları durdurabilirsiniz.

![cloudflareresolvergorsel1](/assets/cloudflareresolvergorsel1.jpg)

Site adresini girdiğinizde ve seçimi yaptığınızda eğer ip bulunabiliyorsa. Bulunan ip adresini gösterecektir.Bulunamıyor ise sitenizin ip adresini güzel bir şekilde gizlemişsiniz demektir.
