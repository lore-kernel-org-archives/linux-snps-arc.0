From: joseph@codesourcery.com (Joseph Myers)
Date: Mon, 28 Jan 2019 23:13:18 +0000
Subject: ARC binutils init/fini (was Re: [PATCH 03/21] ARC: ABI
 Implementation)
In-Reply-To: <15846e18-34a8-d368-61c0-1d101a956884@synopsys.com>
References: <1545167083-16764-1-git-send-email-vgupta@synopsys.com>
 <1545167083-16764-4-git-send-email-vgupta@synopsys.com>
 <alpine.DEB.2.21.1812182302430.30183@digraph.polyomino.org.uk>
 <15846e18-34a8-d368-61c0-1d101a956884@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <alpine.DEB.2.21.1901282309250.22928@digraph.polyomino.org.uk>
To: linux-snps-arc@lists.infradead.org

On Mon, 28 Jan 2019, Vineet Gupta wrote:

> In the failing case, the dsos are NOT getting the DT_INIT/DT_FINI 
> dynamic tags

And they shouldn't be (they should have DT_INIT_ARRAY / DT_FINI_ARRAY 
instead).

> (1). gcc config test failing (false alaram)
> 
> | host-gcc-final-ab544139bfee/build/gcc/config.log
> |
> |configure:22941: checking for .preinit_array/.init_array/.fini_array support
> |configure:23106: checking cross compile... guessing
> |configure:23111: result: no
> 
> gcc was seemingly built w/o init_array support leading to inclusion of default
> gcc/config/initfini-array.h
> However doing a glibc aarch64 build I see the same output so perhaps it is not
> relevant.

This was discussed at length in the C-Sky discussion.  In short: the 
proper fix is to change that configure test to apply for cross compilation 
as well, other than in the very limited case where it tries to run 
something (but doing so is not appropriate in the current 
regression-fixes-only GCC development stage).  You can hack around it with 
gcc_cv_initfini_array=yes for the target in config.gcc, as done by a few 
architectures.  Or you can define the relevant target macros in 
gcc/config/<arch>/<something>.h to force init_array / fini_array use 
independent of the configure test, as done for AArch64.

-- 
Joseph S. Myers
joseph at codesourcery.com
