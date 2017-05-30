From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Tue, 30 May 2017 16:22:55 +0300
Subject: [PATCH] arc: Add "include chroot" for DT bindings
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1496150575-9273-1-git-send-email-abrodkin@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Basically this extends
c58299aa8754 "kbuild: create an "include chroot" for DT bindings" for
ARC where we extensively use Device Tree and there're good reasons
to use DT bindings, especially if those are required.

Otherwise on attempt to compile .dts with something like:
-------------------->8---------------------
 #include <dt-bindings/net/ti-dp83867.h>
-------------------->8---------------------

we inevitably see this compilation failure:
-------------------->8---------------------
arch/arc/boot/dts/hsdk.dts:16:40: fatal error: dt-bindings/net/ti-dp83867.h: No such file or directory
 #include <dt-bindings/net/ti-dp83867.h>
                                        ^
compilation terminated.
-------------------->8---------------------

Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
Cc: Stephen Warren <swarren at wwwdotorg.org>
Cc: Rob Herring <robh+dt at kernel.org>
---
 arch/arc/boot/dts/include/dt-bindings | 1 +
 1 file changed, 1 insertion(+)
 create mode 120000 arch/arc/boot/dts/include/dt-bindings

diff --git a/arch/arc/boot/dts/include/dt-bindings b/arch/arc/boot/dts/include/dt-bindings
new file mode 120000
index 000000000000..08c00e4972fa
--- /dev/null
+++ b/arch/arc/boot/dts/include/dt-bindings
@@ -0,0 +1 @@
+../../../../../include/dt-bindings
\ No newline at end of file
-- 
2.7.4
