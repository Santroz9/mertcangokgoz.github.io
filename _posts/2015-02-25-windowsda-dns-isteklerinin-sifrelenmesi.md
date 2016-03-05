---
layout: post
title: Windows'da DNS İsteklerinin Şifrelenmesi
date: 2015-02-25 14:24:23.000000000 +02:00
type: post
published: true
status: publish
categories: Windows
description: DNS isteklerinin ne denli önemli olduklarını geçtiğimiz yıllarda türkiyenin başından geçen ve benimde bahsettiğim DNS Spoofing vakasından sonra
---
**DNS** isteklerinin ne denli önemli olduklarını geçtiğimiz yıllarda türkiyenin başından geçen ve benimde bahsettiğim [DNS Spoofing](http://sosyalmedya.co/turkiye-dns-spoofing/) vakasından sonra anlamış olmamız gerekiyor cümlenin devrik olmasına aldanmayın ve makaleyi okumaya devam etmenizi öneririm.Bizim ülkemiz boş durmayığ şifreli yapılan dns isteklerinide aykırı olduğu için yasaklamıştı.tabiki bu konuda liste uzun olduğu için çoğu şifreli dns sunucusu ülkemizde hala aktif olarak kullanılabiliyor.Hangi mantıkla bazılarını kapattıklarını bilmiyorum öğrenmek dahi istemiyorum.Herneyse bu makalemizde **OpenDNS** nin geliştirmekde olduğu ve isteklerin şifreli olarak herhangi bir manipülasyona yada değişime mağruz kalmadan kişiye ulaşmasından geçiyor aslında bu proje.

Kurulumu biraz uğraştırsada kurulum bittikten sonra **DNS** istekleriniz şifreli bir şekilde aktarılmaya başlıyor.Türkiye gibi bir ülkedeyseniz bence işinizi fazlasıyla görecektir.Lokal bir **DNS** sunucumuz olacak diyebilirim.

ilk olarak [Bu adresden](http://download.dnscrypt.org/dnscrypt-proxy/) uygulamanın windows için uygun olan sürümünü indirelim.

daha sonra indirdiğimiz bu dosyanın içerisindekileri C sürücüsüne oluşturduğumuz bir klasöre taşıyalım ben **DNSCrypter** olarak adlandırdım klasörü

![dnscrypgorsel1](/assets/dnscrypgorsel1.png)

içerisine gereken tüm dosyaları yani _"bin,include,plugins"_ kuruluma gelmişiz demektir bu adımdan sonra yapacaklarınız sisteminize zarar vermez ancak ayarlamalardan sonra internetiniz kesilebilir şimdiden uyarayım.

Dosyaların olduğu yere bir bat dosyası oluşturmamız gerekiyor bunu yapacağımız klasörde **bin** klasörü ayrıca bu klasör içerisinde **dnscrypt-resolvers** diye bir dosya olması lazım eğer yok ise [buradan](https://github.com/jedisct1/dnscrypt-proxy/raw/master/dnscrypt-resolvers.csv)indirip **bin** klasörüne atmanız yeterli

Bağlantıda bir sıkıntı varmı yokmu diye test parametresi ile deneme yapıyoruz ve çıkan sonuç

![dnscrypttestgorsel1](/assets/dnscrypttestgorsel1.png)

Test için kullandığımız komut için bir bin klasöründeki .bat dosya içeriğimiz

    dnscrypt-proxy.exe --resolver-name=opendns --resolvers-list="dnscrypt-resolvers.csv" --test=0
    pause

Şimdi testimiz başarılı bir şekilde yapıldığını gördük bize geri dönüş olarak bir benzersiz parmak izi gönderdi ve sertifikanında geçerli olduğunu görüyoruz dikkat etmeniz gereken bir nokta var sistem SSL kullanmıyor OpenDNS tarafından [curve25519](http://dnscurve.org/crypto.html) kullanılıyor böylelikle bağlantının deşifre edilmesinin önüne birazda olsa geçilebiliyor.

Şimdi ise kurulum parametremize geliyor sıra bu aşamada istediğiniz dns yi kullanabilirsiniz bin dosyası içerisindeki **dnscrypt-resolvers** [buradan](https://github.com/jedisct1/dnscrypt-proxy/blob/master/dnscrypt-resolvers.csv)açıp **Name** kısmında yazanı _"--resolver-name"_ kısmına girip istediğiniz dns sunucusunu kullanabilirsiniz.

Ben ağanın eli tutulmaz dedim ve geliştirici firmanın dns sunucularını kullanmaya karar verdim ve kurulum parametresini aşağıdaki gibi ayarlayıp bıraktım.

    dnscrypt-proxy.exe --resolver-name=opendns --resolvers-list="dnscrypt-resolvers.csv" --install
    pause

![dnscrypterinstallgorsel2](/assets/dnscrypterinstallgorsel2.png)

Bundan sonra **DNSCrypt** sisteminize dahil edilecek ve sisteminizdeki **DNS** adreslerini _127.0.0.1_ yönlendirme yaparak kullanabileceksiniz.Kurulumunu yaptığınız konumdan dosyaları silmemenizi öneririm yoksa çalışmayacaktır.Her sistem başlangıcında arka planda çalışmaya devam edecektir.

# **Dns değiştirmek için ise aşağıdaki adımları uygulayabilirsiniz.**

**IPv4** için ayarlamalar aşağıdaki gibi yapılacaktır.

![dnsnasilayarlanir](/assets/dnsnasilayarlanir-e1423966194377.png)

**IPv6** için ayarlamalar ise aşağıdaki gibi yapılacaktır.

![dnsnasilayarlanirv6](/assets/dnsnasilayarlanirv6-e1423966274246.png)

IPv6 da ise görüldüğü gibi DNS ye **::1** yazıyoruz böylelikle **IPv6** istekleride artık _127.0.0.1_ den geçiyor olacak.
