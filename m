Return-Path: <SRS0=I7CJ=6U=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CF14C28CBC
	for <linux-snps-arc@archiver.kernel.org>; Wed,  6 May 2020 20:25:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 710442063A
	for <linux-snps-arc@archiver.kernel.org>; Wed,  6 May 2020 20:25:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="moH/I9gX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 710442063A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tujru4QWMHCkWUDVToK5S2SElBmVj13wuqPEZVt9EIw=; b=moH/I9gXruBTrG
	O01lCqqCHlWlfA1WZkfK/5NLkiuEIn43HOew7dxxOH+EkPi23/J4YiVd+ZxJK8a1qQgU72z43nJWe
	VGtf0UyxhWQVi5QkyvRVsw/1/6EA6EWZ3BejdpJWieXN6Iw3XHTu2Gac85Ve6FAwvUowHGQG35nxp
	ladrs6w4Yp96dGxelPfw7WnZt0zigUSpeoCD2KO38JKEjkLo/BEwuyeHo4E9kwIB+26Vgq2015k+3
	h5EkHiWB+QmKwgQF7usKWNM05+QEPHw7zLfv8Qy183qrJASUs+QRE55BwUPK5wz7nYZrVMEvg5Ofw
	Qd2DbLWvH3tP2i2WDvGg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWQbh-00056i-LY; Wed, 06 May 2020 20:25:29 +0000
Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWQbY-0004yO-Jj; Wed, 06 May 2020 20:25:21 +0000
IronPort-SDR: Hm3NO3ouWzZWPSakzKJ4flhSDgbyHFOXKHh9wOZ9zZT1O0uJ4HcHZyNJEkoAJoUm6+de1hhvPu
 CvPtxTiI7aJg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2020 13:25:15 -0700
IronPort-SDR: xSrhp4VCcSvP5bv2WtfYo6vFeSsnnsv3N44sSopWfpFOgIk9uc/zRJt3WrQM/g5MZyK9rPCoAV
 JVwDj2vxz4ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,360,1583222400"; d="scan'208";a="461881349"
Received: from iweiny-desk2.sc.intel.com ([10.3.52.147])
 by fmsmga006.fm.intel.com with ESMTP; 06 May 2020 13:25:14 -0700
Date: Wed, 6 May 2020 13:25:14 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH V2 05/11] {x86,powerpc,microblaze}/kmap: Move preempt
 disable
Message-ID: <20200506202514.GF1084880@iweiny-DESK2.sc.intel.com>
References: <20200504010912.982044-1-ira.weiny@intel.com>
 <20200504010912.982044-6-ira.weiny@intel.com>
 <20200506061113.GA5192@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200506061113.GA5192@infradead.org>
User-Agent: Mutt/1.11.1 (2018-12-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200506_132520_691903_F9649326 
X-CRM114-Status: GOOD (  18.55  )
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

On Tue, May 05, 2020 at 11:11:13PM -0700, Christoph Hellwig wrote:
> On Sun, May 03, 2020 at 06:09:06PM -0700, ira.weiny@intel.com wrote:
> > From: Ira Weiny <ira.weiny@intel.com>
> > 
> > During this kmap() conversion series we must maintain bisect-ability.
> > To do this, kmap_atomic_prot() in x86, powerpc, and microblaze need to
> > remain functional.
> > 
> > Create a temporary inline version of kmap_atomic_prot within these
> > architectures so we can rework their kmap_atomic() calls and then lift
> > kmap_atomic_prot() to the core.
> > 
> > Signed-off-by: Ira Weiny <ira.weiny@intel.com>
> > 
> > ---
> > Changes from V1:
> > 	New patch
> > ---
> >  arch/microblaze/include/asm/highmem.h | 11 ++++++++++-
> >  arch/microblaze/mm/highmem.c          | 10 ++--------
> >  arch/powerpc/include/asm/highmem.h    | 11 ++++++++++-
> >  arch/powerpc/mm/highmem.c             |  9 ++-------
> >  arch/x86/include/asm/highmem.h        | 11 ++++++++++-
> >  arch/x86/mm/highmem_32.c              | 10 ++--------
> >  6 files changed, 36 insertions(+), 26 deletions(-)
> > 
> > diff --git a/arch/microblaze/include/asm/highmem.h b/arch/microblaze/include/asm/highmem.h
> > index 0c94046f2d58..ec9954b091e1 100644
> > --- a/arch/microblaze/include/asm/highmem.h
> > +++ b/arch/microblaze/include/asm/highmem.h
> > @@ -51,7 +51,16 @@ extern pte_t *pkmap_page_table;
> >  #define PKMAP_NR(virt)  ((virt - PKMAP_BASE) >> PAGE_SHIFT)
> >  #define PKMAP_ADDR(nr)  (PKMAP_BASE + ((nr) << PAGE_SHIFT))
> >  
> > -extern void *kmap_atomic_prot(struct page *page, pgprot_t prot);
> > +extern void *kmap_atomic_high_prot(struct page *page, pgprot_t prot);
> > +void *kmap_atomic_prot(struct page *page, pgprot_t prot)
> 
> Shouldn't this be marked inline?

Yes Thanks.  Done.

> 
> The rest looks fine:
> 
> Reviewed-by: Christoph Hellwig <hch@lst.de>

Thanks,
Ira


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
