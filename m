From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 5 May 2016 16:35:08 +0530
Subject: [PATCH 1/7] asm-generic/io.h: add io{read,write}64 accessors
In-Reply-To: <4560398.4eHNWD6mu5@wuerfel>
References: <1462382179-11889-1-git-send-email-horia.geanta@nxp.com>
 <16429831.u9JK7qO1GE@wuerfel>
 <C2D7FE5348E1B147BCA15975FBA23075F4EA07DD@us01wembx1.internal.synopsys.com>
 <4560398.4eHNWD6mu5@wuerfel>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <572B28E4.3090700@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Thursday 05 May 2016 04:26 PM, Arnd Bergmann wrote:
> On Thursday 05 May 2016 08:16:47 Vineet Gupta wrote:
>> > Thx for noticing this Arnd and the heads up. Does the patch below look ok to you ?
>> > 
>> > ----------->
>> > rom b7e719831c389ab4fa338b2e2e7c0d1ff90dabb0 Mon Sep 17 00:00:00 2001
>> > From: Vineet Gupta <vgupta at synopsys.com>
>> > Date: Thu, 5 May 2016 13:32:34 +0530
>> > Subject: [PATCH] ARC: Add missing io barriers to io{read,write}{16,32}be()
>> > 
>> > While reviewing a different change to asm-generic/io.h Arnd spotted that
>> > ARC ioread32 and ioread32be both of which come from asm-generic versions
>> > are not symmetrical in terms of calling the io barriers.
>> > 
>> > generic ioread32   -> ARC readl()                  [ has barriers]
>> > generic ioread32be -> __be32_to_cpu(__raw_readl()) [ lacks barriers]
>> > 
>> > While generic ioread32be is being remediated to call readl(), that involves
>> > a swab32(), causing double swaps on ioread32be() on Big Endian systems.
>> > 
>> > So provide our versions of big endian IO accessors to ensure io barrier
>> > calls while also keeping them optimal
>> > 
>> > Suggested-by: Arnd Bergmann <arnd at arndb.de>
>> > Cc: stable at vger.kernel.org  [4.2+]
>> > Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
>
> Yes, that looks correct. We probably want this regardless of the change
> I proposed for the generic file, to avoid the double swap.

Indeed so - I've queued this for 4.6 fixes !

> Acked-by: Arnd Bergmann <arnd at arndb.de>

Thx !
