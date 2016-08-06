---
layout: post
title: Wordpress DMCA Sorununu Gidermek
date: 2013-10-05 22:57:31.000000000 +03:00
type: post
published: true
status: publish
categories: programlama
description: Bilindiği gibi DMCA özgün içerik girişi yapılan sitelerin mutlaka kullanması gereken bir sistem ancak firmanın ciddiyetsizliği yüzünden
---

Bilindiği gibi **DMCA** özgün içerik girişi yapılan sitelerin mutlaka kullanması gereken bir sistem ancak firmanın ciddiyetsizliği yüzünden benim canım 2 gündür sıkılmıştı yapmış oldukları wordpress eklentisinde gerek admin paneli gerekse eklentinin **İD** alamama durumu ve firmanın da eklentide sorun yok demesi üzerine bu makaleyi yazma gereği duydum hata alan arkadaşlar yada içeriklerinin sitede işlenmemesini giderebilirler

Öncelikle eklentiyi yükledikten sonra karşımıza admin panelinde "func\_get\_args()" syntax hatası karşımıza çıkacak eklentiyi yazarken ne düşünmüşler tam bilemiyorum bu **syntax** değişken tanımlamadan belli başlı yerlerde kullanılamaz işte o kullanılamayacak yerde bunlar kullanmış...

/wp-content/plugins/dmca-badge/libraries/sidecar/classes/ **class-admin-page.php** dosyasında 448.satıra bakınız

```
protected function _get_plugin_value( $method ) {
return call_user_func_array( array( $this, '_do_plugin_action' ), func_get_args() );
}
```

Aşağıdakiyle değiştir

```
protected function _get_plugin_value( $method ) {
$gethata1 = func_get_args();
return call_user_func_array( array( $this, '_do_plugin_action' ), $gethata1 );
}
```

yapılan **syntax** hatasını da giderdikten sonra geldik en büyük sıkıntıya konulara **ID** atanamaması ve **DMCA.com** sitesinde içeriklerin korumaya alınmaması sorununa aslında eklentide tasarım yada özellik değiştirmedik demişler ancak temiz kodlama yapacağız diyede unuttukları 1-2 kısmı da biz ekleyeceğiz...

Öncelikle yapmamız gereken **DMCA.com** sitesine girip sitenin bize vermiş olduğu badges embed kodlarını almak

Bize verilmiş olan kod satırları

```
    <a href="http://www.dmca.com/Protection/Status.aspx?ID=557588e1-2f0a-451d-9d71-b825d1730ff2" title="DMCA"> <img src ="http://images.dmca.com/Badges/_dmca_premi_badge_1.png?ID=557588e1-2f0a-451d-9d71-b825d1730ff2"  alt="DMCA.com" /></a>
```

Sitenin bu kodu alması gerektiği yer ve sorun

![dmcagorsel1](/assets/dmcagorsel11.png)

/wp-content/plugins/dmca-badge/classes/ **class-plugin.php** dosyasında **433**.satıra bakınız

```
function the_settings_badges_tab() {
echo '<p>' . __( 'Select a DMCA Website Protection Badge by clicking on it.', 'dmca-badge' ) . '</p>';

$branding = __( 'Content Protection by DMCA.com', 'dmca-badge' );
$badge_template = <<<HTML
<a href="http://www.dmca.com/" title="{$branding}"><img src="{{badge_url}}" alt="{$branding}"></a>
HTML;
$badge_template = htmlentities( $badge_template );
echo "<pre style="display:none" id="badge-template">{$badge_template}</pre>";
echo $this->get_badges_html( $this->get_form_settings_value( 'badge', 'url' ) );
echo $this->get_form( 'badge' )->get_html();
}
```

görüldüğü gibi sayfa ve içeriklere **DMCA** embed kodu eklerken hiç bir yerden **İD** bilgisi almıyor.Hal böyle olunca da sayfalara koruma işlememiş oluyor.

Kodu aşağıdaki gibi değiştiriniz.biz burada değişken tanımlayarak sorunu çözeceğiz...

```
function the_settings_badges_tab() {
echo '<p>' . __( 'Select a DMCA Website Protection Badge by clicking on it.', 'dmca-badge' ) . '</p>';

$branding = __( 'Content Protection by DMCA.com', 'dmca-badge' );
$idpar1="DMCA Link bilginiz"
$idpar2="Resimlerin sonuna eklenecek olan İD"
$badge_template = <<<HTML
<a href="{$idpar1}" title="{$branding}"><img src="{{badge_url}}{$idpar2}" alt="{$branding}"></a>
HTML;
$badge_template = htmlentities( $badge_template );
echo "<pre style="display:none" id="badge-template">{$badge_template}</pre>";
echo $this->get_badges_html( $this->get_form_settings_value( 'badge', 'url' ) );
echo $this->get_form( 'badge' )->get_html();
}
```

Örnek olarak

```
$idpar1="http://www.dmca.com/Protection/Status.aspx?ID=557588e1-2f0a-451d-9d71-b825d1730ff2"
$idpar2="?ID=557588e1-2f0a-451d-9d71-b825d1730ff2"
```

yapıp kayıt edip çıkıyoruz cache eklentisi kullanıyorsak **cacheyi** yeniliyoruz.işlemimiz sonuçlanıyor...
