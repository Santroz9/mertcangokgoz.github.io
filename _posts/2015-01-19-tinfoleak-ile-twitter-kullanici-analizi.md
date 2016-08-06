---
layout: post
title: TinfoLeak ile Twitter Kullanıcı Analizi
date: 2015-01-19 16:00:12.000000000 +02:00
type: post
published: true
status: publish
categories: programlama
description: Tinfoleak uygulaması adındanda anlaşılacağı gibi bir kullanıcı analiz uygulamasıdır python ile yazılmış olan bu uygulama sayesinde istediğiniz
---
**Tinfoleak** uygulaması adındanda anlaşılacağı gibi bir kullanıcı analiz uygulamasıdır **python** ile yazılmış olan bu uygulama sayesinde istediğiniz kullanıcının bilgilerini görebilir ve analiz yapabilirsiniz.Başlıca özellikleri ise şunlardır


- Kullanıcı hakkında temel bilgileri verir(isim,kayıt tarihi,resmi,lokasyonu,takip dilen kişi sayısı vb)
- **Tweetlerin atıldığı Operatör yada cihaz**
- hangi sosyal ağdan gönderildiği
- Atılan tweetlere göre kordinatsal olarak yer takibi yapabilme özelliği
- **Atılan tweetlerin google haritası üzerinde gösterilmesi ile harita çıkartılabilme özelliği**
- Tweetter üzerinde kullanıcının tüm resimlerini indirebilme
- Hangi Hashtaglara katılıp hangi tweetlerin atıldığı bunlara bağlı olarak yer tarih bildirimi
- Hangi kullanıcı ile etkiletişe girdiği ve ne kadar süre boyunca etkileşimde kaldığı bunlara bağlı olarak yer tarih bildirimi
- Kullanıcının hangi konulara bağlı kaldığı

_Gibi bir takım bilgiler ile Kullanıcıyı tam olarak analiz edebilirsiniz.Twitter APİ üzerinden çalıştığı içinde %100 yasal bir uygulamadır.her ne kadar yukarıda yazan özellikler sizi korkutsada twitter bunların hepsine_ **APİ** _bazında izin vermektedir._

Uygulamayı nasıl kullanabilirsiniz.

ilk olarak Python üzerine yazıldığı için python da bulunan Twitter APİ kütüphanesinin yüklenmesi gerekiyor.

    sudo apt-get install python-pip

Daha sonra şu komut verilerek pip üzerinden **tweepy** kurulacak

    pip install tweepy

Kurulum tamamlandıktan sonra uygulamayı sisteminize çekmeniz gerekiyor bunun için ise

    wget https://mertcangokgoz.com/Downloads/tinfoleak.py

Şimdi Twitterdan APİ Almaya geldi sıra [**Twitter Developer**](https://dev.twitter.com/apps/new) Adresine giriş yapıyoruz ve Api İçin bir uygulama kayıt ediyoruz ki Aşağıdaki satırları doldurabilelim.Bu satırları uygulamanın içerinde görebilirsiniz herhangi bir text editörü ile açıp düzenlemeniz yeterli

    # OAuth Settings
    # How to obtain the API key:
    # Go to https://dev.twitter.com/apps/new
    # Copy the consumer key (API key), consumer secret, access token and access token secret
    CONSUMER_KEY = ''
    CONSUMER_SECRET = ''
    ACCESS_TOKEN = ''
    ACCESS_TOKEN_SECRET = ''

Örnek uygulama Kayıt ekranı

![tinfoleaktwitteranalizgorsel1](/assets/tinfoleaktwitteranalizgorsel1-e1421340797127-827x576.jpg)

Burada _ **callback URL** _ kısmını kafadan atmak suretiyle devam ediyoruz ben yukardaki gibi yaptım sizde sonu callback.php ile biten istediğiniz bi yeri yazabilirsiniz. **Api key** lere nasıl ulaşacağım ben diyorsanız oluşturduğunuz uygulamaya tıklıyorsunuz ve gereken bilgileri alıyorsunuz şu şekilde

![tinfoleaktwitteranalizgorsel3](/assets/tinfoleaktwitteranalizgorsel3-e1421341406142-598x576.jpg)


**Twitter** da APİ ayarladıktan sonra gerekli bilgileri uygulamaya giriyoruz ve kayıt edip çıkıyoruz.Sıra geliyor uygulamayı çalıştırmaya

    ./tinfoleak.py

bu şekilde çalışıyor tabi siz komut göndermediğiniz için default komutları size sıralayacak ve ne yapabileceğinizi size gösterecek şöyleki

![tinfoleaktwitteranalizgorsel2](/assets/tinfoleaktwitteranalizgorsel2-e1421341137649-980x576.png)

Gereken varyasyonlar ile istediğiniz kullanıcıyı analiz edebilirsiniz.Üstelik vaktinizi bile almayacak bir hız ile **Python** ile yazıldığı için oldukça hızlı bir uygulama sizi bekliyor olacak
