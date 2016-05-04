---
layout: post
title: C ile Matris Toplama İşlemi
date: 2015-03-28
type: post
categories: Programlama
description: C ile tanımlamış olduğunuz 2 matrisi toplayabilirsiniz bunun için arraylar kullanıyoruz.Biraz
---

C ile tanımlamış olduğunuz 2 matrisi toplayabilirsiniz bunun için arraylar kullanıyoruz.Biraz karışık olsada toplama işlemi sorunsuz bir şekilde gerçekleştirebiliyoruz.Örnek kodumuzu aşağıda bulabilirsiniz

```c
{% raw %}
    #include<stdio.h>

    main(){
          int matris1[4][3] = {{6,7,8},{1,3,2},{5,2,8},{1,3,6}};
          int matris2[4][3] = {{6,8,1},{9,11,3},{3,10,18},{14,2,8}};  
          int toplam[4][3];

          int i,j;

          for(i=0;i<4;i++)
          {
             for(j=0;j<3;j++)
             {
                toplam[i][j] = matris1[i][j] + matris2[i][j];          
             }
          }
          for(i=0;i<4;i++)
          {
             for(j=0;j<3;j++)
             {
                printf("%d ",toplam[i][j]);        
             }
             printf("nn");      
          }
          return 0;
    }
{% endraw %}
```

Örnek Çıktı

![cilematristoplamaislemi](/assets/cilematristoplamaislemi.jpg)
