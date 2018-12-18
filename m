From: joseph@codesourcery.com (Joseph Myers)
Date: Tue, 18 Dec 2018 23:23:01 +0000
Subject: [PATCH 07/21] ARC: math soft float support
In-Reply-To: <1545167083-16764-8-git-send-email-vgupta@synopsys.com>
References: <1545167083-16764-1-git-send-email-vgupta@synopsys.com>
 <1545167083-16764-8-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <alpine.DEB.2.21.1812182315580.30183@digraph.polyomino.org.uk>
To: linux-snps-arc@lists.infradead.org

On Tue, 18 Dec 2018, Vineet Gupta wrote:

> +#if defined(__ARC_FPU_SP__) || defined(__ARC_FPU_DP__)

Missing spaces before '(' (should have such spaces in most cases between 
an identifier or keyword and '(' - calls to "defined", calls to functions, 
calls to macros, __attribute__, etc. - except for a few cases of calls to 
macros such as ElfW where the result is logically used like an 
identifier).

> +/* In the soft-float case, only rounding to nearest is supported, with
> +   no exceptions.  */

To confirm: hard-float and soft-float are always different ABIs; you don't 
support hard-float compilation using the soft-float function calling ABI 
(like is supported for ARM and RISC-V, for example)?  (If you support 
hard-float compilation with the soft-float ABI, it would be problematic to 
have different FE_TONEAREST values in the two cases - ARM and RISC-V both 
define all the FE_* macros independently of whether hard or soft float is 
used, because they support that case.)

> diff --git a/sysdeps/arc/math_private.h b/sysdeps/arc/math_private.h

This file should not be needed now.

> diff --git a/sysdeps/arc/nofpu/math-tests-exception.h b/sysdeps/arc/nofpu/math-tests-exception.h

This file does nothing (the name is wrong, the name actually used is 
math-tests-exceptions.h).  And it should not be needed unless you support 
hard-float compilation with the soft-float ABI (and thus define all the 
FE_* names in bits/fenv.h even for soft-float).

> diff --git a/sysdeps/arc/nofpu/math-tests-rounding.h b/sysdeps/arc/nofpu/math-tests-rounding.h

Again, not needed unless hard-float compilation with the soft-float ABI is 
supported and bits/fenv.h has corresponding contents.

-- 
Joseph S. Myers
joseph at codesourcery.com
