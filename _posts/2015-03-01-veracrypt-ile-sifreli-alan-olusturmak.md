---
layout: post
title: VeraCrypt ile Şifreli Alan Oluşturmak
date: 2015-03-01 14:26:14.000000000 +02:00
type: post
published: true
status: publish
categories: windows
description: VeraCrypt çok uzun zaman önce bir kaç açık yüzünden patlayan TrueCryptın küllerinden doğmuş bir uygulamadır TrueCrypt ile aynı özelliklere
---

**VeraCrypt** çok uzun zaman önce bir kaç açık yüzünden patlayan **TrueCryptın** küllerinden doğmuş bir uygulamadır **TrueCrypt** ile aynı özelliklere sahiptir.Kurulum ve işleyiş olarak **TrueCrypt** ile aynı olmasının yanında daha güvenlidir ve **TrueCrypt** da bulunan açıklar kapatılarak **VeraCrypt** ismini alarak yayınlanmıştır.Açık kaynak kodlu olarak proje devam etmekdedir ve bulunan açıklar anında kapatılmaktadır.

Kuruluma gelecek olursak ilk olarak uygulamayı sitesinden indirmeniz gerekiyor [indirmek için tıklayın](https://veracrypt.codeplex.com/releases/view/565079)

Uygulamayı açtığımızda karşımıza **TrueCryptın** birebir aynısı olan bir arayüz ile karşılaşıyoruz çünkü bahsettiğimiz gibi **TrueCryptın** buglarının giderilmiş hali bu yüzden adamlar kasmamış ismini değiştirmişler ve projeye devam etmişler ilk olarak istediğiniz bi sürücü adını seçiyorsunuz sonrada **"Create Volume"** diyorsunuz._Yapacağımız işlemlerde seçtiğimiz sürücü harfi aslında pek işimize yaramayacak ama ne olur ne olmaz biz seçelim._

![veracryptgorsel1](/assets/veracryptgorsel1.png)

Burada şifrelemeyi ne şekilde yapacağız sürücümü yoksa dosyamı şifreliyeceğiz onu seçmemizi istiyor bizden

1. Bu seçenekde **sanal şifreli bir sürücü** oluşturursunuz.
2. Bu seçenekde ise sistemden ayrı herhangi bir **flash disk** olabilir yada taşınabilir **HDD** olabilir şifreleyebilirsiniz
3. Bu seçenekte ise şifreli bir sistem sürücüsü oluşturabilirsiniz.Boot sırasında şifreyi soracaktır ona göre kendinizi hazırlayın

ben ilk seçeneği seçerek sanal bir sürücü/klasör da önemli bilgilerimi ve dosyalarımı tutmaya karar verdim.

![veracryptgorsel2](/assets/veracryptgorsel2.png)

Normal yada gizli alan oluşturabilirsiniz ben gözümle görmeden inanmam dediğim için ilk seçeneği seçip şifreli alanımı oluşturmaya devam ediyorum.İkinci seçeneği seçerseniz siz dahi zar zor görürsünüz.Şifresini yazmazsanızda göremezsiniz zaten biraz daha güvenli olsada size unutturabilir sıkıntı çıkabilir dikkat etmenizde fayda var

![veracryptgorsel3](/assets/veracryptgorsel3.png)

Nereye hangi dosyaya hangi isimle yeni bir alan oluşturacağız bunun seçimini yapmamız gerekiyor **USB** vs yapabilirsiniz.Eski dosyayı kullanmayın Sıfırdan dosya oluşmasına izin verin.bunun dışında " **Never save history**" seçili olmasına dikkat edin

![veracryptgorsel4](/assets/veracryptgorsel4.png)

Dosyaya uygulanacak olan şifreleme türünü seçiyoruz.Bu kısımda birden çok şifreleme türü bulunuyor istediğinizi kullanmakta özgürsünüz.Bunlar başlıca

- AES
- Serpent
- Twofish
- AES-Twofish
- AES-Twofish-Serpent
- Serpent-AES
- Serpent-Twofish-AES
- Twofish-Serpent

![veracryptgorsel5](/assets/veracryptgorsel5.png)

Oluşacak olan alanın boyutunu seçebiliyorsunuz istediğinizi yazmakta özgürsünüz güvenli alanınız ona göre boyutlanacaktır.

![veracryptgorsel6](/assets/veracryptgorsel6.png)

bu kısımda şifremizi belirliyoruz.isterseniz keyfile kullanabilirsiniz ancak bu bana göre azda olsa güvensiz bir yöntem birisinin eline geçerse dosyayı açabilirler bunun yerine daha güçlü bir şifre ile şifreleyip aklınızda tutabilirsiniz.

![veracryptergorsel7](/assets/veracryptergorsel7.png)

Alanın formatını ve parça tipi ve sayısını ayarlayabiliyorsunuz.Bunun yanında random olarak şifreleme anahtarı oluşturacağız bu bölümde bunu yaparkende mousemizi oynatmamız yeterli 1-2 dk yada 20 sn kadar mouseyi rastgele hareket ettiriyoruz tabi istediğiniz kadar bu işlemi tekrarlayabilirsiniz.Sonrasında onay veriyoruz ve güvenli şifrelenmiş alanımız oluşmuş oluyor.

![veracryptgorsel8](/assets/veracryptgorsel8.png)

Sonuç olarak alanımız oluşuyor oluştuktan sonra alanı kullanmaya başlayabilirsiniz.

![veracryptgorsel9](/assets/veracryptgorsel9.png)

_Kesinlikle unutmayınız bu tip uygulamalarda güvenlik riski bulunmaktadır.Oluşabilecek sorunlara her zaman hazırlıklı olmanızda yarar var bu yüzden çok ama çok dikkatli olmayı unutmayın._
