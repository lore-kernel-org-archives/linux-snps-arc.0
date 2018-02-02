From: wbx@uclibc-ng.org (Waldemar Brodkorb)
Date: Fri, 2 Feb 2018 03:33:41 +0100
Subject: mman.h patch
In-Reply-To: <358b8834-7a51-5af2-b412-d80294c464ba@synopsys.com>
References: <20180201193623.GL4279@waldemar-brodkorb.de>
 <358b8834-7a51-5af2-b412-d80294c464ba@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180202023341.GO4279@waldemar-brodkorb.de>
To: linux-snps-arc@lists.infradead.org

Hi,
Vineet Gupta wrote,

> On 02/01/2018 11:43 AM, Waldemar Brodkorb wrote:
> >Hi,
> >
> >I would like to push attached patch next week.
> >Any veto?
> 
> So it seems there is code consolidation and additionally there's seems to be
> a semantical change to ldso mmap().
> 
> Assuming __ARCH_USE_MMU__ is true for say ARC, now we have
> _MAP_UNINITIALIZED == 0 vs. before MAP_UNINITIALIZED == 0x4000000.
> 
> So we won't be zero init ldso anon mmaps - which could be functionally OK,
> but I think better to split it out as a seperate patch just to call this out
> !

I believe MAP_UNINITIALIZED is only used by the Linux kernel for
noMMU cases, so the ARC definition was wrong.
Is it really a semantically change, if Linux kernel ignores it for
MMU targets?
May be a better commit log like the attached clarifies it?

best regards
 Waldemar
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0006-bits-mman.h-consolidate-header-file.patch
Type: text/x-diff
Size: 70047 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-snps-arc/attachments/20180202/d9a9e740/attachment-0001.bin>
