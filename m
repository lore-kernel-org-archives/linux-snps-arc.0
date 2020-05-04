Return-Path: <SRS0=eyJ8=6S=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A769C47254
	for <linux-snps-arc@archiver.kernel.org>; Mon,  4 May 2020 23:27:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D432020663
	for <linux-snps-arc@archiver.kernel.org>; Mon,  4 May 2020 23:27:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rizxSJOv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D432020663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YpPk8NJbFZy+oFU4IDhLyVdzMr7NG1xUURqkFuLeyQg=; b=rizxSJOvu/oqb3
	G1bFfjnm66SbIbcSgBSaPv4hDRzqQLUy5P2i2Q8CrDYrpb9UIz7UGceOpH0qbFqu7aIiC5vi6cS2n
	YPFz/78jBvIyl89avGy0Q1rpLgXbcD1FqWa39fPioGVGW7c2O3MBHoB3hVC9LGah0u8djzSYOX2hR
	aMBi6coSI/N8eHs4L/haNZ5ndM5OxtihSBWBFkIB+F106ah613RphkY0lzAWAO/yQp1iHbGEWGcO/
	NSL8B+pCWMUU9qo8L2OLDbYF7y7y6G3lpwpyj3tKFIID6SHFgeTrNmBX02PZoQAfn8x2vhqNQ8zc6
	8RiwAl62vaM/8vM65uKg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jVkUv-0001bb-Dy; Mon, 04 May 2020 23:27:41 +0000
Received: from mga07.intel.com ([134.134.136.100])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVkUj-0001N8-8U; Mon, 04 May 2020 23:27:30 +0000
IronPort-SDR: LopqpokmH3Qxk03blqBBG/JbJcN4nRitHvfGHb2cpQfvTJVLz2qTnt2mMWN5lAA9JZQc+AMSbq
 rWkyo6c3MN5g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2020 16:27:27 -0700
IronPort-SDR: FfmHJ+ZXo1f5ZQiiqbjWS0lOXVjHvUwnQi1XbTU0n32Bds1d2LVvsjbZwDRAuatgMzoWj4tKIj
 rnIe76RxdCiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,353,1583222400"; d="scan'208";a="248380428"
Received: from iweiny-desk2.sc.intel.com ([10.3.52.147])
 by orsmga007.jf.intel.com with ESMTP; 04 May 2020 16:27:26 -0700
Date: Mon, 4 May 2020 16:27:26 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH V2 00/11] Subject: Remove duplicated kmap code
Message-ID: <20200504232725.GA1084304@iweiny-DESK2.sc.intel.com>
References: <20200504010912.982044-1-ira.weiny@intel.com>
 <20200504013509.GU23230@ZenIV.linux.org.uk>
 <20200504050447.GA979899@iweiny-DESK2.sc.intel.com>
 <20200504053357.GV23230@ZenIV.linux.org.uk>
 <20200504201740.GA985739@iweiny-DESK2.sc.intel.com>
 <20200504210225.GW23230@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200504210225.GW23230@ZenIV.linux.org.uk>
User-Agent: Mutt/1.11.1 (2018-12-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200504_162729_348809_8C2C18D7 
X-CRM114-Status: GOOD (  15.95  )
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
 linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Huang Rui <ray.huang@amd.com>,
 Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>,
 sparclinux@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>,
 Helge Deller <deller@gmx.de>, x86@kernel.org, linux-csky@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, linux-snps-arc@lists.infradead.org,
 linux-xtensa@linux-xtensa.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Christian Koenig <christian.koenig@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Mon, May 04, 2020 at 10:02:25PM +0100, Al Viro wrote:
> On Mon, May 04, 2020 at 01:17:41PM -0700, Ira Weiny wrote:
> 
> > > || * arm: much, much worse.  We have several files that pull linux/highmem.h:
> > > || arch/arm/mm/cache-feroceon-l2.c, arch/arm/mm/cache-xsc3l2.c,
> > > || arch/arm/mm/copypage-*.c, arch/arm/mm/dma-mapping.c, arch/arm/mm/flush.c,
> > > || arch/arm/mm/highmem.c, arch/arm/probes/uprobes/core.c,
> > > || arch/arm/include/asm/kvm_mmu.h (kmap_atomic_pfn()).
> > > || Those are fine, but we also have this:
> > > || arch/arm/include/asm/pgtable.h:200:#define __pte_map(pmd)               (pte_t *)kmap_atomic(pmd_page(*(pmd)))
> > > || arch/arm/include/asm/pgtable.h:208:#define pte_offset_map(pmd,addr)     (__pte_map(pmd) + pte_index(addr))
> > > || and sure as hell, asm/pgtable.h does *NOT* pull linux/highmem.h.
> > 
> > It does not pull asm/highmem.h either...
> 
> No, but the users of those macros need to be considered.

Agreed, I was trying to point out that highmem.h was being pulled from
somewhere else prior to my series, sorry.

> 
> > > || #define pte_offset_map(dir, addr)               \
> > > ||         ((pte_t *) kmap_atomic(pmd_page(*(dir))) + pte_index(addr))
> > > ||         One pte_offset_map user in arch/microblaze:
> > > || arch/microblaze/kernel/signal.c:207:    ptep = pte_offset_map(pmdp, address);
> > > || Messy, but doesn't require any changes (we have asm/pgalloc.h included
> > > || there, and that pull linux/highmem.h).
> > 
> > AFAICS asm/pgtable.h does not include asm/highmem.h here...
> > 
> > So looks like arch/microblaze/kernel/signal.c will need linux/highmem.h
> 
> See above - line 39 in there is
> #include <asm/pgalloc.h>
> and line 14 in arch/microblaze/include/asm/pgalloc.h is
> #include <linux/highmem.h>
> It's conditional upon CONFIG_MMU in there, but so's the use of
> pte_offset_map() in arch/microblaze/kernel/signal.c 
> 
> So it shouldn't be a problem.

Ah ok, I did not see that one.  Ok I'll drop that change and this series should
be good.

I was setting up to submit another version with 3 more patches you have
suggested:

kmap: Remove kmap_atomic_to_page()
parisc/kmap: Remove duplicate kmap code
sparc: Remove unnecessary includes

Would you like to see those folded in?  I submitted 2 of the above as a
separate series already.

> 
> > > || * xtensa: users in arch/xtensa/kernel/pci-dma.c, arch/xtensa/mm/highmem.c,
> > > || arch/xtensa/mm/cache.c and arch/xtensa/platforms/iss/simdisk.c (all pull
> > > || linux/highmem.h).
> > 
> > Actually
> > 
> > arch/xtensa/mm/cache.c gets linux/highmem.h from linux/pagemap.h
> > 
> > arch/xtensa/platforms/iss/simdisk.c may have an issue?
> > 	linux/blkdev.h -> CONFIG_BLOCK -> linux/pagemap.h -> linux/highmem.h
> > 	But simdisk.c requires BLK_DEV_SIMDISK -> CONFIG_BLOCK...
> > 	<sigh>
> 
> Yep - see above re major chain of indirect includes conditional upon CONFIG_BLOCK
> and its uses in places that only build with such configs.  There's a plenty of
> similar considerations outside of arch/*, unfortunately...

Indeed.

FWIW the last 2 versions of this series have had no build failures with 0-day.

This series in particular just finished 164 configs without issue.

Would you like me to submit a new series?  With your additional patches?

Ira

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
