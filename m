Return-Path: <SRS0=XnSr=ON=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8221EC433EF
	for <linux-snps-arc@archiver.kernel.org>; Thu, 23 Sep 2021 07:44:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46EFE61107
	for <linux-snps-arc@archiver.kernel.org>; Thu, 23 Sep 2021 07:44:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 46EFE61107
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+BpNBO0mD2SPqxEbg1ra57/g+v4IasOeowH0wgN6YFg=; b=EIUBSCvNzjta0H
	McJqcOitfA4S0gjf3LGn1umkckjszJ/eAqbTzd5XNMYEKai/5CBWTmGTj6+c1ZfuzXQ2OKr2NPzDD
	/jMNlCw0D8f1M7OHgNfKG43u2V0+vOlseyCWu2Uf9IQhiK2nES9aewWjODqCplNf2/k4pG1ivvAlC
	vNYiV7MVfrIChNW3mHhSj/ENHEwx7tNbbewlXSvo4uckMORFZM384v9h27zlfnFUkpByqUBp8lCF9
	EI/bFACdvkBEZJnd69kTfNlopyjrjebxSfIVEfhQNKNdAaaFeG5w0V79Ah79N+U3YYZ2u/wSPjBvM
	bLDT4JjdBoB6B7lx+nUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTJOi-00AXfN-Oe; Thu, 23 Sep 2021 07:44:00 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTJOU-00AXb0-4R; Thu, 23 Sep 2021 07:43:47 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3D07E60EC0;
 Thu, 23 Sep 2021 07:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632383025;
 bh=3uVNPtFfbPBZRQaNfQKwTwtev9YVKUZqny4BWnp3ztY=;
 h=From:To:Cc:Subject:Date:From;
 b=Vold8Z9hLOut5Y57D9YqGfAPpL4eeU2GGKe6N2/G2K+rSChme5BK2bVJUGQMhNnD5
 tlc7pIoxBTA8mtBmkSbcvxOA4ol2fbYKLvd84RUIoei3PfOrgW7d8UvcqmHNvAAnqH
 2rTOLkAFW6DycEheiJuAByIZSW1Mb0ht/+wW3EsUTQK66rudMrHlsuHTSWtaF9pCtZ
 zz2eXREGQLaTYVqwKNRZd1xLM2W36l4O1x9wg+UbZ8351+5wCVj9XzBQPxb3HkA2G0
 kjff1rDe9w+gBCM2bpBWj7skIwT6XMoMhVQl3RcYgUgyL/ulxZSnczTeB3j1RHlvfS
 d5Zxibdoq1rzA==
From: Mike Rapoport <rppt@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, devicetree@vger.kernel.org,
 iommu@lists.linux-foundation.org, kasan-dev@googlegroups.com,
 kvm@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org,
 linux-usb@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org,
 Mike Rapoport <rppt@linux.ibm.com>
Subject: [PATCH 0/3] memblock: cleanup memblock_free interface
Date: Thu, 23 Sep 2021 10:43:32 +0300
Message-Id: <20210923074335.12583-1-rppt@kernel.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210923_004346_255323_23346F6E 
X-CRM114-Status: GOOD (  10.98  )
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

From: Mike Rapoport <rppt@linux.ibm.com>

Hi,

Following the discussion on [1] this is the fix for memblock freeing APIs
mismatch. 

The first patch is a cleanup of numa_distance allocation in arch_numa I've
spotted during the conversion.
The second patch is a fix for Xen memory freeing on some of the error
paths.

The core change is in the third patch that makes memblock_free() a
counterpart of memblock_alloc() and adds memblock_phys_alloc() to be a
counterpart of memblock_phys_alloc().

Since scripts/get_maintainer.pl returned more than 100 addresses I've
trimmed the distribution list only to the relevant lists.

[1] https://lore.kernel.org/all/CAHk-=wj9k4LZTz+svCxLYs5Y1=+yKrbAUArH1+ghyG3OLd8VVg@mail.gmail.com

Mike Rapoport (3):
  arch_numa: simplify numa_distance allocation
  xen/x86: free_p2m_page: use memblock_free_ptr() to free a virtual pointer
  memblock: cleanup memblock_free interface

 arch/alpha/kernel/core_irongate.c         |  2 +-
 arch/arc/mm/init.c                        |  2 +-
 arch/arm/mach-hisi/platmcpm.c             |  2 +-
 arch/arm/mm/init.c                        |  2 +-
 arch/arm64/mm/mmu.c                       |  4 ++--
 arch/mips/mm/init.c                       |  2 +-
 arch/mips/sgi-ip30/ip30-setup.c           |  6 +++---
 arch/powerpc/kernel/dt_cpu_ftrs.c         |  2 +-
 arch/powerpc/kernel/paca.c                |  4 ++--
 arch/powerpc/kernel/setup-common.c        |  2 +-
 arch/powerpc/kernel/setup_64.c            |  2 +-
 arch/powerpc/platforms/powernv/pci-ioda.c |  2 +-
 arch/powerpc/platforms/pseries/svm.c      |  4 +---
 arch/riscv/kernel/setup.c                 |  4 ++--
 arch/s390/kernel/setup.c                  |  8 ++++----
 arch/s390/kernel/smp.c                    |  4 ++--
 arch/s390/kernel/uv.c                     |  2 +-
 arch/s390/mm/kasan_init.c                 |  2 +-
 arch/sh/boards/mach-ap325rxa/setup.c      |  2 +-
 arch/sh/boards/mach-ecovec24/setup.c      |  4 ++--
 arch/sh/boards/mach-kfr2r09/setup.c       |  2 +-
 arch/sh/boards/mach-migor/setup.c         |  2 +-
 arch/sh/boards/mach-se/7724/setup.c       |  4 ++--
 arch/sparc/kernel/smp_64.c                |  2 +-
 arch/um/kernel/mem.c                      |  2 +-
 arch/x86/kernel/setup.c                   |  4 ++--
 arch/x86/kernel/setup_percpu.c            |  2 +-
 arch/x86/mm/init.c                        |  2 +-
 arch/x86/mm/kasan_init_64.c               |  4 ++--
 arch/x86/mm/numa.c                        |  2 +-
 arch/x86/mm/numa_emulation.c              |  2 +-
 arch/x86/xen/mmu_pv.c                     |  6 +++---
 arch/x86/xen/p2m.c                        |  2 +-
 arch/x86/xen/setup.c                      |  6 +++---
 drivers/base/arch_numa.c                  | 10 ++++------
 drivers/firmware/efi/memmap.c             |  2 +-
 drivers/macintosh/smu.c                   |  2 +-
 drivers/of/kexec.c                        |  2 +-
 drivers/of/of_reserved_mem.c              |  4 ++--
 drivers/s390/char/sclp_early.c            |  2 +-
 drivers/usb/early/xhci-dbc.c              | 10 +++++-----
 drivers/xen/swiotlb-xen.c                 |  2 +-
 include/linux/memblock.h                  | 16 ++--------------
 init/initramfs.c                          |  2 +-
 init/main.c                               |  2 +-
 kernel/dma/swiotlb.c                      |  2 +-
 kernel/printk/printk.c                    |  4 ++--
 lib/bootconfig.c                          |  2 +-
 lib/cpumask.c                             |  2 +-
 mm/cma.c                                  |  2 +-
 mm/memblock.c                             | 20 ++++++++++----------
 mm/memory_hotplug.c                       |  2 +-
 mm/percpu.c                               |  8 ++++----
 mm/sparse.c                               |  2 +-
 tools/bootconfig/include/linux/memblock.h |  2 +-
 55 files changed, 94 insertions(+), 110 deletions(-)


base-commit: e4e737bb5c170df6135a127739a9e6148ee3da82
-- 
2.28.0


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
