Return-Path: <SRS0=I7CJ=6U=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F230CC28CBC
	for <linux-snps-arc@archiver.kernel.org>; Wed,  6 May 2020 20:34:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C13E320753
	for <linux-snps-arc@archiver.kernel.org>; Wed,  6 May 2020 20:34:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="n3f2AQbo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C13E320753
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/F4gWSU3ZWyUHh2e5A7OEYtEm9WECeoyuFFLM4boyV8=; b=n3f2AQbos2FzF1
	LDVTS+h3ZCB+7Rz0kCMFD2Y8P6Z5o2mEP7AGhXDwI+ghwLFaUgn2gaPXSC8CcW8rpyC75U3aCqfbL
	Zxy03/gdybHaXVyPE02wMzcLw29mL2TWWFnDQYn7fHqWEB8vHO1ixyquQmyXjGzRvZW3NffLju51B
	N80J15uqs5QHWLJJyl6WT+56/HyIV/WTmaLjtxFAJ4/XGgtm/k08OaeneS8/yib8pmUNhqSS7BjRF
	pK+dhPzDPgwgBZ2u7V9I6oDUazGGW8Ei5GWpNEVE76NCdNLOJGAlkaQmWZB9WO/SzvBc5KB2F+LuG
	9o9rQ/2gUxWHJbNbkDiA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWQjv-0000jG-NN; Wed, 06 May 2020 20:33:59 +0000
Received: from mga05.intel.com ([192.55.52.43])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWQjj-0000Zb-EJ; Wed, 06 May 2020 20:33:48 +0000
IronPort-SDR: xGs7hiTdXdSnk30Wiy03s/a3kZ7xwkBKprzg8Gw4knxpju13W7LuLWhOwRlNf/bfykfFgGzSyo
 KQQZq1UsxHPw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2020 13:33:46 -0700
IronPort-SDR: M/8biaEifOtf/KVemcKvoXhaN/dNTMq07DSDleAl9z1EKDvsLY2Gj1/J5kQQSyza0fRBg4vIeY
 Ynf/+fytsXZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,360,1583222400"; d="scan'208";a="435017008"
Received: from iweiny-desk2.sc.intel.com ([10.3.52.147])
 by orsmga005.jf.intel.com with ESMTP; 06 May 2020 13:33:40 -0700
Date: Wed, 6 May 2020 13:33:39 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH V2 08/11] arch/kmap: Ensure kmap_prot visibility
Message-ID: <20200506203339.GG1084880@iweiny-DESK2.sc.intel.com>
References: <20200504010912.982044-1-ira.weiny@intel.com>
 <20200504010912.982044-9-ira.weiny@intel.com>
 <20200506061326.GD5192@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200506061326.GD5192@infradead.org>
User-Agent: Mutt/1.11.1 (2018-12-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200506_133347_491355_C766BB82 
X-CRM114-Status: GOOD (  17.94  )
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

On Tue, May 05, 2020 at 11:13:26PM -0700, Christoph Hellwig wrote:
> On Sun, May 03, 2020 at 06:09:09PM -0700, ira.weiny@intel.com wrote:
> > From: Ira Weiny <ira.weiny@intel.com>
> > 
> > We want to support kmap_atomic_prot() on all architectures and it makes
> > sense to define kmap_atomic() to use the default kmap_prot.
> > 
> > So we ensure all arch's have a globally available kmap_prot either as a
> > define or exported symbol.
> 
> FYI, I still think a
> 
> #ifndef kmap_prot
> #define kmap_prot PAGE_KERNEL
> #endif
> 
> in linux/highmem.h would be nicer.  Then only xtensa and sparc need
> to override it and clearly stand out.

That would be nice...  But...  in this particular patch kmap_prot needs to be
in arch/microblaze/include/asm/highmem.h to preserve bisect-ability.

So there would be an inversion with this define and the core #ifndef...

I like the change but I'm going to add this change as a follow on patch because
at the end of the series microblaze no longer needs this.

If this is reasonable could I get a review on this patch to add to the next
series?

Ira


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
