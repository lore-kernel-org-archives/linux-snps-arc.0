From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 19 Aug 2016 12:10:02 -0700
Subject: [PATCH] ARC: uaccess: get_user to zero out dest in cause of fault
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1471633802-2936-1-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Al reported potential issue with ARC get_user() as it wasn't clearing
out destination pointer in case of fault due to bad address etc.

Verified using following

| {
|  	u32 bogus1 = 0xdeadbeef;
|	u64 bogus2 = 0xdead;
|	int rc1, rc2;
|
|  	pr_info("Orig values %x %llx\n", bogus1, bogus2);
|	rc1 = get_user(bogus1, (u32 __user *)0x40000000);
|	rc2 = get_user(bogus2, (u64 __user *)0x50000000);
|	pr_info("access %d %d, new values %x %llx\n",
|		rc1, rc2, bogus1, bogus2);
| }

| [ARCLinux]# insmod /mnt/kernel-module/qtn.ko
| Orig values deadbeef dead
| access -14 -14, new values 0 0

Reported-by: Al Viro <viro at ZenIV.linux.org.uk>
Cc: Linus Torvalds <torvalds at linux-foundation.org>
Cc: linux-snps-arc at lists.infradead.org
Cc: linux-kernel at vger.kernel.org
Cc: stable at vger.kernel.org
Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/include/asm/uaccess.h | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/arc/include/asm/uaccess.h b/arch/arc/include/asm/uaccess.h
index a78d5670884f..41faf17cd28d 100644
--- a/arch/arc/include/asm/uaccess.h
+++ b/arch/arc/include/asm/uaccess.h
@@ -83,7 +83,10 @@
 	"2:	;nop\n"				\
 	"	.section .fixup, \"ax\"\n"	\
 	"	.align 4\n"			\
-	"3:	mov %0, %3\n"			\
+	"3:	# return -EFAULT\n"		\
+	"	mov %0, %3\n"			\
+	"	# zero out dst ptr\n"		\
+	"	mov %1,  0\n"			\
 	"	j   2b\n"			\
 	"	.previous\n"			\
 	"	.section __ex_table, \"a\"\n"	\
@@ -101,7 +104,11 @@
 	"2:	;nop\n"				\
 	"	.section .fixup, \"ax\"\n"	\
 	"	.align 4\n"			\
-	"3:	mov %0, %3\n"			\
+	"3:	# return -EFAULT\n"		\
+	"	mov %0, %3\n"			\
+	"	# zero out dst ptr\n"		\
+	"	mov %1,  0\n"			\
+	"	mov %R1, 0\n"			\
 	"	j   2b\n"			\
 	"	.previous\n"			\
 	"	.section __ex_table, \"a\"\n"	\
-- 
2.7.4
