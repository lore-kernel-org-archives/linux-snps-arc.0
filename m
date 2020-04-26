Return-Path: <SRS0=h8bZ=6K=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05665C2BA1A
	for <linux-snps-arc@archiver.kernel.org>; Sun, 26 Apr 2020 05:55:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7CF07206BF
	for <linux-snps-arc@archiver.kernel.org>; Sun, 26 Apr 2020 05:55:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BODjUiex"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7CF07206BF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=r9M6P646IB4cUWyCPS4lIK6Ce5AdF/rM1KwS2ccWd4A=; b=BODjUiexm6kvCN
	pmi6siXwW+OvfJWV38LuaFkcfB9MwgcRFWbUQbtToCJX1QO6WQM7nHyvzZeJidUTpT+PfnY04Zq08
	iTvJiEotXipUsqSNzB/SSwM8ft9Rgw+AfbwpBvPjCpjzVbRIYSuYn1PaTelR4movgsmwj2vymWIku
	+WMAq5VIGvRH4bxXTLdbG5f1iXpak9eUYjVxZIooVtjiBuOSea8xAPcrNMwCmjHHc/o7J8Gb7dAPm
	QDMcGwj58OF9FZ3PdKqEVYMwHXQojbcHoSU3FfDhOYtMiQqm7/CQ2NpJQqPIbK/udHhmGl4zkX79E
	pIFudTD7hwMoumCOZGTg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jSaGI-00073I-IJ; Sun, 26 Apr 2020 05:55:30 +0000
Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jSaFI-0003ra-0k; Sun, 26 Apr 2020 05:54:30 +0000
IronPort-SDR: wLzHAPwMFQfyRBghPP8C0WhGJRPcOohD5IkidTZVR9jntd4piSPmZ+M85/fQtnL+lSFqCXcjoF
 NQ1L2dBKjrLQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2020 22:54:21 -0700
IronPort-SDR: /cZ3umTa8B8PLh9tjA9EP3+bxl80qczghY2Si7yQnbojuyuxqol2zAYPUansPdHYwpezKRfg9s
 EcpTlSW8XTMQ==
X-IronPort-AV: E=Sophos;i="5.73,319,1583222400"; d="scan'208";a="281313737"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2020 22:54:20 -0700
From: ira.weiny@intel.com
To: linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 0/5] Remove duplicated kmap code
Date: Sat, 25 Apr 2020 22:54:01 -0700
Message-Id: <20200426055406.134198-1-ira.weiny@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200425_225428_104207_2F8CED01 
X-CRM114-Status: UNSURE (   8.82  )
X-CRM114-Notice: Please train this message.
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
 Dave Hansen <dave.hansen@linux.intel.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Helge Deller <deller@gmx.de>, x86@kernel.org, linux-csky@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, linux-snps-arc@lists.infradead.org,
 linux-xtensa@linux-xtensa.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

From: Ira Weiny <ira.weiny@intel.com>

The kmap infrastructure has been copied almost verbatim to every architecture.
This series consolidates obvious duplicated code.  (k[un]map_atmoic has some
additional duplication between some of the architectures but the differences
were such to not warrant further changes.)

0day built successfully to cover all the architectures I can't readily build.

Ira Weiny (5):
  arch/kmap: Remove BUG_ON()
  arch/kmap: Remove redundant arch specific kmaps
  arch/kunmap: Remove duplicate kunmap implementations
  arch/kmap_atomic: Consolidate duplicate code
  arch/kunmap_atomic: Consolidate duplicate code

 arch/arc/include/asm/highmem.h        | 11 -------
 arch/arc/mm/highmem.c                 | 20 ++-----------
 arch/arm/include/asm/highmem.h        |  3 --
 arch/arm/mm/highmem.c                 | 28 ++----------------
 arch/csky/include/asm/highmem.h       |  3 +-
 arch/csky/mm/highmem.c                | 28 ++++--------------
 arch/microblaze/include/asm/highmem.h | 17 -----------
 arch/microblaze/mm/highmem.c          | 10 ++-----
 arch/mips/include/asm/highmem.h       |  3 +-
 arch/mips/mm/highmem.c                | 25 +++-------------
 arch/nds32/include/asm/highmem.h      |  3 --
 arch/nds32/mm/highmem.c               | 31 ++------------------
 arch/parisc/include/asm/cacheflush.h  |  2 --
 arch/powerpc/include/asm/highmem.h    | 17 -----------
 arch/powerpc/mm/highmem.c             |  9 ++----
 arch/sparc/include/asm/highmem.h      | 17 -----------
 arch/sparc/mm/highmem.c               |  9 ++----
 arch/x86/include/asm/highmem.h        |  4 ---
 arch/x86/mm/highmem_32.c              | 30 ++------------------
 arch/xtensa/include/asm/highmem.h     | 14 +--------
 arch/xtensa/mm/highmem.c              | 10 ++-----
 include/linux/highmem.h               | 41 +++++++++++++++++++++++++--
 22 files changed, 75 insertions(+), 260 deletions(-)

-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
