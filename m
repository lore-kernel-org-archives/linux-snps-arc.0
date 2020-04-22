Return-Path: <SRS0=lpWb=6G=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2B5AC55189
	for <linux-snps-arc@archiver.kernel.org>; Wed, 22 Apr 2020 01:52:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE3DE20722
	for <linux-snps-arc@archiver.kernel.org>; Wed, 22 Apr 2020 01:52:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Df1xDXjT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE3DE20722
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=A/7iKi4q5if7wJznAlc66qzxXSiKBc/inJQ+2KpN4eA=; b=Df1
	xDXjTYARseNGLg7pcHHWtoslCO8vzgq6GSjdC3kRUesuzwe55U2druVTyyOQ9lb53lPsYuKUV+JQr
	aksFLkxkJILmA9y935O4c2VEAaHn8YdawbZgDdBTvdXQ9aeXpzAvfarAEKTJYTLQxN6lGqq4bX21I
	GC4aCPm5henRs9s7zA4CB1cnkAZDDahX8DE9AoR3hJpH7Mo4T7AezzJih0TkNo7Uo5nIa5RZbd8zI
	yRJvP1pm0/hWsKV2inTDfMZGm1oQNdo6MPE90detw59gM2yssyMMzZfs03+Ghd7OwCKna1lFo9M6M
	zQO3ZMyuU6yShc453Rd1IsHiNflFl4w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jR4ZA-0002qT-AP; Wed, 22 Apr 2020 01:52:44 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jR4Z1-0002hX-Hk; Wed, 22 Apr 2020 01:52:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6C89C30E;
 Tue, 21 Apr 2020 18:52:32 -0700 (PDT)
Received: from p8cg001049571a15.arm.com (unknown [10.163.1.9])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EE92C3F73D;
 Tue, 21 Apr 2020 18:52:24 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org
Subject: [PATCH V2 0/2] mm/thp: Rename pmd_mknotpresent() as pmd_mkinvalid()
Date: Wed, 22 Apr 2020 07:22:04 +0530
Message-Id: <1587520326-10099-1-git-send-email-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200421_185235_632932_D5C87226 
X-CRM114-Status: GOOD (  10.13  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Cc: Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Will Deacon <will@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 Ingo Molnar <mingo@redhat.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linux-snps-arc@lists.infradead.org,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, nouveau@lists.freedesktop.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Vineet Gupta <vgupta@synopsys.com>, linux-mips@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

This series renames pmd_mknotpresent() as pmd_mkinvalid(). Before that it
drops an existing pmd_mknotpresent() definition from powerpc platform which
was never required as it defines it's pmdp_invalidate() through subscribing
__HAVE_ARCH_PMDP_INVALIDATE. This does not create any functional change.

This rename was suggested by Catalin during a previous discussion while we
were trying to change the THP helpers on arm64 platform for migration.

https://patchwork.kernel.org/patch/11019637/

This series is based on v5.7-rc2.

Boot tested on arm64 and x86 platforms.
Built tested on many other platforms including the ones changed here.

Changes in V2:

- Changed pmd_mknotvalid() as pmd_mkinvalid() per Will

Changes in V1: (https://patchwork.kernel.org/project/linux-mm/list/?series=259139)

Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Vineet Gupta <vgupta@synopsys.com>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Andy Lutomirski <luto@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: nouveau@lists.freedesktop.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-snps-arc@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mips@vger.kernel.org
Cc: x86@kernel.org
Cc: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org

Anshuman Khandual (2):
  powerpc/mm: Drop platform defined pmd_mknotpresent()
  mm/thp: Rename pmd_mknotpresent() as pmd_mkinvalid()

 arch/arc/include/asm/hugepage.h              | 2 +-
 arch/arm/include/asm/pgtable-3level.h        | 2 +-
 arch/arm64/include/asm/pgtable.h             | 2 +-
 arch/mips/include/asm/pgtable.h              | 2 +-
 arch/powerpc/include/asm/book3s/64/pgtable.h | 4 ----
 arch/x86/include/asm/pgtable.h               | 2 +-
 arch/x86/mm/kmmio.c                          | 2 +-
 mm/pgtable-generic.c                         | 2 +-
 8 files changed, 7 insertions(+), 11 deletions(-)

-- 
2.20.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
