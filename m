Return-Path: <SRS0=ERPa=6P=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AF38C4724C
	for <linux-snps-arc@archiver.kernel.org>; Fri,  1 May 2020 15:36:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA84024953
	for <linux-snps-arc@archiver.kernel.org>; Fri,  1 May 2020 15:36:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pn/+OB1r"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA84024953
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3vSm+AuktW30C8ZxVAHA+vCsWtgSL7/ql9PKTVVRMgc=; b=pn/+OB1rlakq1g
	u7SmtPArLp7cBOg/51usTPK4P/deYTsxpT1mjHuFpT1gEw9Bvn+kCIdFIhHp5IjMiwjXSe9B4Kb/c
	c82tF5470WZgtKnvOcjNvORC/BIiAZjPqhN61YzIEWeVLfO2diZv565885omX06OXRkyEn/6RTDbo
	LkLB50rQo8Nwme+nyV+fpf+6n0Rju+XTA0PLph34oWs8Z3HYGxTpEB5XqdQKrPKzK+a6PJSa9IqK6
	XmSV6jSGOri9pNuJb4enLiqKG4XOwKnQu2TIx5gKldEGLOr44F42r++WNwZMsbJT6uMyMqDgjw4NW
	yd+OCGjPAsy0u/He9x5A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jUXhs-0006sc-Sf; Fri, 01 May 2020 15:36:04 +0000
Received: from mga07.intel.com ([134.134.136.100])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jUXhi-0006e9-4p; Fri, 01 May 2020 15:35:55 +0000
IronPort-SDR: yOd3a9LxZxyXr+FBnH7fP0+GBno2+UKwwNsJcMy7vKv0kGvNbuu8mTHYmuAZbyV7TkS2oQvTAI
 dQJnFSpcVY5w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2020 08:35:52 -0700
IronPort-SDR: eiOWyZIKI7vO19DR7OCFr64BqstCK2TpjbIFtfZ8MAqSSlMpCoVlOTcj7hUJ1GBJabMYzWffE+
 Y8JGzvryIPoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,339,1583222400"; d="scan'208";a="460295055"
Received: from iweiny-desk2.sc.intel.com ([10.3.52.147])
 by fmsmga006.fm.intel.com with ESMTP; 01 May 2020 08:35:52 -0700
Date: Fri, 1 May 2020 08:35:52 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: sparc-related comment, to Re: [PATCH V1 07/10] arch/kmap: Ensure
 kmap_prot visibility
Message-ID: <20200501153551.GA673107@iweiny-DESK2.sc.intel.com>
References: <20200430203845.582900-1-ira.weiny@intel.com>
 <20200430203845.582900-8-ira.weiny@intel.com>
 <20200501084446.GG27858@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200501084446.GG27858@infradead.org>
User-Agent: Mutt/1.11.1 (2018-12-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200501_083554_236639_EE4DBC54 
X-CRM114-Status: GOOD (  14.56  )
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
 linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Fri, May 01, 2020 at 01:44:46AM -0700, Christoph Hellwig wrote:
> > --- a/arch/sparc/mm/highmem.c
> > +++ b/arch/sparc/mm/highmem.c
> > @@ -33,6 +33,7 @@
> >  #include <asm/vaddrs.h>
> >  
> >  pgprot_t kmap_prot;
> > +EXPORT_SYMBOL(kmap_prot);
> 
> Btw, I don't see why sparc needs this as a variable, as there is just
> a single assignment to it.

Because sparc uses non-standard defines which I'm not familiar with.

        kmap_prot = __pgprot(SRMMU_ET_PTE | SRMMU_PRIV | SRMMU_CACHE);

SRMMU_ET_PTE and friends are defined in 

arch/sparc/include/asm/pgtsrmmu.h

Since I can't readily test sparc this was easier to put out than let 0-day
crank on the entire series checking if including that header in the common
header chain would be an issue.

> 
> If sparc is sorted out we can always make it a define, and use a define
> for kmap_prot that defaults to PAGE_KERNEL, avoiding a little
> more duplication.

Agreed.  But it seems easier as a follow up (for me with 0-day).  Perhaps
someone from sparc can weigh in on the specifics of those defines and why they
are different from the normal ones?  Or even provide a follow on patch?

Ira


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
