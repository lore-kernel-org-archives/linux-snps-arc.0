From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 9 Feb 2017 08:56:42 -0800
Subject: [PATCH] [ARC] Handle aux registers differences on ARC700 vs. HS38 cpus
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1486659402-6670-1-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

opcodes/
2017-02-09  Vineet Gupta <vgupta at synopsys.com>

	* arc-regs.h: Distinguish some of the registers different on
	ARC700 and HS38 cpus.

gas/
2017-02-09  Vineet Gupta <vgupta at synopsys.com>

	* testsuite/gas/arc/st.d: Update for 0xe having a name now

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 gas/ChangeLog              |  4 ++++
 gas/testsuite/gas/arc/st.d |  2 +-
 opcodes/ChangeLog          |  5 +++++
 opcodes/arc-regs.h         | 48 ++++++++++++++++++++++++++++++++++------------
 4 files changed, 46 insertions(+), 13 deletions(-)

diff --git a/gas/ChangeLog b/gas/ChangeLog
index d96516f93b57..3a4c2ce496ce 100644
--- a/gas/ChangeLog
+++ b/gas/ChangeLog
@@ -1,3 +1,7 @@
+2017-02-09  Vineet Gupta <vgupta at synopsys.com>
+
+	* testsuite/gas/arc/st.d: Update for 0xe having a name now
+
 2017-02-02  Maciej W. Rozycki  <macro at imgtec.com>
 
 	* doc/as.texinfo (Overview): Select MIPS options for man page
diff --git a/gas/testsuite/gas/arc/st.d b/gas/testsuite/gas/arc/st.d
index 3f75d40c367f..6fe5b88aefa1 100644
--- a/gas/testsuite/gas/arc/st.d
+++ b/gas/testsuite/gas/arc/st.d
@@ -22,7 +22,7 @@ Disassembly of section .text:
   38:	1c04 1f80 0000 0000 	st	0,\[r12,4\]
 			3c: R_ARC_32_ME	.text\+0x40
   40:	212b 0080           	sr	r1,\[r2\]
-  44:	216b 0380           	sr	r1,\[0xe\]
+  44:	216b 0380           	sr	r1,\[aux_irq_ctrl\]
   48:	262b 7040 0000 03e8 	sr	0x3e8,\[r1\]
   50:	262b 7080 0000 0064 	sr	0x64,\[r2\]
   58:	212b 0f80 0000 2710 	sr	r1,\[0x2710\]
diff --git a/opcodes/ChangeLog b/opcodes/ChangeLog
index 2185484ecec5..68ef4610240c 100644
--- a/opcodes/ChangeLog
+++ b/opcodes/ChangeLog
@@ -1,3 +1,8 @@
+2017-02-09  Vineet Gupta <vgupta at synopsys.com>
+
+	* arc-regs.h: Distinguish some of the registers different on
+	ARC700 and HS38 cpus.
+
 2017-02-03  Nick Clifton  <nickc at redhat.com>
 
 	PR 21096
diff --git a/opcodes/arc-regs.h b/opcodes/arc-regs.h
index ae1f4c66f66f..0bdbd92a949c 100644
--- a/opcodes/arc-regs.h
+++ b/opcodes/arc-regs.h
@@ -19,8 +19,10 @@
    along with this program; if not, write to the Free Software Foundation,
    Inc., 51 Franklin Street - Fifth Floor, Boston, MA 02110-1301, USA.  */
 
-DEF (0x0,   ARC_OPCODE_ARCALL, NONE, status)
-DEF (0x1,   ARC_OPCODE_ARCALL, NONE, semaphore)
+DEF (0x0,   ARC_OPCODE_ARC600, NONE, status)
+DEF (0x0,   ARC_OPCODE_ARC700, NONE, status)
+DEF (0x1,   ARC_OPCODE_ARC600, NONE, semaphore)
+DEF (0x1,   ARC_OPCODE_ARC700, NONE, semaphore)
 DEF (0x2,   ARC_OPCODE_ARCALL, NONE, lp_start)
 DEF (0x3,   ARC_OPCODE_ARCALL, NONE, lp_end)
 DEF (0x4,   ARC_OPCODE_ARCALL, NONE, identity)
@@ -30,8 +32,16 @@ DEF (0x7,   ARC_OPCODE_ARCALL, NONE, adcr)
 DEF (0x8,   ARC_OPCODE_ARCALL, NONE, apcr)
 DEF (0x9,   ARC_OPCODE_ARCALL, NONE, acr)
 DEF (0xa,   ARC_OPCODE_ARCALL, NONE, status32)
-DEF (0xb,   ARC_OPCODE_ARCALL, NONE, status32_l1)
-DEF (0xc,   ARC_OPCODE_ARCALL, NONE, status32_l2)
+DEF (0xb,   ARC_OPCODE_ARC600, NONE, status32_l1)
+DEF (0xb,   ARC_OPCODE_ARC700, NONE, status32_l1)
+DEF (0xb,   ARC_OPCODE_ARCv2EM, NONE, status32_p0)
+DEF (0xb,   ARC_OPCODE_ARCv2HS, NONE, status32_p0)
+DEF (0xc,   ARC_OPCODE_ARC600, NONE, status32_l2)
+DEF (0xc,   ARC_OPCODE_ARC700, NONE, status32_l2)
+DEF (0xd,   ARC_OPCODE_ARCv2EM, NONE, aux_user_sp)
+DEF (0xd,   ARC_OPCODE_ARCv2HS, NONE, aux_user_sp)
+DEF (0xe,   ARC_OPCODE_ARCv2EM, NONE, aux_irq_ctrl)
+DEF (0xe,   ARC_OPCODE_ARCv2HS, NONE, aux_irq_ctrl)
 DEF (0xf,   ARC_OPCODE_ARCALL, NONE, bpu_flush)
 DEF (0x10,  ARC_OPCODE_ARCALL, NONE, ivic)
 DEF (0x10,  ARC_OPCODE_ARCALL, NONE, ic_ivic)
@@ -87,7 +97,10 @@ DEF (0x3d,  ARC_OPCODE_NONE,   NONE, burstval)
 DEF (0x40,  ARC_OPCODE_ARCALL, NONE, xtp_newval)
 DEF (0x41,  ARC_OPCODE_ARCALL, NONE, aux_macmode)
 DEF (0x42,  ARC_OPCODE_ARCALL, NONE, lsp_newval)
-DEF (0x43,  ARC_OPCODE_ARCALL, NONE, aux_irq_lv12)
+DEF (0x43,  ARC_OPCODE_ARC600, NONE, aux_irq_lv12)
+DEF (0x43,  ARC_OPCODE_ARC700, NONE, aux_irq_lv12)
+DEF (0x43,  ARC_OPCODE_ARCv2EM, NONE, aux_irq_act)
+DEF (0x43,  ARC_OPCODE_ARCv2HS, NONE, aux_irq_act)
 DEF (0x44,  ARC_OPCODE_ARCALL, NONE, aux_xmac0)
 DEF (0x45,  ARC_OPCODE_ARCALL, NONE, aux_xmac1)
 DEF (0x46,  ARC_OPCODE_ARCALL, NONE, aux_xmac2)
@@ -204,9 +217,14 @@ DEF (0x102, ARC_OPCODE_ARCALL, NONE, limit1)
 DEF (0x103, ARC_OPCODE_ARCALL, NONE, timer_xx)
 DEF (0x120, ARC_OPCODE_ARCALL, NONE, arcangel_periph_xx)
 DEF (0x140, ARC_OPCODE_ARCALL, NONE, periph_xx)
-DEF (0x200, ARC_OPCODE_ARCALL, NONE, aux_irq_lev)
+DEF (0x200, ARC_OPCODE_ARC600, NONE, aux_irq_lev)
+DEF (0x200, ARC_OPCODE_ARC700, NONE, aux_irq_lev)
+DEF (0x200, ARC_OPCODE_ARCv2EM, NONE, irq_priority_pending)
+DEF (0x200, ARC_OPCODE_ARCv2HS, NONE, irq_priority_pending)
 DEF (0x201, ARC_OPCODE_ARCALL, NONE, aux_irq_hint)
 DEF (0x202, ARC_OPCODE_ARCALL, NONE, aux_inter_core_interrupt)
+DEF (0x206, ARC_OPCODE_ARCv2EM, NONE, irq_priority)
+DEF (0x206, ARC_OPCODE_ARCv2HS, NONE, irq_priority)
 DEF (0x210, ARC_OPCODE_ARCALL, NONE, aes_aux_0)
 DEF (0x211, ARC_OPCODE_ARCALL, NONE, aes_aux_1)
 DEF (0x212, ARC_OPCODE_ARCALL, NONE, aes_aux_2)
@@ -263,11 +281,11 @@ DEF (0x401, ARC_OPCODE_ARCALL, NONE, erbta)
 DEF (0x402, ARC_OPCODE_ARCALL, NONE, erstatus)
 DEF (0x403, ARC_OPCODE_ARCALL, NONE, ecr)
 DEF (0x404, ARC_OPCODE_ARCALL, NONE, efa)
-DEF (0x405, ARC_OPCODE_ARCALL, NONE, tlbpd0)
-DEF (0x406, ARC_OPCODE_ARCALL, NONE, tlbpd1)
-DEF (0x407, ARC_OPCODE_ARCALL, NONE, tlbindex)
-DEF (0x408, ARC_OPCODE_ARCALL, NONE, tlbcommand)
-DEF (0x409, ARC_OPCODE_ARCALL, NONE, pid)
+DEF (0x405, ARC_OPCODE_ARC700, NONE, tlbpd0)
+DEF (0x406, ARC_OPCODE_ARC700, NONE, tlbpd1)
+DEF (0x407, ARC_OPCODE_ARC700, NONE, tlbindex)
+DEF (0x408, ARC_OPCODE_ARC700, NONE, tlbcommand)
+DEF (0x409, ARC_OPCODE_ARC700, NONE, pid)
 DEF (0x409, ARC_OPCODE_ARCALL, NONE, mpuen)
 DEF (0x40a, ARC_OPCODE_ARCALL, NONE, icause1)
 DEF (0x40b, ARC_OPCODE_ARCALL, NONE, icause2)
@@ -279,7 +297,7 @@ DEF (0x413, ARC_OPCODE_ARCALL, NONE, bta_l1)
 DEF (0x414, ARC_OPCODE_ARCALL, NONE, bta_l2)
 DEF (0x415, ARC_OPCODE_ARCALL, NONE, aux_irq_pulse_cancel)
 DEF (0x416, ARC_OPCODE_ARCALL, NONE, aux_irq_pending)
-DEF (0x418, ARC_OPCODE_ARCALL, NONE, scratch_data0)
+DEF (0x418, ARC_OPCODE_ARC700, NONE, scratch_data0)
 DEF (0x420, ARC_OPCODE_ARCALL, NONE, mpuic)
 DEF (0x421, ARC_OPCODE_ARCALL, NONE, mpufa)
 DEF (0x422, ARC_OPCODE_ARCALL, NONE, mpurdb0)
@@ -319,6 +337,12 @@ DEF (0x450, ARC_OPCODE_ARCALL, NONE, pm_status)
 DEF (0x451, ARC_OPCODE_ARCALL, NONE, wake)
 DEF (0x452, ARC_OPCODE_ARCALL, NONE, dvfs_performance)
 DEF (0x453, ARC_OPCODE_ARCALL, NONE, pwr_ctrl)
+DEF (0x460, ARC_OPCODE_ARCv2HS, NONE, tlbpd0)
+DEF (0x461, ARC_OPCODE_ARCv2HS, NONE, tlbpd1)
+DEF (0x463, ARC_OPCODE_ARCv2HS, NONE, tlbindex)
+DEF (0x464, ARC_OPCODE_ARCv2HS, NONE, tlbcommand)
+DEF (0x468, ARC_OPCODE_ARCv2HS, NONE, pid)
+DEF (0x46c, ARC_OPCODE_ARCv2HS, NONE, scratch_data0)
 DEF (0x500, ARC_OPCODE_ARCALL, NONE, aux_vlc_buf_idx)
 DEF (0x501, ARC_OPCODE_ARCALL, NONE, aux_vlc_read_buf)
 DEF (0x502, ARC_OPCODE_ARCALL, NONE, aux_vlc_valid_bits)
-- 
2.7.4
