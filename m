Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E6C11099B3E
	for <linux-snps-arc@archiver.kernel.org>; Fri, 20 Mar 2026 19:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jrI0dO2UEJuq1JYJJ8s607oPn4ksbTlenuQPTGJ2bgc=; b=Y7aeMIvU0r1hsr
	cO1Gl4PfXa3lBAaeZOPue4xNA4bVc+pdJ6S9RGyYH5QHFWAdSYjLkw2keZAcv1chgdGHdDTEHGk0f
	IlKFbC5o4mp6yd1gvD3ugtPOHjWF2KLcVVqEucFF6MzLozSqGX7RyI4G8aG0JAa0gF7VbTMQtGmuF
	d3GY/Leuj3cLTIuT/xCMJP/PIzCpE2uwwyyE7MoOOC5aVlkf959z7VGihg3NcTt0aDF7kLi0jsRjY
	gamTMkLC83XHMoAM+GnDACw8mB6zqrzKg+fVsEq9agvbBCNXYbp9Af562PmmA4CQ12l5cFiTydnvn
	y1usvCEfqM2SGxi+dcww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3fgo-0000000DTbv-419F;
	Fri, 20 Mar 2026 19:39:22 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3fgi-0000000DTRg-1Rdv;
	Fri, 20 Mar 2026 19:39:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=7Bh1w+z0JWOqUddQi7wko3Cw3Y50TUDCTLtrQm/GK+I=; b=HfIcdnS1bwbtaFbEO+zEzWwmh4
	IlU0Z3BRq/Tjvm5uZJYatAKF3Q7J1d2Z3zE0SkeHwTsr5Jv/V/UOcldv9mt8/K5U+kd/snsMTU74d
	gZY8tEHBHtWXntxBLreRKf+FuabQlvyAiRG6ecB2NiFrzotVOZ+5scHAvYBDNIh+mVJJ8s/GK92SW
	RigD48Pw/MSbGFLXSkULLYEyDLMmMEXYsVKkPMoWO773VeDHwwIVM4yuM4AR/UFJ7vneIJAjZ24Ek
	o71hvmQnqPuKu9zPAd4/o53kEoeRErlG0nmkBOifaYFentaYzS7+FhOqYEj4nXsIotzNhsX8DU80M
	5Oi+kWEw==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3fge-00000008Gla-3PoA;
	Fri, 20 Mar 2026 19:39:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A2A0840A5D;
	Fri, 20 Mar 2026 19:39:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0929DC2BCB0;
	Fri, 20 Mar 2026 19:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774035547;
	bh=86x1e2KlqpteSaaM7lejP1Bl+dRpcwhLokvktrA9jqY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Uhu53cZC/i9jnIgNtZl9DHyCJPNP7M2+7D0KPd9H0fOR7q4bemzt8shuQyEUWwhgw
	 1ceG+HynjH/FwHZBb0jwxNV8M1Q8u6YMdqWyVhbOh8oWKDv5uQ4TGn6HzZegbrrAqH
	 4TZ1iaZ6kqLTGCKwcLPz/ya6pD3aVyEPJTuAeq1ihituF+qqu/HxmZnuwCKmTMcuKw
	 7SqEgTRKI6Q9dEnoOjZp4wk31l0zJ8YG/iHBXji2ff9HJpgBY20Q6q9JQccuLxQsOQ
	 hGqeIqAOlGLcNYOfBJ7exBVzVbmnejqpV+UXJ5zxhlED6Nvu0YgE/UA8CGIIK7x8cD
	 +7qbaWZY4pG/g==
From: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Kees Cook <kees@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Vineet Gupta <vgupta@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Brian Cain <bcain@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Xu Xin <xu.xin16@zte.com.cn>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Michal Hocko <mhocko@suse.com>,
	Paul Moore <paul@paul-moore.com>,
	Stephen Smalley <stephen.smalley.work@gmail.com>,
	Ondrej Mosnacek <omosnace@redhat.com>,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-um@lists.infradead.org,
	linux-fsdevel@vger.kernel.org,
	selinux@vger.kernel.org
Subject: [PATCH v4 09/25] mm: unexport vm_brk_flags() and eliminate vm_flags parameter
Date: Fri, 20 Mar 2026 19:38:26 +0000
Message-ID: <7bada48ddf3f9dbd3e6c4fc50ec2f4de97706f52.1774034900.git.ljs@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1774034900.git.ljs@kernel.org>
References: <cover.1774034900.git.ljs@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_193913_189207_E532E0AA 
X-CRM114-Status: GOOD (  14.62  )
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

This function is only used by elf_load(), and that is a static function
that doesn't need an exported symbol to invoke an internal function, so
un-EXPORT_SYMBOLS() it.

Also, the vm_flags parameter is unnecessary, as we only ever set VM_EXEC,
so simply make this parameter a boolean.

While we're here, clean up the mm.h definitions for the various vm_xxx()
helpers so we actually specify parameter names and elide the redundant
extern's.

Acked-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>
Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
---
 fs/binfmt_elf.c    |  3 +--
 include/linux/mm.h | 12 ++++++------
 mm/mmap.c          |  8 ++------
 3 files changed, 9 insertions(+), 14 deletions(-)

diff --git a/fs/binfmt_elf.c b/fs/binfmt_elf.c
index fb857faaf0d6..16a56b6b3f6c 100644
--- a/fs/binfmt_elf.c
+++ b/fs/binfmt_elf.c
@@ -453,14 +453,13 @@ static unsigned long elf_load(struct file *filep, unsigned long addr,
 		zero_end = ELF_PAGEALIGN(zero_end);
 
 		error = vm_brk_flags(zero_start, zero_end - zero_start,
-				     prot & PROT_EXEC ? VM_EXEC : 0);
+				     prot & PROT_EXEC);
 		if (error)
 			map_addr = error;
 	}
 	return map_addr;
 }
 
-
 static unsigned long total_mapping_size(const struct elf_phdr *phdr, int nr)
 {
 	elf_addr_t min_addr = -1;
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 0c35423177bf..42d346684678 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -4005,12 +4005,12 @@ static inline void mm_populate(unsigned long addr, unsigned long len) {}
 #endif
 
 /* This takes the mm semaphore itself */
-extern int __must_check vm_brk_flags(unsigned long, unsigned long, unsigned long);
-extern int vm_munmap(unsigned long, size_t);
-extern unsigned long __must_check vm_mmap(struct file *, unsigned long,
-        unsigned long, unsigned long,
-        unsigned long, unsigned long);
-extern unsigned long __must_check vm_mmap_shadow_stack(unsigned long addr,
+int __must_check vm_brk_flags(unsigned long addr, unsigned long request, bool is_exec);
+int vm_munmap(unsigned long start, size_t len);
+unsigned long __must_check vm_mmap(struct file *file, unsigned long addr,
+		unsigned long len, unsigned long prot,
+		unsigned long flag, unsigned long offset);
+unsigned long __must_check vm_mmap_shadow_stack(unsigned long addr,
 		unsigned long len, unsigned long flags);
 
 struct vm_unmapped_area_info {
diff --git a/mm/mmap.c b/mm/mmap.c
index 79544d893411..2d2b814978bf 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -1201,8 +1201,9 @@ SYSCALL_DEFINE5(remap_file_pages, unsigned long, start, unsigned long, size,
 	return ret;
 }
 
-int vm_brk_flags(unsigned long addr, unsigned long request, vm_flags_t vm_flags)
+int vm_brk_flags(unsigned long addr, unsigned long request, bool is_exec)
 {
+	const vm_flags_t vm_flags = is_exec ? VM_EXEC : 0;
 	struct mm_struct *mm = current->mm;
 	struct vm_area_struct *vma = NULL;
 	unsigned long len;
@@ -1217,10 +1218,6 @@ int vm_brk_flags(unsigned long addr, unsigned long request, vm_flags_t vm_flags)
 	if (!len)
 		return 0;
 
-	/* Until we need other flags, refuse anything except VM_EXEC. */
-	if ((vm_flags & (~VM_EXEC)) != 0)
-		return -EINVAL;
-
 	if (mmap_write_lock_killable(mm))
 		return -EINTR;
 
@@ -1246,7 +1243,6 @@ int vm_brk_flags(unsigned long addr, unsigned long request, vm_flags_t vm_flags)
 	mmap_write_unlock(mm);
 	return ret;
 }
-EXPORT_SYMBOL(vm_brk_flags);
 
 static
 unsigned long tear_down_vmas(struct mm_struct *mm, struct vma_iterator *vmi,
-- 
2.53.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
