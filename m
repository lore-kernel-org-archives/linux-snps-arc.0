From: joseph@codesourcery.com (Joseph Myers)
Date: Tue, 18 Dec 2018 23:38:21 +0000
Subject: [PATCH 09/21] ARC: Linux ABI
In-Reply-To: <1545167083-16764-10-git-send-email-vgupta@synopsys.com>
References: <1545167083-16764-1-git-send-email-vgupta@synopsys.com>
 <1545167083-16764-10-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <alpine.DEB.2.21.1812182333230.30183@digraph.polyomino.org.uk>
To: linux-snps-arc@lists.infradead.org

On Tue, 18 Dec 2018, Vineet Gupta wrote:

> +typedef unsigned short int __pr_uid_t;
> +typedef unsigned short int __pr_gid_t;

Are you sure?  I don't see an ARC-specific definition of __kernel_uid_t or 
__kernel_gid_t in the Linux kernel at all (which would mean unsigned int 
is actually used and you don't need this header at all).

> diff --git a/sysdeps/unix/sysv/linux/arc/bits/sigaction.h b/sysdeps/unix/sysv/linux/arc/bits/sigaction.h

I wouldn't expect new architectures to have their own bits/sigaction.h.  
Rather, I'd expect them to use the generic bits/sigaction.h and the 
generic code to convert from the userspace struct sigaction to the kernel 
version.

> +#ifdef __USE_MISC
> +# define __ctx(fld) fld
> +#else
> +# define __ctx(fld) __ ## fld
> +#endif

New ports should just use namespace-clean field names here 
unconditionally.  The __ctx macros with __USE_MISC conditionals are purely 
for maximum API-compatibility for existing ports that needed to be fixed 
to make them namespace-clean.

-- 
Joseph S. Myers
joseph at codesourcery.com
