---
layout: post
title: VestaCP Hakkında Bilinmeyenler
date: 2014-07-12 11:18:27.000000000 +03:00
type: post
published: true
status: publish
categories: linux
description: VestaCP de genel olarak gördüğüm insanların sistem üzerinde yazan terimleri yada fonksiyonların ne anlama geldiğini bilmemesi ve loğların
---
**VestaCP** de genel olarak gördüğüm insanların sistem üzerinde yazan terimleri yada fonksiyonların ne anlama geldiğini bilmemesi ve **logların** ve **configlerin** hangi yerde tutulduğu konusunda bilgilendirmenin yapılması gerekmektedir.

Apache

- **Default** = çoğu sistemde sorunsuz çalışan ek ayarların işin içerisine girmediği bir seçenek
- **Basedir** = open\_basedir kullanılarak shellere karşı mücadele
- **Hosting** = adından da anlaşılabileceği gibi domain başına limitlerin bulunduğu bir seçenek
- **Phpcgi** = cgi olarak php kullanımı php4 yada php5 kullanılır.
- **Phpfcgid** = FastCGI olarak çalışan PHP Ram 1GB den yukarı ise vesta panel zaten otomatik olarak default bir biçimde bu seçeneği seçmektedir.
- **Wsgi** = Python çalışacak ise domainde bu ayarın seçilmesi önerilir.(el ile kurulum gerektirebilir)

Apache aslında üç dosyadan oluşur. **Tpl** uzantılı dosya olağan sanal vhost oluşturmak için kullanılır. **STPL** uzantısı ile Dosya **SSL** vhostu oluşturmak için kullanılır. Buradaki **SH** uzantısı isteğe bağlıdır. Bu etki yaratma üzerine ilave kabuk komutları çalıştırmak için tetikleyici olarak kullanılabilir. Ayrıntılar phpfcgid.sh

Nginx

- **Default** = sabit içerikleri için idealdir çoğu sitede sorunsuzdur.
- **Hosting** = disable\_symlinks ataklardan korunmak için kullanılır
- **Caching** = dinamik sayfalar 15 dakikalığına önbelleklenir. Spontan olarak gelişen trafiklerde önemli bir yeri vardır. İçerikleriniz genel olarak resim vs ise kullanılması önerilir.
- **Force-https** = SSL kullanacak olan siteler için gereklidir. Kullanıcıların http kullanılmasına izin verilmez (el ile kurulum gerektirebilir.)

DNS

- **Default** = ön tanımlı olarak DNS kayıtları oluşturulur
- **Gmail** = Google app mail hostu kullanılacak ise bu seçenek iyidir.
- **Child-ns** = ana nameserverlar dışında kullanılan ns

Şablonlar /usr/local/Vesta/data/templates/dizininde bulunabilir. Yeni özel şablonlar oluşturmak için onları değiştirmek ya da kopyalamak için kullanabilirsiniz. Varolan bir şablonu değiştirdikten sonra kullanıcı yapılandırmasını yeniden inşa etmek gerekecektir. Bu işlem kullanıcı menüsü web arayüzünde **v-rebuild-user** komutunu ile veya toplu işlem parametresi kullanılarak yapılabilir.

Logların nerelerde tutulduğunu bilmeniz **VestaCP** deki hataları gidermek ve sisteminizi takip etmeniz için çok önemli bu yüzden

## **RHEL/Centos İçin**
<table>
<tbody>
<tr>
<td><strong>Service</strong></td>
<td><strong>Config</strong></td>
<td><strong>Log</strong></td>
</tr>
<tr>
<td>Apache</td>
<td>/etc/apache2/apache2.conf<br />
/etc/httpd/conf.d/*<br />
/home/$user/conf/web/apache2.conf<br />
/home/$user/conf/web/sapache2.conf (ssl)</td>
<td>/var/log/apache2/access.log<br />
/var/log/apache2/error.log<br />
/var/log/apache2/domains/$domain.log<br />
/var/log/apache2/domains/$domain.error.log</td>
</tr>
<tr>
<td>PHP</td>
<td>/etc/php5/apache2/php.ini<br />
/etc/php5/conf.d/*</td>
<td>/var/log/apache2/domains/$domain.error.log</td>
</tr>
<tr>
<td>Nginx</td>
<td>/etc/nginx/nginx.conf<br />
/etc/nginx/conf.d/*<br />
/home/$user/conf/web/nginx.conf<br />
/home/$user/conf/web/snginx.conf (ssl)</td>
<td>/var/log/nginx/access.log<br />
/var/log/nginx/error.log<br />
/var/log/apache2/domains/$domain.log<br />
/var/log/apache2/domains/$domain.error.log</td>
</tr>
<tr>
<td>Named</td>
<td>/etc/bind/named.conf<br />
/home/$user/conf/dns/$domain.db</td>
<td>/var/log/syslog</td>
</tr>
<tr>
<td>Exim</td>
<td>/etc/exim4/exim4.conf.template<br />
/home/$user/conf/mail/$domain/*</td>
<td>/var/log/exim4/mainlog<br />
/var/log/exim/rejectlog<br />
/var/log/exim/paniclog</td>
</tr>
<tr>
<td>Dovecot</td>
<td>/etc/dovecot/dovecot.conf<br />
/etc/dovecot/conf.d/*<br />
/home/$user/conf/mail/$domain/passwd</td>
<td>/var/log/dovecot.log</td>
</tr>
<tr>
<td>ClamAV</td>
<td>/etc/clamav/clamd.conf<br />
/etc/clamav/freshclam.conf</td>
<td>/var/log/clamav/clamav.log<br />
/var/log/clamav/freshclam.log<br />
/var/log/exim4/mainlog</td>
</tr>
<tr>
<td>SpamAssassin</td>
<td>/etc/spamassassin/local.cf</td>
<td>/var/log/exim4/mainlog</td>
</tr>
<tr>
<td>Roundcube</td>
<td>/etc/roundcube/main.inc.php<br />
/etc/roundcube/db.inc.php<br />
/etc/apache2/conf.d/roundcube</td>
<td>/var/log/roundcube/*<br />
/var/log/apache2/domains/$domain.log<br />
/var/log/apache2/domains/$domain.error.log</td>
</tr>
<tr>
<td>MySQL</td>
<td>/etc/mysql/my.cnf<br />
/root/.my.cnf<br />
/usr/local/vesta/conf/mysql.conf</td>
<td>/var/log/mysql.log<br />
/var/log/mysql/error.log</td>
</tr>
<tr>
<td>phpMyAdmin</td>
<td>/etc/phpmyadmin/config.inc.php<br />
/etc/apache2/conf.d/phpmyadmin.conf</td>
<td>/var/log/apache2/domains/$domain.log<br />
/var/log/apache2/domains/$domain.error.log</td>
</tr>
<tr>
<td>PostgreSQL</td>
<td>/etc/postgresql/*/main/postgresql.conf<br />
/etc/postgresql/*/main//pg_hba.conf<br />
/usr/local/vesta/conf/pgsql.conf</td>
<td>/var/log/postgresql/postgresql-*-main.log</td>
</tr>
<tr>
<td>phpPgAdmin</td>
<td>/etc/phppgadmin/config.inc.php<br />
/etc/apache2/conf.d/phppgadmin</td>
<td>/var/log/apache2/domains/$domain.log<br />
/var/log/apache2/domains/$domain.error.log</td>
</tr>
<tr>
<td>Vsftpd</td>
<td>/etc/vsftpd.conf</td>
<td>/var/log/xferlog<br />
/var/log/syslog</td>
</tr>
<tr>
<td>Vesta</td>
<td>/usr/local/vesta/conf/vesta.conf<br />
/usr/local/vesta/conf/mysql.conf<br />
/usr/local/vesta/conf/pgsql.conf<br />
/usr/local/vesta/conf/ftp.backup.conf<br />
/usr/local/vesta/conf/dns-cluster.conf<br />
/usr/local/vesta/nginx/conf/nginx.conf<br />
/usr/local/vesta/php/lib/php.ini<br />
/usr/local/vesta/php/etc/php-fpm.conf</td>
<td>/var/log/vesta/system.log<br />
/var/log/vesta/backup.log<br />
/var/log/vesta/auth.log<br />
/var/log/vesta/nginx-error.log<br />
/usr/local/vesta/php/var/log/php-fpm.log</td>
</tr>
</tbody>
</table>
