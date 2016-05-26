From: vgupta@synopsys.com (Vineet Gupta)
Date: Thu, 26 May 2016 17:37:44 +0530
Subject: Unaligned flush_dcache_range in axs101.c
In-Reply-To: <1464262710.4578.17.camel@synopsys.com>
References: <570219DD.4020007@suse.de> <1460396935.5119.57.camel@synopsys.com>
 <570BE4D8.9050303@denx.de> <1460398438.5119.73.camel@synopsys.com>
 <570BF185.2050705@denx.de> <1460725252.3025.55.camel@synopsys.com>
 <5710F165.9040008@denx.de> <1464262710.4578.17.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <5746E710.4060800@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Thursday 26 May 2016 05:09 PM, Alexey Brodkin wrote:

> In the code you were referring what I wanted to modify reset vector of the slave core.
> And while we were living without IOC it was all OK. My code above wrote-back
> (or as we used to call it within ARC "flushed") L1 data cache with modified
> reset vector contents to L2 (which is combined data and instruction cache in case of ARC)
> and once slave core was unhalted it read reset vector contents via instruction
> fetch hardware and executed right what I wanted.

I don't have the full context here, but I think for this specific case (writing
reset vector of other core), you don't need to invent a new interface. You can
just do an uncached store (ST.di) which will ensure that the data goes straight to
memory. You need to make sure that this line is not in other cores' caches L1
and/or L2 - which can probably be assumed if it's just coming out of reset.

-Vineet
