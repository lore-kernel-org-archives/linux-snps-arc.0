From: akpm@linux-foundation.org (Andrew Morton)
Date: Tue, 19 Dec 2017 13:55:59 -0800
Subject: [PATCH v2] arch: define weak abort
In-Reply-To: <f098f672-7b51-26ea-c215-2c3edf72e62b@synopsys.com>
References: <1513118956-8718-1-git-send-email-sudipm.mukherjee@gmail.com>
 <f098f672-7b51-26ea-c215-2c3edf72e62b@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20171219135559.07104711eb9301f5f40a338f@linux-foundation.org>
To: linux-snps-arc@lists.infradead.org

On Tue, 19 Dec 2017 13:39:22 -0800 Vineet Gupta <Vineet.Gupta1@synopsys.com> wrote:

> > --- a/kernel/exit.c
> > +++ b/kernel/exit.c
> > @@ -1759,3 +1759,11 @@ long kernel_wait4(pid_t upid, int __user *stat_addr, int options,
> >   	return -EFAULT;
> >   }
> >   #endif
> > +
> > +__weak void abort(void)
> > +{
> > +	BUG();
> > +
> > +	/* if that doesn't kill us, halt */
> > +	panic("Oops failed to kill thread");
> > +}
> 
> Hmm, I realize there's a small gotcha with this, when testing with a different 
> patch from Arnd. This needs an EXPORT_SYMBOL() as well !

Yup.  This?

From: Andrew Morton <akpm@linux-foundation.org>
Subject: kernel/exit.c: export abort() to modules

gcc -fisolate-erroneous-paths-dereference can generate calls to abort()
from modular code too.

Reported-by: Vineet Gupta <Vineet.Gupta1 at synopsys.com>
Cc: Sudip Mukherjee <sudipm.mukherjee at gmail.com>
Cc: Arnd Bergmann <arnd at arndb.de>
Cc: "Alexey Brodkin" <Alexey.Brodkin at synopsys.com>
Signed-off-by: Andrew Morton <akpm at linux-foundation.org>
---

 kernel/exit.c |    1 +
 1 file changed, 1 insertion(+)

diff -puN kernel/exit.c~a kernel/exit.c
--- a/kernel/exit.c~a
+++ a/kernel/exit.c
@@ -1763,3 +1763,4 @@ __weak void abort(void)
 	/* if that doesn't kill us, halt */
 	panic("Oops failed to kill thread");
 }
+EXPORT_SYMBOL(abort);
_
