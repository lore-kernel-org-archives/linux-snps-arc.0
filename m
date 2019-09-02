From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Mon,  2 Sep 2019 15:21:51 +0300
Subject: [PATCH] arc: emsdp: Add more platform-specific compiler options
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190902122151.39637-1-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Even though EM SDP is FPGA-based board and different FPGA
images (known as .bit-files) are awailable for the board still
there's a common subset of options we may rely on for all configs.

These are:
 * Normalizer
 * Swap instructions
 * Simple multiplier
 * Barrel-shifter
 * Floating-point unit
 * Shorter instructions (code density)

This among other improvements allows to compile code with
64-bit divisions, see [1].

[1] https://patchwork.ozlabs.org/patch/1156541/

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
Cc: Kever Yang <kever.yang at rock-chips.com>
---
 board/synopsys/emsdp/config.mk | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 board/synopsys/emsdp/config.mk

diff --git a/board/synopsys/emsdp/config.mk b/board/synopsys/emsdp/config.mk
new file mode 100644
index 0000000000..67fd7bf82a
--- /dev/null
+++ b/board/synopsys/emsdp/config.mk
@@ -0,0 +1,2 @@
+PLATFORM_CPPFLAGS += -mlittle-endian -mnorm -mswap -mmpy-option=3 \
+                     -mbarrel-shifter -mfpu=fpuda_all -mcode-density
-- 
2.16.2
