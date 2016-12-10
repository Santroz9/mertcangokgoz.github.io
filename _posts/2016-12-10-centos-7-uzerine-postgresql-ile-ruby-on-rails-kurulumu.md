---
layout: post
title: Centos 7 Üzerine PostgreSQL ile Ruby on Rails Kurulumu
date: 2016-12-10
type: post
categories: linux
description: Ruby on Rails (RoR) veya kısa adıyla "rails", ruby'de MVC (Model-View-Controller) kavramını takip eden bir sunucu tarafı web uygulaması çerçevesidir
---

Ruby on Rails (RoR) veya kısa adıyla "rails", ruby'de MVC (Model-View-Controller) kavramını takip eden bir sunucu tarafı web uygulaması çerçevesidir. RoR açık kaynak kodlu MIT Lisansı altında yayınlandı. Rails, veritabanları, web hizmetleri ve web sayfaları için varsayılan yapılar sağlar. Rails yaygın olarak kullanılmaktadır ve bugüne kadar 3000'den fazla kişi Rails projesine kod eklemiştir Github, Airbnb, Soundcloud gibi Rails'e dayanan birçok web uygulaması bulunmaktadır.

Kurulum aşaması

```
yum install curl
curl -sSL https://rvm.io/mpapis.asc | gpg --import -
curl -sSL https://get.rvm.io | bash -s stable --ruby
```

Komutlar, önce gerekli paketleri (paket bağımlılıkları) yükleyecek ve en son kararlı RVM sürümünü indirip kuracaktır.

Şimdi, aşağıdaki komutu çalıştırarak RVM'yi kullanmaya başlayabiliriz

```
source /usr/local/rvm/scripts/rvm
```

Ruby Kurulumuna başlayalım

```
rvm get stable --autolibs=enable
rvm install ruby-2.3.1
rvm --default use ruby-2.3.1
```

Başarılı bir şekilde kuruldu ise aşağıdaki komut ile sürüm bilgisine bakabilirsiniz

```
ruby -v
```

Rails, assetleri derlemek için bir JavaScript'e ihtiyaç duyar. Bunun için NodeJS kurulumunu yapıyoruz.

```
curl -sL https://rpm.nodesource.com/setup_6.x | sudo -E bash -
yum -y install nodejs
```

Gem'i güncelleştirip yapılandırmasını yapalım sonuçta bir sunucu ve geliştirme ortamı kuruyoruz. Gereksizlerin kurulması işimize yaramaz sistem gemlerini güncellememiz yeterli

```
gem update --system
gem -v
```

**.gemrc** dosyasına aşağıdaki satırı ekleyerek her gem kurulum belgelerini yüklemeyi devre dışı bırakabilirsiniz. Sabit disk alanı kazandıracağından burada internet üzerinden belgeleri okumayı tercih edeceğiz. Ve unutulmamalıdır ki bu işlem isteğe bağlı bir işlemdir. 

```
echo "gem: --no-document" >> ~/.gemrc
```

Tüm bu işlemleri başarılı bir şekilde geçtiğimize göre **Ruby On Rails 5** kurulumuna geçebiliriz

```
gem install rails -v 5.0.0
```

Kurulum başarıyla tamamlandığında rails sürümünü kontrol etmeyi unutmuyoruz

```
rails -v
```

### Rails Geliştirmek için PostgreSQL Veritabanı Ayarlamalarının yapılması

Bu adımda PostgreSQL'i rails'in geliştirilmesi için hazırlayacağız. Ruby on Rails, MySQL, SQLite (Varsayılan) ve PostgreSQL gibi birçok veritabanını desteklemektedir. Veritabanı olarak PostgreSQL'i kullanacağız.

```
yum -y install postgresql-server postgresql-devel postgresql-contrib
```

Şimdi veritabanı sunucusunu initdb komutu ile başlatmalıyız.

```
postgresql-setup initdb
```

Varsayılan olarak, **CentOS** sunucusunda **PostgreSQL** şifre tabanlı kimlik doğrulamasına kesinlikle izin vermez. RoR kurulumu için **PostgreSQL** yapılandırmasını bir şifre ile girişlere izin verecek şekilde düzenlememiz gerekiyor.

```
yum install nano
nano /var/lib/pgsql/data/pg_hba.conf
```

Kimlik doğrulama yöntemini `md5` olarak değiştiriyoruz.

```
# IPv4 local connections:
host    all             all             127.0.0.1/32            md5
# IPv6 local connections:
host    all             all             ::1/128                 md5
```

ve servisi yeniden başlatıyoruz.

```
systemctl start postgresql
```

Yükleme tamamlandığında, su ile kabuk üzerinde `postgres` kullanıcısı olarak girin ve postgresql kabuğuna (psql) erişin.

```
su - postgres
psql
```

Aslında bu işlem tüm sistemler için aynı şifre tanımlaması yapmaktan başka bir işe yaramıyor.

```
\password postgres
Enter new password:
```

Sonra, bu komutla rails geliştirilmesi için `rails-dev` adlı yeni bir rol oluşturun:

```
create role rails_dev with createdb login password 'admin123';
```

Benim şüphelerim var bana kuralları göster dostum diyorsan

```
\du
```

Şimdi bir uygulama oluşturalım bakalım RoR çalışıyormu

rails komutu ile ilk uygulamamızı kolayca oluşturabiliriz. PostgreSQL'i varsayılan veritabanı olarak kullanarak yeni bir uygulama oluşturun.

```
rails new testcanisi -d postgresql
```

Bu komut, yeni bir dizin 'testcanisi' oluşturacak ve PostgreSQL veritabanına bağlanmak için rails tarafından gerekli olan "pg" gemini de içeren yeni bir gem yükleyecektir.

'testcanisi' dizinine gidin ve config dizininde `database.yml` dosyasını düzenleyin.

```
cd testcanisi/
nano config/database.yml
```

dosya içerisinde 32.satıra denk gelen kısımları yukarıda ayarladığımız şekilde değiştiriyoruz.

```
username: rails_dev
password: admin123
host: localhost
port: 5432
```

dosyayı kayıt edip editörden başarılı bir şekilde çıkış yapıyorsunuz. Ardından, veritabanını rails komutu ile oluşturun aynısı django tarafındada var bilenler bilirler

```
rails db:setup
rails db:migrate
```

Sonra rails sunucusunu aşağıdaki komutu kullanarak çalıştırın:

```
rails s -b >sunucu-ip> -p 8080
```

İp adresine baktığınızda karşınızda RoR'un kullandığı ön tanımlı sayfayı göreceksiniz ve onu gördüğünüzde kurulumu başarılı bir şekilde yaptığınızı anlayabilirsiniz.

Artık RoR uygulamaları geliştirebilir veya geliştirilmiş herhangi bir uygulamayı canlıya alabilirsiniz.