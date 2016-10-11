---
layout: post
title: Nodejs Paketlerini Rootsuz Kurabilme Yetisi
date: 2016-10-11
type: post
categories: linux
description: Githubun kapatılması ve sonrasında tekrardan gelmesi ile birlikte yazılarımıza devam ediyoruz. Bildiğiniz gibi nodejs javascriptin
---

Githubun kapatılması ve sonrasında tekrardan gelmesi ile birlikte yazılarımıza devam ediyoruz. Bildiğiniz gibi nodejs javascriptin sunucu tarafında takılan sürümü v8 javascript motoru üzerinde çalışıyor google amca arkasında bununda. Bu arkadaş ile oldukça güzel uygulama yazanlar var kafalar pırıl pırıl ve ciddi anlamda işe yarar uygulamalar doğuyor gönül isterdi ki bizde yazabilelim ama `java to javascript is car to carpet` olduğundan dolayı işimiz yaş.

Ben sisteme paket yükleme dışında genel anlamda yapılan dış kaynaklardan alınan dosyaların root izni ile kurulmasına karşı bir insanım gerek güvenlik gerekse kolaylık açısından home dizini altındaki kullanıcıya tanımlamak gerektiğini düşünüyorum.

Hem yedekleme de hemde kullanıcıların dosyaları yönetmesinde kolaylık olacak her işlemde ikide bir root olup yok şunu kur şunu ayarla kafasına girmeyeceğiz. Eskiden olsa belki yapardık ancak şimdilerde pek hoş olmaz

Sisteminizde nodejs ve npm paket yöneticisi yüklüdür diye düşünüyorum ve normal kullanıcı ile nasıl işlem yapılır bunu göstermek istiyorum.

İlk önce node'nin paket yöneticisine yani **npm** ye diyoruz ki işte bizim yeni yolumuz şu ama bunu derken root olmayın normal kullanıcı ile bu işlemlerin yapılması gerekiyor.

```
npm config set prefix=$HOME/node
```

daha sonra `bashrc` düzenlemesi yapıyoruz ki bu alana kurulan uygulamaları terminalde çalıştırabilelim.

```
export PATH=$HOME/node/bin:$PATH
```

Şimdi bu ayarlamaları yapınız terminali açıp kapattınız `npm` artık hazır normal kullanıcı ile istediğinizi kurdurabilirsiniz. Path ayarlaması yapıldı gerekli olan düzenlemelerde yapıldı şimdi size kalan uygulamalarınızı kurmak

öptüm bye <3