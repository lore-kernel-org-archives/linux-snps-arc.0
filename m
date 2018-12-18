From: joseph@codesourcery.com (Joseph Myers)
Date: Tue, 18 Dec 2018 23:09:55 +0000
Subject: [PATCH 03/21] ARC: ABI Implementation
In-Reply-To: <1545167083-16764-4-git-send-email-vgupta@synopsys.com>
References: <1545167083-16764-1-git-send-email-vgupta@synopsys.com>
 <1545167083-16764-4-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <alpine.DEB.2.21.1812182302430.30183@digraph.polyomino.org.uk>
To: linux-snps-arc@lists.infradead.org

On Tue, 18 Dec 2018, Vineet Gupta wrote:

> +/* FLAG 1 is privilege mode only instruction, hence will crash any program */

Generally, throughout the port, make sure comments end ".  " (full stop, 
two spaces, end of comment).  I won't remark on other places with this 
formatting issue.

> diff --git a/sysdeps/arc/crti.S b/sysdeps/arc/crti.S

As a new port I think it would be best to use init_array in your Implies 
file so you don't need these crti / crtn files, and make GCC generate 
init_array / fini_array exclusively.  (See RISC-V and C-Sky discussions of 
this issue.)

> +#ifdef __A7__
> +#define ARC_PLT_SIZE	12
> +#else
> +#define ARC_PLT_SIZE	16
> +#endif

Except for the multiple-include guards round a whole header file, 
preprocessor directives inside #if should have indentation in glibc, so 
"# define" (and "#  define" inside two levels of #if, etc.).  (As usual, 
fix this throughout the port; I won't list other individual places with 
this issue.)

> +#define reloc_index					\
> +({							\
> +  unsigned long plt0 = D_PTR (l, l_info[DT_PLTGOT]);	\
> +  unsigned long pltn = reloc_arg;			\
> +  /* exclude PL0 and PLT1 */				\

Note the first letter of a comment should be capitalized (in addition to 
ending with ".  ").

> +  unsigned long idx = (pltn - plt0)/ARC_PLT_SIZE - 2;	\

glibc style uses "unsigned long int", not just "unsigned long".

> diff --git a/sysdeps/arc/tls-macros.h b/sysdeps/arc/tls-macros.h
> new file mode 100644
> index 000000000000..51855edef6e7
> --- /dev/null
> +++ b/sysdeps/arc/tls-macros.h
> @@ -0,0 +1,29 @@
> +/* Macros to support TLS testing in times of missing compiler support.  */

Any file more than ten lines long should have copyright and license 
notices.

-- 
Joseph S. Myers
joseph at codesourcery.com
