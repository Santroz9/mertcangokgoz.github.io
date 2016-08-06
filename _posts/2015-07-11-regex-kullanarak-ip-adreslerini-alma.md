---
layout: post
title: Regex Kullanarak İP Adreslerini Alma
date: 2015-07-11 12:47:55.000000000 +03:00
type: post
published: true
status: publish
categories: programlama
description: PHP ile pek çok şey yapılabileceği gibi sayfalar arasındaki verilerde parçalanarak alınabilmekte.Bu örnek de ben regex kullandım ve bir kaç
---

**PHP** ile pek çok şey yapılabileceği gibi sayfalar arasındaki verilerde parçalanarak alınabilmekte.Bu örnek de ben regex kullandım ve bir kaç gün önce ihtiyacımdan dolayı yazmış olduğum ufak bir kodu sizlerle paylaşmak istiyorum.Ben bu yazdığım kod ile sayfalarda bulunan tüm ip adreslerini alabiliyor ve bir **text** dosyasına aktarabiliyorum. **Bruteforce** ve **ddos** yapan belirli ip adreslerini almak için bazı sitelerde kullanıyorum oldukça işime yarıyor.

    <?php
    /**
     * Created by PhpStorm.
     * User: Mertcan
     * Date: 9.7.2015
     * Time: 12:13
     */
    $homepage = SayfaGetir('website adress');
    $file = fopen("ip.txt", 'w') or die("Dosya Acilamadi");
    $reg = '/\b(?:(?:2(?:[0-4][0-9]|5[0-5])|[0-1]?[0-9]?[0-9])\.){3}(?:(?:2([0-4][0-9]|5[0-5])|[0-1]?[0-9]?[0-9]))\b/i';
    preg_match_all($reg, $homepage, $results);

    for ($i = 0; $i <= count($results[0]); $i++) {
        //fwrite($file, implode("\n", $results[$i]));
        fwrite($file, $results[0][$i]. PHP_EOL);
    }
    function SayfaGetir($url)
    {
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
        curl_setopt($ch, CURLOPT_HEADER, false);
        curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true);
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_REFERER, $url);
        curl_setopt($ch, CURLOPT_USERAGENT, 'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1.13) Gecko/20080311 Firefox/2.0.0.13');
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE);
        $result = curl_exec($ch);
        curl_close($ch);
        return $result;
    }

Bu şekilde istediğiniz ip adreslerini alabilirsiniz ben tanımlamayı yaparken sıfırıncı dizidekiler'in tamamını istemiştim.Eğer sizin veriniz de diziler&nbsp;1 den çok ise komut satırı içerisinde bulunan kodu aktifleştirerek de tamamını&nbsp;alabilirsiniz.
