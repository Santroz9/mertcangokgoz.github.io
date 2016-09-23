---
layout: post
title:  Linux'de Netflix Kullanımı
date: 2016-09-23
type: post
categories: linux
description: Web TV adı altında pek çok kan emici vardı ödediğin ücret ile doğru düzgün hizmet alamıyordun ve bunu gören Netflix Türkiye piyasasına açılma kararı aldı
---

Geldiğine öncelikle sevindik çünkü türkiye piyasasında Web TV adı altında pek çok kan emici vardı ödediğin ücret ile doğru düzgün hizmet alamıyordun ve bunu gören Netflix Türkiye piyasasına açılma kararı aldı ayrıca torrentden indirip izlemek ile vakit kaybetmek ben dahil artık pek çok kişi istemiyordur diye düşünüyorum. Her ne kadar ilk başta karşı çıksamda

<blockquote class="twitter-tweet" data-lang="tr"><p lang="tr" dir="ltr">Geldik, geldik, merak etmeyin. <a href="https://twitter.com/netflix">@netflix</a> <a href="https://twitter.com/hashtag/NetflixT%C3%BCrkiyede?src=hash">#NetflixTürkiyede</a></p>&mdash; Netflix Türkiye (@netflixturkiye) <a href="https://twitter.com/netflixturkiye/status/778700644249014272">21 Eylül 2016</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

Bizde kollarımızı sıvadık ve 1 aylık ücretsiz dedikleri hesabımızı açtık ancak dikkatinizi çekerim hesap ücretsiz ancak bazı kartlardan para çekebiliyor. Örneğin Virtual card kullanıyorsanız ama merak etmeyin hesaba para geri geliyor sanırım sahte birşeyler olmasın diye kontrol aşaması var yada farklı bir prosedür işletiyorlar bilmiyorum.

Lafı uzatmadan amacımıza geçelim. Normal şartlar altında netflix **silverlight** denen uygulama ile çalışıyor. Bilindiği üzere bu uygulama sadece mac ve windows sistemler üzerinde bulunuyor. Kurulması gerekiyor. Linux tarafında Chrome tarayıcı kullananlar için bir sorun bulunmuyor **silverlight** kurmadan da izleyebilirler.

Ancak Chrome kullanmak istemeyip **Firefox** tarayıcıda dizilerini izlemek isteyenler ne yazık ki başarılı olamayacaklar. Bunu başarılı bir şekilde yapabilmek için sisteminize linux için forklanmış silverlight çalıştırmaya izin veren bir eklenti olan **pipelight** ile yapacağız. Ancak baştan söyleyeyim [pipelight](http://pipelight.net/cms/) sisteminize oldukça fazla paket indirip kuracak

Bunlar 32 bit paketler ve sistemimize bu şekilde paketler kurmak istemeyiz zaten eklentide wine ile çalışıyor diyebiliriz. Sistem için bu hiç hoş olmaz

Pipelight kurulumu şu şekilde yapacağız yaklaşık **605 MB** gibi bir yer kaplayacak.

```
sudo add-apt-repository ppa:pipelight/stable
sudo apt-get update
sudo apt-get install --install-recommends pipelight-multi
sudo pipelight-plugin --update
```

Ardından uygulamadan bize gerekli olanı etkinleştirmek kalıyor.

```
sudo pipelight-plugin --enable silverlight
```

Daha sonra Firefox eğer çalışıyor ise yeniden başlatın ve tarayıcıda izleyebilir hale getirebileceksiniz. Ancak bu yöntem benim **kesinlikle önermediğim** bir yöntemdir. Çünkü sisteminize oldukça fazla 32bit paket kuracak daha sonradan sisteminizden bunları kaldırırken sıkıntı çekebilirsiniz. Ama onun içinde size bir ipucu vereyim

```
sudo apt-get purge `dpkg --get-selections | grep i386 | awk '{print $1}'`
```

Böylelikle sistemdeki tüm 32 bit paketlerden kurtulmuş olursunuz. Unutmadan bu işlemi eğer **Skype** kullanıyorsanız yapmayın. **Skypenin** kullandığı paketlerin %80 lik bir bölümü 32 bit mimaride

En iyisi siz Google Chrome indirip kurun ve **netflix** izleyeceğiniz zaman bu tarayıcı ile dizinizi, filminizi yada belgeselinizi izleyin.

Sıralı Tam Liste

![netflixorigins](/assets/netflixorigin.png)


![netflixother](/assets/netflixother.png)

öptüm bye <3
