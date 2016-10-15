---
layout: post
title: Debian Üzerine GitLab Kurulumu( Omnibus Yöntemi)
date: 2016-10-15
type: post
categories: linux
description: Piyasada self-hosted olarak kullanabileceğiniz pek çok git uygulaması bulunmuyor. İçlerinden 2 tanesi oldukça güzel bizim için bu yüzdende
---

Piyasada `self-hosted` olarak kullanabileceğiniz pek çok git uygulaması bulunmuyor. İçlerinden 2 tanesi oldukça güzel bizim için bu yüzdende birisini seçmemiz gerekiyordu ve bu anlatımda `GitLab` seçtim hem özellikleri oldukça güzel hemde topluluk sürümü diğer uygulamalara göre daha çok özelliği bünyesinde barındırıyor.

Bu anlatım sırasında **Debian 8.6** işletim sistemi ve 4 GB ramli bir sunucu tercih ettim. Daha hızlı işlem yapabilmemiz için ramin yüksek olması gerekiyor. Minimum 1 GB ram kullanabiliriz ama swap alanının 4 gb kadar olması gerekiyor.

Temel kurulum işlemlerimiz **SMTP** servislerimiz ve bu servisin ihtiyaç duyduğu paketler ile gerekenlerin kurulması

```
apt-get install -y curl openssh-server ca-certificates postfix sudo
```

Şimdi depo yu sistemimize dahil edelim topluluk sürümünü kullanacağımız için durum şu şekilde olacak

```
curl -sS https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | sudo bash
```

Kurulumu yapmadan önce sistemdeki git sürümünü kontrol ediyoruz. çünkü Gitlab git 2.7.4 ve üst sürümlerde sıkıntısız çalışabiliyor.

```
git --version
```

Sürüm çıktısı 2.7.4 den düşük ise lütfen sisteminizde bu konuda bir güncelleme yapınız. Tüm her şeyin tamamlandığını düşünüyorsanız. Kuruluma geçebilirsiniz.

```
apt-get install gitlab-ce
```

Yaklaşık **301 MB** kadar gerekli olan dosyasını indirecek ve sisteme dahil edecek ardından şu şekilde bir çıktı ile karşılaşacaksınız.

```
       *.                  *.
      ***                 ***
     *****               *****
    .******             *******
    ********            ********
   ,,,,,,,,,***********,,,,,,,,,
  ,,,,,,,,,,,*********,,,,,,,,,,,
  .,,,,,,,,,,,*******,,,,,,,,,,,,
      ,,,,,,,,,*****,,,,,,,,,.
         ,,,,,,,****,,,,,,
            .,,,***,,,,
                ,*,.
     _______ __  __          __
    / ____(_) /_/ /   ____ _/ /_
   / / __/ / __/ /   / __ `/ __ \
  / /_/ / / /_/ /___/ /_/ / /_/ /
  \____/_/\__/_____/\__,_/_.___/

gitlab: Thank you for installing GitLab!
gitlab: To configure and start GitLab, RUN THE FOLLOWING COMMAND:

sudo gitlab-ctl reconfigure

gitlab: GitLab should be reachable at http://debian-4gb-nyc2-01
gitlab: Otherwise configure GitLab for your system by editing /etc/gitlab/gitlab.rb file
gitlab: And running reconfigure again.
gitlab:
gitlab: For a comprehensive list of configuration options please see the Omnibus GitLab readme
gitlab: https://gitlab.com/gitlab-org/omnibus-gitlab/blob/master/README.md
gitlab:
It looks like GitLab has not been configured yet; skipping the upgrade script.
```

Şimdi sıra yukarıdaki çıktının da bize söylediği gibi ayarlamalarını yapmamız gerekiyor böylelikle tüm herşeyi tamamlamış olacağız.

```
sudo gitlab-ctl reconfigure
```

Terminal ekranınızda uzunca bir süre bir takım yazılar kayacak sistem ekipmanlarını çalıştıracak kurulumları gerçekleştirecek.

Kurulumun tamamlandığını şununla anlayabilirsiniz.

```
Running handlers:
Running handlers complete
Chef Client finished, 223/311 resources updated in 01 minutes 38 seconds
gitlab Reconfigured!
```

Bu şekilde ön tanımlı kurulumu gerçekleştirdik. Ancak isterseniz de aşağıdaki dosyayı düzenleyerek özel bir kurulum gerçekleştirebilirsiniz.

```
nano /etc/gitlab/gitlab.rb
```

Peki bu dosyamızın içeriğinde neler var

{% gist MertcanGokgoz/cde01bd73b523a5b575503bf12ff983a %}

Gitlab size oldukça fazla özelleştirme imkanı sunuyor. Bunları detaylı bir şekilde bu makale içerisinde anlatmak isterdim ancak gereğinden uzun olacağından dolayı her bir ayar için ayrı bir makale düzenlemeyi düşündüm.

**dipnot**: Bu kurulum sadece normal **http** üzerinden çalışabilecek şekilde ayarları değiştirilmeden basit şekilde nasıl yapılabileceğini göstermek için yapılmıştır. **Gitlab** kurulumu omnibus paket kullanılarak gerçekleştirilmiştir. Daha detaylı kurulum ve isteğe göre konfigürasyonları yapmak için kaynaktan kurulum yapılması gerekmektedir.
