---
layout: post
title: Github SSH Key Oluşturma İşlemi
date: 2015-09-21 15:48:47.000000000 +03:00
type: post
published: true
status: publish
categories: Linux
description: Github hesabınız varken genelde bir proje yada dosya eklemek isterseniz uzun uzun kullanıcı adı ve şifrenizi girmeniz gerekiyor.Ben bununla

---

Github hesabınız varken genelde bir proje yada dosya eklemek isterseniz uzun uzun kullanıcı adı ve şifrenizi girmeniz gerekiyor.Ben bununla uğraşmakdan bıktığım için genelde SSH key yöntemini kullanıyorum.Sistemden oluşturuyorum key github giriyorum ve bu aşamadan sonra tüm herşey sadece **SSH key** oluştururken yazdığınız şifreye kalıyor.Siteye girişinizdeki şifre benim kullandığım 256 bitlik bir şifre olabilir.Haliyle bu şifreyi girmek oldukça zor.

Şimdi gerekli dokümantasyon a bir göz attıktan sonra farklı bir yapılandırma yapılmadığını fark ettim normal olarak şifreyi oluşturup sisteme dahil etmemiz yetiyor.Tabi sistemde daha önceden kullanılan başka bi **SSH key** varsa ismini değiştirmenizi öneririm.

    ssh-keygen -t rsa -b 4096 -C "mailadresi@mail.com"

yukarıdaki komut ile github üye olduğunuz maili girerek bir adet **SSH key** oluşturuyorsunuz bu oluşturduğunuz key ile sisteme giriş yapacaksınız bu key in **passphrase** kesinlikle unutmayınız yoksa sisteme giriş yapamazsınız değiştirmek zorunda kalabilirsiniz.Buda size vakit kaybettirir.Key oluştururken size yol soracak nereye ne oluşturayım diye farklı bir yer istemiyorsanız **ENTER** tuşuna basıp devam edin

    Generating public/private rsa key pair.
    Enter file in which to save the key (/root/.ssh/id_rsa):

hepsine tamam dedikten sonra zaten keyimizi uluşturacak bizede bu keyi kullanmak kalacak.yol olarak ise belirttiğimiz yeri gösteriyor olacak şöyle ki

    our identification has been saved in /root/.ssh/id_rsa.
    Your public key has been saved in /root/.ssh/id_rsa.pub.
    The key fingerprint is:
    ee:c8:3f:1f:f2:ab:xxxxxx

Şimdi yukarıda gördüğünüz gibi bize bir **fingerprint** verdi bu şimdilik burada dursun karşılaştırma yaparken işimize yarayacak onun dışında pek bir önemi yok.Şimdi **SSH-Agent** in arkada çalıştığından emin olalım bunun için aşağıdaki kod işinize yarayacak

    eval "$(ssh-agent -s)"

direk size bir numara verecek vermez ise sıkıntı arka planda çalışmıyor demektir.Ama key oluşturabildiğinize göre yüzde 99 bu kısımda sıkıntı çıkmayacaktır.Bazı istisnalar hariç eksik kurulumlar vs Ardından oluşturduğumuz **SSH key** sisteme dahil ediyoruz.

    ssh-add ~/.ssh/id_rsa

Bu komutu verdiğiniz zaman **SSH** key oluştururken girmiş olduğunuz passphrase yi tekrar sizden isteyecek giriyoruz ve devam ediyoruz.

    root@0x2e88ce4:/home/mertcan# ssh-add ~/.ssh/id_rsa
    Enter passphrase for /root/.ssh/id_rsa:
    Identity added: /root/.ssh/id_rsa (/root/.ssh/id_rsa)

Artık sistemimize tamamen bu **SSH key** dahil edildi şimdi ise sıra geldi bu oluşturduğumuz **SSH** keyimizi github hesabımıza tanımlayalım ve test edelim. Siteye giriş yapıyoruz ve sağ üst kısımda bulunan kişisel alanımızdan **Settings** diyerek ayarlar menümüze ulaşıyoruz.

![githubgorsel1](/assets/githubgorsel1.jpg)

Alanımıza gittiğimizde sol menüde yer alan **SSH Keys** kısmına tıklıyoruz.Burada hem daha önceden tanımladığımız anahtarları görebiliyoruz hemde yeni anahtar ekleyebiliyoruz.

![githubleftsettingtab2](/assets/githubleftsettingtab2.jpg)

Tıkladığınızda karşınıza çıkan alanda **Add SSH Key** adında yeşil bir buton göreceksiniz buna tıkladığınızda ise karşınıza 2 adet boş kısım çıkıcak ilkine hangi sistemde kullanıyorsanız yada hangi ismi vermek istiyorsanız veriyorsunuz.İkincisinde ise sistemde oluşturduğunuz **SSH Key** giriyoruz.

![githubaddsshkeys](/assets/githubaddsshkeys.jpg)

Bunun için Terminalde iken cat komutu ile ekrana keyimizi basabiliriz.kullanabileceğiniz örnek bir komut ise şu şekildedir.zaten sonu .pub olan en son oluşturduğunuz **SSH** anahtar dizisini eklemeniz gerekmekte.

    cat id_rsa.pub

daha sonra oluşturduğumuz anahtarı eklediğimizde şu şekilde gözükecek ve yukarıda bahsettiğim fingerprint ile kontrol edebilirsiniz.Zaten yanlış eklediğinizde eklenmeyeceği için pek başınızı ağrıtmaz sistem anahtarların doğruluğunu kontrol ediyor.

![githubsshkeygorsel1](/assets/githubsshkeygorsel1.jpg)

Herşey tamam gibi gözüküyor şimdi ise sistemdeki ekli olan anahtar dizisini test edelim bakalım gerçekten olmuşmu bunun için aşağıdaki komutu verelim.

    ssh -T git@github.com

İşlem sonucunda karşımıza şu şekilde satırlar gelecek ve olay tamamlanmış olacak bundan sonra yapacağınız işlemlerde **SSH** linklerinden gerçekleştirmelisiniz yani **HTTPS** yerine **SSH** seçerek gerekli push işlemini gerçekleştirebilirsiniz.

![githubtestgorsel1](/assets/githubtestgorsel1.jpg)
