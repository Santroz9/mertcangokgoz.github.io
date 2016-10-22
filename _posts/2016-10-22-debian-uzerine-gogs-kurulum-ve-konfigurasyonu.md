---
layout: post
title: Debian Üzerine Gogs Kurulum ve Konfigürasyonu
date: 2016-10-22
type: post
categories: linux
description: Self-hosted olarak kullanılabilecek en güzel uygulamalardan 2.si olan Gogs gitlab'a göre daha hızlı ve daha az sistem kaynaklarını tüketen
---

**Self-hosted** olarak kullanılabilecek en güzel uygulamalardan 2.si olan **Gogs**, gitlab'a göre daha hızlı ve daha az sistem kaynaklarını tüketen bir git uygulaması ikisini kuran bilir biri 4 GB lik bir sistem isterken diğeri hiç bir sorun çıkartmadan 1 GB lik bir sistemde çalışabiliyor. kişisel kullanımlar için oldukça güzel ve arayüzü oldukça başarılı

İşleme başlamadan hemen önce `hostname` ayarlıyoruz.

```
echo "venus" > /etc/hostname
hostname -F /etc/hostname
```

Şimdi IP adresi hostname ile ilişkilendirelim. Bunun için şu adımı uygulayabilirsiniz.

```
nano /etc/hosts/
```

içerisine tanımladığımız hostname ye IP adresini tanımlıyoruz. `venus` hostnameine direk olarak `162.243.73.162` numaralı ip adresini tanımladık ve şu şekilde tamamlandı kayıt edip çıkışımızı yapıyoruz.

```
127.0.0.1	localhost
127.0.0.1	debian
162.243.73.162	venus
```

yada

```
hostnamectl set-hostname venus
```

tabi bundan sonra ip tanımlaması yapmanız gerekiyor. Kendisi IP tanımlaması yapmaz sadece `hostname` ayarlaması yapar

Ayarlamamızı yaptıktan sonra şimdi kurulum işlemlerine rahatlıkla geçebiliriz. İlk olarak sistemi güncelliyoruz.

```
sudo apt-get update && sudo apt-get upgrade
```

Güncelleme işleminden hemen sonra `git` uygulamasını sisteme dahil ediyoruz.

```
sudo apt-get install git
```

İşlemleri yapacağımız bir kullanıcı ekliyoruz. Gerekli değil ama ekleseniz hiç fena olmaz ben `gitclient` adında bir kullanıcı oluşturdum

```
sudo adduser --disabled-login --gecos 'Gogs' gitclient
```

Kurulumlar için gitclient kullanıcısı ile giriş yapıyoruz ve go kurulumunu gerçekleştiriyoruz.

```
sudo su - gitclient
mkdir $HOME/local && cd $_
```

Şimdi normalde debian depoları içerisindeki golang paketini kurardık ancak **Gogs** 1.7 sürümü ve üstünü istediği için indirip ekleyeceğiz

```
wget https://storage.googleapis.com/golang/go1.7.linux-amd64.tar.gz
tar -C /home/gitclient/local -xvzf go1.7.linux-amd64.tar.gz
```

Şimdi gerekli olan `.bashrc` düzenlemesini yapıyoruz. el ile düzenleyebileceğiniz gibi aşağıdaki gibi de ekleme yapabilirsiniz.

```
echo 'export GOROOT=$HOME/local/go' >> $HOME/.bashrc
echo 'export GOPATH=$HOME/go' >> $HOME/.bashrc
echo 'export PATH=$PATH:$GOROOT/bin:$GOPATH/bin' >> $HOME/.bashrc
source $HOME/.bashrc
```

Kullandığınız terminalden çıkış yapıp tekrar girdiğinizde işlem tamamlanmış olacak. `go version` dediğimizde çıktı veriyor ise artık **go** kullanabiliriz demektir.

```
go get -u github.com/gogits/gogs
```

indirme işlemi tamamlandıktan sonra kaynak dosyanın bulunduğu dizine geçiyoruz ve derleme işlemini başlatıyoruz.

```
cd $GOPATH/src/github.com/gogits/gogs
go build
```

İşlem tamamlandıktan sonra servisi çalıştırabiliriz.

```
./gogs web
```

Direk olarak uygulama localde `3000` portunu dinlemeye başlayacak. Ama ben bunu değiştireceğim.

```
./gogs web --port=1990
```

Şimdi sıra geldi veritabanı'nı ayarlamaya bunun için önerilen mysql olsada biz **postgreSQL** kullanalım ama önce `gitclient` kullanıcısından çıkış yapalım

`exit`

Veritabanı için kurulumu gerçekleştirelim

```
sudo apt-get install postgresql postgresql-client libpq-dev
```

postgresql konsoluna giriş yapalım

```
sudo -u postgres psql -d template1
```

yeni bir kullanıcı oluşturalım ve parolasını belirleyelim.

```
CREATE USER gogsweb CREATEDB;
\password gogsweb
```

Veritabanını oluşturalım.

```
CREATE DATABASE gogs OWNER gogsweb;
```

`psql` konsolundan çıkış yapalım

```
\q
```

Merak edenler **PostgreSQL** de kullanabileceği komutları gösteren [Komut ve kısayollar](https://mertcangokgoz.com/postgresql-komut-ve-kisayollari/) makalemize göz atabilirler.

Şimdi sıra geldi **NGINX** ile gogs uygulamasını proxy işlemi ile genele açmaya bunun için aşağıdakileri uygulamanız yeterli

```
sudo apt-get install nginx
```

Kurulum tamamlandıktan sonra aşağıdaki komutun tamamını kopyalayıp terminale yapıştırın. **SSL** kullanacağımız için self-signed **SSL** olması yeterli diye düşünüyorum bunun için daha önceden hazırladığımız [NGINX İçin Self-Signed SSL Sertifikası Oluşturma](https://mertcangokgoz.com/nginx-icin-self-signed-ssl-sertifikasi-olusturma) makalemize göz atabilirsiniz.

```
cat > /etc/nginx/sites-available/default <<EOF
server {
    listen 80 default_server;
    listen [::]:80 default_server;
    
    server_name git.mertcangokgoz.com;
    return 301 https://$host$request_uri;
}

server {
    listen 443 ssl;
    listen [::]:443 ssl;
    
    server_name git.mertcangokgoz.com;

    ssl_certificate /path/to/git.mertcangokgoz.com.crt;
    ssl_certificate_key /path/to/git.mertcangokgoz.com.key;
    ssl_session_timeout 1d;
    ssl_session_cache shared:SSL:50m;
    ssl_session_tickets off;

	ssl_dhparam /path/to/dhparam.pem;

    ssl_protocols TLSv1.2;
    ssl_prefer_server_ciphers on;

    ssl_ciphers 'ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-CHACHA20-POLY1305:ECDHE-RSA-CHACHA20-POLY1305:ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-SHA384:ECDHE-RSA-AES256-SHA384:ECDHE-ECDSA-AES128-SHA256:ECDHE-RSA-AES128-SHA256';

    add_header Strict-Transport-Security max-age=31536000;

    location / {
        proxy_set_header X-Real-IP $remote_addr;
        proxy_pass http://localhost:1990;
    }
}
EOF
```

ardından nginx'imizi yeniden başlatıyoruz.

```
systemctl restart nginx
```

İşlemimiz tamamlandı artık alan adınızdan kişisel git sisteminize ulaşabilirsiniz. Ama bir sorunumuz var oda sistem yeniden başlatıldığında uygulamaların başlatılamaması onun içinde aşağıdaki gibi bir **service** düzenleyebilirsiniz.

```
sudo nano /etc/systemd/system/gogs.service
```

 dosyanın içeriği aşağıdaki gibi olmalı kullanıcı adınızı değiştirdiyseniz ona göre düzenlemeyi unutmayın

```
[Unit]
Description=Gogs (Go Git Service)
After=syslog.target
After=network.target
After=postgresql.service
After=nginx.service

[Service]
Type=simple
User=gitclient
Group=gitclient
WorkingDirectory=/home/gitclient/go/src/github.com/gogits/gogs
ExecStart=/home/gitclient/go/src/github.com/gogits/gogs/gogs web
Restart=always
Environment=USER=gitclient HOME=/home/gitclient

[Install]
WantedBy=multi-user.target
```

Servisi aktif hale getirip başlatıyoruz.

```
sudo systemctl enable gogs
sudo systemctl start gogs
```

Bundan sonra ise yukarıdaki ayarlamış olduğumuz veritabanı bilgileri ile kurulumu sonlandırmak

```
Veritabanı bağlantısı : 127.0.0.1:5432
Veritabanı kullanıcısı :  gogsweb
Veritabanı adı: gogs
Veritabanı parola: <belirlediğiniz şifreniz>
```

Tüm işlemleri tamamladıktan sonra direk olarak `Install` butonuna bastığınızda işlemimiz tamamlanmış olacak ve alan adınızdan rahatlıkla giriş yapabileceksiniz.

---

Bu kadar iş ile uğraşamam bana kolay yöntemini ver diyorsanız oda şu şekilde

```
wget -qO - https://deb.packager.io/key | sudo apt-key add -
echo "deb https://deb.packager.io/gh/pkgr/gogs jessie pkgr" | sudo tee /etc/apt/sources.list.d/gogs.list
sudo apt-get update
sudo apt-get install gogs
```

Kullanılacak olan paketleri ekleyip güncelleme işlemini yapıyoruz ardından `gogs` paketini direk olarak sisteme ekliyoruz.

```
APP_NAME="gogs"
MYSQL_PASSWORD="<kullanılacak olan şifre>"
HOSTNAME="git.mertcangokgoz.com"

# setup mysql server and database
debconf-set-selections <<CONFIG
mysql-server-5.5 mysql-server/root_password password ${MYSQL_PASSWORD}
mysql-server-5.5 mysql-server/root_password_again password ${MYSQL_PASSWORD}
CONFIG
apt-get install -y --force-yes mysql-server
mysql -uroot -p${MYSQL_PASSWORD} -e "create database if not exists ${APP_NAME};"

# setup nginx configuration
apt-get install -y nginx
cat > /etc/nginx/sites-available/default <<EOF
server {
  listen          80;
  server_name     ${HOSTNAME};
  location / {
    proxy_pass      http://localhost:3000;
  }
}
EOF
sudo service nginx restart
```

Buda kolay kurulum yöntemi bu kurulumun kötü yanı  **SSL** olmaması ve **MySQL** ile kullanılıyor olması isterseniz bu yöntemi de kullanabilirsiniz.

öptüm bye <3
