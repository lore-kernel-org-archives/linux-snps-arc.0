From: shorne@gmail.com (Stafford Horne)
Date: Sat, 6 Jan 2018 11:57:05 +0900
Subject: [uclibc-ng-devel] [PATCH 4/4] arc: Use new common syscall()
 implementation
In-Reply-To: <ad3b4b76-19b9-590a-c071-3169a0315d57@synopsys.com>
References: <20171214062909.8602-1-shorne@gmail.com>
 <20171214062909.8602-5-shorne@gmail.com>
 <ad3b4b76-19b9-590a-c071-3169a0315d57@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180106025705.GB13019@lianli.shorne-pla.net>
To: linux-snps-arc@lists.infradead.org

On Fri, Jan 05, 2018@03:33:55PM -0800, Vineet Gupta wrote:
> On 12/13/2017 10:29 PM, Stafford Horne wrote:
> > Traditionally arc has had a generic syscall implementation of syscall()
> > matchig the common implementation.
> > 
> > During an audit it was found that this implementation seems to duplicate
> > common implementation and is no longer needed.
> > 
> > Signed-off-by: Stafford Horne <shorne at gmail.com>
> > ---
> >   libc/sysdeps/linux/arc/Makefile.arch |  2 +-
> >   libc/sysdeps/linux/arc/syscall.c     | 17 -----------------
> >   2 files changed, 1 insertion(+), 18 deletions(-)
> 
> [snip]
>  -
> > -extern long syscall(long int sysnum, long a, long b, long c, long d, long e, long f);
> > -
> > -long syscall(long int sysnum, long a, long b, long c, long d, long e, long f)
> > -{
> > -	return INLINE_SYSCALL_NCS(sysnum, 6, a, b, c, d, e, f);
> > -}
> 
> varargs generate pathetic code on ARC atleast, it is partly due to the ABI
> (the args need to be stored on stack)
> 
> With current implementation we get
> 
> 000100ac <syscall>:
>    100ac:	mov_s	r8,r0
>    100ae:	mov_s	r0,r1
>    100b0:	mov_s	r1,r2
>    100b2:	mov_s	r2,r3
>    100b4:	mov_s	r3,r4
>    100b6:	mov_s	r4,r5
>    100b8:	mov_s	r5,r6
>    100ba:	trap_s	0
>    100bc:	cmp	r0,-1024
>    100c0:	jls	[blink]
>    100c4:	st.aw	blink,[sp,-4]
>    100c8:	bl	84	;1011c <__syscall_error>
>    100cc:	ld.ab	blink,[sp,4]
>    100d0:	j_s	[blink]
>    100d2:	nop_s
> 
> With varagrs implementation we get tons of useless stores. So I'd prefer we
> keep the current implementation for ARC - although granted syscall() may not
> be the fast path syscall.

Hello Vineet,

Thanks for testing, I did realize varargs might generate slightly less optimal
code.  But I figured a few thing things

 - syscall() is probably not going to be used in any critical code sections.
 - the compiler could be optimized to make the varargs handling more optimal
 - we could remove code (but actually ends up with a bigger binary, so not
   great)

But for now, lets just drop this patch.  Thanks for the feedback.

-Stafford

> 00010398 <syscall>:
>    10398:	sub_s	sp,sp,0x1c
>    1039a:	mov_s	r8,r0
>    1039c:	st_s	r1,[sp,0]
>    1039e:	st_s	r2,[sp,0x4]
>    103a0:	st_s	r3,[sp,0x8]
>    103a2:	st	r4,[sp,12]
>    103a6:	st	r5,[sp,16]
>    103aa:	st	r6,[sp,20]
>    103ae:	st	r7,[sp,24]
>    103b2:	mov_s	r0,r1
>    103b4:	mov_s	r1,r2
>    103b6:	mov_s	r2,r3
>    103b8:	mov_s	r3,r4
>    103ba:	mov_s	r4,r5
>    103bc:	mov_s	r5,r6
>    103be:	trap_s	0
>    103c0:	brhs.nt	0xfffffc00,r0,20	;103d4 <syscall+0x3c>
>    103c8:	st.aw	blink,[sp,-4]
>    103cc:	bl	84	;10420 <__syscall_error>
>    103d0:	ld.ab	blink,[sp,4]
>    103d4:	j_s.d	[blink]
>    103d6:	add_s	sp,sp,0x1c
