From: peterz@infradead.org (Peter Zijlstra)
Date: Wed, 22 Nov 2017 00:13:15 +0100
Subject: [PATCH 0/4] ARC perf updates
In-Reply-To: <879d7ddd-6942-7b85-a926-f04edfdaa44c@synopsys.com>
References: <1510092784-19942-1-git-send-email-vgupta@synopsys.com>
 <879d7ddd-6942-7b85-a926-f04edfdaa44c@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20171121231315.fmsnexqxu7ejm6au@hirez.programming.kicks-ass.net>
To: linux-snps-arc@lists.infradead.org

On Tue, Nov 21, 2017@02:09:38PM -0800, Vineet Gupta wrote:
> On 11/07/2017 02:13 PM, Vineet Gupta wrote:
> > Hi,
> > 
> > Found these when cleaning up some old branches. The only controversial one
> > could be the last one.
> > 
> > Thx,
> > -Vineet
> > 
> > Vineet Gupta (4):
> >    ARCv2: perf: tweak overflow interrupt
> >    ARCv2: perf: optimize given that num counters <= 32
> >    ARC: perf: avoid vmalloc backed mmap
> >    ARCv2: entry: Reduce perf intr return path
> > 
> >   arch/arc/Kconfig                   |  2 +-
> >   arch/arc/include/asm/entry-arcv2.h |  2 ++
> >   arch/arc/kernel/entry-arcv2.S      | 23 +++++++++++++++++++++-
> >   arch/arc/kernel/perf_event.c       | 40 ++++++++++++++++++++------------------
> >   4 files changed, 46 insertions(+), 21 deletions(-)
> 
> Peter, do I need an ACK from you for the initial 3 patches to able to add
> them to ARC tree ?

Sure, for 1-3

Acked-by: Peter Zijlstra (Intel) <peterz at infradead.org>
