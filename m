Return-Path: <SRS0=90H6=6V=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A2FDC47247
	for <linux-snps-arc@archiver.kernel.org>; Thu,  7 May 2020 15:01:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A24D20857
	for <linux-snps-arc@archiver.kernel.org>; Thu,  7 May 2020 15:01:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fo69IM9m"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A24D20857
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Y6PlP7q2FY0SQUIhsuiEpPDqw+H4PmgyqGthSeNWmFo=; b=fo69IM9muWdADk
	6Os65xXk2PsI0r9cxslMe2GKJrtyXgEhb/WToo+2r2bO8uRLxvqMDrWIJrr1kxLRlHVvpWA4MYU9N
	2H4WutRquNzzrNtma+V0XOCmPyrhsMRvjOjfjn8nSQN6ipkxzvkdENiAGzzZh1NsiktWeBi+zu+IW
	fgbNUl7yr89fSJbzL6asYdbQUdz2MqtCSgNDOVI+HDsLO0wcUzGtXtp7MprSEUeVrDwUiQkNwDAwX
	H0n9jzsg6h14xWO4102i0EA63WFSri9Tu/AllcKkAgdUiALdRS+K18MDkzbsF/oXZ1X+Iy80j593B
	CiLmzELZutv38MZOgv9g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWi1x-0005q0-Ja; Thu, 07 May 2020 15:01:45 +0000
Received: from mga07.intel.com ([134.134.136.100])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWi0Q-0001vV-Eg; Thu, 07 May 2020 15:00:12 +0000
IronPort-SDR: mh18C036n+49qnrHMW2llMUvmmygcuKnl+4fWADi6JLq41PgVpFt96E1wldN/xM3cTGsqmZyGy
 vameG/Z3oSBA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2020 08:00:07 -0700
IronPort-SDR: b/s7ZWxVBNmG4J2I+k7yxw4bkhrO5iMaLGMsoiM7CLNhxvnQQ99q0hnTaoBLVOL1NGGxx8SlhW
 4VsFNQaNuTzg==
X-IronPort-AV: E=Sophos;i="5.73,364,1583222400"; d="scan'208";a="407664102"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2020 08:00:06 -0700
From: ira.weiny@intel.com
To: linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH V3 00/15] Remove duplicated kmap code
Date: Thu,  7 May 2020 07:59:48 -0700
Message-Id: <20200507150004.1423069-1-ira.weiny@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200507_080010_628573_2BCE73B4 
X-CRM114-Status: GOOD (  10.22  )
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
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Helge Deller <deller@gmx.de>, x86@kernel.org, linux-csky@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, Ingo Molnar <mingo@redhat.com>,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 Borislav Petkov <bp@alien8.de>, Al Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 linux-mips@vger.kernel.org, Christian Koenig <christian.koenig@amd.com>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

From: Ira Weiny <ira.weiny@intel.com>

The kmap infrastructure has been copied almost verbatim to every architecture.
This series consolidates obvious duplicated code by defining core functions
which call into the architectures only when needed.

Some of the k[un]map_atomic() implementations have some similarities but the
similarities were not sufficient to warrant further changes.

In addition we remove a duplicate implementation of kmap() in DRM.

Testing was done by 0day to cover all the architectures I can't readily
build/test.

---
Changes from V2:
	Collect review/acks
	Add kmap_prot consolidation patch from Christoph
	Add 3 suggested patches from Al Viro
	Fix include for microblaze
	Fix static inline for microblaze

Changes from V1:
	Fix bisect-ability
	Update commit message and fix line lengths
	Remove unneded kunmap_atomic_high() declarations
	Remove unneded kmap_atomic_high() declarations
	collect reviews
	rebase to 5.7-rc4

Changes from V0:
	Define kmap_flush_tlb() and make kmap() truely arch independent.
	Redefine the k[un]map_atomic_* code to call into the architectures for
		high mem pages
	Ensure all architectures define kmap_prot, use it appropriately, and
		define kmap_atomic_prot()
	Remove drm implementation of kmap_atomic()


Ira Weiny (15):
  arch/kmap: Remove BUG_ON()
  arch/xtensa: Move kmap build bug out of the way
  arch/kmap: Remove redundant arch specific kmaps
  arch/kunmap: Remove duplicate kunmap implementations
  {x86,powerpc,microblaze}/kmap: Move preempt disable
  arch/kmap_atomic: Consolidate duplicate code
  arch/kunmap_atomic: Consolidate duplicate code
  arch/kmap: Ensure kmap_prot visibility
  arch/kmap: Don't hard code kmap_prot values
  arch/kmap: Define kmap_atomic_prot() for all arch's
  drm: Remove drm specific kmap_atomic code
  kmap: Remove kmap_atomic_to_page()
  parisc/kmap: Remove duplicate kmap code
  sparc: Remove unnecessary includes
  kmap: Consolidate kmap_prot definitions

 arch/arc/include/asm/highmem.h        | 18 -------
 arch/arc/mm/highmem.c                 | 28 ++--------
 arch/arm/include/asm/highmem.h        |  9 ----
 arch/arm/mm/highmem.c                 | 35 ++-----------
 arch/csky/include/asm/highmem.h       | 12 +----
 arch/csky/mm/highmem.c                | 56 ++++----------------
 arch/microblaze/include/asm/highmem.h | 27 ----------
 arch/microblaze/mm/highmem.c          | 16 ++----
 arch/microblaze/mm/init.c             |  3 --
 arch/mips/include/asm/highmem.h       | 11 +---
 arch/mips/mm/cache.c                  |  6 +--
 arch/mips/mm/highmem.c                | 49 +++---------------
 arch/nds32/include/asm/highmem.h      |  9 ----
 arch/nds32/mm/highmem.c               | 39 ++------------
 arch/parisc/include/asm/cacheflush.h  | 30 +----------
 arch/powerpc/include/asm/highmem.h    | 28 ----------
 arch/powerpc/mm/highmem.c             | 21 ++------
 arch/powerpc/mm/mem.c                 |  3 --
 arch/sparc/include/asm/highmem.h      | 25 +--------
 arch/sparc/mm/highmem.c               | 20 ++------
 arch/sparc/mm/io-unit.c               |  1 -
 arch/sparc/mm/iommu.c                 |  1 -
 arch/x86/include/asm/fixmap.h         |  1 -
 arch/x86/include/asm/highmem.h        |  9 ----
 arch/x86/mm/highmem_32.c              | 50 ++----------------
 arch/xtensa/include/asm/highmem.h     | 27 ----------
 arch/xtensa/mm/highmem.c              | 22 ++++----
 drivers/gpu/drm/ttm/ttm_bo_util.c     | 56 ++------------------
 drivers/gpu/drm/vmwgfx/vmwgfx_blit.c  | 16 +++---
 include/drm/ttm/ttm_bo_api.h          |  4 --
 include/linux/highmem.h               | 74 ++++++++++++++++++++++++---
 31 files changed, 150 insertions(+), 556 deletions(-)

-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
