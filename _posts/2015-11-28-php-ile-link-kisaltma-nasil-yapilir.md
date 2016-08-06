---
layout: post
title: PHP ile Link Kısaltma Nasıl Yapılır
date: 2015-11-28 22:21:02.000000000 +02:00
type: post
categories: programlama
description: Başkalarının sistemlerini kullanmak yerine geçtiğimiz günlerde kendi php Link kısaltma servisimi yazmaya karar verdim kara cuma indiriminden

---

Başkalarının sistemlerini kullanmak yerine geçtiğimiz günlerde kendi **php Link kısaltma** servisimi yazmaya karar verdim kara cuma indiriminden aldığım domain ile yola koyuldum link kısaltmalarının mantığını bildiğim için zor olmadı kısaca anlatmak gerekirse

1. Uzun olan link kullanıcıdan input yardımıyla alınır
2. Veritabanı oluşturulur ve bu linkler veritabanına kısaltılmış url yapıları ile birlikte kayıt edilir
3. kısa link yapısını oluşturmak için istenilen bir algoritma kullanılabilir yada kendi algoritmanızı oluşturabilirsiniz.
4. kısaltılan url daha sonra herhangi bir kural yardımıyla tekrar yönlendirilir genellikle 301 olarak yönlendirme yapılır.

yazarken fazla kod kullanmayalım hızlı,güvenli ve etkili olsun diye arayüze pek önem vermedim. Güvenli olsun diye hem webserver tarafında hemde veritabanı tarafında kullanıcıya dair hiçbir bilgi tutmadım site içerisinde analiz kodları dahi bulunmuyor.

Veritabanı için mysql seçtim ve bu projemide her zaman ki gibi github üzerinden yayınladım isteyen herkes destek olabilsin diye.Kodlar ise şu şekilde

**Dosya:** ajax.php

    <?php
    //include database connection details
    include('database.php');

    if (isset($_POST['url']) && !empty($_POST['url']) && preg_match_all('/(ftp|http|https):\/\/(\w+:{0,1}\w*@)?(\S+)(:[0-9]+)?(\/|\/([\w#!:.?+=&%@!\-\/]))?/', $_POST['url'])) {
        //get random strong string for URL
        $command3 = "SELECT * FROM urls WHERE url_link= '" . urlencode($_POST['url']) . "';";
        $control_database = mysqli_query($connect, $command3);
        //check database
        if ($control_database == FALSE) {
            return FALSE;
        }
        //find same url and read short code
        if (mysqli_num_rows($control_database) > 0) {
            $row = mysqli_fetch_assoc($control_database);
            $site_url = "?s=" . $row["url_short"];
            echo json_encode(array("url" => $server_name . $row["url_short"], "site_url" => $server_name . $site_url));
        } else {
            $short = substr(bin2hex(openssl_random_pseudo_bytes(6, $short)), 3, 5);
            //$short = substr(str_shuffle(uniqid(sha1(md5(mt_rand((double)microtime()*1000000))))), 3, 5);
            $url_data = mysqli_real_escape_string($connect, $_POST['url']);
            $command2 = "INSERT INTO urls (url_link, url_short, url_date) VALUES('" . urlencode($url_data) . "','$short','" . time() . "')";
            mysqli_query($connect, $command2);
            $url = $server_name . $short;
            $site_url = $server_name . "?s=$short";
            echo json_encode(array("url" => $url, "site_url" => $site_url));
        }
    }

**Dosya:** index.php

    <?php
    /**
     * Created by PhpStorm.
     * User: mertcan
     * Date: 27.11.2015
     * Time: 23:14
     */

    //include database connection details
    include('database.php');

    //redirect to real link if URL is set
    if (!empty($_GET['url'])) {
        $filter_url = filter_var($_GET['url'], FILTER_SANITIZE_STRING, FILTER_FLAG_STRIP_HIGH);
        $command1 = "SELECT url_link FROM urls WHERE url_short = '" . $filter_url . "'";
        $redirect = mysqli_fetch_assoc(mysqli_query($connect, $command1));
        $redirect = urldecode($redirect["url_link"]);

        header('HTTP/1.1 301 Moved Permanently');
        header("Location: " . $redirect);
    }
    ?>
    <!DOCTYPE html>
    <html lang="en" class="no-js" xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>0w1 &mdash; URL Shortener Services</title>
        <!-- Google Main Meta -->
        <meta charset='utf-8'>
        <meta name="robots" content="noindex, nofollow">
        <meta name="google-site-verification" content="LPdSncuoqCucWsdFo_mdfpsmmjXdmUUFxm3x_2-5Bik"/>
        <meta name="description" content="Secure, fast and anonymous url Shortener Services for free">

        <!-- Meta -->
        <meta content="minimum-scale=1.0, width=device-width, maximum-scale=0.6667, user-scalable=no" name="viewport">
        <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta http-equiv="Content-Language" content="en">
        <meta name="author" content="Mertcan GOKGOZ, admin@mertcangokgoz.com, https://mertcangokgoz.com/"/>

        <!-- Jquery -->
        <script src="inc/jquery-1.11.3.min.js"></script>

        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="inc/bootstrap.min.css">

        <!-- Optional theme -->
        <link rel="stylesheet" href="inc/bootstrap-theme.min.css">

        <!-- Latest compiled and minified JavaScript -->
        <script src="inc/bootstrap.min.js"></script>

        <!-- Costum Javascript code -->
        <link rel="stylesheet" href="costum.css">

        <!-- Costum Javascript code -->
        <script language="JavaScript">
            $(document).ready(function () {
                $("#send").click(function () {
                    $('.alert').remove();
                    var check = document.getElementById('longurl').value;
                    var MatcUrl = /(ftp|http|https):\/\/(\w+:{0,1}\w*@)?(\S+)(:[0-9]+)?(\/|\/([\w#!:.?+=&%@!\-\/]))?/;
                    if (MatcUrl.test(check)) {
                        $.ajax({
                            type: "post",
                            url: "ajax.php",
                            data: $("#shortener").serialize(),
                            success: function (data) {
                                var json = JSON.parse(data);
                                $('.result').append('<div class="alert alert-success" role="alert">Short Url:<a target="_blank" href="' + json.url + '">' + json.url + '</a> <br> \
                                Site Url <a target="_blank" href="' + json.site_url + '">' + json.site_url + '</a> \
                                </div>');
                            }
                        });
                    } else {
                        $('.result').append('<div class="alert alert-danger"><a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a><strong>Error!</strong> Invalid url.</div>');
                        return false;
                    }
                });
            });
        </script>
        <!-- Content -->
        <link rel="author" href="//plus.google.com/103305118431759296457/posts"/>
        <link rel="publisher" href="//plus.google.com/103305118431759296457/posts"/>
    </head>
    <body style="font-family: Arial,sans-serif,Verdana !important;">
    <!--[if lt IE 8]>
    <p class="chromeframe">outdated</p>
    <![endif]-->
    <div class="container">
        <div class="header col-md-6 center">
            <h1 class='title'>0w1</h1>

            <p class='desc'>URL Shortener Service</p>
        </div>
        <div class="well content">
            <div class="row">
                <div class="col-md-12">
                    <div class="form-group">
                        <form method="post" action="" id="shortener" onsubmit="return false">
                            <div class="input-group input-group-lg">
                                <span class="input-group-addon" id="sizing-addon1">URL to Shorten:</span>
                                <input type="text" name="url" id="longurl" class="form-control" placeholder="URL"
                                       aria-describedby="sizing-addon1">
                                <span class="input-group-btn">
                                     <button type="submit" id="send" class="btn btn-success">Shorten</button>
                                </span>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 center">
                    <div class="result">
                        <?php if (!empty($_GET['s'])): ?>
                            <div class="alert alert-success" role="alert">Short Url:<a
                                    href="<?php echo $server_name; ?><?php echo $_GET['s']; ?>"
                                    target="_blank"><?php echo $server_name; ?><?php echo $_GET['s']; ?></a><br>
                                Site Url:<a href="<?php echo $server_name; ?>?s=<?php echo $_GET['s']; ?>"
                                            target="_blank"><?php echo $server_name; ?>?s=<?php echo $_GET['s']; ?></a><br>
                            </div>
                        <?php endif ?>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="footer">
        <ul>
            <li><a href="mailto:admin@mertcangokgoz.com">Feedback</a></li>
            <li><a href="https://github.com/MertcanGokgoz/simple-url-shortener">Github</a></li>
        </ul>
    </div>
    </body>
    </html>

**Dosya:** database.php

    <?php
    /**
     * Created by PhpStorm.
     * User: mertcan
     * Date: 27.11.2015
     * Time: 23:14
     */
    ini_set('display_errors', 0);

    function Database_Connector()
    {
        $server = "localhost";
        $username = "database_username";
        $password = "database_password";
        $database_name = "database_name";

        $connection = new mysqli($server, $username, $password, $database_name);
        return $connection;
    }

    $server_name = "http://" . $_SERVER['HTTP_HOST'] . "/";

    $connect = Database_Connector();
    $command = "CREATE TABLE IF NOT EXISTS `urls` (
      `url_id` int(11) NOT NULL AUTO_INCREMENT,
      `url_link` varchar(255) NOT NULL,
      `url_short` varchar(6) NOT NULL,
      `url_date` int(10) NOT NULL,
      PRIMARY KEY (`url_id`),
      UNIQUE KEY `url_id` (`url_id`,`url_short`)
    ) ENGINE=MyISAM DEFAULT CHARSET=latin1;";
    // Perform queries
    mysqli_query($connect, $command);

Proje ve yapılan diğer işlemlerin tamamına ulaşmak için [Github hesabım](https://github.com/MertcanGokgoz/simple-url-shortener) üzerinden gereken dosyalara ulaşabilirsiniz.Projeyi geliştirmeye devam edeceğim.Güvenli bir link kısaltma servisi olarak hem kendim hemde çevremdekilerin kullanmasını umuyorum.

## Projeyi Toplu bir şekilde [indirmek için Tıklayın](https://github.com/MertcanGokgoz/simple-url-shortener/archive/master.zip)
