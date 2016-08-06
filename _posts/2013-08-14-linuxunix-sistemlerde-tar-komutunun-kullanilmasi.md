---
layout: post
title: Linux/Unix Sistemlerde Tar komutunun kullanılması
date: 2013-08-14 22:22:34.000000000 +03:00
type: post
published: true
status: publish
categories: linux
description: linuxun temel komutları arasında gösterilebileceğimiz tar ssh üzerinden bizlere dosya sıkıştırma işlemlerini yapmamıza olanak sağlıyor pratik
---
<p>belkide linuxun temel komutları arasında gösterilebileceğimiz tar ssh üzerinden bizlere dosya sıkıştırma işlemlerini yapmamıza olanak sağlıyor pratik kolay ve hızlı olması açısından gui li sistemlerden iyidir ve en sorunsuzudur.</p>
<p>tar kodu linux sistemlerde dosya arşivlemeye yarar komut ile dizindeki dosyaları tek bir arşiv içinde birleştirebilirsiniz.windows da oldupu gibi dosyaları sıkıştırabilirsiniz. tar,gzip,bzip işlemlerinizide tar komutu ile rahatlıkla yapabilirsiniz.sizlere bu makalemizde detaylı olarak tar komutlarının kullanımını göstermek istiyorum.</p>
<p>Kullanım Şekli</p>
<blockquote><p># tar  [options]  [name of tar file to be created] [list of files &amp; directories to be included]</p></blockquote>
<p>&nbsp;</p>
<p>Komutlar</p>
<ol>
<li><strong><strong>-A, --catenate, --concatenate : bir arşive tar dosyası eklemenizi sağlar</strong></strong></li>
<li><strong>-c, --create : yeni arşiv oluşturur</strong></li>
<li><strong>-d, --diff, --compare : arşiv ve dosya sistemi arasındaki farklılıkların tespiti</strong></li>
<li><strong>--delete : Arşiv siler</strong></li>
<li><strong>-r, --append : arşivin sonuna belirttiğiniz dosyaları ekler</strong></li>
<li><strong> </strong><strong>-t, --list : arşiv içerisindekileri listeler</strong></li>
<li><strong>--test-label : arşivin test edilmesi işleminde kullanılır</strong></li>
<li><strong>-u, --update : sadece kopyasını değil yenisini ekler</strong></li>
<li><strong>-x, --extract, --get : arşivi dosyaya çıkartır.</strong></li>
</ol>
<p>komutlar bu şekildedir ama genelde farklı farklı kullanıldıgı görülmektedir. alttaki örnekler ile daha iyi anlayacaksınız.</p>
<p>&nbsp;</p>
<p>örnek 1 Arşiv oluşturmak</p>
<blockquote><p># tar  cvf    /usr/backup.tar       /dosya1 /dosya2</p></blockquote>
<p>yukarıdaki komut dosya 1 ve dosya 2 deki tüm içeriği backup.tar şeklinde arşivliyecektir.</p>
<p>&nbsp;</p>
<p>Örnek 2 dosyaları çıkartmak</p>
<blockquote><p># tar  xpvf   backup.tar  -C   /tmp/</p></blockquote>
<p>yukarıdaki komut backup dosyasını ctmp klasörüne çıkartıcaktır.</p>
<p>&nbsp;</p>
<p>Örnek 3 Dosyaları çıkartmadan içeriğini listelemek</p>
<blockquote><p># tar   tvf    /mnt/backup.tar</p></blockquote>
<p>&nbsp;</p>
<p>Örnek 4 tarih saat gün gibi parametreler ve gzip ile sıkıştırma tekniği</p>
<blockquote><p>#  tar  zcpvf    /tmp/backup-$(date +%d-%m-%Y).tar.gz     /dosya1 /dosya2</p>
<p>yada</p>
<p>#  tar  zcpvf    /tmp/backup-$(date +%d-%m-%Y).tgz     /etc /usr</p></blockquote>
<p>yukarıdaki komut ile tmp dosyası içine tarihli bir şekilde yedek alınabilir.</p>
<p>&nbsp;</p>
<p>Örnek 5 bzip kullanarak sistemden yedek alma işlemi</p>
<blockquote><p>#  tar  jcpvf    /tmp/backup-$(date +%d-%m-%Y).tar.bz2     /dosya1 /dosya2</p>
<p>yada</p>
<p>#  tar  jcpvf    /tmp/backup-$(date +%d-%m-%Y).tbz    /dosya1 /dosya2</p></blockquote>
<p>tmp dosyası içine tarih ve saat li bir yedek alınması yapılabilir.</p>
<p>&nbsp;</p>
<p>Örnek 6 tar komutu ile sıkıştırılmış dosyaların açılması</p>
<blockquote><p>#  tar  zxpvf    /tmp/backup-13-08-2013.tgz  -C  /acılmasını istediğiniz yer</p>
<p>yada</p>
<p>#  tar  jxpvf    /tmp/backup-13-08-2013.tbz  -C  /acılmasını istediğiniz yer</p></blockquote>
<p>Örnek 7 arşivleri özel dosya ve dizinlere çıkartma işlemi</p>
<blockquote><p># tar  jxpvf  backup-12-08-2013.tbz    etc/passwd</p>
<p>yada</p>
<p>#  tar jxpvf backup-12-08-2013.tbz    etc/apache2</p></blockquote>
<p>&nbsp;</p>
<p>Örnek 8 -r komutu ile mevcut arşiv için yeni dosya veya dizin eklemek</p>
<blockquote><p>#  tar rvf  /tmp/backup-13-08-2013.tar   smc-0.2.0-38</p></blockquote>
<p>yedek içerisine belirlemiş olduğunu dosyayı eklemek için kullanılır.</p>
<p>&nbsp;</p>
<p>Örnek 9 yedek alırken belirli dosyaların hariç tutulması</p>
<blockquote><p># tar  -zcpvf   etc-$(date +%d-%m-%Y).tgz  --exclude /etc/sysconfig/network-scripts/  /etc/</p></blockquote>
<p>Görüldüğü gibi etc klasöründen yedek alıyor ancak /etc/sysconfig/network-scripts yedeklenmiyor.</p>
<p>bir dizinin yedeğini almak zorunda kalıpda içerisindeki belli dosyaların yedeğinizin boyutunu şişirmesini istemiyorsanız işte bu kod tam size göre</p>
<blockquote><p># tar  -zcpvf   etc-$(date +%d-%m-%Y).tgz  -X  /root/exclude.txt   /etc/</p></blockquote>
<p>içerik hakkında bilgi edinilebilir.</p>
<p>&nbsp;</p>
<p>Örnek 10 tar yedekleri ile -X - T Seçenekleri</p>
<p>-T : adlara göre ayıklama işlemi</p>
<p>-X : dosyadaki listelenen hariç</p>
<p>Bazen, yedeklenecek dosya ve yedekten dışlanacak bazı dosyaları belirtmek isteyebilirsiniz.</p>
<p>oluşturun /root/include.txt</p>
<blockquote><p>/etc<br />
/home</p></blockquote>
<p>oluşturun /root/exclude.txt</p>
<blockquote><p>/etc/sysconfig/network-scripts<br />
/etc/fstab</p></blockquote>
<p>Şimdide aşağıdaki komutu kullanarak yedek almaya çalışın</p>
<blockquote><p># tar -zcpvf backup-$(date +%d-%m-%Y).tgz -T /root/include.txt -X /root/exclude.txt</p></blockquote>
<p>bu komut txt dosyası içinde belirttiğiniz dosya ve dizinleri include.txt demiştik yedekliyecek ve belirlenen diğer txt deki dosyaları yedeklemeyecek yani exclude.txt dekileri.</p>
<p>&nbsp;</p>
