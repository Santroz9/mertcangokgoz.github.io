---
layout: post
title: Wordpress Ön Tanımlı Avatarı değiştirme
date: 2015-03-24 14:13:41.000000000 +02:00
type: post
published: true
status: publish
categories: genel
description: Wordpress de genel olarak kullanılabilir durumda bir kaç adet avatar mevcut isterseniz bunlardan bir tanesini seçebilirsiniz ama hiçbiri
---
Wordpress de genel olarak kullanılabilir durumda bir kaç adet avatar mevcut isterseniz bunlardan bir tanesini seçebilirsiniz ama hiçbiri hoşunuza gitmediyse function dosyanıza tanımlayacağınız bir kaç kural ile yorumlarda gözükecek olan avatarınızı kalıcı olarak değiştirmeniz mümkün bu yöntem ile dışarıdan çıkışlarıda engellemiş olacaksınız bir bakıma sayfanızın load zamanıda düşecek diyebilirim.

Kullanacağımız kodu internetden aramalarım sonucu buldum ve çalıştığını gördüm kod parçacığı aşağıdaki gibidir yapmanız gereken temanızın **function.php** içerisine eklemektir.

    add_filter( 'avatar_defaults', 'newgravatar' );

    function newgravatar ($avatar_defaults)
    {
        $myavatar = "https://mertcangokgoz.com/wp-content/uploads/2013/07/ufakm.jpg";
        $avatar_defaults[$myavatar] = "Mertcan";
        return $avatar_defaults;
    }

Burada yapmış olduğumuz işlem panele yeni bir avatar tanımalası oldu bu sayede yeni avatarımızı seçip kullanabiliriz.
