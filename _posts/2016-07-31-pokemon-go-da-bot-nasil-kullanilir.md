---
layout: post
title:  Pokemon GO'da Bot Nasıl Kullanılır
date: 2016-07-31
type: post
categories: Linux
description: Pokemon GO oynayan arkadaşlar bilirler dağ tepe gezmeniz gerekir. Telefon elinizde bir günüz pokemon ararken diğer gözünüzde
---

Pokemon GO oynayan arkadaşlar bilirler dağ tepe gezmeniz gerekir. Telefon elinizde bir günüz pokemon ararken diğer gözünüzde şarjın kaç kaldığına bakar yanınıza powerbank alsanız bile o şarja bakarsınız hızlı düştüğünü görürsünüz hızlı hareket edersiniz. Buraya kadar her şey gerçekten normal peki botu çıkmışken biz niye botu kurmayalım kullanımı oldukça basit geliştirilmeye devam ediliyor ve oldukça güzel özellikleri var.

**Bot** : [PokemonGo-Bot](https://github.com/PokemonGoF/PokemonGo-Bot)

# Özellikleri

* Pokestop noktalarını ziyaret eder ve poketopu toplar
* Pokemon yakalama özelliğine sahiptir
* Düşük CPsi olan pokemonları yakalamaz yada candy yapar
* Otomatik olarak yürür
* Pokestop için belirli alanlarda farm yapabilir
* İşlevsel IV filtresi ile gereksiz pokemonlar candy yapılır.( CP yüksek olsa bile IV puanı dikkate alınır)
* Otomatik geçiş modu (pokemon yakalama, poketopu yakalama)
* Belirlediğiniz pokemonları yakalamaz
* Gerektiğinde üstün top türlerini kullanmaktan çekinmez
* İtem toplar
* Pokemon yakalama filitresi
* Google MAP APİ Aracılığı ile çalışır.
* Haritada tüm objeler gözükür (GYM, pokestop)
* Pokemonları geliştirir.
* Yumurta yakalar
* Yumurtaları kırar

bunlar dışında sayamadığım pek çok özelliği bulunmaktadır. Bot genel olarak Google MAP APİ kullanır koordinatlara göre rastgele bir şekilde yürür ve pokestop noktalarını gezer. Bunu yaparken de yolda yada gittiği yerlerde rastladığı tüm pokemonları yakalar.

## Kurulum

Multiplatform olarak geliştirilmiş bir uygulamadır python kurulu olan her şeyde çalışacaktır. Windows için kurulumu oldukça zor ancak MAC ve Linux üzerine kurulumları basit ve 5 dakika içerisinde bot ile oynamaya başlayabilirsiniz.

**Windows**

[Bu linkte](http://www.lfd.uci.edu/~gohlke/pythonlibs/#pyyaml) bulunan PyYAML-3.11-cp27-cp27m-win32.whl dosyasını indirin(eğer sisteminiz 64bit ise ve hata verir ise PyYAML-3.11-cp27-cp27m-win_amd64.whl olan sürümü indirip sisteminize dahil edin)

Ayrıca [Python 2.7.x](http://docs.python-guide.org/en/latest/starting/installation/) sürümünden bir tanesinin kurulu olması gerekmektedir.

```console
cd download-directory
pip2 install PyYAML-3.11-cp27-cp27m-win32.whl
// 64 bit kullanıyorsanız aşağıdakini uygulayın
pip2 install PyYAML-3.11-cp27-cp27m-win_amd64.whl
```

Ardından yapılması gerekenler

```console
git clone -b master https://github.com/PokemonGoF/PokemonGo-Bot  
cd PokemonGo-Bot  
pip2 install -r requirements.txt
git submodule init
git submodule update
```

**MAC**

```console
git clone --recursive -b master https://github.com/PokemonGoF/PokemonGo-Bot  
cd PokemonGo-Bot  
virtualenv .  
source bin/activate  
pip install -r requirements.txt
```

**Linux**

```console
git clone --recursive -b master https://github.com/PokemonGoF/PokemonGo-Bot  
cd PokemonGo-Bot  
pip install -r requirements.txt
```

Kurulumu Linux üzerinde yapacağım zaten en stabil linux üzerinde ve MAC üzerinde çalışıyor. Komutları verdikten sonra belirttiğiniz yerde kurulum işlemleri yapılmış olacak bizim düzenleyeceğimiz iki şey var burada 

* config.json.example
* release_config.json.example

Bu iki dosyanın sonundaki `.example` yazısını kaldırıyorsunuz. Hemen ardından ana ayarlamaları yapacak olduğunuz `config.json` dosyasını herhangi bir metin editörü ile açıyorsunuz.

```json
{
    "auth_service": "google",
    "username": "YOURACCOUNT@gmail.com",
    "password": "YOURPASSWORD",
    "location": "SOME LOCATION",
    "gmapkey": "AGMAPAPIKEY",
    "max_steps": 5,
    "mode": "all",
    "walk": 4.16,
    "debug": false,
    "test": false,
    "initial_transfer": 0,
    "location_cache": true,
    "distance_unit": "km",
    "item_filter": "101,102,103,104",
    "evolve_all": "NONE"
}
```

Yukarıdaki ayarları içeren bir dosya ile karşılaşacaksınız Google hesap bilgilerinizi `username` ve `password` kısmına giriyorsunuz eğer hesabınızda 2FA aktif ise google tarafından sağlanan uygulama şifresi metodunu kullanarak bir şifre yaratın bunun işin [bu linkten](https://security.google.com/settings/security/apppasswords) faydalanabilirsiniz.

Ardından size 1 adet Google MAP Javascript APİ gerekiyor bunu edinebilmek için kullandığınız google hesabından Google APİ Console [bu link](https://console.developers.google.com/?hl=TR) aracılığı ile giriş yapıyorsunuz. Arama kısmına Google MAP Javascript APİ yazdığınızda karşınıza 1 adet seçenek çıkacak bunu seçip `Enable` diyorsunuz APİ hesabınızda aktif hale gelecek solda bulunan `Credentials` kısmını kullanarak da kendinize 1 adet browser için key oluşturun oluşturma sırasında domain sorar ise boş bırakın yada `localhost` yazın.

Geldik son olarak `location` ayarlamaya bunun için koordinat girmeniz gerekiyor koordinatları edinirken [Pokevision](https://pokevision.com/) sitesini kullanabilirsiniz. Fareniz ile işaretlediğiniz yerin koordinatları tarayıcınızın URL kısmında gözükecek kopyalayıp direk olarak json da bulunan `location` kısmına giriniz.

Yürüme hızınızı değiştirmek isterseniz.

```json
"max_steps": 5
```

bu değeri istediğiniz bir değer ile değiştirin `25` geçmeyin en ideali `15` hem hızlı hemde sıkıntısız.

Yumurta çatlatma

```json
"hatch_eggs": true,
"longer_eggs_first": true,
```

yukarıdaki iki satırıda `config.json` dosyanıza ekleyip botu çalıştırın ardından bot yumurtaları otomatik olarak kulukça cihazımıza ekleyecek ve otomatik olarak açacak bu sayede çok miktarda yumurta çatlatabilir ve XP kasabilirsiniz.

## Botu Çalıştırma

```console
python pokecli.py
```

Eğer çalıştırdığınız sırada SSL konusunda sıkıntı çıkarsa `pokecli.py` herhangi bir metin editörü ile açın 43 ve 44 numaralı satırlarda bulunan kodlara `#` ekleyin kayıt edin ve kapatın.

### Sonuç

![pokemongo-bot](/assets/pokemongo-bot.png)

### Dikkat Edilmesi Gerekenler
 
* her zaman oynadığınız konumdan daha uzaklara çıkmayın Türkiyede oynuyorsanız bir anda New York koordinatlarını girmeyin
* Yürüme hızını bahsettiğim aralıklar içerisinde girmeye özen gösterin
* Bot çalıştırırken telefondan kesinlikle oyuna giriş yapmayın ve GPS açmayın
* Botu kullanmadığınız zamanlarda telefonunuzdan oyuna giriş yapacaksanız eğer GPS kapatarak açın ve itemlerinizi yumurtalarınızı kontrol edin yapacaklarınızı yapın

Yukarıda bahsettiğim durumlara uyulmadığı zaman `Softban` denen ve oyun içinde yaklaşık 1-2 saat boyunca pokemon yakalayamadığınız bir duruma düşersiniz.

## Web Arayüz kullanımı

Botu çalıştırdınız her şey güzel ilerliyor. Kasılıyorsunuz ve pokemonları yakalıyorsunuz konsolda bunu görüyorsunuz peki ya bu bot nereden ne yapıyor ve nerelere hareket ediyor diye merak ediyorsanız işte bu web uygulaması tam sizin için düşünülmüş üstelik web arayüzünü kullanırken hesabınız hakkında detaylı bilgi sahibide olabilirsiniz.

* Hesabınızın genel özelliklerine bakabilirsiniz.
* Çantanızda hangi pokemonların olduğunu görebilirsiniz
* Pokedexinizi görebilirsiniz.
* İtemleriniz hakkında bilgi alabilirsiniz.(Potlar, Yumurtalar vb)

Kurulumu ise şu şekilde

İlk olarak sisteminize bir adet `nginx` web server kuruyorsunuz.

```console
sudo apt-get update
sudo apt-get install nginx
```

Uygulamanın web sunucusu ile iletişime geçebilmesi ve dosyaları görebilmesi için metin editörü ile ön tanımlı konfigürasyondan kök dizin değişikliği yapıyoruz.

```console
sudo nano "/etc/nginx/sites-enabled/default"
```

ardından aşağıdaki değişikliği yapıyoruz siz botu nereye indirdiyseniz o yolu vermek zorundasınız.

```console
root /home/mertcan/Desktop/PokemonGo-Bot/web;
```

Ayarların geçerli olması için nginx ayarlarını yeniliyoruz.

```console
nginx -s reload
```

![pokemongo-bot-web](/assets/pokemongo-bot-web.png)