---
layout: post
title:  TMUX Komut ve Kısayolları
date: 2016-07-20
type: post
categories: Linux
description:   tmux özellikle bir çok sanal terminal açmamıza imkan sağladığı için kullanıyoruz.Ya birader bunu ben tab ile yaparım
---

Herhangi bir linux distro kullanıyorsanız en az 2-3 kez ilgilenmiş olmanız gerekiyor diye düşünüyorum **tmux** özellikle bir çok sanal terminal açmamıza imkan sağladığı için kullanıyoruz.Ya birader bunu ben tab ile yaparım en olmadı sağ tıklayıp yeni sekme açarım niye bunu kurayım boşa paket kurdurma bize ya diyen bir kaç kişiyi görür gibiyim belki onlardan biride siz olabilirsiniz.

Ancak unutmayın tam o işlemi yaptığınız esnada elektrik gitti yada internetiniz koptu hadi bunlar olmadı kullandığınız bilgisayar kendini bi şekilde kapattı yada terminal işleminizi engelleyecek bir durum oldu ne yapacaksınız ?

İşte bu noktada **tmux** bizi kurtarıyor. Açtığınız sekmeler devam edbilebilir sekmelerdir. istediğiniz zaman kapatıp gidebilirsiniz. **screen** uygulaması ile aynı görevi görür daha yeni ve daha esnek bir yapısı vardır.

Kurulumu oldukça basit her dağıtımda bulunuyor.

```console
sudo apt-get install tmux
```

Kurulum tamamlandıktan sonra ufak bir ayarlama yapmamız gerekiyor normalde ön tanımlı olarak gelen kısayol `CTRL + b` tuşudur ancak b biraz uzağımızda kaldığı için ben bunu her zaman `CTRL + a` ya getiriyorum böylelikle biraz daha hızlı işimi görüyorum.

```console
nano ~/.tmux.conf
```

içerisinde bir takım değerler olacak biz bunu şu şekilde değiştiriyoruz.

```console
unbind C-b
set -g prefix C-a
```

kayıt edip çıktıktan sonra başlattığımızda zaten aktif hale geldiğini göreceksiniz. Gelmez ise aşağıda ipucunu verdim ben oradan yola çıkarsınız artık. Şimdi geldik aydınlanmaya;

**Tmux** oturumu açılmadan önce yapabilecekleriniz;

| Komut    |    Açıklama   |
|----------|-------------|
| tmux list-sessions | Oturumları listeler |
| tmux list-keys | Kısayolları gösterir |
| tmux list-commands | Tüm komutları listeler |
| tmux source-file ~/.tmux.conf| TMUX ayarlarını yeniler |
| tmux a -t oturum_adi | oturumu sabitler |

**Tmux** oturumu oluşturulduğunda geçerli olan kısayollar;

| Komut    |    Açıklama   |
|----------|-------------|
| Ctrl-a new -s oturum_adi | Yeni adlandırılmış oturum açar |
| Ctrl-a, c | Yeni pencere açar |
| Ctrl-a, , | Ekranı adlandırmak |
| Ctrl-a, w | Ekranları listeleme |
| Ctrl-a, l | Önceki seçilen ekrana geçer |
| Ctrl-a, n | Sonraki ekrana geçer |
| Ctrl-a, p | Önceki ekrana geçer |
| Ctrl-a, d | Oturumdan ayrılma |
| Ctrl-a, s | Oturumları listeler(varsayılan), eşleşmiyor ise |
| Ctrl-a, ? | Tüm kısayolları listeler |
| Ctrl-a, % | Ekranı dikey böler |
| Ctrl-a, ” | Ekranı yatay böler |
| Ctrl-a, {or} | Ekranlar arasında geçiş |
| Ctrl-a, KeyUp | Yukarıdaki ekrana geç |
| Ctrl-a, KeyDown | Aşağıdaki ekrana geç |
| Ctrl-a, KeyLeft | Soldaki ekrana geç |
| Ctrl-a, KeyRight | Sağdaki ekrana geç |
| Ctrl-a, space | Her ekranı aynı boyutlandır |
| Ctrl-a, s | Oturumları eşitleme |

Bu aşamadan sonra benim kullandığım ve oldukça sevdiğim bir yöntem var ben bunu oturumları takip etmek için kullanıyorum. Belirli süre işlem yapmadığımda renk değişiyor ve ben son olarak işlem ney yapmışım onu görebiliyorum.

```console
setw -g monitor-silence 60
```

Böylelikle ben 1 dakika boyunca işlem yapmaz ise oturum farklı bir renk ile gözükecek bana bende anlayacağım ki orada işlem yapıyormuşum ama yapmayı durdurmuşum.

Bir diğer kullandığım olay ise aktif olan oturumun renginin değiştirilmesi onuda şu şekilde sağlıyoruz.

```console
set-window-option -g window-status-current-bg red
```

Son olarak fare ile kopyalamayı açalım ben bunu genellikle kullandığım için diğer türlü zorlandığımdan açtım isterseniz açmayabilirsiniz.

```console
setw -g mode-mouse on
```

Bu ayarları yukarıda bahsettiğim kişisel ayar dosyanıza uygulamayı unutmayın yani `~/.tmux.conf`