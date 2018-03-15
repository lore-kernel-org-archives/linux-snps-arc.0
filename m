From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Thu, 15 Mar 2018 09:12:09 +0000
Subject: arc_usr_cmpxchg and preemption
In-Reply-To: <20180315081845.GS4064@hirez.programming.kicks-ass.net>
References: <1521045375.11552.27.camel@synopsys.com>
 <fdf30e76-f75d-9dda-26ca-ac011c41ee64@synopsys.com>
 <20180314175352.GP4064@hirez.programming.kicks-ass.net>
 <1521059931.11552.51.camel@synopsys.com>
 <20180315081845.GS4064@hirez.programming.kicks-ass.net>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1521105128.11552.64.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Peter,

On Thu, 2018-03-15@09:18 +0100, Peter Zijlstra wrote:
> On Wed, Mar 14, 2018@08:38:53PM +0000, Alexey Brodkin wrote:
> > > int sys_cmpxchg(u32 __user *user_ptr, u32 old, u32 new)
> > > {
> > > 	u32 val;
> > > 	int ret;
> > > 
> > > again:
> > > 	ret = 0;
> > > 
> > > 	preempt_disable();
> > > 	val = get_user(user_ptr);
> > > 	if (val == old)
> > > 		ret = put_user(new, user_ptr);
> > > 	preempt_enable();
> > > 
> > > 	if (ret == -EFAULT) {
> > > 		struct page *page;
> > > 		ret = get_user_pages_fast((unsigned long)user_ptr, 1, 1, &page);
> > > 		if (ret < 0)
> > > 			return ret;
> > > 		put_page(page);
> > > 		goto again;
> > 
> > I guess this jump we need to do only once, right?
> 
> Typically, yes. It is theoretically possible for the page to get
> paged-out right after we do put_page() and before we do get/put_user(),
> But if that happens the machine likely has bigger problems than having
> to do this loop again.
> 
> FWIW, look at kernel/futex.c for working examples of this pattern, the
> above was written purely from memory and could contain a fail or two ;-)

Thanks for the pointer!

> Also, it might make sense to stuff this implementation in some lib/ file
> somewhere and make all platforms that need it use the same code, afaict
> there really isn't anything platform specific to it.

Not clear which part do you mean here.
Are you talking about entire cmpxchg syscall implementation?

Do you think there're many users of that quite an inefficient
[compared to proper HW version] atomic exchange?

-Alexey
