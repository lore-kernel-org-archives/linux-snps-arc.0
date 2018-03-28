From: hch@lst.de (hch@lst.de)
Date: Wed, 28 Mar 2018 09:53:13 +0200
Subject: dma-mapping: clearing GFP_ZERO flag caused crashes of Ethernet
 on arc/hsdk board.
In-Reply-To: <1522185558.6917.7.camel@synopsys.com>
References: <1522170774.2593.9.camel@synopsys.com>
 <CAHp75VeZSsdR1=ZhOM6jseYCP3m0GyE=8EjJUxWosze9BBw9rQ@mail.gmail.com>
 <1522185558.6917.7.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180328075313.GA19864@lst.de>
To: linux-snps-arc@lists.infradead.org

> > The logical question is why?
> 
> 1. See that's another platform with ARC core so maybe in case of ARM
>    DMA allocator already zeroes pages regardless provided flags -
>    personally I didn't check that.

Yes, most architectures always clear memory returned by dma_alloc*.
Looks like a few don't and my commit got them in trouble.  As usual
I'd prefer to match x86 semantics for now to avoid problems.

I'll send patches for arc and s390 which seem to be actually used
holdouts, and will look if anyone else is also affected.
