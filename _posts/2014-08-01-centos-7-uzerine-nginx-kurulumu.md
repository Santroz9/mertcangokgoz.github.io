---
layout: post
title: Centos 7 Üzerine Nginx Kurulumu
date: 2014-08-01 23:32:19.000000000 +03:00
type: post
published: true
status: publish
categories: Linux
description: Nginx Günümüzde bazı yüksek ölçekli sitelerin arka planında yükü azaltmak adına çokca kullanılan bir yazılımdır.Apacheye oranla yüksek yük
---
**Nginx** Günümüzde bazı yüksek ölçekli sitelerin arka planında yükü azaltmak adına çokça kullanılan bir yazılımdır.Apacheye oranla yüksek yük altında performansı oldukça fazladır. **Nginx** daha dayanıklı olmasının yanında daha esnektir ve hafiftir sistemi asla yormaz işte sizlere bu makalemizde Nginxi centos 7 üzerine sade olarak nasıl kurabileceğimizi göstereceğim.Oldukça basit bir yol izleyeceğiz.

Reposunu terminal aracılığı ile sisteme ekliyoruz.

    sudo rpm -Uvh http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm

Eklediğimiz repoyu sistemin sindirmesi ve kurulumun olması için

    yum update
    yum install nginx

Kurulum Başarılı bir şekilde gerçekleştiğini gördüğümüzde hemen **nginx** başlatıyoruz.

    systemctl start nginx.service

Domaine yönlendirmediyseniz sunucunuzu ip adresinden siteye ziyaret ediyorsunuz ve çalışıp çalışmadığına bu şekilde göz atabilirsiniz.

![nginx_defaultgorsel1](/assets/nginx_defaultgorsel1.png)

Bu şekilde bir sayfa ile karşılaştıysanız ne mutlu size nginx başarılı bir biçimde kurulmuş demektir.Bundan sonra yapacağınız işlem ise sisteminizin başlangıcına nginxin eklenmesi böylelikle reboot atıldığı zaman bile ulaşabileceksiniz.

    servicectl enable nginx.service

İp adresimi biliyorum ancak doğruluğundan emin olmak istiyorum diyorsanız teminale geliyorsunuz ve aşağıdaki komutumuzu giriyoruz.

    ip addr show eth0 | grep inet | awk '{ print $2; }' | sed 's/\/.*$//'

Ön tanımlı olarak nginxin dosya ve klasörlerinin yerleri aşağıdaki gibidir.

- /usr/share/nginx/html
- /etc/nginx/conf.d Apachedeki virtualhost gibi düşünebiliriz.
- /etc/nginx/conf.d/default.conf
- /etc/nginx/nginx.conf Genel sistem ayarlarınızı yapacağınız ayar dosyamız.
