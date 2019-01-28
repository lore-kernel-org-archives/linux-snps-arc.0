From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 28 Jan 2019 23:42:56 +0000
Subject: ARC binutils init/fini (was Re: [PATCH 03/21] ARC: ABI
 Implementation)
References: <1545167083-16764-1-git-send-email-vgupta@synopsys.com>
 <1545167083-16764-4-git-send-email-vgupta@synopsys.com>
 <alpine.DEB.2.21.1812182302430.30183@digraph.polyomino.org.uk>
 <15846e18-34a8-d368-61c0-1d101a956884@synopsys.com>
 <alpine.DEB.2.21.1901282309250.22928@digraph.polyomino.org.uk>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075014642D111@US01WEMBX2.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 1/28/19 3:13 PM, Joseph Myers wrote:
> This was discussed at length in the C-Sky discussion.  In short: the 
> proper fix is to change that configure test to apply for cross compilation 
> as well, other than in the very limited case where it tries to run 
> something (but doing so is not appropriate in the current 
> regression-fixes-only GCC development stage).  You can hack around it with 
> gcc_cv_initfini_array=yes for the target in config.gcc, as done by a few 
> architectures.  Or you can define the relevant target macros in 
> gcc/config/<arch>/<something>.h to force init_array / fini_array use 
> independent of the configure test, as done for AArch64.

Awesome, now I see how it was working for RISCV (config test printed "cached") and
AArch64
I've added a local hack to gcc.config to test things out and will tackle this over
at gcc mailing list.

Many thx for untangling this for me. I found the C-Sky discussion as well [1]
adding a link here for someone else in future who trips on this again.

-Vineet

[1] https://sourceware.org/ml/libc-alpha/2018-11/msg00870.html
