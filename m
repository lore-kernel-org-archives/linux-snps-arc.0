Return-Path: <SRS0=KRsc=7R=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C608C433E0
	for <linux-snps-arc@archiver.kernel.org>; Thu,  4 Jun 2020 06:43:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5CE692074B
	for <linux-snps-arc@archiver.kernel.org>; Thu,  4 Jun 2020 06:43:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SoI5/M8H"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5CE692074B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vzVugoeReg8QeR4J0AYnS42CqgOkIUUpK1zYyFWIqW0=; b=SoI5/M8HhV2V1Z
	NGCNqbTiJoF6ykmo6AWQX/TFMWMWs9pWWDFd6DEW4V5TFsItOKnZag/II4SVJt+X7kp75fgNHiXVA
	EfVosyuqmJiJAu3VlIBZsp8K84UXoWPY/v10x/0A7/QOO9cl5EJXdI2Acm+jxxZsz1yVgEimRGFhq
	xwdXhfVIBJXe5jLefLi+AscHLLfMUGgJRdZ/JmQQuCtED9RnFymUXWYF0bT7stgLF+uPM2+uKyObu
	OGql4MH9V5RCy8gdM2ZVPxWkar/H/zBMQirZSvBkkOyGqmGvPypkQwhSUR+5Fgh22f9OS/2H6JldX
	5HoeD85F6Whpm/REs4dA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jgjbN-0000uM-G7; Thu, 04 Jun 2020 06:43:45 +0000
Received: from mga06.intel.com ([134.134.136.31])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jgjbG-0000lO-6e; Thu, 04 Jun 2020 06:43:39 +0000
IronPort-SDR: naTSPviCIMktP0PLfAGAN7hA9tgQjXt3Hnfe5gcSIj1XzN+VJQ8WSwXTPlDBrsrjHVcb0prxNu
 QntWYV2mON7w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2020 23:43:37 -0700
IronPort-SDR: qLkuqIEEQFEH1TV5HnSysQza63rrf1zfSA97eNVzKr6bXzJ9VY74YOzF3Wl+1ZUuQyJZwMvFxc
 fP2COJ1wBMoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,471,1583222400"; d="scan'208";a="304620121"
Received: from iweiny-desk2.sc.intel.com ([10.3.52.147])
 by fmsmga002.fm.intel.com with ESMTP; 03 Jun 2020 23:43:36 -0700
Date: Wed, 3 Jun 2020 23:43:36 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH] arch/{mips,sparc,microblaze,powerpc}: Don't enable
 pagefault/preempt twice
Message-ID: <20200604064336.GC1740285@iweiny-DESK2.sc.intel.com>
References: <20200519165422.GA5838@roeck-us.net>
 <20200519184031.GB3356843@iweiny-DESK2.sc.intel.com>
 <20200519194215.GA71941@roeck-us.net>
 <20200520051315.GA3660833@iweiny-DESK2.sc.intel.com>
 <d86dba19-4f4b-061e-a2c7-4f037e9e2de2@roeck-us.net>
 <20200521174250.GB176262@iweiny-DESK2.sc.intel.com>
 <20200603135736.e7b5ded0082a81ae6d9067a0@linux-foundation.org>
 <20200603211416.GA1740285@iweiny-DESK2.sc.intel.com>
 <3538c8ad-674e-d310-d870-4ef6888092ed@roeck-us.net>
 <20200604061805.GA202650@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200604061805.GA202650@kernel.org>
User-Agent: Mutt/1.11.1 (2018-12-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200603_234338_303287_C345D4EE 
X-CRM114-Status: GOOD (  23.54  )
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
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 Dan Williams <dan.j.williams@intel.com>, Helge Deller <deller@gmx.de>,
 x86@kernel.org, linux-csky@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 Ingo Molnar <mingo@redhat.com>, linux-snps-arc@lists.infradead.org,
 Guenter Roeck <linux@roeck-us.net>, linux-xtensa@linux-xtensa.org,
 Borislav Petkov <bp@alien8.de>, Al Viro <viro@zeniv.linux.org.uk>,
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

On Thu, Jun 04, 2020 at 09:18:05AM +0300, Mike Rapoport wrote:
> On Wed, Jun 03, 2020 at 04:44:17PM -0700, Guenter Roeck wrote:
> > On 6/3/20 2:14 PM, Ira Weiny wrote:
> > > On Wed, Jun 03, 2020 at 01:57:36PM -0700, Andrew Morton wrote:
> > >> On Thu, 21 May 2020 10:42:50 -0700 Ira Weiny <ira.weiny@intel.com> wrote:
> > >>
> > >>>>>
> > >>>>> Actually it occurs to me that the patch consolidating kmap_prot is odd for
> > >>>>> sparc 32 bit...
> > >>>>>
> > >>>>> Its a long shot but could you try reverting this patch?
> > >>>>>
> > >>>>> 4ea7d2419e3f kmap: consolidate kmap_prot definitions
> > >>>>>
> > >>>>
> > >>>> That is not easy to revert, unfortunately, due to several follow-up patches.
> > >>>
> > >>> I have gotten your sparc tests to run and they all pass...
> > >>>
> > >>> 08:10:34 > ../linux-build-test/rootfs/sparc/run-qemu-sparc.sh 
> > >>> Build reference: v5.7-rc4-17-g852b6f2edc0f
> > >>>
> > >>> Building sparc32:SPARCClassic:nosmp:scsi:hd ... running ......... passed
> > >>> Building sparc32:SPARCbook:nosmp:scsi:cd ... running ......... passed
> > >>> Building sparc32:LX:nosmp:noapc:scsi:hd ... running ......... passed
> > >>> Building sparc32:SS-4:nosmp:initrd ... running ......... passed
> > >>> Building sparc32:SS-5:nosmp:scsi:hd ... running ......... passed
> > >>> Building sparc32:SS-10:nosmp:scsi:cd ... running ......... passed
> > >>> Building sparc32:SS-20:nosmp:scsi:hd ... running ......... passed
> > >>> Building sparc32:SS-600MP:nosmp:scsi:hd ... running ......... passed
> > >>> Building sparc32:Voyager:nosmp:noapc:scsi:hd ... running ......... passed
> > >>> Building sparc32:SS-4:smp:scsi:hd ... running ......... passed
> > >>> Building sparc32:SS-5:smp:scsi:cd ... running ......... passed
> > >>> Building sparc32:SS-10:smp:scsi:hd ... running ......... passed
> > >>> Building sparc32:SS-20:smp:scsi:hd ... running ......... passed
> > >>> Building sparc32:SS-600MP:smp:scsi:hd ... running ......... passed
> > >>> Building sparc32:Voyager:smp:noapc:scsi:hd ... running ......... passed
> > >>>
> > >>> Is there another test I need to run?
> > >>
> > >> This all petered out, but as I understand it, this patchset still might
> > >> have issues on various architectures.
> > >>
> > >> Can folks please provide an update on the testing status?
> > > 
> > > I believe the tests were failing for Guenter due to another patch set...[1]
> > > 
> > > My tests with just this series are working.
> > > 
> > >>From my understanding the other failures were unrelated.[2]
> > > 
> > > 	<quote Mike Rapoport>
> > > 	I've checked the patch above on top of the mmots which already has
> > > 	Ira's patches and it booted fine. I've used sparc32_defconfig to build
> > > 	the kernel and qemu-system-sparc with default machine and CPU.
> > > 	</quote>
> > > 
> > > Mike, am I wrong?  Do you think the kmap() patches are still causing issues?
> 
> sparc32 UP and microblaze work for me with next-20200603, but I didn't
> test other architectures. 
>  
> > For my part, all I can say is that -next is in pretty bad shape right now.
> > The summary of my tests says:
> > 
> > Build results:
> > 	total: 151 pass: 130 fail: 21
> > Qemu test results:
> > 	total: 430 pass: 375 fail: 55
> > 
> > sparc32 smp images in next-20200603 still crash for me with a spinlock
> > recursion.
> 
> I think this is because Will's fixes [1] are not yet in -next.
> 
> > s390 images hang early in boot. Several others (alpha, arm64,
> > various ppc) don't even compile. I can run some more bisects over time,
> > but this is becoming a full-time job :-(.
> > 
> > Guenter
> 
> [1] https://lore.kernel.org/lkml/20200526173302.377-1-will@kernel.org

I abandoned the bisect and tested with this fix.[1]  It passes.  Guenter, on
the original thread we had microblaze and ppc working with my fix.

https://lore.kernel.org/lkml/20200519194215.GA71941@roeck-us.net/

Sounds like the current failures above are from something much newer in the
tree.

Ira

[1]
23:26:24 > /home/iweiny/dev/linux-build-test/rootfs/sparc/run-qemu-sparc.sh 
Build reference: next-20200603-3-gf5afe92a2135

Building sparc32:SPARCClassic:nosmp:scsi:hd ... running ......... passed
Building sparc32:SPARCbook:nosmp:scsi:cd ... running ......... passed
Building sparc32:LX:nosmp:noapc:scsi:hd ... running ......... passed
Building sparc32:SS-4:nosmp:initrd ... running ......... passed
Building sparc32:SS-5:nosmp:scsi:hd ... running ......... passed
Building sparc32:SS-10:nosmp:scsi:cd ... running ......... passed
Building sparc32:SS-20:nosmp:scsi:hd ... running ......... passed
Building sparc32:SS-600MP:nosmp:scsi:hd ... running ......... passed
Building sparc32:Voyager:nosmp:noapc:scsi:hd ... running ......... passed
Building sparc32:SS-4:smp:scsi:hd ... running ......... passed
Building sparc32:SS-5:smp:scsi:cd ... running ......... passed
Building sparc32:SS-10:smp:scsi:hd ... running ......... passed
Building sparc32:SS-20:smp:scsi:hd ... running ......... passed
Building sparc32:SS-600MP:smp:scsi:hd ... running ......... passed
Building sparc32:Voyager:smp:noapc:scsi:hd ... running ......... passed


> -- 
> Sincerely yours,
> Mike.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
