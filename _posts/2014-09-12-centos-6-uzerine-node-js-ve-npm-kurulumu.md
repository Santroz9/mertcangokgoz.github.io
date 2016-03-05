---
layout: post
title: Centos 6 Üzerine Node.js ve NPM Kurulumu
date: 2014-09-12 17:52:52.000000000 +03:00
type: post
published: true
status: publish
categories: Linux
description: zaten girmeyeceğim çünkü girersek işin içinden çıkmayız şimdi ne yapacaz bugün güzelce centos VPS üzerine node.js ve yanına hemen
---
Bugün bi **node.js** ve **express.js** kurup hello world yazdıralım dedim aslında bu **node.js** chrome için yapılmış aşırı hızlı bi javascriptcik sistemi kasmaz yormaz sıkıntı çıkartmaz ama uzmanlık gerektirir uzun vadede kullanılacak ise herkes ile çalışılmaz bende dokümantasyona şöyle bi göz attım kurulumunda bir zorluk yok ince ayarlamalarında sıkıntılar olduğunu fark ettim ve bende bu ince ayarlara zaten girmeyeceğim çünkü girersek işin içinden çıkmayız şimdi ne yapacaz bugün güzelce **centos**  **VPS** üzerine **node.js** ve yanına hemen **express.js** kurup yolumuza devam edicez kurulum sistem ve network hızına göre 10 ila 25 dk arasında sürebilir.

Öncelikle centos sisteminiz güncel değilse güncelleyin tabi güncel diyip de güncellememezlik yapma güncelle işte bi paket güncellenmiştir bakarsın

    yum -y update

node.js nin bulunduğu paketleri vs kurup güncellemeye geldi sıra buda centos da geliştirici araçları içerisinde yer alıyor. hemen yüklüyoruz.dikkat edilmesi gereken nokta burada node.js kesinlikle kurulmuyor kurmak için kendi ayrı paketinden derlememiz gerekiyor biz sadece bu aşamada node.js nin derlenmesi sırasında hata vermemesi için gerekli olan tüm geliştirici araçlarını kurmuş oluyoruz.

    yum -y groupinstall "Development Tools"

bide bunların kurulumları bittikten sonra screen isimli uygulamayıda kurmamız lazım arka planda hem çalışması hemde olanları bi görmemiz açısından iyi olur diyorlar dokümantasyonda haklılar aslında canım

    yum -y install screen

Şimdi node.js yi resmi sitesine giderek bi sürüm kontrolü yapıyoruz benim baktığımda en son 0.10.31 vardı source code kısmından hemen linki alıp aşağıdaki gibi devam edelim.

    cd /usr/src
    wget http://nodejs.org/dist/v0.10.31/node-v0.10.31.tar.gz
    tar -zxf node-v0.10.31.tar.gz
    cd node-v0.10.31

kaynak kodumuzu derleme işlemine geçebiliriz bu aşamada hata verirse googleden baka baka çözersiniz artık bende hata olmadı

    ./configure
    make
    make install

Geldik en can alıcı noktaya sistemin bi güvenli yolu var her sistemde olduğu gibi " **/usr/local/bin**" ı o güvenli yola eklememiz gerekiyor default olarak o yolda **/usr/bin** var ancak local kısmı yok o yüzden " **secure\_path**"kısmına ekleme yapacağız o eklenecek şey ise " **/usr/local/bin**"

    sudo visudo

yanlış hatırlamıyorsam bu şey sudoers e gidiyordu şimdi oradaki düzenlemeyi yapıcaz satırın sonuna aşağıdakini olduğu gibi ekleyip kayıt edip çıkın

    :/usr/local/bin

eğer doğru yaptığınızı düşünüyorsanız sıkıntı yok hemen npm ile birlikte express ve superadvisor modülünü kurucaz bunun için

    npm -g install express express-generator supervisor

şimdi normalde bunu böyle çalıştırabiliriz ama root olarak yapmanızı önermem sisteme biri sızarsa büyük sorun oluşturur bu yüzden yeni kullanıcı oluşturup devam edelim.

    useradd kullanıcı adı
    passwd kullanıcı şifresi

root hesapdan çıkış yapın ve bu kullanıcı ile girişinizi gerçekleştirin.express baya güçlü bi framework olduğu için her işinizi yapabilirsiniz proje oluşturmak için ise

    express ilkprojem

İçerisine node.js ye ait bir tazım dosyaları atmamız lazım kuru kuruya çalışmayacağı için hemen ufak bir kodumuz var

    cd ilkprojem && npm install

ve işlemimiz son buluyor kurulumumuz ve ilk projemizi açma işlemimiz tamamlandı bundan sonrası sizin hayal gücünüz ve node.js bilginize kalıyor.Nodejs nin dokümantasyonuna [ulaşmak için Tıklayın](http://nodejs.org/documentation/).Şimdi bunun çalışıp çalışmadığını nasıl anlayacağım&nbsp;diyorsanız yukarı da size screen kurdurmuştuk işte bu yüzdendi direk olarak "screen" komutunu verdiğiniz zaman çalışıp çalışmadığını orada görebilirsiniz.Öğrenmek istiyorsanızda [nodeschool](http://nodeschool.io/) gidebilirsiniz gerçekten işe yarar dokümanlar bulunmakta
