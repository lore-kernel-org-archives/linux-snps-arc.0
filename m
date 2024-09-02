Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 436E2CD3420
	for <linux-snps-arc@archiver.kernel.org>; Mon,  2 Sep 2024 19:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RLwmzu/tJ3siD20eMl7tbeKLeqLY0EkCt84LqIrpfKc=; b=geSNC1cjxKR062
	g5/2MnaO/UW+Xp5XfZPXtgFHVsU6jPoW1t9W9B9fzZXBa+SZdMF9EUosOu3p1YfZdAkXjLRnEHrnW
	YfqlHm74oelsXLTMMlMSslFjm7I4C8slUgvsGkkyby66h5/lr5p+64dXiGysQTn9P6Vfjy4xkf7rH
	LbNZ27XBt8RwSAgEmpNgWeOPOJMnEoV8Kq8XiHNy67xObTWZe+mI26HyTWmSWVTajmYJBd0bouhzK
	Qp4xY+wv8PuQ+kB531yttFi+qNKokL8XB2caZCyCISPspH11ciNEVfC+DrqXiibcDcrEA6zt1FeM7
	InVNWGNzadG7ONMbPorw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slCRI-0000000FN4k-3x9w;
	Mon, 02 Sep 2024 19:10:12 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slCQO-0000000FMpA-20sO;
	Mon, 02 Sep 2024 19:09:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 35BFC5C5786;
	Mon,  2 Sep 2024 19:09:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69C9CC4CEC8;
	Mon,  2 Sep 2024 19:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725304155;
	bh=0/hF44fORO0Gery9A2B+FBHrfD+c3aFRzdrAQPNITJE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=N9sI26+YB1BFPD9a0+oQnaOYoEp8JD6VMjANXfF4vZthYCbAVo/geEan5PCYE/5YG
	 KyNtsWx0ZmtF4GI6OmQqvHuRlOVg8nJg01jLUUvrGS8k0qXeZSz9H6+XV52mPp5OT9
	 SiFxv0FaUoXnD8v0PwGJEyUEBBupfs/d/2YxBDJJeebGN6LeO2fcg3zg8MsSGoraop
	 tcocc1osS+PVlcQOrKjq5qbDCptBphGD5397tCq3uoQScdTyYNG0/L00MB3+u9eT91
	 Po9TaiUwdOyyXQuJiSHGiI3yZh0UNZiv/JBij7SxkXKL2T4XOAiQx7+fQg9SMU8IKV
	 ZubyoBQssJRwg==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 02 Sep 2024 20:08:15 +0100
Subject: [PATCH 3/3] mm: Care about shadow stack guard gap when getting an
 unmapped area
MIME-Version: 1.0
Message-Id: <20240902-mm-generic-shadow-stack-guard-v1-3-9acda38b3dd3@kernel.org>
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
 Mark Brown <broonie@kernel.org>, 
 Rick Edgecombe <rick.p.edgecombe@intel.com>
X-Mailer: b4 0.15-dev-37811
X-Developer-Signature: v=1; a=openpgp-sha256; l=2208; i=broonie@kernel.org;
 h=from:subject:message-id; bh=0/hF44fORO0Gery9A2B+FBHrfD+c3aFRzdrAQPNITJE=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBm1g0waix/xDVLlXSaTD4u/rRM+Xov1S4sJqN9L4bW
 qlKpuiaJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZtYNMAAKCRAk1otyXVSH0D8aCA
 CF9K7LlaivE2EybLobtlEVyd3x4/yQFEmQzQPnmLchhUTmpNDtOjAWH5nWJB5csnuTjOxnJKPohxjU
 OlGKNnXZ4xzXd0tKckj2SwQe75FXPlRlPAsaelj3L+B0sFx+eaxKOJptUrnxX0L5qOqpZ7yxSSg7Lp
 QqS957ontDIGI1sWL7Jr883SmGUsD3O1znFCoOJSJgM0E4BSv5EsC6tkrAy58jG3VQAOqtDHm5b8r9
 9yDRusfPXLA88jssbTu7Bg4R1DSDS6OnJlDIn0c2CKKk/Cw+o6jzMxTmxntZMd5Iiz1JndFzNYziYB
 5TydVe5LsQPAyaA9p8ecpXQVC+h/i/
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240902_120916_698575_528309BD 
X-CRM114-Status: GOOD (  15.18  )
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
placed without guard pages.

Architectures which do not have this feature will define VM_SHADOW_STACK
to VM_NONE and hence be unaffected.

Suggested-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 mm/mmap.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/mm/mmap.c b/mm/mmap.c
index b06ba847c96e..902c482b6084 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -1753,6 +1753,14 @@ static unsigned long unmapped_area_topdown(struct vm_unmapped_area_info *info)
 	return gap;
 }
 
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
@@ -1814,6 +1822,7 @@ generic_get_unmapped_area(struct file *filp, unsigned long addr,
 	info.length = len;
 	info.low_limit = mm->mmap_base;
 	info.high_limit = mmap_end;
+	info.start_gap = stack_guard_placement(vm_flags);
 	return vm_unmapped_area(&info);
 }
 
@@ -1863,6 +1872,7 @@ generic_get_unmapped_area_topdown(struct file *filp, unsigned long addr,
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
