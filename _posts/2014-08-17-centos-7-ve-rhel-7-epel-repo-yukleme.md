---
layout: post
title: Centos 7 ve RHEL 7 EPEL Repo Yükleme
date: 2014-08-17 05:07:54.000000000 +03:00
type: post
published: true
status: publish
categories: linux
description: CENTOS ve RHEL 7 seçipde kullanan arkadaşların belkide sorunlarından bir taneside extra repoların yüklenmesinin nasıl olduğu çünkü centos/rhel 6 serisine
---
**CENTOS** ve **RHEL**  **7** seçipde kullanan arkadaşların belkide sorunlarından bir tanesi de extra repoların yüklenmesinin nasıl olduğu çünkü centos/rhel 6 serisine bakıldığı zaman 7 de tamamen kurulumlarının farklı olduğunu görmekdeyiz.Aslında centos/rhel 6 ile neredeyse aynı denebilirdi ancak repoların hem versiyon farklılığı hem kullandıkları parametreler standartlara göre değişik şimdi öncelikle bize centos 7 bir sistem lazım ki şuanda kullandığım web server centos 7

    cd /tmp
    wget http://dl.fedoraproject.org/pub/epel/beta/7/x86_64/epel-release-7-0.2.noarch.rpm
    ls *.rpm

ilk önce **tmp** ye dosyamızı indiriyoruz.sonradan sistemde bulunmaması adına böyle birşey yapma gereği duydum tmp sonuçta crontab ile vakti gelince silinecektir.

    sudo yum install epel-release-7-0.2.noarch.rpm

Parametremiz ile epel rapomuzun kurulum komutunu verdik ve aşağıdaki gibi bir çıktı aldık

![centos7epelrepokurulumugorsel1](/assets/centos7epelrepokurulumugorsel1.png)

Harbiden kurulmuş mu diye bakıyoruz.Ama öncesinde **"y"** basıp ittiriyoruz ki kurulsun

    sudo yum repolist

![centos7epelrepokurulumugorsel2](/assets/centos7epelrepokurulumugorsel2.png)

ve nihayetinde kurulduğuna inanabiliriz.Çünkü listemizde gözükmekte peki bu **epel** reposunda neler var görmek istiyorsak epel içerisinde arama yapıyoruz ve tüm hepsini listeliyoruz.

    sudo yum --disablerepo="*" --enablerepo="epel" list available

![centos7epelrepokurulumugorsel3](/assets/centos7epelrepokurulumugorsel3.png)

Arama yapacak isek ve paket adımızı biliyorsak işimiz daha kolay aşağıdaki örnek ile yapabilirsiniz.

    sudo yum search paketadı
