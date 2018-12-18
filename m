From: joseph@codesourcery.com (Joseph Myers)
Date: Tue, 18 Dec 2018 23:49:10 +0000
Subject: [PATCH 10/21] ARC: Linux Startup and Dynamic Loading
In-Reply-To: <1545167083-16764-11-git-send-email-vgupta@synopsys.com>
References: <1545167083-16764-1-git-send-email-vgupta@synopsys.com>
 <1545167083-16764-11-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <alpine.DEB.2.21.1812182347230.30183@digraph.polyomino.org.uk>
To: linux-snps-arc@lists.infradead.org

On Tue, 18 Dec 2018, Vineet Gupta wrote:

> diff --git a/sysdeps/unix/sysv/linux/arc/ldconfig.h b/sysdeps/unix/sysv/linux/arc/ldconfig.h

This header should only be needed if you support multiple ABIs 
simultaneously on the same system; note most architectures don't have it.  
Maybe it will be relevant when you add support for the hard-float ABI, but 
not yet.

> +#define SYSDEP_KNOWN_INTERPRETER_NAMES \
> +  { "/lib/ld-linux.so.2", FLAG_ELF_LIBC6 },

That's not the dynamic linker name you're using elsewhere.

-- 
Joseph S. Myers
joseph at codesourcery.com
