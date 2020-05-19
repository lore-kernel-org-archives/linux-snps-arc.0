Return-Path: <SRS0=mq+M=7B=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF95FC433E0
	for <linux-snps-arc@archiver.kernel.org>; Tue, 19 May 2020 18:40:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9D35207D3
	for <linux-snps-arc@archiver.kernel.org>; Tue, 19 May 2020 18:40:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="k+xetx9X"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B9D35207D3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ty4LEh8nowAMu41hcutPAh32+YplNIlESwWJu/v9dtc=; b=k+xetx9XBViRa5
	siGLzBWGcvl6yA9h8fXNLsb6+2XgYnTF7r1p4+2ETWmVhbG1CaO0LaUfzP2wIzRVZPH7h1dwYZro0
	uY8f/LsJSIdBdXpK658P+cFvCUpw7Hu2JildiCv7HEL3SsMpXS+1OwC7by/6IF8cuMvvDo63Gbur4
	Gr3nKzstFZuu05hNVtJBLWYUMBo2zQkXPFSpjpKVEtDQQMQw6fSl/i8iV1e7rwtKvztguqjx24fGn
	hmymVnKZD/9IrIpsyN4KT8KUKxFVg/G3DJmu0KothXSLbindnWKBkg0Gzm3g/OFF9DA55DvRpGjOu
	Sx1xWv/QkNrh5AiShuFg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jb7AY-0008VA-Ga; Tue, 19 May 2020 18:40:50 +0000
Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jb7AI-0008EM-St; Tue, 19 May 2020 18:40:36 +0000
IronPort-SDR: as9sXKXcdzs2sUB85Wp5QkfnI1RPgjeU3+6nXzs/bqy5Qkk0eTYmyfz9Vw1D32B/276UKlgDe4
 zAhh6fB8Hp+w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2020 11:40:33 -0700
IronPort-SDR: D+jm1xpsdiPApGucH8RonxhW2osAHv0gYp6yWvUx7peRxHsoQ0vFEHwV7Czh/gp76Png2rfKJj
 4SSgNhc/QOEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,410,1583222400"; d="scan'208";a="264403264"
Received: from iweiny-desk2.sc.intel.com ([10.3.52.147])
 by orsmga003.jf.intel.com with ESMTP; 19 May 2020 11:40:32 -0700
Date: Tue, 19 May 2020 11:40:32 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] arch/{mips,sparc,microblaze,powerpc}: Don't enable
 pagefault/preempt twice
Message-ID: <20200519184031.GB3356843@iweiny-DESK2.sc.intel.com>
References: <20200507150004.1423069-8-ira.weiny@intel.com>
 <20200518184843.3029640-1-ira.weiny@intel.com>
 <20200519165422.GA5838@roeck-us.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200519165422.GA5838@roeck-us.net>
User-Agent: Mutt/1.11.1 (2018-12-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200519_114034_954632_0FB07709 
X-CRM114-Status: GOOD (  15.42  )
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
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 Dan Williams <dan.j.williams@intel.com>, Helge Deller <deller@gmx.de>,
 x86@kernel.org, linux-csky@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 Ingo Molnar <mingo@redhat.com>, linux-snps-arc@lists.infradead.org,
 linux-xtensa@linux-xtensa.org, Borislav Petkov <bp@alien8.de>,
 Al Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Chris Zankel <chris@zankel.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Christian Koenig <christian.koenig@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Tue, May 19, 2020 at 09:54:22AM -0700, Guenter Roeck wrote:
> On Mon, May 18, 2020 at 11:48:43AM -0700, ira.weiny@intel.com wrote:
> > From: Ira Weiny <ira.weiny@intel.com>
> > 
> > The kunmap_atomic clean up failed to remove one set of pagefault/preempt
> > enables when vaddr is not in the fixmap.
> > 
> > Fixes: bee2128a09e6 ("arch/kunmap_atomic: consolidate duplicate code")
> > Signed-off-by: Ira Weiny <ira.weiny@intel.com>
> 
> microblazeel works with this patch,

Awesome...  Andrew in my rush yesterday I should have put a reported by on the
patch for Guenter as well.

Sorry about that Guenter,
Ira

> as do the nosmp sparc32 boot tests,
> but sparc32 boot tests with SMP enabled still fail with lots of messages
> such as:
> 
> BUG: Bad page state in process swapper/0  pfn:006a1
> page:f0933420 refcount:0 mapcount:1 mapping:(ptrval) index:0x1
> flags: 0x0()
> raw: 00000000 00000100 00000122 00000000 00000001 00000000 00000000 00000000
> page dumped because: nonzero mapcount
> Modules linked in:
> CPU: 0 PID: 1 Comm: swapper/0 Tainted: G    B             5.7.0-rc6-next-20200518-00002-gb178d2d56f29 #1
> [f00e7ab8 :
> bad_page+0xa8/0x108 ]
> [f00e8b54 :
> free_pcppages_bulk+0x154/0x52c ]
> [f00ea024 :
> free_unref_page+0x54/0x6c ]
> [f00ed864 :
> free_reserved_area+0x58/0xec ]
> [f0527104 :
> kernel_init+0x14/0x110 ]
> [f000b77c :
> ret_from_kernel_thread+0xc/0x38 ]
> [00000000 :
> 0x0 ]
> 
> Code path leading to that message is different but always the same
> from free_unref_page().
> 
> Still testing ppc images.
> 
> Guenter

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
