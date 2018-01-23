From: luisbg@kernel.org (Luis de Bethencourt)
Date: Tue, 23 Jan 2018 15:16:08 +0000
Subject: [PATCH 1/2] ARC: dw2 unwind: Fix trailing semicolon
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180123151609.23555-1-luisbg@kernel.org>
To: linux-snps-arc@lists.infradead.org

The trailing semicolon is an empty statement that does no operation.
Removing it since it doesn't do anything.

Signed-off-by: Luis de Bethencourt <luisbg at kernel.org>
---

Hi,

After fixing the same thing in drivers/staging/rtl8723bs/, Joe Perches
suggested I fix it treewide [0].

Best regards 
Luis


[0] http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/2018-January/115410.html
[1] http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/2018-January/115390.html

 arch/arc/kernel/unwind.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arc/kernel/unwind.c b/arch/arc/kernel/unwind.c
index 333daab7def0..183391d4d33a 100644
--- a/arch/arc/kernel/unwind.c
+++ b/arch/arc/kernel/unwind.c
@@ -366,7 +366,7 @@ static void init_unwind_hdr(struct unwind_table *table,
 	return;
 
 ret_err:
-	panic("Attention !!! Dwarf FDE parsing errors\n");;
+	panic("Attention !!! Dwarf FDE parsing errors\n");
 }
 
 #ifdef CONFIG_MODULES
-- 
2.15.1
