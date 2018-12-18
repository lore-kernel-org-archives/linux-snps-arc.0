From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 18 Dec 2018 13:04:37 -0800
Subject: [PATCH 15/21] ARC: testsuite fix: elf/check-initfini
In-Reply-To: <1545167083-16764-1-git-send-email-vgupta@synopsys.com>
References: <1545167083-16764-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1545167083-16764-16-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 ChangeLog          | 1 +
 sysdeps/arc/crti.S | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/ChangeLog b/ChangeLog
index 86e4db890850..909b1af09a31 100644
--- a/ChangeLog
+++ b/ChangeLog
@@ -108,6 +108,7 @@
 	* sysdeps/arc/dl-machine.h: replace _start with __start.
 	* sysdeps/arc/start.S: likewise.
 	* sysdeps/arc/entry.h: Add ENTRY_POINT define check.
+	* sysdeps/arc/crti.S: add .hidden annotations.
 
 2018-12-17  Joseph Myers  <joseph at codesourcery.com>
 
diff --git a/sysdeps/arc/crti.S b/sysdeps/arc/crti.S
index 8b823b54a29d..ea741b30e3cf 100644
--- a/sysdeps/arc/crti.S
+++ b/sysdeps/arc/crti.S
@@ -53,6 +53,7 @@
 	.section .init
 	.align 4
 	.global	_init
+	.hidden	_init
 	.type	 _init, at function
 _init:
 	st.a	blink, [sp,-4]
@@ -69,6 +70,7 @@ _init:
 	.section .fini
 	.align 4
 	.global	_fini
+	.hidden	_fini
 	.type	 _fini, at function
 _fini:
 	st.a blink,[sp,-4]
-- 
2.7.4
