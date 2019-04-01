From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 1 Apr 2019 18:01:51 +0000
Subject: [PATCH 5/5] Lib: sort.h: replace int size with size_t size in
 the swap function
References: <18626931553963861@sas1-b3ec53dbc12b.qloud-c.yandex.net>
 <20467491553964233@myt4-c0b480c282c8.qloud-c.yandex.net>
 <20190330183826.GB21828@kroah.com> <201903302015.x2UKFnSL003850@sdf.org>
 <20434561554015618@myt1-cd60b8ae9bb9.qloud-c.yandex.net>
 <20190331105412.GA9393@kroah.com>
 <cd57af9a2c1e494cbc8631a0347831dc@AcuMS.aculab.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075014643F9DF@US01WEMBX2.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 4/1/19 7:46 AM, David Laight wrote:
> From: gregkh at linuxfoundation.org
>> Sent: 31 March 2019 11:54
> ...
>> Yes, "int" is a very nice variable for "size", you need to explain why
>> it is better to use size_t here please.
> Actually, on x86_64 you probably want 'unsigned int' to avoid the
> compiler having to generate a sign-extending register move if the
> value is ever used in a 64bit expression (eg an address calculation).

Thats likely true for non x86 arches too (for certain on ARC). That is also the
reason I dislike "bool", despite its "software engineering" benefits. Per ARC ABI
(and likely others too) it is signed 8 bits and any use thereof, requires the
compiler to generate an additional EXTB instruction to promote to 32-bit int with
sign extension before using the value.

-Vineet
