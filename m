From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 7 Oct 2016 14:11:16 -0700
Subject: [PATCH 1/2] ARC: nptl: cancellable wrappers were broken
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1475874677-28945-1-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

This was reported as uClicb test suite failures of tst-mqueue3,
tst-mqueue5

The syscall args were getting clobbered, so use scratch regs which are
not used for syscall args

00002690 <mq_timedsend>:

    ; SINGLE_THREAD_P

    2690:	sub	r1,r25,0x448   <--- clobers r1, r2
    2698:	ld	r2,[r1]
    269c:	cmp	r2,0

    26a0:	bz	mq_timedsend_nocancel

    ; DOCARGS (saves syscall args but r1, r2 clobbered already)

    26a4:	st.aw	blink,[sp,-4]
    26a8:	st.aw	r0,[sp,-4]
    26ac:	st.aw	r1,[sp,-4]
    26b0:	st.aw	r2,[sp,-4]
    26b4:	st.aw	r3,[sp,-4]
    26b8:	st.aw	r4,[sp,-4]
    26bc:	bl	1e28 <__librt_enable_asynccancel>

Reported-by: Eugeniy Paltsev <paltsev at synopsys.com>
Cc: Alexey Brodkin <abrodkin at synopsys.com>
Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 libpthread/nptl/sysdeps/unix/sysv/linux/arc/sysdep-cancel.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/libpthread/nptl/sysdeps/unix/sysv/linux/arc/sysdep-cancel.h b/libpthread/nptl/sysdeps/unix/sysv/linux/arc/sysdep-cancel.h
index cddd754a8680..918f61d67548 100644
--- a/libpthread/nptl/sysdeps/unix/sysv/linux/arc/sysdep-cancel.h
+++ b/libpthread/nptl/sysdeps/unix/sysv/linux/arc/sysdep-cancel.h
@@ -99,9 +99,9 @@
 #define UNDOCARGS_7			pop  r6`	UNDOCARGS_6
 
 #  define SINGLE_THREAD_P 			\
-    THREAD_SELF r1   `				\
-    ld	   r2, [r1, MULTIPLE_THREADS_OFFSET]`	\
-    cmp    r2, 0
+    THREAD_SELF r9   `				\
+    ld	   r10, [r9, MULTIPLE_THREADS_OFFSET]`	\
+    cmp    r10, 0
 
 /*    ld	   r2, [r1, -TLS_PRE_TCB_SIZE + MULTIPLE_THREADS_OFFSET] */
 #else	/* !__ASSEMBLER__ */
-- 
2.7.4
