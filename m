From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 3 Dec 2015 18:11:00 +0530
Subject: [PATCH 02/17] ARC: dw2 unwind: remove unused cruft
In-Reply-To: <1449146475-15335-1-git-send-email-vgupta@synopsys.com>
References: <1449146475-15335-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1449146475-15335-3-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/include/asm/unwind.h | 34 +++++++++-------------------------
 arch/arc/kernel/unwind.c      | 15 +--------------
 2 files changed, 10 insertions(+), 39 deletions(-)

diff --git a/arch/arc/include/asm/unwind.h b/arch/arc/include/asm/unwind.h
index 7ca628b6ee2a..0e7f48e2686a 100644
--- a/arch/arc/include/asm/unwind.h
+++ b/arch/arc/include/asm/unwind.h
@@ -72,6 +72,15 @@ struct unwind_frame_info {
 
 #define STACK_LIMIT(ptr)	(((ptr) - 1) & ~(THREAD_SIZE - 1))
 
+#define EXTRA_INFO(f) { \
+		BUILD_BUG_ON_ZERO(offsetof(struct unwind_frame_info, f) \
+				% FIELD_SIZEOF(struct unwind_frame_info, f)) \
+				+ offsetof(struct unwind_frame_info, f) \
+				/ FIELD_SIZEOF(struct unwind_frame_info, f), \
+				FIELD_SIZEOF(struct unwind_frame_info, f) \
+	}
+#define PTREGS_INFO(f) EXTRA_INFO(regs.f)
+
 #define UNW_REGISTER_INFO \
 	PTREGS_INFO(r0), \
 	PTREGS_INFO(r1), \
@@ -117,31 +126,6 @@ extern void *unwind_add_table(struct module *module, const void *table_start,
 			      unsigned long table_size);
 extern void unwind_remove_table(void *handle, int init_only);
 
-static inline int
-arch_unwind_init_running(struct unwind_frame_info *info,
-			 int (*callback) (struct unwind_frame_info *info,
-					  void *arg),
-			 void *arg)
-{
-	return 0;
-}
-
-static inline int arch_unw_user_mode(const struct unwind_frame_info *info)
-{
-	return 0;
-}
-
-static inline void arch_unw_init_blocked(struct unwind_frame_info *info)
-{
-	return;
-}
-
-static inline void arch_unw_init_frame_info(struct unwind_frame_info *info,
-					    struct pt_regs *regs)
-{
-	return;
-}
-
 #else
 
 #define UNW_PC(frame) ((void)(frame), 0)
diff --git a/arch/arc/kernel/unwind.c b/arch/arc/kernel/unwind.c
index 7352475451f6..44983b4d9e78 100644
--- a/arch/arc/kernel/unwind.c
+++ b/arch/arc/kernel/unwind.c
@@ -43,23 +43,10 @@ do {						\
 
 #define MAX_STACK_DEPTH 8
 
-#define EXTRA_INFO(f) { \
-		BUILD_BUG_ON_ZERO(offsetof(struct unwind_frame_info, f) \
-				% FIELD_SIZEOF(struct unwind_frame_info, f)) \
-				+ offsetof(struct unwind_frame_info, f) \
-				/ FIELD_SIZEOF(struct unwind_frame_info, f), \
-				FIELD_SIZEOF(struct unwind_frame_info, f) \
-	}
-#define PTREGS_INFO(f) EXTRA_INFO(regs.f)
-
 static const struct {
 	unsigned offs:BITS_PER_LONG / 2;
 	unsigned width:BITS_PER_LONG / 2;
-} reg_info[] = {
-UNW_REGISTER_INFO};
-
-#undef PTREGS_INFO
-#undef EXTRA_INFO
+} reg_info[] = { UNW_REGISTER_INFO };
 
 #ifndef REG_INVALID
 #define REG_INVALID(r) (reg_info[r].width == 0)
-- 
1.9.1
