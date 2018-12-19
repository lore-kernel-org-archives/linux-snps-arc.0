From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 18 Dec 2018 18:39:19 -0800
Subject: [PATCH 08/21] ARC: Linux Syscall Interface
In-Reply-To: <alpine.DEB.2.21.1812182324560.30183@digraph.polyomino.org.uk>
References: <1545167083-16764-1-git-send-email-vgupta@synopsys.com>
 <1545167083-16764-9-git-send-email-vgupta@synopsys.com>
 <alpine.DEB.2.21.1812182324560.30183@digraph.polyomino.org.uk>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <5f512e48-e7fc-2233-febd-2e6a8bc2311b@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 12/18/18 3:30 PM, Joseph Myers wrote:
> On Tue, 18 Dec 2018, Vineet Gupta wrote:
> 
>> +/* Flush cache(s).  */
>> +int
>> +_flush_cache (char *addr, const int nbytes, const int op)
>> +{
>> +  return INLINE_SYSCALL (cacheflush, 3, addr, nbytes, op);
>> +}
>> +weak_alias (_flush_cache, cacheflush)
> 
> Can't this use a syscalls.list entry instead of needing its own .c file?

Sure it can ! Done now.

>> diff --git a/sysdeps/unix/sysv/linux/arc/pt-vfork.S b/sysdeps/unix/sysv/linux/arc/pt-vfork.S
>> new file mode 100644
>> index 000000000000..65cc3823ac87
>> --- /dev/null
>> +++ b/sysdeps/unix/sysv/linux/arc/pt-vfork.S
>> @@ -0,0 +1 @@
>> +#include <sysdeps/unix/sysv/linux/alpha/pt-vfork.S>
> 
> This does nothing for a new port (it's just defining compat symbols).  I'd 
> expect
> 
> /* Not needed.  */
> 
> instead, as for RISC-V.

Done !

>> diff --git a/sysdeps/unix/sysv/linux/arc/sigaction.c b/sysdeps/unix/sysv/linux/arc/sigaction.c
> 
> Why do you need this, rather than using the unified version (possibly with 
> a few macros defined first)?

The only syscall ABI requirement is that we pass our our own SA_RESTORER stub
(rather than inject one in kernel, and deal with cache sync etc etc). Indeed the
common code can be used - likely was not the case when I started with ARC port, or
more likely the port that I started ARC port from ;-)

I'll update this.


>> +/* All syscall handler come here to avoid generated code bloat due to
>> + * GOT reference  to errno_location or it's equivalent
>> + */
>> +int __syscall_error(int err_no)
> 
> Return type goes on a separate line to the function name in a function 
> definition.

Oops sorry fixed.

> (This is in addition to the formatting issues that have been 
> noted elsewhere in the patch series, of which this code has at least three 
> - '*' at start of comment lines, missing '.' at end of comment and missing 
> space before '('.)

Sorry again. I can sense your valid frustration, but then a lint file or kernel's
checkpatch style tools ill go a long way. Anyhow for now I've fixed annoyances
(hopefully all of them).
