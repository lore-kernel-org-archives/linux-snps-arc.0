From: wbx@uclibc-ng.org (Waldemar Brodkorb)
Date: Tue, 11 Apr 2017 22:10:49 +0200
Subject: [uclibc-ng-devel] [PATCH] ldso: exit if zalloc can't alloc memory
In-Reply-To: <1491436214-22394-1-git-send-email-vgupta@synopsys.com>
References: <1491436214-22394-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20170411201049.GB5361@waldemar-brodkorb.de>
To: linux-snps-arc@lists.infradead.org

Hi Vineet,
Vineet Gupta wrote,

> _dl_zalloc callers don't check for allocaton failure. It kind of makes
> sense since such early allocations are unlikely to fail, and even if
> they do, ldso would segv anyways thus bringing the issue to attention.
> 
> However there's a gcc nuance which led to this patch.
> 
> It seems gcc at -O2 (for DODEBUG build), does additional coge gen
> analysis for pointer dereference from erroneous paths and it "isolates"
> such code paths with a intrinsic abort/trap etc.
> 
> The ldso code fragment which was triggering this:
> 
> | add_ldso(struct dyn_elf *rpnt)
> |    if (rpnt)
> |        ...
> |    else
> |       rpnt = _dl_zalloc()
> |
> |    rpnt->dyn = tpnt  <---- potential NULL pointer deref
> 
> ARC gcc currently generates an abort() call which doesn't exist in ldso,
> causing link errors (with a newer vrsion of binutils).
> 
> ARM gcc 6.2.1 behaves similarly, altough instead of abort, it generates
> a trap inducing UDF instruction
> 
> |    367c:	ebfffb79   bl	2468 <_dl_malloc>
> |    3680:	e51b2068   ldr	r2, [fp, #-104]	; 0xffffff98
> |    3684:	e3500000   cmp	r0, #0
> |    3688:	0a000006   beq	36a8 <_dl_add_elf_hash_table+0x280>
> | ...
> |    36a8:	e5862000   str	r2, [r6]
> |    36ac:	e7f000f0   udf	#
> 
> So add an explict dl_exit() in dl_zalloc error case to beat the
> compiler.
> 
> Note that this error propagagtion analysis stops if the function in
> consideration (_dl_zalloc) is NOT inlined. Hence the reason it only
> shows up for DODEBUG builds which builds ldso at -O2 which is more
> aggressive about inlining.
> 
> If this patch is not considered worth applying then the workaround
> suggested by Claudiu is to to build ldso with
> -fno-isolate-erroneous-paths-dereference
> 
> Signed-off-by: Vineet Gupta <vgupta at synopsys.com>

Applied and pushed,
 Waldemar
