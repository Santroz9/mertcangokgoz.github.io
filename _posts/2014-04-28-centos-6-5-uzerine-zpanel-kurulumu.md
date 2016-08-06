---
layout: post
title: Centos 6.5 Üzerine Zpanel Kurulumu
date: 2014-04-28 17:34:29.000000000 +03:00
type: post
published: true
status: publish
categories: linux
description: Cpanele alternatiflerden olan ve kullanıcıya ücretsiz olarak dağıtılan zpanel kullanışlı olmasıyla beraber cpanele benzerliğiyle benim
---
Cpanele alternatiflerden olan ve kullanıcıya ücretsiz olarak dağıtılan zpanel kullanışlı olmasıyla beraber cpanele benzerliğiyle benim dikkatimi çekti. Sunucunuzu yönetmek istiyorsanız ücretsizler arasında webminden sonra en iyi kontrol paneli diyebilirim. Kurulumu Sunucunuzun işlemci ve internet hızına bağlı olarak 45 dakika kadar sürebilir sabırlı olmanızı tavsiye ediyorum.

Öncelikle Kullanacağımız işletim sistemi **Centos 6.5 x64 bit** Sistem özellikleri olarak da minimum 512mb ram li bir sistem kullanabilirsiniz.

Lafı fazla uzatmadan işlemlerimize geçelim. İlk olarak yedeklerinizi aldıktan sonra sunucunuza format atın ki tertemiz bir kurulum gerçekleştirmiş olun. Ve sistemimizi güncelleştirmemiz gerekiyor.

    yum -y update

![1](/assets/1aa.png)

Putty aracılığı ile sunucumuza bağlandıktan sonra işlemlerimin tamamını root olarak gerçekleştireceğimiz için aşağıdaki komutu vererek tam yetki sahibi oluyoruz.

    Sudo –i

Bu komuttan sonra kurulumu gerçekleştireceğimiz için ana dizine gitmemiz gerekiyor bunun için

    Cd …

Diyerek ana dizine geçiş yapıyoruz. Ve resmi sitesinde bizim için hazırlanmış olan yükleyicisini indirmeye geçeceğiz

    Yum –y install wget
    wget -O installer-10-1-0-centos-64.sh.x https://github.com/zpanel/zpanelx/releases/download/10.1.0_orig/installer-10-1-0-centos-64.sh.x

![2](/assets/2aa.png)

komutu vererek sistemimiz için kullanacağımız kurulum dosyasını indirmiş olduk kurulum dosyasının izinlerini ayarlayacak olursak.

    Chmod +x installer-10-1-0-centos-64.sh.x

Diyoruz ve dosyamızı çalıştırılabilir hale getiriyoruz. Ancak kurulumu tamamlayabilmemiz için sistemimizde bazı paketler yüklü olmalı bunun için

    Yum install ld-linux.so.2 curl

Hemen ardından kurulum dosyamızı çalıştırarak işleme başlıyoruz.

    ./installer-10-1-0-centos-64.sh.x

![4](/assets/4aa.png)

Yükleme yaparken yüksek ihtimal putty dahil donmaya neden olabilir. Kurulmuyor bu diyip hemen umudunuzu yitirmeyin max 1 saate kadar kurulum tamamlanacaktır. İp adresiniz ile login olmadı deneyin sonrasında putty e aşağıdaki komutu verebilirsiniz.

    Exit

İlk defa login olacak isek ne yapmamız gerekiyor diye soracaksınız. Öncelikle tanımlı olarak gelen kullanıcı adı “zadmin” şifresi ise &nbsp;“ **/root/passwords.txt”** içerisinde diyor ancak uğraşmak istemiyorsanız benim gibi aşağıdaki komutu vererek şifrenizi değiştirebilirsiniz.

    setzadmin --set ŞİFRENİZ

Zpanel kurulumunuz tamamlanmıştır yeni ücretsiz panelinizi doyasıya kullanabilirsiniz.

![3](/assets/3aa.png)
