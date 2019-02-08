From: alexey.brodkin@synopsys.com (Alexey Brodkin)
Date: Fri,  8 Feb 2019 13:55:19 +0300
Subject: [PATCH] ARC: Explicitly set ARCH_SLAB_MINALIGN = 8
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190208105519.26750-1-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

By default ARCH_SLAB_MINALIGN is defined in "include/linux/slab.h" as
"__alignof__(unsigned long long)" which looks fine but not for ARC.

ARC tools ABI sets align of "long long" the same as for "long" = 4
instead of 8 one may think of.

Thus slab allocator may easily allocate a buffer which is 32-bit aligned.
And most of the time it's OK until we start dealing with 64-bit atomics
with special LLOCKD/SCONDD instructions which (as opposed to their 32-bit
counterparts LLOCK/SCOND) operate with full 64-bit words but those words
must be 64-bit aligned.

Fixes Ext4 folder removal:
--------------------->8-------------------
[    4.015732] EXT4-fs (mmcblk0p2): re-mounted. Opts: (null)
[    4.167881]
[    4.167881] Misaligned Access
[    4.172356] Path: /bin/busybox.nosuid
[    4.176004] CPU: 2 PID: 171 Comm: rm Not tainted 4.19.14-yocto-standard #1
[    4.182851]
[    4.182851] [ECR   ]: 0x000d0000 => Check Programmer's Manual
[    4.190061] [EFA   ]: 0xbeaec3fc
[    4.190061] [BLINK ]: ext4_delete_entry+0x210/0x234
[    4.190061] [ERET  ]: ext4_delete_entry+0x13e/0x234
[    4.202985] [STAT32]: 0x80080002 : IE K
[    4.207236] BTA: 0x9009329c   SP: 0xbe5b1ec4  FP: 0x00000000
[    4.212790] LPS: 0x9074b118  LPE: 0x9074b120 LPC: 0x00000000
[    4.218348] r00: 0x00000040  r01: 0x00000021 r02: 0x00000001
[    4.218348] r03: 0x00000000  r04: 0x00000002 r05: 0x00000000
[    4.218348] r06: 0x000000c6  r07: 0x00000000 r08: 0x9050f140
[    4.218348] r09: 0x000000c6  r10: 0x0000000a r11: 0x00000000
[    4.218348] r12: 0x90247a9c  r13: 0x9004e574 r14: 0x0008e150
[    4.218348] r15: 0x000989b8  r16: 0x0008cbec r17: 0x0009806c
[    4.218348] r18: 0x0009806c  r19: 0x0008e150 r20: 0x0008f0f8
[    4.218348] r21: 0x000000ab  r22: 0x0008f0f8 r23: 0x00000000
[    4.218348] r24: 0x00000000  r25: 0x00000000
[    4.218348]
[    4.218348]
[    4.270510]
[    4.270510] Stack Trace:
[    4.274510]   ext4_delete_entry+0x13e/0x234
[    4.278695]   ext4_rmdir+0xe0/0x238
[    4.282187]   vfs_rmdir+0x50/0xf0
[    4.285492]   do_rmdir+0x9e/0x154
[    4.288802]   EV_Trap+0x110/0x114
--------------------->8-------------------

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
Cc: <stable at vger.kernel.org> # 4.8+
---
 arch/arc/include/asm/cache.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arc/include/asm/cache.h b/arch/arc/include/asm/cache.h
index f393b663413e..74f8fcaaef5c 100644
--- a/arch/arc/include/asm/cache.h
+++ b/arch/arc/include/asm/cache.h
@@ -52,6 +52,16 @@
 #define cache_line_size()	SMP_CACHE_BYTES
 #define ARCH_DMA_MINALIGN	SMP_CACHE_BYTES
 
+/*
+ * Make sure slab-allocated buffers are 64-bit aligned.
+ * This is required for llockd/scondd to deal with 64-bit aligned dwords.
+ * By default ARCH_SLAB_MINALIGN is __alignof__(long long) which in
+ * case of ARC is 4 instead of 8!
+ */
+#ifdef CONFIG_ARC_HAS_LL64
+#define ARCH_SLAB_MINALIGN	8
+#endif
+
 extern void arc_cache_init(void);
 extern char *arc_cache_mumbojumbo(int cpu_id, char *buf, int len);
 extern void read_decode_cache_bcr(void);
-- 
2.16.2
