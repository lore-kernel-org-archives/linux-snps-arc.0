From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 1 Feb 2018 14:31:58 -0800
Subject: mman.h patch
In-Reply-To: <20180201193623.GL4279@waldemar-brodkorb.de>
References: <20180201193623.GL4279@waldemar-brodkorb.de>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <358b8834-7a51-5af2-b412-d80294c464ba@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 02/01/2018 11:43 AM, Waldemar Brodkorb wrote:
> Hi,
>
> I would like to push attached patch next week.
> Any veto?

So it seems there is code consolidation and additionally there's seems to be a 
semantical change to ldso mmap().

Assuming __ARCH_USE_MMU__ is true for say ARC, now we have _MAP_UNINITIALIZED == 0 
vs. before MAP_UNINITIALIZED == 0x4000000.

So we won't be zero init ldso anon mmaps - which could be functionally OK, but I 
think better to split it out as a seperate patch just to call this out !

-Vineet
