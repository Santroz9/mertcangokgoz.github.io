---
layout: post
title: Rust Yeni Bir Programlama Dilinin Doğuşu
date: 2016-10-03
type: post
categories: programlama
description: Öncelikle geleceğin yazılım diline hoşgeldiniz rust programlama dili geliştirileli yaklaşık 6 yıl kadar oluyor. Karşımıza ilk olarak 2010 yılında Mozilla tarafından duyurulması ile birlikte çıktı.
---

Öncelikle geleceğin yazılım diline hoşgeldiniz rust programlama dili geliştirileli yaklaşık 6 yıl kadar oluyor. Karşımıza ilk olarak 2010 yılında Mozilla tarafından duyurulması ile birlikte çıktı. İnanmayabilirsiniz ama uygulama 2011 yılında kendi kendini compile ederek self hosted bir şekilde piyasaya sürüldü

Çok değil sadece 1 yıl kadar önce ise kararlı sürümünün yayınlanması ile hayatımıza tam anlamıyla giriş yaptı yaklaşık 5 yıl kadar bir süre geliştirilmeye devam etti ve pek çok dilin artı yanlarını alan bir dil oldu bahsedeceklerim sizi biraz şaşırtabilir ancak rust tam olarak orjinal bir dil değil bunun en büyük özelliği yukarıda bahsetmiş olduğum dillerin güzel özelliklerini içinde barındırıyor olmasıdır.

Peki **Rust** hangi dillerden özellik alarak ortaya çıktı bildiklerimi yazmakla başlayayım C#, C++, Python, Ruby, Go Gibi bu dillerden tam olarak hangi özellikleri aldı işin doğrusu tam olarak bilmiyorum çünkü gerekli olmadığını düşünüyorum kısa bir şekilde bilsek bize yeter. Uzatmadan rust hakkında bir kaç güzel özelliktende bahsedelim;

**Rust** bellek güvenliğinide beraberinde getiren bir dildir. Ram de her hangi bir taşmaya sebebiyet vermemektedir. Bunun en büyük artısı oluşturulan uygulamalar çok fazla işlem yapsa dahi sistem belleğini sömürmemesidir.

Buna en iyi örnek **Rust** dili ile geliştirilen ve gelecek yıllarda yerini alacak olan [Servo Tarayıcısı](https://mertcangokgoz.com/gelecegin-tarayici-motoru-servo/) çok güzel gösterilebilir. Bu blog yazısından yaklaşık 8 ay önce yayınlanan servo sürümü ile 8 ay sonra ki yayınlanan sürümde oldukça farklılıklar bulunmakta sorunsuz bir şekilde çalışmakta ve siz internet'te gezerken bu kararsız haliyle bile sadece 20 MB ram tüketmektedir. CPU ise sadece 0,1 kullanır.

Hal böyle olunca dili geliştiren arkadaşlar buna [Borrowing](https://doc.rust-lang.org/book/references-and-borrowing.html) demişler ve çok cici bir şekilde dokümantasyona eklemişler. Bu özellik sayesinde ramde tutulan pointerlar yeri geldiğinde boşaltılabilmekte böylelikle ram kullanımında ciddi anlamda düşüşler görünecektir.

Şimdi dokümantasyonu okuyan arkadaşlar olacaktır ve diyeceklerdir ya bu dil nesne yönelimli bir dil değil bize sıkıntı çıkartmasın geride kalmadı mı bunlar ya... Evet kalmadı çünkü rust bunu göz önüne alıp dili ona göre geliştirmiş ve size bir sıkıntı çıkartmayacak şekilde dizayn edilmiş.

Rust dili compiler oldukça güzel bir şekilde dizayn edilmiştir ki siz derleme komutunu verdiğiniz andan itibaren kodu denetler her dilde olduğu gibi ilginç derleme hataları almazsınız oldukça açıklayıcı ve neyin nerede yanlış gittiğini açıklayan hata kodları döndürür size. Örnek olarak aşağıdaki hata formatı gösterilebilir. 1.12 Sürümü ile birlikte dahada güçlendirilmiştir.

![trait error](/assets/mismatched-trait-error.png)

Şimdiden belirtmekte fayda var Rust bildiğiniz tüm dillerin dışında bir yapıya sahiptir. Şaşırabilir hatta program yazamayabilirsiniz korkmayın alışma ile alakalı bir durum dokümanlarına göz attıysanız bununda üstesinden gelebilirsiniz. C ve C++ ile uğraşamadıysanız syntax size biraz farklı gelebilir.

Ben linux dağıtımı kullandığım için kurulumu kendimce(tabi onurunda yardımları oldu bazı aşamalarda) anlatacağım özellikle geliştiriciler için yayınlanan gecelik sürümü kullanacağız bunun en büyük artılarından bir tanesi elimizde her daim güncel bir dilin derleyicisi olacak ayrıca rust da yazılan pek çok uygulama gecelik derlemeyi yani geliştirici sürümünü kullanmaktadır.

Linux için kurulum aracımıza geçiyoruz.(Bu işlemi **root** kullanıcısı ile yapmayınız **normal kullanıcı** ile kurulumu yapmanız gerekmektedir.)

```
curl https://sh.rustup.rs -sSf | sh
```

Bu uygulama **beta** olmasına rağmen bize oldukça tatlı özellikler sunacak sürüm seçebilmekte bunlardan bir tanesi

Gelen ekranda siz direk olarak 2 seçeneğini seçiyorsunuz ilk gelen host triple seçeneğini boş bırakıyorsunuz ardından gelen sürüm bilgisinde ister stable kurabiliriz istersek de **nightly** sürüm kurabilirsiniz. Korkmayın gecelik sürüm bile stable kalitesindedir.

Seçiminizi tamamladığınızda PATH ayarlamanız için bir soru soracak **y** deyip devam ediyorsunuz. Biraz beklediğinizde rust sisteminize kurulmuş olacak

Bu kurulum aracının güzelliği her gün yayınlanan yeni sürümleri sisteminize kurma imkanı sağlamasıdır.

Kurulum aracının özellikleri bunlarla sınırlı değildir. `rustup -h` komutu ile çok rahat bir şekilde özelliklerine bakabilirsiniz. Aşağıdaki gibi bir çıktı verecektir size

```
rustup 0.6.3 (a0e2132 2016-08-28)
The Rust toolchain installer

USAGE:
    rustup [FLAGS] [SUBCOMMAND]

FLAGS:
    -v, --verbose    Enable verbose output
    -h, --help       Prints help information
    -V, --version    Prints version information

SUBCOMMANDS:
    show         Show the active and installed toolchains
    update       Update Rust toolchains
    default      Set the default toolchain
    toolchain    Modify or query the installed toolchains
    target       Modify a toolchain's supported targets
    component    Modify a toolchain's installed components
    override     Modify directory toolchain overrides
    run          Run a command with an environment configured for a given toolchain
    which        Display which binary will be run for a given command
    doc          Open the documentation for the current toolchain
    man          View the man page for a given command
    self         Modify the rustup installation
    set          Alter rustup settings
    help         Prints this message or the help of the given subcommand(s)


rustup installs The Rust Programming Language from the official
release channels, enabling
you to easily switch between stable, beta,
and nightly compilers and keep them updated.
It makes cross-compiling
simpler with binary builds of the standard library for common
platforms.

If you are new to Rust consider running `rustup doc --book`
to learn Rust.
```

Burada kullandığınız mevcut sürümü görebilir ve kurulumları güncelleyebilir yada kurulumu tekrar düzenleyebilirsiniz. Rust'ın resmi sitesinde bu kurulum şuan bulunmadığını fark ettim oradan kurarsanız da telaşlanmayın silip tekrar yükleyebilirsiniz veya tekrar aynı komut ile yeni sürümü kurabilirsiniz

Rustup ile sürüm güncellemek

```
rustup update
```

Sürüm bilgisine ulaşmak

```
rustup show
```

Kullanılan sürümleri değiştirmek

```
rustup toolchain
```

Kurulum aracının dışında sistemde bulunan paketlerden kurabilirsiniz özellikle debian kullanan arkadaşlar için güzel olacaktır.

```
apt-get install rustc cargo
```

Yukarıda kurulumda gördüğünüz **cargo** nedir diyecekseniz demeyin bu rust için geliştirilmiş bir paket yöneticisidir. Aynı zamanda proje oluşturup üzerinde çalışmanızada izin verir. Ayrıca binary olarakta uygulamaları kurabileceğiniz bir ortamdır.

cargoda ne yapabileceğinize kısaca bir göz atalım

```
Rust's package manager

Usage:
    cargo <command> [<args>...]
    cargo [options]

Options:
    -h, --help          Display this message
    -V, --version       Print version info and exit
    --list              List installed commands
    --explain CODE      Run `rustc --explain CODE`
    -v, --verbose ...   Use verbose output
    -q, --quiet         No output printed to stdout
    --color WHEN        Coloring: auto, always, never
    --frozen            Require Cargo.lock and cache are up to date
    --locked            Require Cargo.lock is up to date

Some common cargo commands are (see all commands with --list):
    build       Compile the current project
    clean       Remove the target directory
    doc         Build this project's and its dependencies' documentation
    new         Create a new cargo project
    init        Create a new cargo project in an existing directory
    run         Build and execute src/main.rs
    test        Run the tests
    bench       Run the benchmarks
    update      Update dependencies listed in Cargo.lock
    search      Search registry for crates
    publish     Package and upload this project to the registry
    install     Install a Rust binary

See 'cargo help <command>' for more information on a specific command.
```

bunların bazılarını açıklamak gerekirse

```
cargo install mdbook
```

Bu komut ile hem uygulamanın çalışması için gerekli olan tüm bağımlılıklar indirilecek hemde bu indirilenler derlenip size bir binary hazırlanacak ve sisteminizde bunu kolaylıkla kullanabileceksiniz

Bu kurulan uygulamalar kullanıcı adınızın altında bulunan `.cargo` klasörü içerisinde olacak silmek istersenizde bu klasörü kaldırarak uygulamayı temizleyebilirsiniz.

```
cargo new test_uygulama --bin
```

Yeni bir proje oluştururken bu komutu ullanıyoruz. `--bin` binary olduğunu ifade etmektedir. Binary çalıştırılabilir dir dosya olduğunu ifade edip uygulamayı ona göre oluşturmayı sağlar eğer kütüphane için bir proje oluşturacaksanız o zaman `--bin` kullanmamanız gerekiyor böylelikle `src` dizini içerisinde sadece `lib.rs` olacak

İçerisinde `src` dizini haricinde `Cargo.toml` adlı bir dosya bulunmaktadır. Bu dosya sizin projeyi derleyebilmeniz için gerekli olan meta dataları tutacak olan bir dosyadır. Yazdığınız uygulamayı ise

```
cargo build
```

Komutu aracılığı ile kolaylıkla derleyebilirsiniz. Derleyip daha sonra çalıştırmak zorunuza gidiyor ise bunun için direk olarak

```
cargo run
```

Komutunu kullanmanız işinizi görecektir. Derlendikten sonra otomatik olarak uygulama çalıştırılacaktır.

Burada dikkat etmeniz gereken bir şey bulunuyor derleme işleminden sonra aynı proje dosyası içerisinde `Cargo.lock` adında bir dosya oluşturuğunu göreceksiniz bu dosya bağımlılıklar hakkında tam kaydı tutmaktadır. El ile kesinlikle düzenlemeyin, bu iş için `Cargo.toml` kullanılacaktır uygulamanızı geliştirirken lütfen hataya düşmeyin

Bağımlılıkları güncellemek

```
cargo update
```

var olan bir uygulamayı test etmek istiyorsanız aşağıdaki komutu kullanabilirsiniz daha detaylı kullanım örnekleri için [Testing](https://doc.rust-lang.org/book/testing.html) dokümantasyonuna göz atmayı unutmayın.

```
cargo test
```

Rust dili ile uygulama yazarken lütfen kodunuzun içerisine yorumlar eklemeyi ve neyin ne işe yaradığını yazmayı unutmayın. Bu rust için oldukça önemlidir işte bu yüzden de açık kaynak kodlu dokümantasyon işlemi için Onur Aslan tarafından geliştirilmiş [Docs.rs](https://docs.rs/) işinizi fazlasıyla görecektir.

Geleceğin yazılım diline hoşgeldiniz

**dipnot:** Bu makele rust dilini kısa bir şekilde tanıtmak için yazılmıştır. Hatalar olabileceği gibi eksikliklerinde olması doğaldır.
