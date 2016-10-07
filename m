From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 7 Oct 2016 14:11:17 -0700
Subject: [PATCH 2/2] ARC: nptl: cancellable wrappers were broken #2
In-Reply-To: <1475874677-28945-1-git-send-email-vgupta@synopsys.com>
References: <1475874677-28945-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1475874677-28945-2-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Despite the prev fix, tst-mqueue3 was still segfaulting.
The issue was BLINK register not restored properly for return

00002690 <mq_timedsend>:
    2690:	sub	r9,r25,0x448
    2698:	ld	r10,[r9]
    269c:	cmp	r10,0
    26a0:	beq	-36
    26a4:	st.aw	blink,[sp,-4]
    26a8:	st.aw	r0,[sp,-4]
    26ac:	st.aw	r1,[sp,-4]
    26b0:	st.aw	r2,[sp,-4]
    26b4:	st.aw	r3,[sp,-4]
    26b8:	st.aw	r4,[sp,-4]
    26bc:	bl	1e28 <__librt_enable_asynccancel>
    26c0:	mov	r9,r0
    26c4:	ld.ab	r4,[sp,4]
    26c8:	ld.ab	r3,[sp,4]
    26cc:	ld.ab	r2,[sp,4]
    26d0:	ld.ab	r1,[sp,4]
    26d4:	ld.ab	r0,[sp,4]
    26d8:	ld.ab	blink,[sp, 4]   <---- function return BLINK
    26dc:	mov	r8,182
    26e0:	trap_s	0
    26e2:	cmp	r0,-1024
    26e6:	st.aw	r0,[sp,-4]
    26ea:	mov	r0,r9
    26ee:	bl	1e90 <__librt_disable_asynccancel> <-- BLINK clobbered
                                                                to next PC

    26f2:	ld.ab	r0,[sp,4]  <----|   loops here until sp is out of bound
    26fa:	cmp	r0,-1024        |
    26fe:	jls	[blink]	   -----|
    2702:	b	15d8
    2706:	nop_s

So the fix was to retain BLINK on stack before function call, and pop it
later

-   26d8:	ld.ab	blink,[sp, 4]
+   26d8:	ld	blink,[sp]      <--- restore BLINK, but retain on stack
    26dc:	mov	r8,182
    26e0:	trap_s	0
    26e2:	cmp	r0,-1024
    26e6:	st.aw	r0,[sp,-4]
    26ea:	mov	r0,r9
    26ee:	bl	1e90 <__librt_disable_asynccancel>
    26f2:	ld.ab	r0,[sp,4]
+   26f6:	ld.ab	blink,[sp,4]    <--- finally pop BLINK
    26fa:	cmp	r0,-1024
    26fe:	jls	[blink]

Reported-by: Eugeniy Paltsev <paltsev at synopsys.com>
Cc: Alexey Brodkin <abrodkin at synopsys.com>
Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 libpthread/nptl/sysdeps/unix/sysv/linux/arc/sysdep-cancel.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/libpthread/nptl/sysdeps/unix/sysv/linux/arc/sysdep-cancel.h b/libpthread/nptl/sysdeps/unix/sysv/linux/arc/sysdep-cancel.h
index 918f61d67548..01fd844d13f7 100644
--- a/libpthread/nptl/sysdeps/unix/sysv/linux/arc/sysdep-cancel.h
+++ b/libpthread/nptl/sysdeps/unix/sysv/linux/arc/sysdep-cancel.h
@@ -38,6 +38,7 @@
       mov   r0, r9     /* prep mask for disable_asynccancel */  `	\
       CDISABLE	`	\
       pop  r0           /* get syscall ret value back */  ` \
+      pop  blink	/* UNDOCARGS above left blink on stack */ `	\
       cmp  r0, -1024	`	\
       jls  [blink]					`	\
       b  __syscall_error at plt				`	\
@@ -75,7 +76,9 @@
 .endm
 
 #define DOCARGS_0	push blink
-#define UNDOCARGS_0	pop  blink
+
+/* don't pop blink at this point */
+#define UNDOCARGS_0	ld   blink, [sp]
 
 #define DOCARGS_1	DOCARGS_0`	push r0
 #define UNDOCARGS_1			pop  r0`	UNDOCARGS_0
-- 
2.7.4
