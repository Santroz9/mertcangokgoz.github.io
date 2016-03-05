---
layout: post
title: Centos 6.x Sistemlerde SSH Girişlerinin İzlenmesi
date: 2014-05-01 16:47:28.000000000 +03:00
type: post
published: true
status: publish
categories: Güvenlik
description: Eğer bir web hosting yöneticisi veya bir Linux güvenlik teknisyeni iseniz özellikle başarısız SSH oturum açma girişimlerini yakından takip etmeniz
---
Eğer bir web hosting yöneticisi veya bir Linux güvenlik teknisyeni iseniz özellikle başarısız **SSH** oturum açma girişimlerini yakından takip etmeniz gerekmektedir. Bunun için sunucunuzda ufak birkaç değişiklik ile bu özelliği aktif edebilirsiniz **PAM** (Pluggable Authentication Modules) adı verilen bu mobül sayesinde izinsiz yapılmış olan tüm girişleri listeleyebilirsiniz.

Öncelikle Centos 6.\* işletim sistemlerinde bu iş için kullanılan **PAM modülü pam\_tally2.so** dur bunu sisteminizde aktive etmemiz gerekmekte.

    sudo nano /etc/pam.d/password-auth

![1](/assets/aa1.png)

Komutunu vererek password-auth kısmını geçiş yapıyoruz.

    auth required pam_tally2.so deny=3 onerr=fail unlock_time=300
    account required pam_tally2.so

satırlarını ekliyoruz ve kayıt ediyoruz. (**CTRL+X)**

Burada dikkat etmemiz gereken eklemiş olduğumuz komutun 3 başarısız denemede banlanması kuralıdır yani 3 kere yanlış girilen şifrede 300 saniye boyunca ip adresi yasaklanacak. İsterseniz bu ayarları kendinize göre düzenleyebilirsiniz.

Modülümüz başarıyla aktifleştirildi şimdi yapılan başarısız girişlerin listesini görmeye geldi sıra bunun için ufak bir komut vererek kaç kere yanlış giriş denemesi yapıldığı ve bu denemenin hangi ip den geldiği başarıyla gözlemlenecektir.

    sudo pam_tally2 -u root

![2](/assets/aa2.png)

**root** burada kullanıcı adıdır –u komutumuzdan sonra kayıtlarını görmek istediğiniz kullanıcının ismini yazmanız yeterlidir.
