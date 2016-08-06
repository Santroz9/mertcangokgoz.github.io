---
layout: post
title: Ubuntu Sistemler için OrangeHRM Kurulumu
date: 2015-12-08 13:25:44.000000000 +02:00
type: post
published: true
status: publish
categories: linux
description: OrangeHRM İnsan kaynakları yönetimi için gerekli olan tüm şartları sağlamakta ve açık kaynak kodlu olarak dağıtılmaktadır üstelik ücretsiz
---

[OrangeHRM](http://www.orangehrm.com/) İnsan kaynakları yönetimi için gerekli olan tüm şartları sağlamakta ve açık kaynak kodlu olarak dağıtılmaktadır üstelik ücretsiz bir şekilde indirip kullanabilirsiniz.Çok zengin özellikleri bulunmaktadır avrupadaki firmalar arasında popülerliği bulunmaktadır. Ücretsiz sürümü oldukça fazla özellik barındırsada Paralı sürümleri daha fazla geliştirilmiş modüller içerir ücretsiz bir şekilde kullanmaya başlayıp daha sonraki zamanlarda firma ihtiyaçlarına göre bir üst sürüme geçebilirsiniz.

Genellikle firmalar ofislerinde bulundurdukları sunucularda bu sistemi kullanırlar bu yüzden sistemi dışarıya açmanıza gerek yoktur herhangi bir siteye kurulmasınada gerek yok ofis içerisindeki ağda kullanılması insan kaynakları yöneticileri için ek güvenlik önemleri almalarını azaltacaktır.

Web server seçimini **apache** ve veritabanı yönetimi için ise **MySQL** olarak seçiyoruz.

    sudo su
    apt-get update && apt-get upgrade
    apt-get install apache2
    apt-get install mysql-server
    apt-get install php5 php5-mysql

Temel LAMP Kurulumlarını geçtiğimize göre artık asıl bizim işimize yarayacak olan OrangeHRM kurulumuna başlayalım.

    cd
    wget http://freefr.dl.sourceforge.net/project/orangehrm/stable/3.3.2/orangehrm-3.3.2.zip
    unzip orangehrm-* /var/www/html

dosyamızı html dizini içerisine açtığımızda sürüm ismi ile bir klasör oluşturduğunu göreceksiniz.Bundan kurtulmamız ve ana dizine tamamıyla taşımamız ve dosyaları görmemiz gerekiyor.

    cd /var/www/html/
    mv orangehrm-3.3.2 orangehrm

Son olarak klasör dizinleri ve kullanıcı ayarlarını yapalım apache için ve **OrangeHRM** izinlerini verelim ki sıkıntısız kurulum aşamasında işlemlerimizi yapabilelim.

    chown -R www-data:www:data /var/www/html/orangehrm
    chmod -R 755 /var/www/html/orangehrm

son olarak herşey yerinde gittiğini düşünüyorsanız apache yeniden başlatarak tüm bu ayarların geçerli olmasını sağlayabilirsiniz.

    apt-get restart apache2

![orangehrmkurulumgorsel1](/assets/orangehrmkurulumgorsel1.png)

Veritabanı bilgilerinizi girdikten sonra sistem tarafından otomatik olarak gerekenler yapılacaktır.Bu yüzden sizin ek bir ayar yapmanıza gerek yok

![orangehrmkurulumgorsel3](/assets/orangehrmkurulumgorsel3.png)

**OrangeHRM** otomatik olarak kurulacak gereken ayarları sistem üzerinden zahmetsizce yapabilirsiniz.OrangeHRM oldukça kolay ve etkili bir uygulamadır.Eksiği yok fazlası var denilebilir tabiki paralı sürümü ile karşılaştırıldığında eksiklikleri elbette vardır ancak ilk başlarda uygulamayı denemek amacıyla kullanılabilir.

- Çalışanların bilgilerini tutma
- Departmanlara göre analiz yapma
- Detaylı raporlama
- Çalışma saatlerini belirleyip çizelge oluşturma
- İşin tanımına göre gereken eğitimleri çalışanlara sunabilme
- Akıllı telefon entegrasyonu
- Çalışanların yaptığı işleri detaylı takip edebilme
- Performans değerlendirme
