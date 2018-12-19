From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 19 Dec 2018 17:36:35 +0000
Subject: [PATCH 1/2] ARC: show_regs: avoid page allocator
References: <1545159239-30628-1-git-send-email-vgupta@synopsys.com>
 <1545159239-30628-2-git-send-email-vgupta@synopsys.com>
 <1545239047.14089.13.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075014642226B@US01WEMBX2.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 12/19/18 9:04 AM, Eugeniy Paltsev wrote:
> Just curious: isn't that enough to use GFP_NOWAIT instead
> of GFP_KERNEL when we allocate page in show_regs()?
>
> As I can see x86 use print_vma_addr() in their show_signal_msg()
> function which allocate page with __get_free_page(GFP_NOWAIT);

I'm not sure if lockdep will be happy with it still.

At any rate, as explained in changelog, this still has merit, since the buffer is
only needed for nested d_path calls, which are better served with a smaller
on-stack buffer. For cases such as kernel crash, we want lesser code/traces in
fault path to sift thru !

-Vineet
