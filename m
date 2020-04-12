Return-Path: <SRS0=m+rD=54=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55E7BC2BB85
	for <linux-snps-arc@archiver.kernel.org>; Sun, 12 Apr 2020 19:49:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31745206E9
	for <linux-snps-arc@archiver.kernel.org>; Sun, 12 Apr 2020 19:49:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eb6nXgic";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="pzr405/s"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 31745206E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QB0ff6LEzuyBoODzhZxRrUo+0AffO0A9uAH87Q2tLQg=; b=eb6nXgicdi+7gh
	RoWQxiP7Sowq3D0bHddQlD8hNB/W/Iz6dQwQf9CYr7Fiwl8kr5+9X2ZWX0jq3c396kxRZVWps8Tgd
	Nd71CnA9Kx0vzI/eCETehseK/31Y4zEuYryZUC3GYCVSx89TqYprmgwLGelURDVVGiw5xI5ofK89C
	8rIPAnmtPwu/UgNVKa+buYE6wKcqPLid58jWyEF2AQ9bEWlAwNRaZu+6i5Fwo71m3bXvj2y9nCwQl
	k7gnClXBRfrN9Vv+oB558kDsYRbj3G2AVb6j8wr8Yw5SVqKjK9KuoxeCOGcoMTvW5vvppstQVvHf4
	SN/Ij+SjisiJEzcG+UrA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jNibk-0008W2-VM; Sun, 12 Apr 2020 19:49:32 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jNibg-0008UP-9H; Sun, 12 Apr 2020 19:49:29 +0000
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A6730206C3;
 Sun, 12 Apr 2020 19:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586720963;
 bh=OSu9vVJom8pttJXFBXq0V1ybKX1HhPDF+fLlz2wy5xI=;
 h=From:To:Cc:Subject:Date:From;
 b=pzr405/sWsHeV+I0WSYKIfQH3Iki5tkWQ3vSpkcy3jLFmiNnyI/eda0N2NUmgZtnR
 l3O2adzA1dSQtugzjfjHGGA3GsDeypmHf/4OrsS+cNbGt6rZeLXwX4/3PhxId9WiOU
 LPuYippu6RejjfEEtGLiXQy4TZZTaIgGGKFg4lLA=
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 00/21] mm: rework free_area_init*() funcitons
Date: Sun, 12 Apr 2020 22:48:38 +0300
Message-Id: <20200412194859.12663-1-rppt@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200412_124928_361601_A650F543 
X-CRM114-Status: GOOD (  13.57  )
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org,
 linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Michal Hocko <mhocko@kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>,
 linux-csky@vger.kernel.org, linux-parisc@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-riscv@lists.infradead.org, Mike Rapoport <rppt@linux.ibm.com>,
 Greg Ungerer <gerg@linux-m68k.org>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 Baoquan He <bhe@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-sh@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 Helge Deller <deller@gmx.de>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, Ley Foon Tan <ley.foon.tan@intel.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-arm-kernel@lists.infradead.org, Mark Salter <msalter@redhat.com>,
 Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org,
 uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 linux-alpha@vger.kernel.org, linux-um@lists.infradead.org,
 linux-m68k@lists.linux-m68k.org, Tony Luck <tony.luck@intel.com>,
 Greentime Hu <green.hu@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Stafford Horne <shorne@gmail.com>, Guan Xuetao <gxt@pku.edu.cn>,
 Hoan Tran <Hoan@os.amperecomputing.com>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Brian Cain <bcain@codeaurora.org>, Nick Hu <nickhu@andestech.com>,
 linux-mm@kvack.org, Vineet Gupta <vgupta@synopsys.com>,
 linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
 Richard Weinberger <richard@nod.at>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

From: Mike Rapoport <rppt@linux.ibm.com>

Hi,

After the discussion [1] about removal of CONFIG_NODES_SPAN_OTHER_NODES and
CONFIG_HAVE_MEMBLOCK_NODE_MAP options, I took it a bit further and updated
the node/zone initialization. 

Since all architectures have memblock, it is possible to use only the newer
version of free_area_init_node() that calculates the zone and node
boundaries based on memblock node mapping and architectural limits on
possible zone PFNs. 

The architectures that still determined zone and hole sizes can be switched
to the generic code and the old code that took those zone and hole sizes
can be simply removed.

And, since it all started from the removal of
CONFIG_NODES_SPAN_OTHER_NODES, the memmap_init() is now updated to iterate
over memblocks and so it does not need to perform early_pfn_to_nid() query
for every PFN.

--
Sincerely yours,
Mike.

[1] https://lore.kernel.org/lkml/1585420282-25630-1-git-send-email-Hoan@os.amperecomputing.com

Baoquan He (1):
  mm: memmap_init: iterate over memblock regions rather that check each PFN

Mike Rapoport (20):
  mm: memblock: replace dereferences of memblock_region.nid with API calls
  mm: make early_pfn_to_nid() and related defintions close to each other
  mm: remove CONFIG_HAVE_MEMBLOCK_NODE_MAP option
  mm: free_area_init: use maximal zone PFNs rather than zone sizes
  mm: use free_area_init() instead of free_area_init_nodes()
  alpha: simplify detection of memory zone boundaries
  arm: simplify detection of memory zone boundaries
  arm64: simplify detection of memory zone boundaries for UMA configs
  csky: simplify detection of memory zone boundaries
  m68k: mm: simplify detection of memory zone boundaries
  parisc: simplify detection of memory zone boundaries
  sparc32: simplify detection of memory zone boundaries
  unicore32: simplify detection of memory zone boundaries
  xtensa: simplify detection of memory zone boundaries
  mm: remove early_pfn_in_nid() and CONFIG_NODES_SPAN_OTHER_NODES
  mm: free_area_init: allow defining max_zone_pfn in descending order
  mm: rename free_area_init_node() to free_area_init_memoryless_node()
  mm: clean up free_area_init_node() and its helpers
  mm: simplify find_min_pfn_with_active_regions()
  docs/vm: update memory-models documentation

 .../vm/numa-memblock/arch-support.txt         |  34 ---
 Documentation/vm/memory-model.rst             |   9 +-
 arch/alpha/mm/init.c                          |  16 +-
 arch/alpha/mm/numa.c                          |  22 +-
 arch/arc/mm/init.c                            |  36 +--
 arch/arm/mm/init.c                            |  66 +----
 arch/arm64/Kconfig                            |   1 -
 arch/arm64/mm/init.c                          |  56 +---
 arch/arm64/mm/numa.c                          |   9 +-
 arch/c6x/mm/init.c                            |   8 +-
 arch/csky/kernel/setup.c                      |  26 +-
 arch/h8300/mm/init.c                          |   6 +-
 arch/hexagon/mm/init.c                        |   6 +-
 arch/ia64/Kconfig                             |   1 -
 arch/ia64/mm/contig.c                         |   2 +-
 arch/ia64/mm/discontig.c                      |   2 +-
 arch/m68k/mm/init.c                           |   6 +-
 arch/m68k/mm/mcfmmu.c                         |   9 +-
 arch/m68k/mm/motorola.c                       |  15 +-
 arch/m68k/mm/sun3mmu.c                        |  10 +-
 arch/microblaze/Kconfig                       |   1 -
 arch/microblaze/mm/init.c                     |   2 +-
 arch/mips/Kconfig                             |   1 -
 arch/mips/loongson64/numa.c                   |   2 +-
 arch/mips/mm/init.c                           |   2 +-
 arch/mips/sgi-ip27/ip27-memory.c              |   2 +-
 arch/nds32/mm/init.c                          |  11 +-
 arch/nios2/mm/init.c                          |   8 +-
 arch/openrisc/mm/init.c                       |   9 +-
 arch/parisc/mm/init.c                         |  22 +-
 arch/powerpc/Kconfig                          |  10 -
 arch/powerpc/mm/mem.c                         |   2 +-
 arch/riscv/Kconfig                            |   1 -
 arch/riscv/mm/init.c                          |   2 +-
 arch/s390/Kconfig                             |   1 -
 arch/s390/mm/init.c                           |   2 +-
 arch/sh/Kconfig                               |   1 -
 arch/sh/mm/init.c                             |   2 +-
 arch/sparc/Kconfig                            |  10 -
 arch/sparc/mm/init_64.c                       |   2 +-
 arch/sparc/mm/srmmu.c                         |  21 +-
 arch/um/kernel/mem.c                          |  12 +-
 arch/unicore32/include/asm/memory.h           |   2 +-
 arch/unicore32/include/mach/memory.h          |   6 +-
 arch/unicore32/kernel/pci.c                   |  14 +-
 arch/unicore32/mm/init.c                      |  43 +--
 arch/x86/Kconfig                              |  10 -
 arch/x86/mm/init.c                            |   2 +-
 arch/x86/mm/numa.c                            |  11 +-
 arch/xtensa/mm/init.c                         |   8 +-
 include/linux/memblock.h                      |   8 +-
 include/linux/mm.h                            |  30 +-
 include/linux/mmzone.h                        |  11 +-
 mm/Kconfig                                    |   3 -
 mm/memblock.c                                 |  19 +-
 mm/memory_hotplug.c                           |   4 -
 mm/page_alloc.c                               | 262 +++++++-----------
 57 files changed, 249 insertions(+), 650 deletions(-)
 delete mode 100644 Documentation/features/vm/numa-memblock/arch-support.txt

-- 
2.25.1


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
