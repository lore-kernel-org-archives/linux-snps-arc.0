From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Wed,  9 Oct 2019 10:21:28 +0300
Subject: [PATCH] arc: emsdp: docs: Prefer Degilent over Opella-XD
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20191009072128.2851-1-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Back in the day on early board samples built-in Digilent JTAG probe
was not functional so we used externally attached Ashling Opella-XD
probe. But now with production units everything works as expected and
so we anybody may enjoy readily avaialble built-in JTAG probe so
we specify Digilent oprion on MDB's command line example.

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
---
 board/synopsys/emsdp/README | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/synopsys/emsdp/README b/board/synopsys/emsdp/README
index 034062e397..036554c4d5 100644
--- a/board/synopsys/emsdp/README
+++ b/board/synopsys/emsdp/README
@@ -79,5 +79,5 @@ ARC EM Software Development Platform (AKA EMSDP)
 
       2.1. In case of proprietary MetaWare debugger run:
       ------------------------->8----------------------
-      mdb -dll=opxdarc.so -OK -preloadexec="eval *(int*)0xf0001000=0" u-boot
+      mdb -digilent -OK -preloadexec="eval *(int*)0xf0001000=0" u-boot
       ------------------------->8----------------------
-- 
2.17.1
