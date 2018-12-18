From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 18 Dec 2018 13:04:40 -0800
Subject: [PATCH 18/21] ARC: testsuite fix: GD TLS issue
In-Reply-To: <1545167083-16764-1-git-send-email-vgupta@synopsys.com>
References: <1545167083-16764-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1545167083-16764-19-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

From: Cupertino Miranda <cmiranda@synopsys.com>

Offset set by the linker in the GOT entries would be overwritten by the dynamic
loader instead of added to the symbol location.
Other target have the same approach on DTSOFF relocs.

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 ChangeLog                | 4 ++++
 sysdeps/arc/dl-machine.h | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/ChangeLog b/ChangeLog
index 39ff298b0091..ec068c7c5925 100644
--- a/ChangeLog
+++ b/ChangeLog
@@ -1,3 +1,7 @@
+2018-12-17  Cupertino Miranda <cmiranda at synopsys.com>
+
+	* sysdeps/arc/dl-machine.h: Fix relocation.
+
 2018-12-17  Vineet Gupta <vgupta at synopsys.com>
 
 	* sysdeps/unix/make-syscalls.sh: Fix comment referencing
diff --git a/sysdeps/arc/dl-machine.h b/sysdeps/arc/dl-machine.h
index 02727a3a4d47..f4757904084a 100644
--- a/sysdeps/arc/dl-machine.h
+++ b/sysdeps/arc/dl-machine.h
@@ -290,7 +290,7 @@ elf_machine_rela (struct link_map *map, const ElfW(Rela) *reloc,
         case R_ARC_TLS_DTPOFF:
           if (sym != NULL)
             {
-              *reloc_addr = sym->st_value;
+              *reloc_addr += sym->st_value;
             }
           break;
 
-- 
2.7.4
