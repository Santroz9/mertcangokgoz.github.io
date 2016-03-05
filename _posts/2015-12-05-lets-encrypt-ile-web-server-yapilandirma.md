---
layout: post
title: Let’s Encrypt ile Web Server Yapılandırma
date: 2015-12-05 12:14:24.000000000 +02:00
type: post
categories: Güvenlik
description: Internet Security Research Group (ISRG) tarafından yürütülen bir proje olarak geçtiğimiz aylarda karşımıza çıkmaktadır. Transport Layer Security
---

**Internet Security Research Group (ISRG)** tarafından yürütülen bir proje olarak geçtiğimiz aylarda karşımıza çıkmaktadır.&nbsp;**Transport Layer Security encryption (TLS)** için ücretsiz olarak **SSL** sertifikası&nbsp;sağlamaktadırlar. **Let’s Encrypt** kurulum sırasındaki karmaşanın önüne geçmek ve kullanıcıyı yoran bir çok işlevi otomatikleştiren bir uygulama olarak karşımıza çıkmaktadır. Web siteleriniz için ücretsiz bir şekilde bu sertifikayı kullanabilirsiniz.Ancak bu projede tarafınıza verilecek olan **sertifikanın süresi 90 gündür**. Bu sürenin bitiminde sertifikanız otomatik olarak geçersiz hale gelecektir. Proje&nbsp;**Electronic Frontier Foundation (EFF)**, **Mozilla Foundation** ve **University of Michigan** tarafından desteklenmektedir.

Öncelikle sisteme kurulum ile ilgili gereken paketleri indirerek başlayalım

    sudo su
    apt-get update && apt-get upgrade
    apt-get install git
    git clone https://github.com/letsencrypt/letsencrypt
    cd letsencrypt

Ardından klasör içerisinde aşağıdaki komutu web sitenize göre düzenleyerek veriniz.

    ./letsencrypt-auto certonly -d siteadresi.com -d www.siteadresi.com --server https://acme-v01.api.letsencrypt.org/directory

Oluşturulan sertifikalar aşağıdaki dosya yolunda bulunmaktadır.

    /etc/letsencrypt/live/siteadresi.com/

sertifikalar ise şu şekilde kullanılacaktır.

- privkey.com aşağıdaki parametlerde kullanılacak olan dosyamızdır
  - Apache = SSLCertificateKeyFile
  - Nginx = ssl\_certificate\_key
- cert.pem aşağıdaki parametrede kullanılacak olan dosyamızdır
  - Apache = SSLCertificateFile
- chain.pem aşağıdaki parametrede kullanılacak olan dosyamızdır
  - Apache = SSLCertificateChainFile
- fullchain.pem aşağıdaki parametrede kullanılacak olan dosyamızdır
  - Nginx = ssl\_certificate

**Apache** Örnek yapılandırma

    <VirtualHost 192.168.0.1:443>
    DocumentRoot /var/www/html
    ServerName www.yourdomain.com
    SSLEngine on
    SSLCertificateFile /etc/letsencrypt/live/siteadresi.com/cert.pem
    SSLCertificateKeyFile /etc/letsencrypt/live/siteadresi.com/privkey.pem
    SSLCertificateChainFile /etc/letsencrypt/live/siteadresi.com/chain.pem
    </VirtualHost>

**Nginx** Örnek yapılandırma

    server {
        listen 443 ssl;
        server_name www.siteadresi.com;
        ssl_certificate /etc/letsencrypt/live/siteadresi.com/fullchain.pem;
        ssl_certificate_key /etc/letsencrypt/live/siteadresi.com/privkey.pem;
        ssl_protocols TLSv1 TLSv1.1 TLSv1.2;
        ssl_ciphers HIGH:!aNULL:!MD5;
        ...
    }

Olacak şekilde ayarlaması yapıldığı taktirde 90 gün geçerli ücretsiz **SSL** tarafınıza sunulacak ve kullanıma başlayacaksınız.Yapılandırmaların geçerli olabilmesi için web server uygulamanızı yeniden başlatmanız gerekmektedir.

**Apache**

    service apache2 restart

**Nginx**

    service nginx restart

## Peki 90 gün sonunda ne yapmamız gerekiyor ?

Telaşlanmayın **http** ye geçmenize gerek yok sadece **SSL** yenilemeniz gerekiyor bunun için ise aşağıdaki komutu verdiğiniz taktirde sorununuz çözülecektir.

    ./letsencrypt-auto certonly -d siteadresi.com -d www.siteadresi.com --server https://acme-v01.api.letsencrypt.org/directory

her 3 ayda bir bu işlemi yerine getirmeniz gerekiyor.Buna çözüm olarakda cron job işimizi görecektir.

    crontab -e

komutumuzu veriyoruz açılan yere aşağıdaki parametreyi ekleyelim bu parametre her 3 ayda bir çalışacak şekilde ayarlanmıştır.

    30 03 01 */3 * /usr/local/bin/renew.sh >/dev/null 2>&1

**Dosya:** renew.sh

    sudo su
    cd ~ && cd letsencrypt
    ./letsencrypt-auto certonly -d siteadresi.com -d www.siteadresi.com --server https://acme-v01.api.letsencrypt.org/directory
    service nginx restart

gereken yerleri kendi sitenize göre düzenleyebilirsiniz.(web server tipi ve site adresiniz)Çalıştığını gözlemledikten sonra rahatlıkla kullanabileceğiniz bir sistem haline gelecek ve her 3 ayda otomatik olarak yenilenecektir.Herhangi bir ek ayar yapmanıza gerek yoktur.Otomatik olarak yeni keyler yerlerini alacaktır.
