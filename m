Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEF06CD13CF
	for <linux-snps-arc@archiver.kernel.org>; Mon,  2 Sep 2024 19:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=K/Ze3tkhPk+CWTOWw1FydOzIsvadRgz0rAJBnuK8j2k=; b=JQbcZPqATt3I3E
	k+xSM1gwVk9rGVL1F3PZkw/VUiGsx9lO5LS+kjNujO+18TkAL3rOGGtHnbdxA5tUZlmYxjmzJxQww
	JqZUfIJbuq4HIIldDbIuIn6Qix3RNx4NLrhoAdDnMzBPz60uoKwHl38eMbYuOZUNTvH5T+CSvR623
	E/HIV++Y8M8tP4bWIBZJPpdTXO4yNlNJb2MKs80Pz/8wdwX7B3nSedRFSFUd0Ra0ad6TuJFfqbHps
	8Jc6NFeQmgAFIzjDuYUmSu0fwdDGQqWqCF5FY2hchC6LozdU5q9WAshXWGEcRe/lwSVHm+cfklywE
	Qf1j1UwvYu5Ar4UPPZVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slCQQ-0000000FMqL-2aKP;
	Mon, 02 Sep 2024 19:09:18 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slCPs-0000000FMY2-1XEH;
	Mon, 02 Sep 2024 19:08:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B11365C5786;
	Mon,  2 Sep 2024 19:08:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CCAEC4CEC2;
	Mon,  2 Sep 2024 19:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725304122;
	bh=Oas/y5WsR2uek3LQJA53gCtjxNPODnZnDS04Vmdm0SM=;
	h=From:Subject:Date:To:Cc:From;
	b=t8jxrlHNVdQXEDhwqdc20wAj+gPH80qUonuGgv2lMOAereLM62SZkpGPh6RAw9Q9b
	 cBNdNdELgobbYczEeegAXNuBmkG7+MBKa3Udw2wp+tjLbthGJxD6C/atbKR7nQEKwI
	 NAVDsSjvSJZ9+1oRX/kkvqkAIgsWJCEN3vAjweczQiDR8G8rv2/iGBjY0OqiwXsYOC
	 1YZQ4+Nhih70PVTlXd97kseJ3xxY4C8apxLBnSHWiBfctlrlY5bLTNsKDQhWc4cvZV
	 gw+pLSbt1GGlFl6jRG9lXzrbyPWAt8owB6/wy3UdR0nEgwgZKF32T6/tL0RJDOum7q
	 AtI7A5Vf8oy6Q==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 0/3] mm: Care about shadow stack guard gap when getting an
 unmapped area
Date: Mon, 02 Sep 2024 20:08:12 +0100
Message-Id: <20240902-mm-generic-shadow-stack-guard-v1-0-9acda38b3dd3@kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIABwN1mYC/x3MQQqDMBBA0avIrDuQqgHtVUoXSWaMgxhLplVBv
 LvB5Vv8f4ByFlZ4VQdkXkVlSQXPRwVhdCkyChVDberWdI3BecbIqUQBdXS0bKg/FyaMf5cJrQ/
 Wd2S4twTl8c08yH7/35/zvADZttxrbwAAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2921; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Oas/y5WsR2uek3LQJA53gCtjxNPODnZnDS04Vmdm0SM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBm1g0tzzAYejDFf/YyyXU75xxYTOzlmhmKdU7A0Mjv
 QTPoE+GJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZtYNLQAKCRAk1otyXVSH0DS/B/
 9wL/O0zfApTjzan3whOoMvydnSM37kQyhnnpfHRjUqEv3U+31o7LNZtf8cgkcFnfvN/mcjg6zqfUbL
 sgE3gILwU/gP0rpIIqOBcdMi0yW/6RMxDx3KYAXsoMcW+HgREp4Jmstlc5mrqGzeY9D8bRILVJSjtt
 CxzlZDYaBGUyD6JX4rA4vmDkKdsx+ZsnFmkTKKS4DYRkMaU9mg1/cG7jWJa8t7opzkAXW5a9k1msEw
 fa0BXHW/LfCE9M6grMvRbR+VL7UOyIE9Bsha8/dsbR6EJN8gbJiRaqql1/7PoOt5/VXpmT+GO8cCfj
 ebeheDgkstF5WtU2RPgxVpDKwWWfI3
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240902_120844_580090_5C4D30DF 
X-CRM114-Status: GOOD (  13.93  )
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
placed without guard pages. The arm64 and RISC-V shadow stack
implementations are currently on the list:

   https://lore.kernel.org/r/20240829-arm64-gcs-v12-0-42fec94743
   https://lore.kernel.org/lkml/20240403234054.2020347-1-debug@rivosinc.com/

Given the addition of the use of vm_flags in the generic implementation
we also simplify the set of possibilities that have to be dealt with in
the core code by making arch_get_unmapped_area() take vm_flags as
standard. This is a bit invasive since the prototype change touches
quite a few architectures but since the parameter is ignored the change
is straightforward, the simplification for the generic code seems worth
it.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
Mark Brown (3):
      mm: Make arch_get_unmapped_area() take vm_flags by default
      mm: Pass vm_flags to generic_get_unmapped_area()
      mm: Care about shadow stack guard gap when getting an unmapped area

 arch/alpha/kernel/osf_sys.c       |  2 +-
 arch/arc/mm/mmap.c                |  3 ++-
 arch/arm/mm/mmap.c                |  7 +++---
 arch/csky/abiv1/mmap.c            |  3 ++-
 arch/loongarch/mm/mmap.c          |  5 ++--
 arch/mips/mm/mmap.c               |  2 +-
 arch/parisc/kernel/sys_parisc.c   |  5 ++--
 arch/parisc/mm/hugetlbpage.c      |  2 +-
 arch/powerpc/mm/book3s64/slice.c  | 10 +++++---
 arch/s390/mm/mmap.c               |  4 +--
 arch/sh/mm/mmap.c                 |  5 ++--
 arch/sparc/kernel/sys_sparc_32.c  |  2 +-
 arch/sparc/kernel/sys_sparc_64.c  |  4 +--
 arch/x86/include/asm/pgtable_64.h |  1 -
 arch/x86/kernel/sys_x86_64.c      | 21 +++-------------
 arch/xtensa/kernel/syscall.c      |  3 ++-
 include/linux/sched/mm.h          | 27 ++++++++-------------
 mm/mmap.c                         | 51 ++++++++++++++++++---------------------
 18 files changed, 69 insertions(+), 88 deletions(-)
---
base-commit: 7c626ce4bae1ac14f60076d00eafe71af30450ba
change-id: 20240830-mm-generic-shadow-stack-guard-5bc5b8d0e95d

Best regards,
-- 
Mark Brown <broonie@kernel.org>


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
