From: joseph@codesourcery.com (Joseph Myers)
Date: Tue, 18 Dec 2018 23:30:57 +0000
Subject: [PATCH 08/21] ARC: Linux Syscall Interface
In-Reply-To: <1545167083-16764-9-git-send-email-vgupta@synopsys.com>
References: <1545167083-16764-1-git-send-email-vgupta@synopsys.com>
 <1545167083-16764-9-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <alpine.DEB.2.21.1812182324560.30183@digraph.polyomino.org.uk>
To: linux-snps-arc@lists.infradead.org

On Tue, 18 Dec 2018, Vineet Gupta wrote:

> +/* Flush cache(s).  */
> +int
> +_flush_cache (char *addr, const int nbytes, const int op)
> +{
> +  return INLINE_SYSCALL (cacheflush, 3, addr, nbytes, op);
> +}
> +weak_alias (_flush_cache, cacheflush)

Can't this use a syscalls.list entry instead of needing its own .c file?

> diff --git a/sysdeps/unix/sysv/linux/arc/pt-vfork.S b/sysdeps/unix/sysv/linux/arc/pt-vfork.S
> new file mode 100644
> index 000000000000..65cc3823ac87
> --- /dev/null
> +++ b/sysdeps/unix/sysv/linux/arc/pt-vfork.S
> @@ -0,0 +1 @@
> +#include <sysdeps/unix/sysv/linux/alpha/pt-vfork.S>

This does nothing for a new port (it's just defining compat symbols).  I'd 
expect

/* Not needed.  */

instead, as for RISC-V.

> diff --git a/sysdeps/unix/sysv/linux/arc/sigaction.c b/sysdeps/unix/sysv/linux/arc/sigaction.c

Why do you need this, rather than using the unified version (possibly with 
a few macros defined first)?

> +/* All syscall handler come here to avoid generated code bloat due to
> + * GOT reference  to errno_location or it's equivalent
> + */
> +int __syscall_error(int err_no)

Return type goes on a separate line to the function name in a function 
definition.  (This is in addition to the formatting issues that have been 
noted elsewhere in the patch series, of which this code has at least three 
- '*' at start of comment lines, missing '.' at end of comment and missing 
space before '('.)

-- 
Joseph S. Myers
joseph at codesourcery.com
