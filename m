From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 10 Sep 2018 11:26:35 -0700
Subject: [PATCH] [ARC]: core3 features are default for core4
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1536603995-2249-1-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

   * config/arc/arc.c: object attributes for core4 not reflected correctly
   * config/arc/arc.h: Don't restrict DBNZ to core3 (core4 includes core3)

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 gcc/ChangeLog        | 7 +++++++
 gcc/config/arc/arc.c | 2 +-
 gcc/config/arc/arc.h | 2 +-
 3 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/gcc/ChangeLog b/gcc/ChangeLog
index 6dbe8147b3ec..3a022d156445 100644
--- a/gcc/ChangeLog
+++ b/gcc/ChangeLog
@@ -1,3 +1,10 @@
+2018-09-10  Vineet Gupta <vgupta at synopsys.com>
+
+	* config/arc/arc.c: object attributes for core4 not reflected
+	correctly
+	* config/arc/arc.h: Don't restrict DBNZ to core3 (core4 includes
+	core3)
+
 2018-09-09  Uros Bizjak  <ubizjak at gmail.com>
 
 	* config/i386/i386.md (float partial SSE register stall splitter): Move
diff --git a/gcc/config/arc/arc.c b/gcc/config/arc/arc.c
index c186e02e0f18..0171e8a7c615 100644
--- a/gcc/config/arc/arc.c
+++ b/gcc/config/arc/arc.c
@@ -5181,7 +5181,7 @@ static void arc_file_start (void)
 	       TARGET_OPTFPE ? 1 : 0);
   if (TARGET_V2)
     asm_fprintf (asm_out_file, "\t.arc_attribute Tag_ARC_CPU_variation, %d\n",
-		 arc_tune == ARC_TUNE_CORE_3 ? 3 : 2);
+		 arc_tune < ARC_TUNE_CORE_3 ? 2 : (arc_tune == ARC_TUNE_CORE_3 ? 3 : 4) );
 }
 
 /* Implement `TARGET_ASM_FILE_END'.  */
diff --git a/gcc/config/arc/arc.h b/gcc/config/arc/arc.h
index de09b6b2f09e..4d38f9ec174f 100644
--- a/gcc/config/arc/arc.h
+++ b/gcc/config/arc/arc.h
@@ -1636,6 +1636,6 @@ enum
 #define TARGET_FPX_QUARK    (TARGET_EM && TARGET_SPFP		\
 			     && (arc_fpu_build == FPX_QK))
 /* DBNZ support is available for ARCv2 core3 cpus.  */
-#define TARGET_DBNZ (TARGET_V2 && (arc_tune == ARC_TUNE_CORE_3))
+#define TARGET_DBNZ (TARGET_V2 && (arc_tune >= ARC_TUNE_CORE_3))
 
 #endif /* GCC_ARC_H */
-- 
2.7.4
