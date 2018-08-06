From: Eugeniy.Paltsev@synopsys.com (Eugeniy Paltsev)
Date: Mon,  6 Aug 2018 19:44:24 +0300
Subject: [PATCH 2/2] ARC: show_faulting_vma: check file_path for error
In-Reply-To: <20180806164424.32439-1-Eugeniy.Paltsev@synopsys.com>
References: <20180806164424.32439-1-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20180806164424.32439-2-Eugeniy.Paltsev@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Return value of file_path() should be validated with
IS_ERR() macro.

Generic print_vma_addr() implementation was used as an example.

Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
---
 arch/arc/kernel/troubleshoot.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arc/kernel/troubleshoot.c b/arch/arc/kernel/troubleshoot.c
index f7330a3a1c4d..e8d9fb452346 100644
--- a/arch/arc/kernel/troubleshoot.c
+++ b/arch/arc/kernel/troubleshoot.c
@@ -98,6 +98,8 @@ static void show_faulting_vma(unsigned long address, char *buf)
 	if (vma && (vma->vm_start <= address)) {
 		if (vma->vm_file) {
 			nm = file_path(vma->vm_file, buf, PAGE_SIZE - 1);
+			if (IS_ERR(nm))
+				nm = "?";
 		}
 		pr_info("    @off 0x%lx in [%s]\n"
 			"    VMA: 0x%08lx to 0x%08lx\n",
-- 
2.14.4
