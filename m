Return-Path: <SRS0=Sn49=6R=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C5AFC3A5A9
	for <linux-snps-arc@archiver.kernel.org>; Sun,  3 May 2020 03:11:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E29B2098B
	for <linux-snps-arc@archiver.kernel.org>; Sun,  3 May 2020 03:11:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="F9hwmoY6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E29B2098B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wXiVfPy7T2Ry7svz+JX4Kp0CI/5GGmRaDKXvP+h3duM=; b=F9hwmoY6ozOmT/
	DYE3HkxmzjUcjDQPC3jCmaIi1jeS6fSP0ASF8aIwrXMfjUyGIGG9u9+uqahaOPtSOVqkTehsfL5ny
	HLpExcEnGxJkClJcclxeS6dAe0bdXeORYO5Sj2buqd6DPz6TM6YPq/cVNOHg5k2M1sJ8NVC2FUkj7
	BgA/UurBCghl8FZREM1mYwKzGrTmxDS1GkFtBINCKLMtiTpFEn+mGm86REiFQbmdVykexgYUMu9Hk
	N/6DXp/ouZEsZqid/URsi2iKJTd4BD8BXFdTC8z+r8SZIm5fYyHoQ4rdJnQqzB/3KwgvzvbxhK/at
	POcPyCwNFi3Ck5rE+SlA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jV52b-0007Mh-0i; Sun, 03 May 2020 03:11:41 +0000
Received: from mga04.intel.com ([192.55.52.120])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jV52V-0007Do-8f; Sun, 03 May 2020 03:11:36 +0000
IronPort-SDR: EJCt76eWZ5nPKHX/2krFIouUdX3O7LR7d1hthLJTYZGFngCRkMjrOrVCvgc7a1q4jkJVtHZSf6
 HBVZ29ScU2zA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2020 20:11:29 -0700
IronPort-SDR: BDCSOhfLrIbfj7Y5Tw0emibzPffaFEcH6uyQOaSnsa+CYyRQvgFcoRzXLtMv2aSaIMshzi3s7v
 wmHP1NS0G8+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,346,1583222400"; d="scan'208";a="262468221"
Received: from iweiny-desk2.sc.intel.com ([10.3.52.147])
 by orsmga006.jf.intel.com with ESMTP; 02 May 2020 20:11:28 -0700
Date: Sat, 2 May 2020 20:11:28 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH V1 09/10] arch/kmap: Define kmap_atomic_prot() for all
 arch's
Message-ID: <20200503031127.GA685597@iweiny-DESK2.sc.intel.com>
References: <20200430203845.582900-1-ira.weiny@intel.com>
 <20200430203845.582900-10-ira.weiny@intel.com>
 <20200501023734.GF23230@ZenIV.linux.org.uk>
 <20200501032020.GG23230@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200501032020.GG23230@ZenIV.linux.org.uk>
User-Agent: Mutt/1.11.1 (2018-12-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200502_201135_323574_92531046 
X-CRM114-Status: GOOD (  14.12  )
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

On Fri, May 01, 2020 at 04:20:20AM +0100, Al Viro wrote:
> On Fri, May 01, 2020 at 03:37:34AM +0100, Al Viro wrote:
> > On Thu, Apr 30, 2020 at 01:38:44PM -0700, ira.weiny@intel.com wrote:
> > 
> > > -static inline void *kmap_atomic(struct page *page)
> > > +static inline void *kmap_atomic_prot(struct page *page, pgprot_t prot)
> > >  {
> > >  	preempt_disable();
> > >  	pagefault_disable();
> > >  	if (!PageHighMem(page))
> > >  		return page_address(page);
> > > -	return kmap_atomic_high(page);
> > > +	return kmap_atomic_high_prot(page, prot);
> > >  }
> > > +#define kmap_atomic(page)	kmap_atomic_prot(page, kmap_prot)
> > 
> > OK, so it *was* just a bisect hazard - you return to original semantics
> > wrt preempt_disable()...
> 
> FWIW, how about doing the following: just before #5/10 have a patch
> that would touch only microblaze, ppc and x86 splitting their
> kmap_atomic_prot() into an inline helper + kmap_atomic_high_prot().
> Then your #5 would leave their kmap_atomic_prot() as-is (it would
> use kmap_atomic_prot_high() instead).  The rest of the series plays
> out pretty much the same way it does now, and wrappers on those
> 3 architectures would go away when an identical generic one is
> introduced in this commit (#9/10).
> 
> AFAICS, that would avoid the bisect hazard and might even end
> up with less noise in the patches...

This works.  V2 coming out shortly.

Thanks for catching this,
Ira


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
