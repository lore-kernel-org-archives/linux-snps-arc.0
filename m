From: alexey.brodkin@synopsys.com (Alexey Brodkin)
Date: Mon, 12 Nov 2018 23:48:00 +0300
Subject: [PATCH] tcf-agent: Disable architecture-specific features for ARC
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20181112204800.5229-1-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

There's no support of architecture-specific features for ARC
in tcf-agent, so disable non-generic stuff for now.

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
Cc: Richard Purdie <richard.purdie at linuxfoundation.org>
Cc: Khem Raj <raj.khem at gmail.com>
---
 meta/recipes-devtools/tcf-agent/tcf-agent_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
index d901c18c39..b4bd4ca63c 100644
--- a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
@@ -41,6 +41,7 @@ LCL_STOP_SERVICES = "-DSERVICE_RunControl=0 -DSERVICE_Breakpoints=0 \
 
 # These features don't compile for several cases.
 #
+CFLAGS_append_arc = " ${LCL_STOP_SERVICES}"
 CFLAGS_append_mips = " ${LCL_STOP_SERVICES}"
 CFLAGS_append_mips64 = " ${LCL_STOP_SERVICES}"
 CFLAGS_append_libc-musl = " ${LCL_STOP_SERVICES}"
-- 
2.16.2
