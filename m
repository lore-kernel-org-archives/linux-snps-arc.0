From: joseph@codesourcery.com (Joseph Myers)
Date: Wed, 30 Jan 2019 21:04:22 +0000
Subject: [PATCH v2 05/15] ARC: Atomics and Locking primitives
In-Reply-To: <mvmpnse8s6s.fsf@suse.de>
References: <1548811555-24373-1-git-send-email-vgupta@synopsys.com>
 <1548811555-24373-6-git-send-email-vgupta@synopsys.com>
 <mvmpnse8s6s.fsf@suse.de>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <alpine.DEB.2.21.1901302103470.16754@digraph.polyomino.org.uk>
To: linux-snps-arc@lists.infradead.org

On Wed, 30 Jan 2019, Andreas Schwab wrote:

> On Jan 29 2019, Vineet Gupta <vineet.gupta1@synopsys.com> wrote:
> 
> > +#define __PTHREAD_MUTEX_NUSERS_AFTER_KIND  1
> > +#define __PTHREAD_MUTEX_USE_UNION          1
> 
> New ports should use the preferred values for these macros.

This seems like something that could be a common issue for new ports, so 
worth a mention at <https://sourceware.org/glibc/wiki/NewPorts> alongside 
such things as using init_array and USE_ATOMIC_COMPILER_BUILTINS.

-- 
Joseph S. Myers
joseph at codesourcery.com
