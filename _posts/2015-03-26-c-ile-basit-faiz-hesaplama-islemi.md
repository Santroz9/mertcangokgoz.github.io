---
layout: post
title: C ile Basit Faiz Hesaplama İşlemi
date: 2015-03-26
type: post
categories: Programlama
description: C ile Basit Faiz Hesaplama işlemini aşağıdaki gibi yapabilirsiniz.Bu örnek kodumuzda
---

C ile Basit Faiz Hesaplama işlemini aşağıdaki gibi yapabilirsiniz.Bu örnek kodumuzda çıkan sonuçları for döngüsü ile yıllık olarak ekranda gösterdik bunu formatlı bir şekilde yaptık ve son olarakda toplam yıl bazınca alacağı ücreti ekranda gösterdik.

```c
{% raw %}
    #include<stdio.h>

    int main(void){
    	double faiz,anapara,oran;
    	int yil,y;
    	printf("Anapara faiz ve yili giriniz\n");
    	scanf("%lf%lf%d",&anapara,&oran,&y);
    	printf("%4s%22s\n","yil","biriken para");
    	for(yil=1;yil<=y;yil++){
    		faiz= anapara*(1+oran*yil);
    		printf("%4d%21.2f\n",yil,faiz);
    	}
    	printf("%d yillik toplam Faiz %.lf TL\n",y,faiz);
    	return 0;
    }
{% endraw %}
```
