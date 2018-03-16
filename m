From: peterz@infradead.org (Peter Zijlstra)
Date: Fri, 16 Mar 2018 18:58:56 +0100
Subject: arc_usr_cmpxchg and preemption
In-Reply-To: <b0283507-5ab7-e40b-74a7-3ddebafb076d@synopsys.com>
References: <1521045375.11552.27.camel@synopsys.com>
 <fdf30e76-f75d-9dda-26ca-ac011c41ee64@synopsys.com>
 <20180314175352.GP4064@hirez.programming.kicks-ass.net>
 <1521221606.4805.16.camel@synopsys.com>
 <b0283507-5ab7-e40b-74a7-3ddebafb076d@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180316175856.GD4043@hirez.programming.kicks-ass.net>
To: linux-snps-arc@lists.infradead.org

On Fri, Mar 16, 2018@10:54:52AM -0700, Vineet Gupta wrote:
> I'd say just bite the bullet, write the patch and we can refine it there !

Just be glad its not futex.c proper ;-) I'll try and have a look later..
