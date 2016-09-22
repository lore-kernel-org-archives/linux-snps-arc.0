From: gregkh@linuxfoundation.org (Greg Kroah-Hartman)
Date: Thu, 22 Sep 2016 19:29:59 +0200
Subject: [PATCH 4.4 099/118] ARC: uaccess: get_user to zero out dest in cause
 of fault
In-Reply-To: <20160922172938.643879685@linuxfoundation.org>
References: <20160922172938.643879685@linuxfoundation.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160922172943.597395919@linuxfoundation.org>
To: linux-snps-arc@lists.infradead.org

4.4-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Vineet Gupta <Vineet.Gupta1@synopsys.com>

commit 05d9d0b96e53c52a113fd783c0c97c830c8dc7af upstream.

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
Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
Signed-off-by: Al Viro <viro at zeniv.linux.org.uk>
Signed-off-by: Greg Kroah-Hartman <gregkh at linuxfoundation.org>

---
 arch/arc/include/asm/uaccess.h |   11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

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
