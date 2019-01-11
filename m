From: anthony.yznaga@oracle.com (Anthony Yznaga)
Date: Thu, 10 Jan 2019 20:25:09 -0800
Subject: [PATCH 3/3] bitops.h: set_mask_bits() to return old value
In-Reply-To: <1547166387-19785-4-git-send-email-vgupta@synopsys.com>
References: <1547166387-19785-1-git-send-email-vgupta@synopsys.com>
 <1547166387-19785-4-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <693b30a9-96dc-a5e6-9708-c215b90146b0@oracle.com>
To: linux-snps-arc@lists.infradead.org



On 1/10/19 4:26 PM, Vineet Gupta wrote:
> | > Also, set_mask_bits is used in fs quite a bit and we can possibly come up
> | > with a generic llsc based implementation (w/o the cmpxchg loop)
> |
> | May I also suggest changing the return value of set_mask_bits() to old.
> |
> | You can compute the new value given old, but you cannot compute the old
> | value given new, therefore old is the better return value. Also, no
> | current user seems to use the return value, so changing it is without
> | risk.
>
> Link: http://lkml.kernel.org/g/20150807110955.GH16853 at twins.programming.kicks-ass.net
> Suggested-by: Peter Zijlstra <peterz at infradead.org>
> Cc: Miklos Szeredi <mszeredi at redhat.com>
> Cc: Ingo Molnar <mingo at kernel.org>
> Cc: Jani Nikula <jani.nikula at intel.com>
> Cc: Chris Wilson <chris at chris-wilson.co.uk>
> Cc: Andrew Morton <akpm at linux-foundation.org>
> Cc: Will Deacon <will.deacon at arm.com>
> Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
>

Reviewed-by: Anthony Yznaga <anthony.yznaga at oracle.com>
