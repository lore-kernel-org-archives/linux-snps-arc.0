From: mmarek@suse.com (Michal Marek)
Date: Tue, 22 Nov 2016 22:34:31 +0100
Subject: [PATCH 3/6] arc: Use full path in KBUILD_IMAGE definition
In-Reply-To: <20161122213434.14788-1-mmarek@suse.com>
References: <20161122213434.14788-1-mmarek@suse.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20161122213434.14788-3-mmarek@suse.com>
To: linux-snps-arc@lists.infradead.org

The KBUILD_IMAGE variable is used by the rpm and deb-pkg targets, which
expect it to point to the image file in the build directory. The
builddeb script has a workaround for architectures which only provide
the basename, but let's provide a clean interface for packaging tools.

Cc: Vineet Gupta <vgupta at synopsys.com>
Cc: linux-snps-arc at lists.infradead.org
Signed-off-by: Michal Marek <mmarek at suse.com>
---
 arch/arc/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arc/Makefile b/arch/arc/Makefile
index 19cce226d1a8..44ef35d33956 100644
--- a/arch/arc/Makefile
+++ b/arch/arc/Makefile
@@ -123,9 +123,9 @@ libs-y		+= arch/arc/lib/ $(LIBGCC)
 boot		:= arch/arc/boot
 
 #default target for make without any arguments.
-KBUILD_IMAGE	:= bootpImage
+KBUILD_IMAGE	:= $(boot)/bootpImage
 
-all:	$(KBUILD_IMAGE)
+all:	bootpImage
 bootpImage: vmlinux
 
 boot_targets += uImage uImage.bin uImage.gz
-- 
2.10.0
