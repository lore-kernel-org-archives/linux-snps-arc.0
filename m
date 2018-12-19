From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 19 Dec 2018 12:26:15 -0800
Subject: [PATCH 10/21] ARC: Linux Startup and Dynamic Loading
In-Reply-To: <alpine.DEB.2.21.1812182347230.30183@digraph.polyomino.org.uk>
References: <1545167083-16764-1-git-send-email-vgupta@synopsys.com>
 <1545167083-16764-11-git-send-email-vgupta@synopsys.com>
 <alpine.DEB.2.21.1812182347230.30183@digraph.polyomino.org.uk>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <48145ed6-f288-3ce9-8df6-adbcc2688064@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 12/18/18 3:49 PM, Joseph Myers wrote:
> On Tue, 18 Dec 2018, Vineet Gupta wrote:
> 
>> diff --git a/sysdeps/unix/sysv/linux/arc/ldconfig.h b/sysdeps/unix/sysv/linux/arc/ldconfig.h
>
> This header should only be needed if you support multiple ABIs 
> simultaneously on the same system; note most architectures don't have it.  
> Maybe it will be relevant when you add support for the hard-float ABI, but 
> not yet.

Ok removed.

>> +#define SYSDEP_KNOWN_INTERPRETER_NAMES \
>> +  { "/lib/ld-linux.so.2", FLAG_ELF_LIBC6 },
>
> That's not the dynamic linker name you're using elsewhere.

Indeed this is leftover from RFC last year. Per your suggestion we changed the
name from ld-linux.so.2 to ld-linux-*arc*.so.2 (reflected in shlib-versions) but
missed here. Fixed now.
