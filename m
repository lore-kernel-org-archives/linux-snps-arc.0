Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5384CCD4F21
	for <linux-snps-arc@archiver.kernel.org>; Wed,  4 Sep 2024 17:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SLJ/Zmjxi/sUYlZfmZJI8gmwywh4bEx6OVK94zAvapc=; b=MAjyWUD4vCYrn/
	2ML/EYzLeaZ8zXR47vBHlDwLmmmcqfhRwUROFauahBlUCRiHqf577X4oLIZLADjohsfqXkcQ+g+vO
	fS69P+jYF0adIQYJmkVJoIPpRFl9uRbgGRBiLXnYF7ik6ZCC/crElsEB23jWDttSvrfLP3mQDy0pl
	itM7qUjKXD++OhkojJ3cxwvFTBC0BW76hLuIhascfmn0C8GANQW5F/bnungjtUEGfJ8Qbw5KNZrkb
	iafGvJEuHkTeB+sMhVgFosZvs3+LkDSTMml8/HCQQGJrD+eijB53Ex8XjC7kp8QAiDfQwewwgZm+w
	Pvty8w2oGBmMW4K6xbPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sltQf-00000005NZ3-0Gxc;
	Wed, 04 Sep 2024 17:04:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sltQa-00000005NWF-108F;
	Wed, 04 Sep 2024 17:04:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 857485C5711;
	Wed,  4 Sep 2024 17:04:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E2ECC4CECB;
	Wed,  4 Sep 2024 17:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725469458;
	bh=6l7d6i2Hr/t16H3e0PM6ntsqOX0xtByvRrAFpx2RPdc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=XMng1+N5KmI2Uyam4ahGOmJ7SA6LJYTXKVjx7qG8VnUZ/zUuGhRBCUkXKze2d/h2W
	 qvk9lXkZAy6Y05LO0D8t2nFprSfQ7TcDWzQJu8SE80qNBE+/r6k3g83BIKWOzMfOt/
	 Dvpd5qWmKHpFvZ2SytdtRA/ewzxfCdXGeHxRiiWyHN4p2CWQTl0lHTEU4UgysXWzN2
	 eTOvyqyDhTsz/6ctIBuFArpRcUT1qm+ZYrAJVgsZe+irs/+81QH88lWveZJX5wrZrg
	 OTOm7mY8GpWO9fbBe5Sz+TeGAp/qLFj/uFen9cZ5SvcQauQXuNRCmgGBYLVs1L2zqm
	 CIGueYv9nSccQ==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 04 Sep 2024 17:58:01 +0100
Subject: [PATCH v2 3/3] mm: Care about shadow stack guard gap when getting
 an unmapped area
MIME-Version: 1.0
Message-Id: <20240904-mm-generic-shadow-stack-guard-v2-3-a46b8b6dc0ed@kernel.org>
References: <20240904-mm-generic-shadow-stack-guard-v2-0-a46b8b6dc0ed@kernel.org>
In-Reply-To: <20240904-mm-generic-shadow-stack-guard-v2-0-a46b8b6dc0ed@kernel.org>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, 
 Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>, 
 Russell King <linux@armlinux.org.uk>, Guo Ren <guoren@kernel.org>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
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
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-csky@vger.kernel.org, loongarch@lists.linux.dev, 
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-mm@kvack.org, 
 Rick Edgecombe <rick.p.edgecombe@intel.com>, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=openpgp-sha256; l=2551; i=broonie@kernel.org;
 h=from:subject:message-id; bh=6l7d6i2Hr/t16H3e0PM6ntsqOX0xtByvRrAFpx2RPdc=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBm2JLp8oAy9lYwTYiPgligR57zoDd7L+at5nOq93BI
 UyufcpKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZtiS6QAKCRAk1otyXVSH0OADB/
 0ch6Ppo1cUyP74KOdaZaA30djq+AGYfXlBTOUWViXVC9fGK3bpaqsBB0Cfo7Fu6OsGVc21oO0/yUH1
 YrAVYn6NPOHjgywpcI1TnkgqUaxfBOur+h4alPeKfO22P8IGuFmDQWUyfu/9w5PhhvsetXQF8HjY3+
 VA0L3qH2XKq516PsycNgfFI7aYDz9EL8tCzzuTsMp8jhgeTHcVNNcxzbWDDBDU5qQBsU5P9IwQfOAx
 OuEH/w/+Xqho79dLxhqBNChGpSjBv7foaNTf0PLA9gi1zV9CAxhWJ6oVaByM60hUmP9mC93njCQXlg
 DUm9swJvc4113Ub/xAIxFMCk0q1OCk
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_100420_565439_2C8C26F7 
X-CRM114-Status: GOOD (  15.72  )
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

As covered in the commit log for c44357c2e76b ("x86/mm: care about shadow
stack guard gap during placement") our current mmap() implementation does
not take care to ensure that a new mapping isn't placed with existing
mappings inside it's own guard gaps. This is particularly important for
shadow stacks since if two shadow stacks end up getting placed adjacent to
each other then they can overflow into each other which weakens the
protection offered by the feature.

On x86 there is a custom arch_get_unmapped_area() which was updated by the
above commit to cover this case by specifying a start_gap for allocations
with VM_SHADOW_STACK. Both arm64 and RISC-V have equivalent features and
use the generic implementation of arch_get_unmapped_area() so let's make
the equivalent change there so they also don't get shadow stack pages
placed without guard pages. x86 uses a single page guard, this is also
sufficient for arm64 where we either do single word pops and pushes or
unconstrained writes.

Architectures which do not have this feature will define VM_SHADOW_STACK
to VM_NONE and hence be unaffected.

Suggested-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Acked-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 mm/mmap.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/mm/mmap.c b/mm/mmap.c
index b06ba847c96e..050c5ae2f80f 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -1753,6 +1753,18 @@ static unsigned long unmapped_area_topdown(struct vm_unmapped_area_info *info)
 	return gap;
 }
 
+/*
+ * Determine if the allocation needs to ensure that there is no
+ * existing mapping within it's guard gaps, for use as start_gap.
+ */
+static inline unsigned long stack_guard_placement(vm_flags_t vm_flags)
+{
+	if (vm_flags & VM_SHADOW_STACK)
+		return PAGE_SIZE;
+
+	return 0;
+}
+
 /*
  * Search for an unmapped address range.
  *
@@ -1814,6 +1826,7 @@ generic_get_unmapped_area(struct file *filp, unsigned long addr,
 	info.length = len;
 	info.low_limit = mm->mmap_base;
 	info.high_limit = mmap_end;
+	info.start_gap = stack_guard_placement(vm_flags);
 	return vm_unmapped_area(&info);
 }
 
@@ -1863,6 +1876,7 @@ generic_get_unmapped_area_topdown(struct file *filp, unsigned long addr,
 	info.length = len;
 	info.low_limit = PAGE_SIZE;
 	info.high_limit = arch_get_mmap_base(addr, mm->mmap_base);
+	info.start_gap = stack_guard_placement(vm_flags);
 	addr = vm_unmapped_area(&info);
 
 	/*

-- 
2.39.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
