---
layout: post
title: Ubuntu 14.04 Ses Sorunun Giderilmesi
date: 2014-06-22 12:40:38.000000000 +03:00
type: post
published: true
status: publish
categories: linux
description: Ubuntu işletim sistemlerinde nedeni bilinmeyen bir hatadan dolayı oluşan ve neredeyse 3 sürümdür devam eden bu sorun bazı sistemlerde seslerin
---
Ubuntu işletim sistemlerinde nedeni bilinmeyen bir hatadan dolayı oluşan ve neredeyse 3 sürümdür devam eden bu sorun bazı sistemlerde seslerin hiç gelmemesine bazı sistemlerde ise kulaklık takıldığı zaman sesin gelmesine sebebiyet vermektedir.Bu sorun ubuntunun 14.04 13.10 13.04 ve 12.10 sürümlerini genel olarak etkilemektedir.

# 1-Sesi Kontrol Edin

öncelikle sesin açık olduğunu kontrol ediyoruz çoğu zaman sesin kısık olması yada kapalı olması bizi yanlış yönlendirebiliyor bunun için sağ üst kısımdaki ses ikonuna tıklayıp ses ayarlarına giriş yapıyoruz.

![ubuntusesproblemi1](/assets/ubuntusesproblemi1.png)

Giriş yaptığımızda gözümüze ses ayarlarının detaylı bir sürümünün ilişmesi lazım ve mute yani sessiz modunun kapalı olduğundan emin oluyoruz.Ses açık ve sessiz modda kapalıysa bir sonraki adıma geçiyoruz.

![ubuntusesproblemi2](/assets/ubuntusesproblemi2.png)

# 2.AlsaMixeri Kontrol Edin

Alsamixerin ses ayarlarını kontrol etmemiz gerekiyor default olarak ses kapalı olabilir yada ses başka bir aygıtdan çıkması için seçilmiş olabilir.Alsa mixeri uç birim(terminal) aracılığı ile açıyoruz.

CTRL+ALT+T tus kombinasyonu ile terminale ulaşıyoruz.

**alsamixer** diyoruz ve giriş yapıyoruz.

![ubuntusesproblemi3](/assets/ubuntusesproblemi3.png)

Yukarıdaki gibi bir kullanıcı arayüzü ile karşılaşmanız gerekiyor tabi sizin sisteminizde bulunan ses donanımlarına göre değişiklik göstericektir.

F4 = Ses kayıt aygıtları yani mikrofon ve türevlerini gösterir.

F3 = Çalma aygıtlarını gösterir

F5 = Ses aygıtlarının tamamını gösterir.

F6 = Ses kartınızı seçmenize yardımcı olur

Ayarlamalarınızı yaparken klavyenin yön oklarını kullanabilirsiniz yükseltebilir ve düşürebilirsiniz. "M" Harbi Sesi tamamen kapatmak yani Mute anlamındadır iki kez "OO" ya basıldığı zamanda ses tamamen açılmaktadır yani unmute anlamındadır.Ayarlamalarınızı yaptıktan sonra **ESC** ile çıkış yapabilirsiniz.

# 3. Alsa ve Pulse Ses uygulamalarını yeniden kurun

Alsamixer ve pulse audio yu tekrar kurmanız sesin gelmesi için etkili olabilmektedir çoğu kullanıcı bu yöntem ile sesi geri getirebilmişlerdir.

Aşağıdaki komut ile pulse ve alsayı tamamen kaldırıyoruz.

    sudo apt-get remove --purge alsa-base pulseaudio

hemen ardından sildiklerimizi geri kuruyoruz.

    sudo apt-get install alsa-base pulseaudio

Şimdide yüklediklerimizi güç kullanarak bir daha yeniliyoruz.

    sudo alsa force-reload

yaptığınız bu işlemden sonra tekrar sesin var olup olmadığını kontrol ediyoruz. yoksa 4.adıma geçiş yapıyoruz.

# 4.Ubuntu geliştirici ses sürücülerinin kurulması

### NOT: SADECE 14.04 de geçerlidir.

Bu sürücüyü kurmanız büyük ölçüde ses sorununuzun giderilmesini sağlayabilir.İçerisinde çoğu sürücüyü barındırmaktadır.

    sudo add-apt-repository ppa:ubuntu-audio-dev
    sudo apt-get update
    sudo apt-get dist-upgrade

İşlemimiz tamamlandı ses sorununuz yüksek ihtimal ile çözülmesi gerekiyor çözülmemiş ise ubuntunun bug takip sistemini kontrol etmeniz gerekmektedir.
