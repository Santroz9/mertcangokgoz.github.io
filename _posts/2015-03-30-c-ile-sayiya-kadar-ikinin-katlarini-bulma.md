---
layout: post
title: C ile Sayıya kadar İkinin Katlarını Bulma
date: 2015-03-30
type: post
categories: Programlama
description: C ile Girilen Sayıya kadar ikinin katlarını yazdırma ve girilen sayının en büyük ikinin kuvvetini yazdıran
---

C ile Girilen Sayıya kadar ikinin katlarını yazdırma ve girilen sayının en büyük ikinin kuvvetini yazdıran uygulamamız.Yani 1000 Girdiğinizde en son 2 nin en büyük katı olarak karşınıza 1024 çıkacaktır.

```c
{% raw %}
    #include<stdio.h>

    int main(void){

    	int carpim=2,kac;
    	printf("Bir Sayi Girinizn");
    	scanf("%d",&kac);
    	while(carpim<kac){
    		carpim=carpim*2;
    		printf("%dn",carpim);
    	}
    	printf("%d Sayisinin En buyuk 2 nin kati %d",kac,carpim);
    	return 0;
    }
{% endraw %}
```

Çıktı Örneği

![cilegirilensayininicindekiciftibulma](/assets/cilegirilensayininicindekiciftibulma.jpg)
