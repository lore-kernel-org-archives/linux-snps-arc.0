From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 1 Apr 2019 18:22:29 +0000
Subject: [PATCH 5/5] Lib: sort.h: replace int size with size_t size in
 the swap function
References: <18626931553963861@sas1-b3ec53dbc12b.qloud-c.yandex.net>
 <20467491553964233@myt4-c0b480c282c8.qloud-c.yandex.net>
 <20190330183826.GB21828@kroah.com> <201903302015.x2UKFnSL003850@sdf.org>
 <20434561554015618@myt1-cd60b8ae9bb9.qloud-c.yandex.net>
 <20190331105412.GA9393@kroah.com>
 <cd57af9a2c1e494cbc8631a0347831dc@AcuMS.aculab.com>
 <C2D7FE5348E1B147BCA15975FBA23075014643F9DF@US01WEMBX2.internal.synopsys.com>
 <440631554142479@myt6-23299ba78d64.qloud-c.yandex.net>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075014643FA6C@US01WEMBX2.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 4/1/19 11:14 AM, Andrey Abramov wrote:
> George Spelvin wrote "So how about *deleting* the parameter instead?
> That simplifies everything.", and he is right,
> so I am just going to completely remove it.
>
> Any objections?

LGTM.
