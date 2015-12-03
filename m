From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 3 Dec 2015 18:11:11 +0530
Subject: [PATCH 13/17] ARC: dw2 unwind: Assume all regs to be unsigned long
In-Reply-To: <1449146475-15335-1-git-send-email-vgupta@synopsys.com>
References: <1449146475-15335-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1449146475-15335-14-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/include/asm/unwind.h |  3 +-
 arch/arc/kernel/unwind.c      | 74 +++----------------------------------------
 2 files changed, 6 insertions(+), 71 deletions(-)

diff --git a/arch/arc/include/asm/unwind.h b/arch/arc/include/asm/unwind.h
index 03ace2cc8bc5..a1dbcf6cb361 100644
--- a/arch/arc/include/asm/unwind.h
+++ b/arch/arc/include/asm/unwind.h
@@ -66,8 +66,7 @@ struct unwind_frame_info {
 		BUILD_BUG_ON_ZERO(offsetof(struct unwind_frame_info, f) \
 				% FIELD_SIZEOF(struct unwind_frame_info, f)) \
 				+ offsetof(struct unwind_frame_info, f) \
-				/ FIELD_SIZEOF(struct unwind_frame_info, f), \
-				FIELD_SIZEOF(struct unwind_frame_info, f) \
+				/ FIELD_SIZEOF(struct unwind_frame_info, f) \
 	}
 #define PTREGS_INFO(f) EXTRA_INFO(regs.f)
 
diff --git a/arch/arc/kernel/unwind.c b/arch/arc/kernel/unwind.c
index 6eb377c102c6..b2053b55d076 100644
--- a/arch/arc/kernel/unwind.c
+++ b/arch/arc/kernel/unwind.c
@@ -45,7 +45,6 @@ do {						\
 
 static const struct {
 	unsigned offs:BITS_PER_LONG / 2;
-	unsigned width:BITS_PER_LONG / 2;
 } reg_info[] = { UNW_REGISTER_INFO };
 
 #define DW_CFA_nop                          0x00
@@ -996,7 +995,6 @@ int arc_unwind(struct unwind_frame_info *frame)
 	    || state.loc > endLoc
 /*	   || state.regs[retAddrReg].where == Nowhere */
 	    || state.cfa.reg >= ARRAY_SIZE(reg_info)
-	    || reg_info[state.cfa.reg].width != sizeof(unsigned long)
 	    || state.cfa.offs % sizeof(unsigned long))
 		return -EIO;
 
@@ -1025,28 +1023,8 @@ int arc_unwind(struct unwind_frame_info *frame)
 		if (state.regs[i].where == Register) {
 			if (state.regs[i].value >= ARRAY_SIZE(reg_info))
 				return -EIO;
-			switch (reg_info[state.regs[i].value].width) {
-			case sizeof(u8):
-				state.regs[i].value =
-				FRAME_REG(state.regs[i].value, const u8);
-				break;
-			case sizeof(u16):
-				state.regs[i].value =
-				FRAME_REG(state.regs[i].value, const u16);
-				break;
-			case sizeof(u32):
-				state.regs[i].value =
-				FRAME_REG(state.regs[i].value, const u32);
-				break;
-#ifdef CONFIG_64BIT
-			case sizeof(u64):
-				state.regs[i].value =
-				FRAME_REG(state.regs[i].value, const u64);
-				break;
-#endif
-			default:
-				return -EIO;
-			}
+
+			state.regs[i].value = FRAME_REG(state.regs[i].value, unsigned long);
 		}
 	}
 
@@ -1056,35 +1034,15 @@ int arc_unwind(struct unwind_frame_info *frame)
 
 		switch (state.regs[i].where) {
 		case Nowhere:
-			if (reg_info[i].width != sizeof(UNW_SP(frame))
-			    || &FRAME_REG(i, __typeof__(UNW_SP(frame)))
+			if (&FRAME_REG(i, __typeof__(UNW_SP(frame)))
 			    != &UNW_SP(frame))
 				continue;
 			UNW_SP(frame) = cfa;
 			break;
 		case Register:
-			switch (reg_info[i].width) {
-			case sizeof(u8):
-				FRAME_REG(i, u8) = state.regs[i].value;
-				break;
-			case sizeof(u16):
-				FRAME_REG(i, u16) = state.regs[i].value;
-				break;
-			case sizeof(u32):
-				FRAME_REG(i, u32) = state.regs[i].value;
-				break;
-#ifdef CONFIG_64BIT
-			case sizeof(u64):
-				FRAME_REG(i, u64) = state.regs[i].value;
-				break;
-#endif
-			default:
-				return -EIO;
-			}
+			FRAME_REG(i, unsigned long) = state.regs[i].value;
 			break;
 		case Value:
-			if (reg_info[i].width != sizeof(unsigned long))
-				return -EIO;
 			FRAME_REG(i, unsigned long) = cfa + state.regs[i].value
 			    * state.dataAlign;
 			break;
@@ -1098,29 +1056,7 @@ int arc_unwind(struct unwind_frame_info *frame)
 			    || addr + sizeof(unsigned long) > endLoc)
 					return -EIO;
 
-			switch (reg_info[i].width) {
-			case sizeof(u8):
-				__get_user(FRAME_REG(i, u8),
-					   (u8 __user *)addr);
-				break;
-			case sizeof(u16):
-				__get_user(FRAME_REG(i, u16),
-					   (u16 __user *)addr);
-				break;
-			case sizeof(u32):
-				__get_user(FRAME_REG(i, u32),
-					   (u32 __user *)addr);
-				break;
-#ifdef CONFIG_64BIT
-			case sizeof(u64):
-				__get_user(FRAME_REG(i, u64),
-					   (u64 __user *)addr);
-				break;
-#endif
-			default:
-				return -EIO;
-			}
-
+			__get_user(FRAME_REG(i, unsigned long), (unsigned long __user *)addr);
 			break;
 		}
 		unw_debug("r%d: 0x%lx\n", i, *fptr);
-- 
1.9.1
