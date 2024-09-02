Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 087F7CD13CF
	for <linux-snps-arc@archiver.kernel.org>; Mon,  2 Sep 2024 19:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yuqHv0LidK0u+P/dwavB2zZfqpFgw2KGBpfTaAGsZDk=; b=kMVjhES2izpeQ7
	i4NKKEzef3uWk46L7CBv3w6FD4RnTZHhdiSLYWs0T/Rj64o0wxQ11FBAT0fT6LDwXw+7/1nTvnzpd
	7WXXv7szwY4RfmL6UOPWu8XEsG8wHvwNoFmfzuJXUNZTp9QU2V4GRskdT7r+fJpWWP68amwt6Hn9V
	P2VzbZ9XMvu/7ENjAeWy90+u1acdVH6KbTHhpkK7+yw19C36uWaImhH/cYuIQvBerfFKCwtBi0Jk4
	OciLMSKsqRMSBdxGXbjIjccTH9Wojd7xWHmvD39QhGFFZx4xaNVMDfzm4se8y6RpLwRwGB2+Sy3ks
	rZgcOfdl8vg+gqyZgduA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slCRI-0000000FN4R-2caf;
	Mon, 02 Sep 2024 19:10:12 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slCQC-0000000FMjQ-11Ld;
	Mon, 02 Sep 2024 19:09:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2FFE5A431CC;
	Mon,  2 Sep 2024 19:08:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CF47C4CEC9;
	Mon,  2 Sep 2024 19:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725304143;
	bh=nejS97KnA2Qms3Gvgo3SMj9sJCiVfLci6/Mfi/Rsw8U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ufsKnZLLQwEHAwpacZdtysRg/9QTknqhrlzPG0gTIS2ybE0mNRT06SNEuUXiZCc52
	 rL+kMleAwcxpyJCXunOkVdq2gkI0N4rXboHt0oCmSgcGWyIDtKyzqE1RLH6FGpCehJ
	 Nca5DzLVoAyJkCzqFoxcM2eyWPTVeaxie9bJU/MGsXST6olZu3DlCT9zPLmzlDYiDo
	 26pYLD97shqH/Vu3qR8DrMi1U/FYh0ChQcfnXrx7ZvWkDhG+mSHja+QAtiFSNdNyh4
	 wOsgcVvHRsT0fJO5jdxMGCUzxcJPTzigqd/TdNVNvI1OlUf5pvD6mFYRBg0yAvRUbY
	 6Q9pMzCUd4xCg==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 02 Sep 2024 20:08:14 +0100
Subject: [PATCH 2/3] mm: Pass vm_flags to generic_get_unmapped_area()
MIME-Version: 1.0
Message-Id: <20240902-mm-generic-shadow-stack-guard-v1-2-9acda38b3dd3@kernel.org>
References: <20240902-mm-generic-shadow-stack-guard-v1-0-9acda38b3dd3@kernel.org>
In-Reply-To: <20240902-mm-generic-shadow-stack-guard-v1-0-9acda38b3dd3@kernel.org>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, 
 Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>, 
 Russell King <linux@armlinux.org.uk>, Guo Ren <guoren@kernel.org>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 "David S. Miller" <davem@davemloft.net>, 
 Andreas Larsson <andreas@gaisler.com>, Thomas Gleixner <tglx@linutronix.de>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>, 
 Max Filippov <jcmvbkbc@gmail.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Deepak Gupta <debug@rivosinc.com>, 
 linux-arm-kernel@lists.infradead.org, linux-alpha@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
 loongarch@lists.linux.dev, linux-parisc@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-mm@kvack.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-37811
X-Developer-Signature: v=1; a=openpgp-sha256; l=4018; i=broonie@kernel.org;
 h=from:subject:message-id; bh=nejS97KnA2Qms3Gvgo3SMj9sJCiVfLci6/Mfi/Rsw8U=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBm1g0v9w9lBiTjIu5lnJumAd7oKheioErj5Av8o9p9
 xjbw4dqJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZtYNLwAKCRAk1otyXVSH0FX7B/
 9slZJSbOLk1zaWaFIlxJH7fsKOjdUxsEOGWqCfQQ7SzheizYCzQY9YUFbpp6x55PbW9KNdQ/ikhexU
 ts50XikTINzfTgQ5Nv4584Ko0cc5QH9Vvp0f0XFS3G8wep0Uq6vKMRlTzj2D8sUxFbzP65JLa882Vz
 pTQ7zTU/tzgbq3wMWfLtM/IqmqQJPSikIxU5k6R1bMD0jw/s2LwtAq5lD5a/g30apMg/klNkyAShDn
 JdrvWvSR2DLgHDfOSFSLUlLXNVTd61W01f/ngaSuv3L1ymol4mTPWXexFqqN6BKbYj9tM2RHTYuHDn
 LkE9GrCLQjRp0t+wnKJpiI8cN1kT2+
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240902_120904_485180_BAEC98C7 
X-CRM114-Status: GOOD (  12.66  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

In preparation for using vm_flags to ensure guard pages for shadow stacks
supply them as an argument to generic_get_unmapped_area(). The only user
outside of the core code is the PowerPC book3s64 implementation which is
trivially wrapping the generic implementation in the radix_enabled() case.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/powerpc/mm/book3s64/slice.c |  4 ++--
 include/linux/sched/mm.h         |  4 ++--
 mm/mmap.c                        | 10 ++++++----
 3 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/slice.c b/arch/powerpc/mm/book3s64/slice.c
index ada6bf896ef8..87307d0fc3b8 100644
--- a/arch/powerpc/mm/book3s64/slice.c
+++ b/arch/powerpc/mm/book3s64/slice.c
@@ -641,7 +641,7 @@ unsigned long arch_get_unmapped_area(struct file *filp,
 				     vm_flags_t vm_flags)
 {
 	if (radix_enabled())
-		return generic_get_unmapped_area(filp, addr, len, pgoff, flags);
+		return generic_get_unmapped_area(filp, addr, len, pgoff, flags, vm_flags);
 
 	return slice_get_unmapped_area(addr, len, flags,
 				       mm_ctx_user_psize(&current->mm->context), 0);
@@ -655,7 +655,7 @@ unsigned long arch_get_unmapped_area_topdown(struct file *filp,
 					     vm_flags_t vm_flags)
 {
 	if (radix_enabled())
-		return generic_get_unmapped_area_topdown(filp, addr0, len, pgoff, flags);
+		return generic_get_unmapped_area_topdown(filp, addr0, len, pgoff, flags, vm_flags);
 
 	return slice_get_unmapped_area(addr0, len, flags,
 				       mm_ctx_user_psize(&current->mm->context), 1);
diff --git a/include/linux/sched/mm.h b/include/linux/sched/mm.h
index c4d34abc45d4..07bb8d4181d7 100644
--- a/include/linux/sched/mm.h
+++ b/include/linux/sched/mm.h
@@ -204,11 +204,11 @@ unsigned long mm_get_unmapped_area_vmflags(struct mm_struct *mm,
 unsigned long
 generic_get_unmapped_area(struct file *filp, unsigned long addr,
 			  unsigned long len, unsigned long pgoff,
-			  unsigned long flags);
+			  unsigned long flags, vm_flags_t vm_flags);
 unsigned long
 generic_get_unmapped_area_topdown(struct file *filp, unsigned long addr,
 				  unsigned long len, unsigned long pgoff,
-				  unsigned long flags);
+				  unsigned long flags, vm_flags_t vm_flags);
 #else
 static inline void arch_pick_mmap_layout(struct mm_struct *mm,
 					 struct rlimit *rlim_stack) {}
diff --git a/mm/mmap.c b/mm/mmap.c
index 7528146f886f..b06ba847c96e 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -1789,7 +1789,7 @@ unsigned long vm_unmapped_area(struct vm_unmapped_area_info *info)
 unsigned long
 generic_get_unmapped_area(struct file *filp, unsigned long addr,
 			  unsigned long len, unsigned long pgoff,
-			  unsigned long flags)
+			  unsigned long flags, vm_flags_t vm_flags)
 {
 	struct mm_struct *mm = current->mm;
 	struct vm_area_struct *vma, *prev;
@@ -1823,7 +1823,8 @@ arch_get_unmapped_area(struct file *filp, unsigned long addr,
 		       unsigned long len, unsigned long pgoff,
 		       unsigned long flags, vm_flags_t vm_flags)
 {
-	return generic_get_unmapped_area(filp, addr, len, pgoff, flags);
+	return generic_get_unmapped_area(filp, addr, len, pgoff, flags,
+					 vm_flags);
 }
 #endif
 
@@ -1834,7 +1835,7 @@ arch_get_unmapped_area(struct file *filp, unsigned long addr,
 unsigned long
 generic_get_unmapped_area_topdown(struct file *filp, unsigned long addr,
 				  unsigned long len, unsigned long pgoff,
-				  unsigned long flags)
+				  unsigned long flags, vm_flags_t vm_flags)
 {
 	struct vm_area_struct *vma, *prev;
 	struct mm_struct *mm = current->mm;
@@ -1887,7 +1888,8 @@ arch_get_unmapped_area_topdown(struct file *filp, unsigned long addr,
 			       unsigned long len, unsigned long pgoff,
 			       unsigned long flags, vm_flags_t vm_flags)
 {
-	return generic_get_unmapped_area_topdown(filp, addr, len, pgoff, flags);
+	return generic_get_unmapped_area_topdown(filp, addr, len, pgoff, flags,
+						 vm_flags);
 }
 #endif
 

-- 
2.39.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
