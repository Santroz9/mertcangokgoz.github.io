---
layout: post
title: LibreOffice 5.0.x Türkçe Kurulumu
date: 2015-10-02 16:58:36.000000000 +03:00
type: post
published: true
status: publish
categories: Linux
description: Açık kaynak kod sevenlerin vazgeçilmez office uygulamalarından biri olan LibreOffice nin 5.0 sürümü geçtiğimiz aylarda sunuldu hala kurmamış
---

![libreofficeyazigorselici](/assets/libreofficeyazigorselici.jpg)

Açık kaynak kod sevenlerin vazgeçilmez office uygulamalarından biri olan **LibreOffice** nin 5.0 sürümü geçtiğimiz aylarda sunuldu hala kurmamış olan yada sisteme dahil olarak geleni kullanan arkadaşlar bu sürümden malesef faydalanamıyoz **PPA** ise ağustos ayından beri güncellenmediği için resmi sitesinden kurulumunu yapmamız gerekiyor.Ben **Xubuntu** kullandığım için anlatımı Debian tabanlı sistemlere göre yapacağım.

İlk olarak web sitesine girip son sürümü kontrol ediyoruz. [Şuanda son sürüm 5.0.2 olarak gözüküyor](http://www.libreoffice.org/download/libreoffice-fresh/?type=deb-x86_64&version=5.0.2&lang=en-US) boyut olarakda 230 MB gözüküyor.İnternet hızınıza göre indirme işlemi biraz zaman alacaktır.

İndirme işlemi tamamlandığında masaüstünüzde bir arşiv yönetme uygulaması varsa onunla açabilirsiniz eğer yoksada aşağıdaki komutu verip dosya içeriğini çıkartmanız gerekiyor.

    tar -xvzf LibreOffice_5.0.2_Linux_x86-64_deb.tar.gz

arşivden çıkartma işleminden sonra klasör içerisinde 2 adet daha klasör olacak bunlardan biri **DEBS** diğeride **README** ama bizim işimiz **DEBS** klasörü ile aşağıdaki komut yardımı ile giriş yapın klasör içerisine

    cd LibreOffice_5.0.2_Linux_x86-64_deb/DEBS

daha sonra içerisindeki **.deb** uzantılı dosyaları tek tek kurmaya başlayın el ile uğraşmanıza hiç gerek yok direk olarak aşağıdaki komutu verin otomatik olarak yeni sürüm kurulacak.

    sudo dpkg -i *.deb

daha kolay bir yöntem istiyorsanızda **PPA** kullanabilirsiniz eski depo güncellenmiyordu ancak bu depo işinize yarayabilir güncellemeler hemen gelmiyor olsada geç olsun güç olmasın mantığı ile kullanabilirsiniz.

    sudo apt-add-repository ppa:libreoffice/libreoffice-5-0
    sudo apt-get update

depoyu sisteminize dahil ettiyseniz geriye kalan normal kurulum parametresidir onuda yazarsınız diye düşünüyorum.

    sudo apt-get install libreoffice

kurdunuz güzel bir şekilde kullanıyorsunuz ve yeni sürümün çıktığını fark ettiniz hemen yapmanız.Temel sistem güncelleme komutunu vermek böylelikle tüm sistem gibi LibreOffice uygulamasınıda güncelleyebileceksiniz.

    sudo apt-get upgrade

## Kurulum Sırasında Hata Alırsanız

Kurulumu gerçekleştirmek istediniz ama sistemde eski sürümden kaynaklı bir takım hatalar olduysa özelliklede zaten bir sürüm kurulu vs diye caz yapıyor ise eski sürümü kaldırmanız gerekiyor ki yeni sürümü kurabilesiniz bunun için aşağıdaki komutu kullanabilirsiniz.

    sudo apt-get purge libreoffice-core

## Türkçe Dil Paketi

İngilizce kullanamazsanız türkçe dil paketini kurarak türkçe bir şekilde kullanabilirsiniz.İlk olarak sitesinden sürüme uygun dil paketini indiriyoruz.

    wget http://download.documentfoundation.org/libreoffice/stable/5.0.2/deb/x86_64/LibreOffice_5.0.2_Linux_x86-64_deb_langpack_tr.tar.gz

indirdiğimiz dil dosyasını her zamanki gibi arşivden çıkartıyoruz.ve kurulum aşamasına geçiyoruz.

    tar -xvzf LibreOffice_5.0.2_Linux_x86-64_deb_langpack_tr/DEBS

daha sonra yukarıda kullandığımız kurulum parametresini aynı dizin içerisinde tekrarlıyoruz.

    sudo dpkg -i *.deb

ardından **LibreOffice** artık türkçe ve doyasıya kullanabilirsiniz.
