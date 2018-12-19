From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 19 Dec 2018 11:57:13 -0800
Subject: [PATCH 09/21] ARC: Linux ABI
In-Reply-To: <alpine.DEB.2.21.1812182333230.30183@digraph.polyomino.org.uk>
References: <1545167083-16764-1-git-send-email-vgupta@synopsys.com>
 <1545167083-16764-10-git-send-email-vgupta@synopsys.com>
 <alpine.DEB.2.21.1812182333230.30183@digraph.polyomino.org.uk>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <c987196c-3791-01b1-8bd3-c579f58982a9@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 12/18/18 3:38 PM, Joseph Myers wrote:
> On Tue, 18 Dec 2018, Vineet Gupta wrote:
> 
>> +typedef unsigned short int __pr_uid_t;
>> +typedef unsigned short int __pr_gid_t;
> 
> Are you sure?  

No I'm not :-) There were some interim sweeping changes in this area since when I
started so this might indeed be redundant as you say.

> I don't see an ARC-specific definition of __kernel_uid_t or 
> __kernel_gid_t in the Linux kernel at all (which would mean unsigned int 
> is actually used and you don't need this header at all).

I'll check.

>> diff --git a/sysdeps/unix/sysv/linux/arc/bits/sigaction.h b/sysdeps/unix/sysv/linux/arc/bits/sigaction.h
> 
> I wouldn't expect new architectures to have their own bits/sigaction.h.  
> Rather, I'd expect them to use the generic bits/sigaction.h and the 
> generic code to convert from the userspace struct sigaction to the kernel 
> version.

So this is further to the other thread about generic sigaction (sorry for
cross-post). Indeed with switch to generic sigaction this may not be required.
*However* the layouts of generic userspace sigaction are different from kernel's.
Just to rehash (notes for myself really)

1. user exported struct

struct sigaction
  {
    __sighandler_t sa_handler;
    __sigset_t sa_mask;
    int sa_flags;
    void (*sa_restorer) (void);
  };

2. Linux kernel UAPI struct sigaction / glibc kernel_sigaction

struct sigaction {
	__sighandler_t sa_handler;
	unsigned long sa_flags;
	__sigrestore_t sa_restorer;
	sigset_t sa_mask;  /* mask last for extensibility */
};

Since they don't match and we can't possibly change kernel_sigaction, a future
optimization implies changing #1 which has ABI implications at which point it has
diminished or NO returns.

So perhaps we keep the ARC header above, with matching layout, while switching to
generic sigaction() still. OK ?

>> +#ifdef __USE_MISC
>> +# define __ctx(fld) fld
>> +#else
>> +# define __ctx(fld) __ ## fld
>> +#endif
> 
> New ports should just use namespace-clean field names here 
> unconditionally.  The __ctx macros with __USE_MISC conditionals are purely 
> for maximum API-compatibility for existing ports that needed to be fixed 
> to make them namespace-clean.

OK, fixed this.

Thx,
-Vineet
