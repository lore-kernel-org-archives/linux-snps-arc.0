Return-Path: <SRS0=KRsc=7R=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38298C433DF
	for <linux-snps-arc@archiver.kernel.org>; Thu,  4 Jun 2020 06:18:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0AB5220734
	for <linux-snps-arc@archiver.kernel.org>; Thu,  4 Jun 2020 06:18:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Qnmfq5JU";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="IXkqPQoO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0AB5220734
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ObHgwcZTIvPeGrwMk5uSU4zMLYOeZsWBjs5YH5gGzNY=; b=Qnmfq5JUnKh+SU
	TabyVF6VvQQ39WkcTnLZe8Ia0cBW2KIO9fbVP+yWzVRQr/rLjiFMdJLlJmnhRWDXWvb19gcn/HQMb
	aYNNQiUvqTn0New5ixRI/5jzoxXXnGcaB5y8/kTIMqA+gCC+5nF07HCG/yHhXQs3AYFvXeoyhnzVm
	gi7qeveklxEHLmLjw+mpUX3hSd5/kGWUC6+ma3AK7AzqDbl9WxCIs3CpbM/j8Y7oHqkUBKMIQkr+1
	zKXqhC7IW9C3hR2xusl/EOdjBrPI7RzTQRsyVZZXbhJEaLA5ZqyV72j2AwMa29edmHlTYVCqk4cj7
	ZEV82hmZZhLNrp67oMkA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jgjCy-0002DP-4E; Thu, 04 Jun 2020 06:18:32 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jgjCq-0001up-2l; Thu, 04 Jun 2020 06:18:25 +0000
Received: from kernel.org (unknown [87.71.78.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3E3962072E;
 Thu,  4 Jun 2020 06:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591251502;
 bh=b58Vy5SwtTbyRgwDB1JjnKDC7odtYPgt+t7MvV6fCOU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IXkqPQoOU3wscqIXXMWt/Y5TkOrwtwnMx8e1GDO3arwp37wF3YS5TWw1he9VyaSeS
 89Vf2ok0AEsO6njQmNORJH1sdCn3SOZLBx7rtKo7/9alOdMNqSdhDlvkldurNoZnBT
 iW2UzmfH4Spawe1NKyJhKCr9TIFG31X5xIMnk6Lw=
Date: Thu, 4 Jun 2020 09:18:05 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] arch/{mips,sparc,microblaze,powerpc}: Don't enable
 pagefault/preempt twice
Message-ID: <20200604061805.GA202650@kernel.org>
References: <20200518184843.3029640-1-ira.weiny@intel.com>
 <20200519165422.GA5838@roeck-us.net>
 <20200519184031.GB3356843@iweiny-DESK2.sc.intel.com>
 <20200519194215.GA71941@roeck-us.net>
 <20200520051315.GA3660833@iweiny-DESK2.sc.intel.com>
 <d86dba19-4f4b-061e-a2c7-4f037e9e2de2@roeck-us.net>
 <20200521174250.GB176262@iweiny-DESK2.sc.intel.com>
 <20200603135736.e7b5ded0082a81ae6d9067a0@linux-foundation.org>
 <20200603211416.GA1740285@iweiny-DESK2.sc.intel.com>
 <3538c8ad-674e-d310-d870-4ef6888092ed@roeck-us.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3538c8ad-674e-d310-d870-4ef6888092ed@roeck-us.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200603_231824_163039_28A39F0B 
X-CRM114-Status: GOOD (  19.13  )
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
 Ira Weiny <ira.weiny@intel.com>, Dan Williams <dan.j.williams@intel.com>,
 Helge Deller <deller@gmx.de>, x86@kernel.org, linux-csky@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, Ingo Molnar <mingo@redhat.com>,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
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

On Wed, Jun 03, 2020 at 04:44:17PM -0700, Guenter Roeck wrote:
> On 6/3/20 2:14 PM, Ira Weiny wrote:
> > On Wed, Jun 03, 2020 at 01:57:36PM -0700, Andrew Morton wrote:
> >> On Thu, 21 May 2020 10:42:50 -0700 Ira Weiny <ira.weiny@intel.com> wrote:
> >>
> >>>>>
> >>>>> Actually it occurs to me that the patch consolidating kmap_prot is odd for
> >>>>> sparc 32 bit...
> >>>>>
> >>>>> Its a long shot but could you try reverting this patch?
> >>>>>
> >>>>> 4ea7d2419e3f kmap: consolidate kmap_prot definitions
> >>>>>
> >>>>
> >>>> That is not easy to revert, unfortunately, due to several follow-up patches.
> >>>
> >>> I have gotten your sparc tests to run and they all pass...
> >>>
> >>> 08:10:34 > ../linux-build-test/rootfs/sparc/run-qemu-sparc.sh 
> >>> Build reference: v5.7-rc4-17-g852b6f2edc0f
> >>>
> >>> Building sparc32:SPARCClassic:nosmp:scsi:hd ... running ......... passed
> >>> Building sparc32:SPARCbook:nosmp:scsi:cd ... running ......... passed
> >>> Building sparc32:LX:nosmp:noapc:scsi:hd ... running ......... passed
> >>> Building sparc32:SS-4:nosmp:initrd ... running ......... passed
> >>> Building sparc32:SS-5:nosmp:scsi:hd ... running ......... passed
> >>> Building sparc32:SS-10:nosmp:scsi:cd ... running ......... passed
> >>> Building sparc32:SS-20:nosmp:scsi:hd ... running ......... passed
> >>> Building sparc32:SS-600MP:nosmp:scsi:hd ... running ......... passed
> >>> Building sparc32:Voyager:nosmp:noapc:scsi:hd ... running ......... passed
> >>> Building sparc32:SS-4:smp:scsi:hd ... running ......... passed
> >>> Building sparc32:SS-5:smp:scsi:cd ... running ......... passed
> >>> Building sparc32:SS-10:smp:scsi:hd ... running ......... passed
> >>> Building sparc32:SS-20:smp:scsi:hd ... running ......... passed
> >>> Building sparc32:SS-600MP:smp:scsi:hd ... running ......... passed
> >>> Building sparc32:Voyager:smp:noapc:scsi:hd ... running ......... passed
> >>>
> >>> Is there another test I need to run?
> >>
> >> This all petered out, but as I understand it, this patchset still might
> >> have issues on various architectures.
> >>
> >> Can folks please provide an update on the testing status?
> > 
> > I believe the tests were failing for Guenter due to another patch set...[1]
> > 
> > My tests with just this series are working.
> > 
> >>From my understanding the other failures were unrelated.[2]
> > 
> > 	<quote Mike Rapoport>
> > 	I've checked the patch above on top of the mmots which already has
> > 	Ira's patches and it booted fine. I've used sparc32_defconfig to build
> > 	the kernel and qemu-system-sparc with default machine and CPU.
> > 	</quote>
> > 
> > Mike, am I wrong?  Do you think the kmap() patches are still causing issues?

sparc32 UP and microblaze work for me with next-20200603, but I didn't
test other architectures. 
 
> For my part, all I can say is that -next is in pretty bad shape right now.
> The summary of my tests says:
> 
> Build results:
> 	total: 151 pass: 130 fail: 21
> Qemu test results:
> 	total: 430 pass: 375 fail: 55
> 
> sparc32 smp images in next-20200603 still crash for me with a spinlock
> recursion.

I think this is because Will's fixes [1] are not yet in -next.

> s390 images hang early in boot. Several others (alpha, arm64,
> various ppc) don't even compile. I can run some more bisects over time,
> but this is becoming a full-time job :-(.
> 
> Guenter

[1] https://lore.kernel.org/lkml/20200526173302.377-1-will@kernel.org
-- 
Sincerely yours,
Mike.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
