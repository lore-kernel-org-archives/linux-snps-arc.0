From: peterz@infradead.org (Peter Zijlstra)
Date: Tue, 17 Nov 2015 12:23:43 +0100
Subject: [PATCH v2 18/19] ARC: [plat-eznps] replace sync with proper cpu
 barrier
In-Reply-To: <564B0BB1.8080709@synopsys.com>
References: <1446297327-16298-1-git-send-email-noamc@ezchip.com>
 <1446893557-29748-19-git-send-email-noamc@ezchip.com>
 <564B0BB1.8080709@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20151117112343.GW3816@twins.programming.kicks-ass.net>
To: linux-snps-arc@lists.infradead.org

On Tue, Nov 17, 2015@04:42:49PM +0530, Vineet Gupta wrote:
> On Saturday 07 November 2015 04:22 PM, Noam Camus wrote:
> > From: Tal Zilcer <talz at ezchip.com>
> > 
> > In SMT system like we have the generic "sync" is not working with
> > HW threads. The replacement is "schd.rw" instruction that is served
> > as cpu barrier for HW threads.
> 
> As discussed in v2 of this patch, SYNC or some such in __switch_to is completely
> superfluous. We don't need this patch, you may instead wanna submit a patch which
> removes the sync. Also please do that in assembler version of this file as well !

Do test it though; as is ARC-SMP seems to have a _lot_ of superfluous
barriers many of which have no explanation yet (I'm thinking of those
extra smp_mb()s in the lock primitives).
