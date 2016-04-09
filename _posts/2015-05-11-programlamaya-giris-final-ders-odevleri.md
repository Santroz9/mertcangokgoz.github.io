---
layout: post
title: Programlamaya Giriş Final Ders Ödevleri
date: 2015-05-11
type: post
categories: programlama
description: Başkent Üniversitesi Programlamaya Giriş dersinde Prof. Dr. Afet GOLAYOĞLU Tarafından verilmiş
---
Başkent Üniversitesi Programlamaya Giriş dersinde **Prof. Dr. Afet GOLAYOĞLU** Tarafından verilmiş olan Final Ders Ödevleri Tarafımdan yazılmış olup 11.05.2015 Tarihinde yayınlanmıştır.Kaynak verilmeden kullanılması kesinlikle yasaktır.

**1-**Elektrik dağıtım şirketinde elektrik kullanım bedeli,

- Konutlar için 0-100 KWh arası 0.1 TL /Kwh, 100 Kwh dan fazla kısmi için 0.15 TL/Kwh,
- Kamu kuruluşları için 0-500KWh arası için 0.15TL/KWh, 500Kwh dan fazla kısmi için 0.2 TL/KWh ve
- Özel sektör için 0-1000 KWh arası 0.3TL/ KWh, 1000 Kwh dan fazla kısmi için ise 0.35TL/KWh olarak hesaplanmaktadır.

Elektrik kullanım bedeli hesaplama  programını yazınız.
```
{% raw %}
#include&lt;stdio.h&gt;
#include&lt;conio.h&gt;

int main(void) {
	int secim=1,kv=0;
	float konut;
	jump:
	while(secim) {
		printf("1-Konutlar\n2-Kamu Kuruluslari\n3-Ozel Sektor\n4-Cikis\n\n");
		scanf("%d",&amp;secim);
		switch(secim) {
			case 1:
				printf("Kullandiginiz Elektrigi KWh Cinsinden giriniz.\n");
				scanf("%d",&amp;kv);
				if(kv &lt;= 0){
                	printf("Gecersiz deger girdiniz \n");
                	break;
            	}
				if(kv &gt;= 0 &amp;&amp; kv &lt;= 100) {
					konut=(float)kv*0.1;
				} else if(kv&gt;=101) {
					konut=(float)(100*0.1)+(kv-100)*0.15;
				}
				printf("%d KWh icin Kullanim Bedeliniz %.2f TL Olarak Bulunmustur.\n\n",kv,konut);
				break;
			case 2:
				printf("Kullandiginiz Elektrigi KWh Cinsinden giriniz.\n");
				scanf("%d",&amp;kv);
				if(kv &lt;= 0){
                	printf("Gecersiz deger girdiniz \n");
                	break;
            	}
				if(kv &gt;= 0 &amp;&amp; kv &lt;= 500) {
					konut=(float)kv*0.15;
				} else if(kv&gt;=501) {
					konut=(float)(500*0.15)+(kv-500)*0.2;
				}
				printf("%d KWh icin Kullanim Bedeliniz %.2f TL Olarak Bulunmustur.\n\n",kv,konut);
				break;
			case 3:
				printf("Kullandiginiz Elektrigi KWh Cinsinden giriniz.\n");
				scanf("%d",&amp;kv);
				if(kv &lt;= 0){
                	printf("Gecersiz deger girdiniz \n");
                	break;
            	}
				if(kv &gt;= 0 &amp;&amp; kv &lt;= 1000) {
					konut=(float)kv*0.3;
				} else if(kv&gt;=1001) {
					konut=(float)(1000*0.3)+(kv-1000)*0.35;
				}
				printf("%d KWh icin Kullanim Bedeliniz %.2f TL Olarak Bulunmustur.\n\n",kv,konut);
				break;
			case 4:
				secim=0;
				break;
			default:
				goto jump;
				break;
		}
	}
	return 0;
	getch();
}
{% endraw %}
```

**2-**Üniversite misafirhanesi öğretim üyeleri için konaklayacakları gün sayısına bağlı olarak tabloda verildiği gibi farklı tarife uygulamaktadır.

| Gün sayısı   |      Ücret(yabancı)      |  Ücret(TC vatandaşı) |
|----------|:-------------:|------:|
| 0-4 |  5-10 | 11-yukarısı |
| 25 |    20   |   17 |
| 15 | 12 |    10 |
| 12 |10  | 7 |

Konaklama bedelini hesaplayan program kodunu  yazınız.

```
{% raw %}
#include &lt;stdio.h&gt;
#include &lt;conio.h&gt;
/*Tarife fiyatlarının dizi içerisinde tutulması*/
int tarife[3][3]={{25, 15, 12},{20, 12, 10},{17, 10, 7}};

/*Misafir tipi ile birlikte ücreti hesaplayan fonksiyon*/
int fiyat_hesapla(int tip, int gun){
    int fiyat = 0 ;
    /*Array indis ayarlama işlemi 1 ise 0,2 ise 1 şeklinde */
    tip--;
    if (gun &lt;= 4){
        fiyat+=tarife[0][tip]*gun;/*0-4 Arası için 25 TL ile gün sayısının çarpılması*/
    }
    else if (gun &lt;= 10){
        fiyat+= tarife[0][tip] * 4;/*ilk 4 gün ücretlendirmesi*/
        fiyat+= tarife[1][tip] * (gun-4);/*4 den 10 kadar olan ki ücretlendirme*/
    }
    else{
    	/*11 den yukarısı için konaklama bedel hesabı*/
        fiyat+=tarife[0][tip]*4;
        fiyat+=tarife[1][tip]*6;
        fiyat+=tarife[2][tip]*(gun-10);
    }
    return fiyat;
}

int main(void){
    /*Calis programin calisma dongusunu kontrol edecek*/
    int calis = 1,tip, gun;
    while(calis){
    	jump:
        printf("1-Yabanci\n2-TC Vatandasi\n3-Personel\n4-Cikis\n");
        scanf("%d", &amp;tip);
        switch (tip){
        case 1:
        case 2:
        case 3:
            /*Tum misafir tipleri icin tek bir fiyat fonksiyonu yeterli oluyor*/
            printf("Kalinacak gun sayisini giriniz: ");
            scanf("%d", &amp;gun);
            if(gun &lt;= 0){
                printf("Gecersiz gun sayisi \n");
                break;
            }
            printf("Konaklama ucreti: %d TL\n", fiyat_hesapla(tip, gun));
            break;
        case 4:
            calis=0;
            break;
        default: //Girdi olarak 1,2,3 ve ya 4'den farkli bir sey girildiyse uygulama tekrar çalışmaya devam etsin
            goto jump;
        }
    }
    return 0;
    getch();
}
{% endraw %}
```

**3-**Asgari ücretin 20 yaş altındakiler için **896 TL**, 20 yaş üstündekiler için **1010 TL** emekliler için **960 TL** olarak uygulandığı bir pazarlama şirketinde çalışan her eleman için yaptığı satış miktarının **%5** i kadar ek ücret, bayram ve ya tatil günlerinde çalıştığı her yarım gün için ise **50 TL** ek ücret verilmektedir. Buna göre, aylık maaş hesaplama programını yazınız

```
{% raw %}
#include &lt;stdio.h&gt;
#include &lt;conio.h&gt;

/*Calisan maasini hesaplayan fonksiyon*/
double maas_hesapla(int yas, int satis, int mesai){
    double maas=0;
    if(yas == 1)
        maas=896;
    if(yas == 2)
        maas = 1010;
    else
        maas = 960;
    /*Satislardan gelen %5*/
    maas += (satis * 0.05);
    /*Measiden gelen gun*50 TL*/
    maas += (mesai*50);
    return maas;
}
int main(){
    /*Calis programin calisma dongusunu kontrol edecek*/
    int calis = 1,yas, satis, mesai;
    while(calis){
        printf("1-20 Yas Alti\n2-20 Yas Ustu\n3-Emekli\n4-Cikis\n");
        scanf("%d", &amp;yas);
        switch (yas){
        case 1:
        case 2:
        case 3:
            /*Tum misafir tipleri icin tek bir fiyat fonksiyonu yeterli oluyor*/
            printf("Elemanini satis miktarini giriniz:");
            scanf("%d", &amp;satis);
            if(satis &lt; 0){
                printf("Satis negatif olamaz \n");
                break;
            }
            printf("Elemanini bayram ve ya tatilde calistigi gun sayisi:");
            scanf("%d", &amp;mesai);
            if(mesai &lt; 0){
                printf("Gun sayisi negatif olamaz \n");
                break;
            }
            printf("Elemanin maasi: %.2f TL\n", maas_hesapla(yas, satis, mesai));
            break;
        case 4:
            calis=0;
            break;
        default:        //Girdi olarak 1,2,3 ve ya -1'den farkli bir sey girildiyse
            printf("Gecersiz bir secenek girdiniz \n");
        }
    }
    return 0;
	getch();
}
{% endraw %}
```

**4-**Kargo şirketi gönderilecek kargonun ağırlığı ve gideceği yere bağlı olarak aşağıdaki şekilde tarife uygulamaktadır:

- Amerika:  0-250 gr arası için 2 TL, sonrası her 250 gr için 1.5 TL
- Avrupa:   0-250 gr arası için 1 TL, sonrası her 250 gr için 0.75 TL
- Uzakdoğu: 0-250 gr arası için 3 TL, sonrası her 250 gr için 2 TL

Buna göre ücret hesaplayan program kodunu yazınız.

```
{% raw %}
#include&lt;stdio.h&gt;
#include&lt;conio.h&gt;

int main()
{
	char yer;
	float kargonun_agirligi,odenecek_tutar;
	printf("Kargonun agirligini giriniz: ");
	scanf("%f",&amp;kargonun_agirligi);
	printf("Kargonun gidecegi yeri giriniz: ");
	scanf("%s",&amp;yer);
	switch(yer)
	{
	case 'A':
			if(kargonun_agirligi&gt;0 &amp;&amp; kargonun_agirligi&lt;250)
		    {printf("Odenecek tutar 2 TL");}
		    else if(kargonun_agirligi&gt;250)
		    {
		    	odenecek_tutar=(kargonun_agirligi/250)*1.5+0.5;
		    	printf("Odenecek tutar: %.2f TL",odenecek_tutar);
			}
		    break;
	case 'E':
			if(kargonun_agirligi&gt;0 &amp;&amp; kargonun_agirligi&lt;250)
		    {printf("Odenecek tutar 1 TL\n");}
		    else if(kargonun_agirligi&gt;250)
		    {
		    	odenecek_tutar=(kargonun_agirligi/250)*0.75+0.25;
		    	printf("Odenecek tutar: %.2f TL",odenecek_tutar);
			}
		    break;
	case 'U':
			if(kargonun_agirligi&gt;0 &amp;&amp; kargonun_agirligi&lt;250)
		    {printf("Odenecek tutar 3 TL\n");}
		    else if(kargonun_agirligi&gt;250)
		    {
		    	odenecek_tutar=(kargonun_agirligi/250)*2+1;
		    	printf("Odenecek tutar: %.2f TL",odenecek_tutar);
			}
		    break;
    }
    getch();
    return 0;
}
{% endraw %}
```