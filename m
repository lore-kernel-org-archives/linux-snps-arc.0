Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BB2AC54E66
	for <linux-snps-arc@archiver.kernel.org>; Tue, 12 Mar 2024 22:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5wAs56QQUeCh7w0cXjdG8NRJszoD993ny3XMvboCa6U=; b=hEHLEqNJp8xHxi
	QFNE9Z4CIRVy9bIO0s5SwlmnRa8GUEvBF7TxQ8LuOlVgGCoeXTH6G3m8O3rNRatRyq2hkaJaFc45k
	7Lv57dpci9/QkIGDj5bGvaPL6QyLsOmwZF1VIIjfWmfWF3uPs3QY5ssiospqX+kxVPRUOQ4ZXWSH7
	w5B6yiuaI464KjyNvv0En4B2wbhzOsS1aJgsOMBpXfyEni2JbqXxNamw4I8ezNtslRj9hOBSunLp0
	/bVNCdLUV7RGxOO9WjIecmusvAP+SFnYayiOOcL72QiFxiLoBUr2HgxDRdA7CbRWptk6sef9b3jwx
	wogSOhw65CjnVShPrXRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkAcX-00000007pxa-23ov;
	Tue, 12 Mar 2024 22:29:18 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkAcP-00000007pq9-0Zes;
	Tue, 12 Mar 2024 22:29:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710282549; x=1741818549;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=D1/EWAXI8SpxfCEHFRS2m8qX6cfft62KgrdcBDWVQkY=;
  b=XTqdQ6sjQXd3KGcdbT9rxGm0EGkIR+4Zwt+R2g8oCCruNFv9ZKeKAhdc
   +F3jl+/w62UawaqJ9SEHRDSfCWzpsiieb+k6WcM1rfnHq5V12IyeYJ3sB
   RAg3hq03W28QDgaW8xT1SjmAzAhkZftuJ5l1NF4f2EVwZBconpL0fIhVQ
   fgSlDOzfibUxchHEM3yWbW9fCaHmScjdAYGoybx57Vu2kH1alf3wQsuLz
   5As7ggkRmHcDSXSCu+xsC8LIV0beNsH8I2PJuaOFiinqZOiL9zLl1Ovpl
   KdqpD2WHLIHbHRKAhK3DDhn5Y++gOEW/efFvnRnMNLIJgmIHmOHR59HWz
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="5192030"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="5192030"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 15:29:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="16356866"
Received: from gargayus-mobl1.amr.corp.intel.com (HELO rpedgeco-desk4.intel.com) ([10.255.231.196])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 15:29:03 -0700
From: Rick Edgecombe <rick.p.edgecombe@intel.com>
To: Liam.Howlett@oracle.com,
	akpm@linux-foundation.org,
	bp@alien8.de,
	broonie@kernel.org,
	dave.hansen@linux.intel.com,
	debug@rivosinc.com,
	hpa@zytor.com,
	keescook@chromium.org,
	kirill.shutemov@linux.intel.com,
	luto@kernel.org,
	mingo@redhat.com,
	peterz@infradead.org,
	tglx@linutronix.de,
	x86@kernel.org,
	christophe.leroy@csgroup.eu
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	rick.p.edgecombe@intel.com,
	linux-alpha@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org
Subject: [PATCH v3 08/12] treewide: Use initializer for struct vm_unmapped_area_info
Date: Tue, 12 Mar 2024 15:28:39 -0700
Message-Id: <20240312222843.2505560-9-rick.p.edgecombe@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240312222843.2505560-1-rick.p.edgecombe@intel.com>
References: <20240312222843.2505560-1-rick.p.edgecombe@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_152909_260184_C62B6B81 
X-CRM114-Status: GOOD (  23.49  )
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

Future changes will need to add a new member to struct
vm_unmapped_area_info. This would cause trouble for any call site that
doesn't initialize the struct. Currently every caller sets each member
manually, so if new ones are added they will be uninitialized and the
core code parsing the struct will see garbage in the new member.

It could be possible to initialize the new member manually to 0 at each
call site. This and a couple other options were discussed. Having some
struct vm_unmapped_area_info instances not zero initialized will put
those sites at risk of feeding garbage into vm_unmapped_area(), if the
convention is to zero initialize the struct and any new field addition
missed a call site that initializes each field manually. So it is
useful to do things similar across the kernel.

The consensus (see links) was that in general the best way to accomplish
taking into account both code cleanliness and minimizing the chance of
introducing bugs, was to do C99 static initialization. As in:
struct vm_unmapped_area_info info = {};

With this method of initialization, the whole struct will be zero
initialized, and any statements setting fields to zero will be unneeded.
The change should not leave cleanup at the call sides.

While iterating though the possible solutions a few archs kindly acked
other variations that still zero initialized the struct. These sites have
been modified in previous changes using the pattern acked by the respective
arch.

So to be reduce the chance of bugs via uninitialized fields, perform a
tree wide change using the consensus for the best general way to do this
change. Use C99 static initializing to zero the struct and remove and
statements that simply set members to zero.

Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: linux-mm@kvack.org
Cc: linux-alpha@vger.kernel.org
Cc: linux-snps-arc@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-csky@vger.kernel.org
Cc: loongarch@lists.linux.dev
Cc: linux-mips@vger.kernel.org
Cc: linux-s390@vger.kernel.org
Cc: linux-sh@vger.kernel.org
Cc: sparclinux@vger.kernel.org
Link: https://lore.kernel.org/lkml/202402280912.33AEE7A9CF@keescook/#t
Link: https://lore.kernel.org/lkml/j7bfvig3gew3qruouxrh7z7ehjjafrgkbcmg6tcghhfh3rhmzi@wzlcoecgy5rs/
Link: https://lore.kernel.org/lkml/ec3e377a-c0a0-4dd3-9cb9-96517e54d17e@csgroup.eu/
---
Hi archs,

For some context, this is part of a larger series to improve shadow stack
guard gaps. It involves plumbing a new field via
struct vm_unmapped_area_info. The first user is x86, but arm and riscv may
likely use it as well. The change is compile tested only for non-x86.

Thanks,

Rick
---
 arch/alpha/kernel/osf_sys.c      |  5 +----
 arch/arc/mm/mmap.c               |  4 +---
 arch/arm/mm/mmap.c               |  5 ++---
 arch/loongarch/mm/mmap.c         |  3 +--
 arch/mips/mm/mmap.c              |  3 +--
 arch/s390/mm/hugetlbpage.c       |  7 ++-----
 arch/s390/mm/mmap.c              | 11 ++++-------
 arch/sh/mm/mmap.c                |  5 ++---
 arch/sparc/kernel/sys_sparc_32.c |  3 +--
 arch/sparc/kernel/sys_sparc_64.c |  5 ++---
 arch/sparc/mm/hugetlbpage.c      |  7 ++-----
 arch/x86/kernel/sys_x86_64.c     |  7 ++-----
 arch/x86/mm/hugetlbpage.c        |  7 ++-----
 fs/hugetlbfs/inode.c             |  7 ++-----
 mm/mmap.c                        |  9 ++-------
 15 files changed, 27 insertions(+), 61 deletions(-)

diff --git a/arch/alpha/kernel/osf_sys.c b/arch/alpha/kernel/osf_sys.c
index 5db88b627439..e5f881bc8288 100644
--- a/arch/alpha/kernel/osf_sys.c
+++ b/arch/alpha/kernel/osf_sys.c
@@ -1218,14 +1218,11 @@ static unsigned long
 arch_get_unmapped_area_1(unsigned long addr, unsigned long len,
 		         unsigned long limit)
 {
-	struct vm_unmapped_area_info info;
+	struct vm_unmapped_area_info info = {};
 
-	info.flags = 0;
 	info.length = len;
 	info.low_limit = addr;
 	info.high_limit = limit;
-	info.align_mask = 0;
-	info.align_offset = 0;
 	return vm_unmapped_area(&info);
 }
 
diff --git a/arch/arc/mm/mmap.c b/arch/arc/mm/mmap.c
index 3c1c7ae73292..69a915297155 100644
--- a/arch/arc/mm/mmap.c
+++ b/arch/arc/mm/mmap.c
@@ -27,7 +27,7 @@ arch_get_unmapped_area(struct file *filp, unsigned long addr,
 {
 	struct mm_struct *mm = current->mm;
 	struct vm_area_struct *vma;
-	struct vm_unmapped_area_info info;
+	struct vm_unmapped_area_info info = {};
 
 	/*
 	 * We enforce the MAP_FIXED case.
@@ -51,11 +51,9 @@ arch_get_unmapped_area(struct file *filp, unsigned long addr,
 			return addr;
 	}
 
-	info.flags = 0;
 	info.length = len;
 	info.low_limit = mm->mmap_base;
 	info.high_limit = TASK_SIZE;
-	info.align_mask = 0;
 	info.align_offset = pgoff << PAGE_SHIFT;
 	return vm_unmapped_area(&info);
 }
diff --git a/arch/arm/mm/mmap.c b/arch/arm/mm/mmap.c
index a0f8a0ca0788..d65d0e6ed10a 100644
--- a/arch/arm/mm/mmap.c
+++ b/arch/arm/mm/mmap.c
@@ -34,7 +34,7 @@ arch_get_unmapped_area(struct file *filp, unsigned long addr,
 	struct vm_area_struct *vma;
 	int do_align = 0;
 	int aliasing = cache_is_vipt_aliasing();
-	struct vm_unmapped_area_info info;
+	struct vm_unmapped_area_info info = {};
 
 	/*
 	 * We only need to do colour alignment if either the I or D
@@ -68,7 +68,6 @@ arch_get_unmapped_area(struct file *filp, unsigned long addr,
 			return addr;
 	}
 
-	info.flags = 0;
 	info.length = len;
 	info.low_limit = mm->mmap_base;
 	info.high_limit = TASK_SIZE;
@@ -87,7 +86,7 @@ arch_get_unmapped_area_topdown(struct file *filp, const unsigned long addr0,
 	unsigned long addr = addr0;
 	int do_align = 0;
 	int aliasing = cache_is_vipt_aliasing();
-	struct vm_unmapped_area_info info;
+	struct vm_unmapped_area_info info = {};
 
 	/*
 	 * We only need to do colour alignment if either the I or D
diff --git a/arch/loongarch/mm/mmap.c b/arch/loongarch/mm/mmap.c
index a9630a81b38a..4bbd449b4a47 100644
--- a/arch/loongarch/mm/mmap.c
+++ b/arch/loongarch/mm/mmap.c
@@ -24,7 +24,7 @@ static unsigned long arch_get_unmapped_area_common(struct file *filp,
 	struct vm_area_struct *vma;
 	unsigned long addr = addr0;
 	int do_color_align;
-	struct vm_unmapped_area_info info;
+	struct vm_unmapped_area_info info = {};
 
 	if (unlikely(len > TASK_SIZE))
 		return -ENOMEM;
@@ -82,7 +82,6 @@ static unsigned long arch_get_unmapped_area_common(struct file *filp,
 		 */
 	}
 
-	info.flags = 0;
 	info.low_limit = mm->mmap_base;
 	info.high_limit = TASK_SIZE;
 	return vm_unmapped_area(&info);
diff --git a/arch/mips/mm/mmap.c b/arch/mips/mm/mmap.c
index 00fe90c6db3e..7e11d7b58761 100644
--- a/arch/mips/mm/mmap.c
+++ b/arch/mips/mm/mmap.c
@@ -34,7 +34,7 @@ static unsigned long arch_get_unmapped_area_common(struct file *filp,
 	struct vm_area_struct *vma;
 	unsigned long addr = addr0;
 	int do_color_align;
-	struct vm_unmapped_area_info info;
+	struct vm_unmapped_area_info info = {};
 
 	if (unlikely(len > TASK_SIZE))
 		return -ENOMEM;
@@ -92,7 +92,6 @@ static unsigned long arch_get_unmapped_area_common(struct file *filp,
 		 */
 	}
 
-	info.flags = 0;
 	info.low_limit = mm->mmap_base;
 	info.high_limit = TASK_SIZE;
 	return vm_unmapped_area(&info);
diff --git a/arch/s390/mm/hugetlbpage.c b/arch/s390/mm/hugetlbpage.c
index c2d2850ec8d5..51fb3806395b 100644
--- a/arch/s390/mm/hugetlbpage.c
+++ b/arch/s390/mm/hugetlbpage.c
@@ -258,14 +258,12 @@ static unsigned long hugetlb_get_unmapped_area_bottomup(struct file *file,
 		unsigned long pgoff, unsigned long flags)
 {
 	struct hstate *h = hstate_file(file);
-	struct vm_unmapped_area_info info;
+	struct vm_unmapped_area_info info = {};
 
-	info.flags = 0;
 	info.length = len;
 	info.low_limit = current->mm->mmap_base;
 	info.high_limit = TASK_SIZE;
 	info.align_mask = PAGE_MASK & ~huge_page_mask(h);
-	info.align_offset = 0;
 	return vm_unmapped_area(&info);
 }
 
@@ -274,7 +272,7 @@ static unsigned long hugetlb_get_unmapped_area_topdown(struct file *file,
 		unsigned long pgoff, unsigned long flags)
 {
 	struct hstate *h = hstate_file(file);
-	struct vm_unmapped_area_info info;
+	struct vm_unmapped_area_info info = {};
 	unsigned long addr;
 
 	info.flags = VM_UNMAPPED_AREA_TOPDOWN;
@@ -282,7 +280,6 @@ static unsigned long hugetlb_get_unmapped_area_topdown(struct file *file,
 	info.low_limit = PAGE_SIZE;
 	info.high_limit = current->mm->mmap_base;
 	info.align_mask = PAGE_MASK & ~huge_page_mask(h);
-	info.align_offset = 0;
 	addr = vm_unmapped_area(&info);
 
 	/*
diff --git a/arch/s390/mm/mmap.c b/arch/s390/mm/mmap.c
index cd52d72b59cf..5c9d9f18a55f 100644
--- a/arch/s390/mm/mmap.c
+++ b/arch/s390/mm/mmap.c
@@ -77,7 +77,7 @@ unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr,
 {
 	struct mm_struct *mm = current->mm;
 	struct vm_area_struct *vma;
-	struct vm_unmapped_area_info info;
+	struct vm_unmapped_area_info info = {};
 
 	if (len > TASK_SIZE - mmap_min_addr)
 		return -ENOMEM;
@@ -93,14 +93,12 @@ unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr,
 			goto check_asce_limit;
 	}
 
-	info.flags = 0;
 	info.length = len;
 	info.low_limit = mm->mmap_base;
 	info.high_limit = TASK_SIZE;
 	if (filp || (flags & MAP_SHARED))
 		info.align_mask = MMAP_ALIGN_MASK << PAGE_SHIFT;
-	else
-		info.align_mask = 0;
+
 	info.align_offset = pgoff << PAGE_SHIFT;
 	addr = vm_unmapped_area(&info);
 	if (offset_in_page(addr))
@@ -116,7 +114,7 @@ unsigned long arch_get_unmapped_area_topdown(struct file *filp, unsigned long ad
 {
 	struct vm_area_struct *vma;
 	struct mm_struct *mm = current->mm;
-	struct vm_unmapped_area_info info;
+	struct vm_unmapped_area_info info = {};
 
 	/* requested length too big for entire address space */
 	if (len > TASK_SIZE - mmap_min_addr)
@@ -140,8 +138,7 @@ unsigned long arch_get_unmapped_area_topdown(struct file *filp, unsigned long ad
 	info.high_limit = mm->mmap_base;
 	if (filp || (flags & MAP_SHARED))
 		info.align_mask = MMAP_ALIGN_MASK << PAGE_SHIFT;
-	else
-		info.align_mask = 0;
+
 	info.align_offset = pgoff << PAGE_SHIFT;
 	addr = vm_unmapped_area(&info);
 
diff --git a/arch/sh/mm/mmap.c b/arch/sh/mm/mmap.c
index b82199878b45..bee329d4149a 100644
--- a/arch/sh/mm/mmap.c
+++ b/arch/sh/mm/mmap.c
@@ -57,7 +57,7 @@ unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr,
 	struct mm_struct *mm = current->mm;
 	struct vm_area_struct *vma;
 	int do_colour_align;
-	struct vm_unmapped_area_info info;
+	struct vm_unmapped_area_info info = {};
 
 	if (flags & MAP_FIXED) {
 		/* We do not accept a shared mapping if it would violate
@@ -88,7 +88,6 @@ unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr,
 			return addr;
 	}
 
-	info.flags = 0;
 	info.length = len;
 	info.low_limit = TASK_UNMAPPED_BASE;
 	info.high_limit = TASK_SIZE;
@@ -106,7 +105,7 @@ arch_get_unmapped_area_topdown(struct file *filp, const unsigned long addr0,
 	struct mm_struct *mm = current->mm;
 	unsigned long addr = addr0;
 	int do_colour_align;
-	struct vm_unmapped_area_info info;
+	struct vm_unmapped_area_info info = {};
 
 	if (flags & MAP_FIXED) {
 		/* We do not accept a shared mapping if it would violate
diff --git a/arch/sparc/kernel/sys_sparc_32.c b/arch/sparc/kernel/sys_sparc_32.c
index 082a551897ed..08a19727795c 100644
--- a/arch/sparc/kernel/sys_sparc_32.c
+++ b/arch/sparc/kernel/sys_sparc_32.c
@@ -41,7 +41,7 @@ SYSCALL_DEFINE0(getpagesize)
 
 unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr, unsigned long len, unsigned long pgoff, unsigned long flags)
 {
-	struct vm_unmapped_area_info info;
+	struct vm_unmapped_area_info info = {};
 
 	if (flags & MAP_FIXED) {
 		/* We do not accept a shared mapping if it would violate
@@ -59,7 +59,6 @@ unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr, unsi
 	if (!addr)
 		addr = TASK_UNMAPPED_BASE;
 
-	info.flags = 0;
 	info.length = len;
 	info.low_limit = addr;
 	info.high_limit = TASK_SIZE;
diff --git a/arch/sparc/kernel/sys_sparc_64.c b/arch/sparc/kernel/sys_sparc_64.c
index 1dbf7211666e..d9c3b34ca744 100644
--- a/arch/sparc/kernel/sys_sparc_64.c
+++ b/arch/sparc/kernel/sys_sparc_64.c
@@ -93,7 +93,7 @@ unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr, unsi
 	struct vm_area_struct * vma;
 	unsigned long task_size = TASK_SIZE;
 	int do_color_align;
-	struct vm_unmapped_area_info info;
+	struct vm_unmapped_area_info info = {};
 
 	if (flags & MAP_FIXED) {
 		/* We do not accept a shared mapping if it would violate
@@ -126,7 +126,6 @@ unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr, unsi
 			return addr;
 	}
 
-	info.flags = 0;
 	info.length = len;
 	info.low_limit = TASK_UNMAPPED_BASE;
 	info.high_limit = min(task_size, VA_EXCLUDE_START);
@@ -154,7 +153,7 @@ arch_get_unmapped_area_topdown(struct file *filp, const unsigned long addr0,
 	unsigned long task_size = STACK_TOP32;
 	unsigned long addr = addr0;
 	int do_color_align;
-	struct vm_unmapped_area_info info;
+	struct vm_unmapped_area_info info = {};
 
 	/* This should only ever run for 32-bit processes.  */
 	BUG_ON(!test_thread_flag(TIF_32BIT));
diff --git a/arch/sparc/mm/hugetlbpage.c b/arch/sparc/mm/hugetlbpage.c
index 38a1bef47efb..4caf56b32e26 100644
--- a/arch/sparc/mm/hugetlbpage.c
+++ b/arch/sparc/mm/hugetlbpage.c
@@ -31,17 +31,15 @@ static unsigned long hugetlb_get_unmapped_area_bottomup(struct file *filp,
 {
 	struct hstate *h = hstate_file(filp);
 	unsigned long task_size = TASK_SIZE;
-	struct vm_unmapped_area_info info;
+	struct vm_unmapped_area_info info = {};
 
 	if (test_thread_flag(TIF_32BIT))
 		task_size = STACK_TOP32;
 
-	info.flags = 0;
 	info.length = len;
 	info.low_limit = TASK_UNMAPPED_BASE;
 	info.high_limit = min(task_size, VA_EXCLUDE_START);
 	info.align_mask = PAGE_MASK & ~huge_page_mask(h);
-	info.align_offset = 0;
 	addr = vm_unmapped_area(&info);
 
 	if ((addr & ~PAGE_MASK) && task_size > VA_EXCLUDE_END) {
@@ -63,7 +61,7 @@ hugetlb_get_unmapped_area_topdown(struct file *filp, const unsigned long addr0,
 	struct hstate *h = hstate_file(filp);
 	struct mm_struct *mm = current->mm;
 	unsigned long addr = addr0;
-	struct vm_unmapped_area_info info;
+	struct vm_unmapped_area_info info = {};
 
 	/* This should only ever run for 32-bit processes.  */
 	BUG_ON(!test_thread_flag(TIF_32BIT));
@@ -73,7 +71,6 @@ hugetlb_get_unmapped_area_topdown(struct file *filp, const unsigned long addr0,
 	info.low_limit = PAGE_SIZE;
 	info.high_limit = mm->mmap_base;
 	info.align_mask = PAGE_MASK & ~huge_page_mask(h);
-	info.align_offset = 0;
 	addr = vm_unmapped_area(&info);
 
 	/*
diff --git a/arch/x86/kernel/sys_x86_64.c b/arch/x86/kernel/sys_x86_64.c
index c783aeb37dce..b3278e4f7e59 100644
--- a/arch/x86/kernel/sys_x86_64.c
+++ b/arch/x86/kernel/sys_x86_64.c
@@ -125,7 +125,7 @@ arch_get_unmapped_area(struct file *filp, unsigned long addr,
 {
 	struct mm_struct *mm = current->mm;
 	struct vm_area_struct *vma;
-	struct vm_unmapped_area_info info;
+	struct vm_unmapped_area_info info = {};
 	unsigned long begin, end;
 
 	if (flags & MAP_FIXED)
@@ -144,11 +144,9 @@ arch_get_unmapped_area(struct file *filp, unsigned long addr,
 			return addr;
 	}
 
-	info.flags = 0;
 	info.length = len;
 	info.low_limit = begin;
 	info.high_limit = end;
-	info.align_mask = 0;
 	info.align_offset = pgoff << PAGE_SHIFT;
 	if (filp) {
 		info.align_mask = get_align_mask();
@@ -165,7 +163,7 @@ arch_get_unmapped_area_topdown(struct file *filp, const unsigned long addr0,
 	struct vm_area_struct *vma;
 	struct mm_struct *mm = current->mm;
 	unsigned long addr = addr0;
-	struct vm_unmapped_area_info info;
+	struct vm_unmapped_area_info info = {};
 
 	/* requested length too big for entire address space */
 	if (len > TASK_SIZE)
@@ -210,7 +208,6 @@ arch_get_unmapped_area_topdown(struct file *filp, const unsigned long addr0,
 	if (addr > DEFAULT_MAP_WINDOW && !in_32bit_syscall())
 		info.high_limit += TASK_SIZE_MAX - DEFAULT_MAP_WINDOW;
 
-	info.align_mask = 0;
 	info.align_offset = pgoff << PAGE_SHIFT;
 	if (filp) {
 		info.align_mask = get_align_mask();
diff --git a/arch/x86/mm/hugetlbpage.c b/arch/x86/mm/hugetlbpage.c
index 6d77c0039617..fb600949a355 100644
--- a/arch/x86/mm/hugetlbpage.c
+++ b/arch/x86/mm/hugetlbpage.c
@@ -51,9 +51,8 @@ static unsigned long hugetlb_get_unmapped_area_bottomup(struct file *file,
 		unsigned long pgoff, unsigned long flags)
 {
 	struct hstate *h = hstate_file(file);
-	struct vm_unmapped_area_info info;
+	struct vm_unmapped_area_info info = {};
 
-	info.flags = 0;
 	info.length = len;
 	info.low_limit = get_mmap_base(1);
 
@@ -65,7 +64,6 @@ static unsigned long hugetlb_get_unmapped_area_bottomup(struct file *file,
 		task_size_32bit() : task_size_64bit(addr > DEFAULT_MAP_WINDOW);
 
 	info.align_mask = PAGE_MASK & ~huge_page_mask(h);
-	info.align_offset = 0;
 	return vm_unmapped_area(&info);
 }
 
@@ -74,7 +72,7 @@ static unsigned long hugetlb_get_unmapped_area_topdown(struct file *file,
 		unsigned long pgoff, unsigned long flags)
 {
 	struct hstate *h = hstate_file(file);
-	struct vm_unmapped_area_info info;
+	struct vm_unmapped_area_info info = {};
 
 	info.flags = VM_UNMAPPED_AREA_TOPDOWN;
 	info.length = len;
@@ -89,7 +87,6 @@ static unsigned long hugetlb_get_unmapped_area_topdown(struct file *file,
 		info.high_limit += TASK_SIZE_MAX - DEFAULT_MAP_WINDOW;
 
 	info.align_mask = PAGE_MASK & ~huge_page_mask(h);
-	info.align_offset = 0;
 	addr = vm_unmapped_area(&info);
 
 	/*
diff --git a/fs/hugetlbfs/inode.c b/fs/hugetlbfs/inode.c
index cd87ea5944a1..ae833080a146 100644
--- a/fs/hugetlbfs/inode.c
+++ b/fs/hugetlbfs/inode.c
@@ -176,14 +176,12 @@ hugetlb_get_unmapped_area_bottomup(struct file *file, unsigned long addr,
 		unsigned long len, unsigned long pgoff, unsigned long flags)
 {
 	struct hstate *h = hstate_file(file);
-	struct vm_unmapped_area_info info;
+	struct vm_unmapped_area_info info = {};
 
-	info.flags = 0;
 	info.length = len;
 	info.low_limit = current->mm->mmap_base;
 	info.high_limit = arch_get_mmap_end(addr, len, flags);
 	info.align_mask = PAGE_MASK & ~huge_page_mask(h);
-	info.align_offset = 0;
 	return vm_unmapped_area(&info);
 }
 
@@ -192,14 +190,13 @@ hugetlb_get_unmapped_area_topdown(struct file *file, unsigned long addr,
 		unsigned long len, unsigned long pgoff, unsigned long flags)
 {
 	struct hstate *h = hstate_file(file);
-	struct vm_unmapped_area_info info;
+	struct vm_unmapped_area_info info = {};
 
 	info.flags = VM_UNMAPPED_AREA_TOPDOWN;
 	info.length = len;
 	info.low_limit = PAGE_SIZE;
 	info.high_limit = arch_get_mmap_base(addr, current->mm->mmap_base);
 	info.align_mask = PAGE_MASK & ~huge_page_mask(h);
-	info.align_offset = 0;
 	addr = vm_unmapped_area(&info);
 
 	/*
diff --git a/mm/mmap.c b/mm/mmap.c
index 68381b90f906..b889c79d11bd 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -1707,7 +1707,7 @@ generic_get_unmapped_area(struct file *filp, unsigned long addr,
 {
 	struct mm_struct *mm = current->mm;
 	struct vm_area_struct *vma, *prev;
-	struct vm_unmapped_area_info info;
+	struct vm_unmapped_area_info info = {};
 	const unsigned long mmap_end = arch_get_mmap_end(addr, len, flags);
 
 	if (len > mmap_end - mmap_min_addr)
@@ -1725,12 +1725,9 @@ generic_get_unmapped_area(struct file *filp, unsigned long addr,
 			return addr;
 	}
 
-	info.flags = 0;
 	info.length = len;
 	info.low_limit = mm->mmap_base;
 	info.high_limit = mmap_end;
-	info.align_mask = 0;
-	info.align_offset = 0;
 	return vm_unmapped_area(&info);
 }
 
@@ -1755,7 +1752,7 @@ generic_get_unmapped_area_topdown(struct file *filp, unsigned long addr,
 {
 	struct vm_area_struct *vma, *prev;
 	struct mm_struct *mm = current->mm;
-	struct vm_unmapped_area_info info;
+	struct vm_unmapped_area_info info = {};
 	const unsigned long mmap_end = arch_get_mmap_end(addr, len, flags);
 
 	/* requested length too big for entire address space */
@@ -1779,8 +1776,6 @@ generic_get_unmapped_area_topdown(struct file *filp, unsigned long addr,
 	info.length = len;
 	info.low_limit = PAGE_SIZE;
 	info.high_limit = arch_get_mmap_base(addr, mm->mmap_base);
-	info.align_mask = 0;
-	info.align_offset = 0;
 	addr = vm_unmapped_area(&info);
 
 	/*
-- 
2.34.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
