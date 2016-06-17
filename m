From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 17 Jun 2016 17:36:11 +0200
Subject: Build failures in -next due to 'locking/atomic, arch/arc:
 Implement atomic_fetch_{add,sub,and,andnot,or,xor}()'
In-Reply-To: <20160617152208.GX30154@twins.programming.kicks-ass.net>
References: <57640B08.4090007@roeck-us.net>
 <20160617143942.GV30154@twins.programming.kicks-ass.net>
 <20160617144136.GK30927@twins.programming.kicks-ass.net>
 <57640EB5.8090604@roeck-us.net> <576410AB.6050204@synopsys.com>
 <20160617152208.GX30154@twins.programming.kicks-ass.net>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <576418EB.5090607@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Friday 17 June 2016 05:22 PM, Peter Zijlstra wrote:
> Question; why does atomic_read() have a full memory clobber on arc?
> 
> Will thinks its because you don't use a memory constraint for *v.

So that is only for CONFIG_ARC_PLAT_EZNPS and very liekly not needed. Although NPS
has some design constraints which Noam knows of better !
