From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 14 May 2019 17:29:29 -0700
Subject: [PATCH 2/9] ARC: mm: do_page_fault refactor #1: remove label
 @good_area
In-Reply-To: <1557880176-24964-1-git-send-email-vgupta@synopsys.com>
References: <1557880176-24964-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1557880176-24964-3-git-send-email-vgupta@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Invert the condition for stack expansion.
No functional change

Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
---
 arch/arc/mm/fault.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/arch/arc/mm/fault.c b/arch/arc/mm/fault.c
index 6836095251ed..94d242740ac5 100644
--- a/arch/arc/mm/fault.c
+++ b/arch/arc/mm/fault.c
@@ -100,21 +100,19 @@ void do_page_fault(unsigned long address, struct pt_regs *regs)
 		flags |= FAULT_FLAG_USER;
 retry:
 	down_read(&mm->mmap_sem);
+
 	vma = find_vma(mm, address);
 	if (!vma)
 		goto bad_area;
-	if (vma->vm_start <= address)
-		goto good_area;
-	if (!(vma->vm_flags & VM_GROWSDOWN))
-		goto bad_area;
-	if (expand_stack(vma, address))
-		goto bad_area;
+	if (unlikely(address < vma->vm_start)) {
+		if (!(vma->vm_flags & VM_GROWSDOWN) || expand_stack(vma, address))
+			goto bad_area;
+	}
 
 	/*
 	 * Ok, we have a good vm_area for this memory access, so
 	 * we can handle it..
 	 */
-good_area:
 	si_code = SEGV_ACCERR;
 
 	/* Handle protection violation, execute on heap or stack */
-- 
2.7.4
