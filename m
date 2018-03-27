From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Tue, 27 Mar 2018 21:19:19 +0000
Subject: dma-mapping: clearing GFP_ZERO flag caused crashes of Ethernet
 on arc/hsdk board.
In-Reply-To: <CAHp75VeZSsdR1=ZhOM6jseYCP3m0GyE=8EjJUxWosze9BBw9rQ@mail.gmail.com>
References: <1522170774.2593.9.camel@synopsys.com>
 <CAHp75VeZSsdR1=ZhOM6jseYCP3m0GyE=8EjJUxWosze9BBw9rQ@mail.gmail.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1522185558.6917.7.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Andy,

On Tue, 2018-03-27@21:11 +0300, Andy Shevchenko wrote:
> On Tue, Mar 27, 2018 at 8:12 PM, Evgeniy Didin
> <Evgeniy.Didin@synopsys.com> wrote:
> > Hello,
> > 
> > After commit  57bf5a8963f8 ("dma-mapping: clear harmful GFP_* flags in common code")  we noticed problems with Ethernet controller on one of our
> > platforms (namely ARC HSDK).
> > I
> > n particular we see that removal of __GFP_ZERO flag in function dma_alloc_attrs() was the culprit because in our implementation of arc_dma_alloc()
> > we only allocate zeroed pages if
> > that flag is explicitly set by the caller. Now with unconditional removal of that flag in dma_alloc_attrs() we allocate non-zeroed pages and that
> > seem to cause problems.
> > 
> > From
> > mentioned commit message I may conclude that architectural code is supposed to always allocate zeroed pages but I cannot find any requirement of
> > that in kernel's documentation.
> > Coul
> > d you please point me to that requirement if that exists at all, then we'll implement a fix in our arch code like that:
> 
> Can you elaborate what driver is in use?
> stmmac with dwmac-anarion?

It is indeed DW GMAC (AKA STMMAC) with built-in DMA.

> If so, this driver (w/o anarion parts, which I believe doesn't have
> anything to do with this) is widely used on other platforms.
> We have to see a lot of reports, though only one so far?
> 
> The logical question is why?

1. See that's another platform with ARC core so maybe in case of ARM
   DMA allocator already zeroes pages regardless provided flags -
   personally I didn't check that.

2. Even on HSDK we saw that only on attempt to run "iperf", even DHCP
   client works perfectly fine on that same platform so maybe others
   just don't see problems yet.

3. Who knows if RCs are being tested on other platforms with
   networking so maybe similar reports will start to appear once
   4.16 gets released.

-Alexey
