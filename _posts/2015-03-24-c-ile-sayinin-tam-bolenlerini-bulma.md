---
layout: post
title: C ile Sayının Tam Bölenlerini Bulma
date: 2015-03-24
type: post
categories: Programlama
description: C ile programa girilen herhangi bir sayının içindeki tam bölenleri bulmak isterseniz aşağıdaki kodu kullanabilirsiniz.istersenizde sayının
---

C ile programa girilen herhangi bir sayının içindeki tam bölenleri bulmak isterseniz aşağıdaki kodu kullanabilirsiniz.istersenizde sayının kaça tam bölündüğünü ufak bir değişiklik ile anlaya bilirsiniz.

```c
{% raw %}
    #include<stdio.h>

    int main(void){
    	int sayi1,bol,bolum;
    	printf("Herhangi bir sayi giriniz n");
    	scanf("%d",&sayi1);
    	for(bol = 1; bol<=sayi1;bol++){
    		bolum=sayi1 % bol;
    		if(bolum==0){
    			printf("Sayi %d n",bol);
    		}
    	}
    	return 0;
    }
{% endraw %}
```

Örnek Çıktımız

![ciletambolunebilmeciktisi](/assets/ciletambolunebilmeciktisi.jpg)
