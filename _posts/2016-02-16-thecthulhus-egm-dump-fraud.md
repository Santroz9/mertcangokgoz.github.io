---
layout: post
title: (EN)TheCthulhus EGM Dump Fraud
date: 2016-02-16
type: post
categories: guvenlik
description: According to turkey time 05.02 PM, An English security activist @TheCthulhu published data that he claims
---

Hello to everyone,
According to turkey time 05.02 PM, An English security activist @TheCthulhu published data that he claims from EGM (Turkish National Police) as torrent.

He write his webpage on this:

![leakgorsel1](/assets/leakgorsel1.png)

```
I have been asked to release the following files by ROR[RG], who is responsible for collecting them.
The material was taken from the EGM which is the Turkey National Police.
The source has had persistent access to various parts of the Turkish Government infrastructure for the past 2 years and
in light of various government abuses in the past few months, has decided to take action against corruption by releasing this.

As with everything I share, I do not make any claims for the data. However, please note you may require some knowledge
of databases to be able to properly extrapolate information from this data set. If anyone can make a more accessible
version for the less technically inclined, ping it over to me and I will add it here.
```

Tweet about he said dump it:

<blockquote class="twitter-tweet" data-lang="tr"><p lang="en" dir="ltr">Another release, this time the EGM (Turkish National Police). Enjoy responsibly. <a href="https://t.co/ABiURM0rq2">https://t.co/ABiURM0rq2</a> <a href="https://t.co/WLYNABqlkf">pic.twitter.com/WLYNABqlkf</a></p>&mdash; TheCthulhu (@CthulhuSec) <a href="https://twitter.com/CthulhuSec/status/699247420803309569">15 Şubat 2016</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

We download and examine this leaked data from his torrent but we found big similarities between another leaked data from December 2014. data from 2014 was sold 250 TRY in some illegal hack forums. It was popular since 03.08.2015 and some forum admins banned threads but someone could send this data to Cthulhu.


![](/assets/leakforumgorsel1.png)

Another forum thread:

![](/assets/leakgorumgorsel2.png)

As it seen, data published approx. 5-6 months ago but some people says it was before than this.

Firstly we want compare this two data. We found hardly 2014 data from some private cloud accounts that shared in underground deepweb pages.

First of all I would like to specify that the data is not of Mernis systems are fully accrued in the year 2009 and 26 years later, but not necessarily all of the data to anyone.**There is no indication that it was stolen from EGM**
We don't found any hints from Turkish Police (EGM) and "Mernis system" in this data.

![mernisveri1](/assets/countgorsel.jpg)

Total number of records : 46.859.466 This mean's that actually 26 years and older persons living or dead that are kept in the SQL file. But Mernis system has data also younger than 18 age old.
But we look at records, rows and column names encrypted with some speacial string encrypt algorithms.

![korumagorsel](/assets/egmleakgorsel1.jpg)

So, data and its query software (Sorgu.exe) hardened by encryption but we see some duplicated entries as hint. But for fully decryption we must reverse the  `sorgu.exe` and get its algorithm.

![algoritmagorsel](/assets/sifrelemealgoritma.jpg)

Also, `sorgu.exe` has license protection. Our 2014 data has some installation waste like this:

![gorsel1](/assets/icerikgorsel.png)

We scan `sorgu.exe` with VirusTotal and Comodo found some trojan like shits. It could be false-possitive<sup>[[1]](https://forums.comodo.com/av-false-positivenegative-detection-reporting/all-dotfix-niceprotect-protected-applications-fp-t106050.0.html)</sup> but we don't think so.

Also according to our research this software communicate with `89.19.19.210` when licensing progress:

![ipadresi](/assets/Screenshot_2016-02-16_12-09-42.png)

When we do a more detailed review we found a phone number in strings. It could be software corporation sell this software to lawyers.

Another forum thread for query screen: [Link](http://deepwebtr.net/konu-Adres-Sorgu-Programi.html?pid=343331#pid343331)

![detay1](/assets/11855449_886336491421499_398067300_n.jpg)

![detay2](/assets/egm17gbdatas.PNG)
