Return-Path: <SRS0=AMLI=7E=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F3EEC433E0
	for <linux-snps-arc@archiver.kernel.org>; Fri, 22 May 2020 01:36:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4AB392078B
	for <linux-snps-arc@archiver.kernel.org>; Fri, 22 May 2020 01:36:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RPcH0/sM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4AB392078B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4i8U/FQw0lCUtazljjWkNzxptQR6Nvqvkj+r1oEbV4E=; b=RPcH0/sMwJTPVx
	ZNkhxT7fcGXf8kOkQwwNIHXbziDWDyKzJtSuLcX3X4uSzuf1XXFweexzDtfqajptkIS98OGqbRZZh
	dOq23mqpNUZvN8H9kQCi2dJukc10xZOpW0q694zarPjW/OwXkJR35VrUjNEJs8fOJawuC21D0jsO+
	8lQSR99qUQl+zBtVDivmIu1jK+8w+tnYjLf0p+SBcNwk9CAYuAH1p9ssW8Koc3Rfo2NmQHwzSqAUg
	oBbsiofqfDD/QeC9LeDNTuiRoVfbfkvPlHkTT6EIlfn6n8WpoTLsfuSyBMMgDoDoYpydNxsyx2kuO
	dITFzG+zccoVvNWrDI4Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbwba-0001yL-8H; Fri, 22 May 2020 01:36:11 +0000
Received: from [2002:c35c:fd02::1] (helo=ZenIV.linux.org.uk)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbwbR-0001nx-2f; Fri, 22 May 2020 01:36:02 +0000
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.93 #3 (Red Hat
 Linux)) id 1jbwap-00DFUw-Lr; Fri, 22 May 2020 01:35:23 +0000
Date: Fri, 22 May 2020 02:35:23 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] arch/{mips,sparc,microblaze,powerpc}: Don't enable
 pagefault/preempt twice
Message-ID: <20200522013523.GO23230@ZenIV.linux.org.uk>
References: <20200507150004.1423069-8-ira.weiny@intel.com>
 <20200518184843.3029640-1-ira.weiny@intel.com>
 <20200519165422.GA5838@roeck-us.net>
 <20200521172704.GF23230@ZenIV.linux.org.uk>
 <bdc8dc64-622c-3b0d-1ae1-48222cf34358@roeck-us.net>
 <20200521224612.GJ23230@ZenIV.linux.org.uk>
 <20200522004618.GA3151350@ZenIV.linux.org.uk>
 <970857bd-bb56-7b2e-833e-ca74a82fa9b5@roeck-us.net>
 <20200522012950.GN23230@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200522012950.GN23230@ZenIV.linux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200521_183601_142078_487A094D 
X-CRM114-Status: UNSURE (   8.14  )
X-CRM114-Notice: Please train this message.
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
 ira.weiny@intel.com, Dan Williams <dan.j.williams@intel.com>,
 Helge Deller <deller@gmx.de>, x86@kernel.org, linux-csky@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, Ingo Molnar <mingo@redhat.com>,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
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

On Fri, May 22, 2020 at 02:29:50AM +0100, Al Viro wrote:
> On Thu, May 21, 2020 at 06:11:08PM -0700, Guenter Roeck wrote:
> 
> > Mainline, with:
> > 
> > qemu-system-sparc -M SS-4 -kernel arch/sparc/boot/zImage -no-reboot \
> > 	-snapshot -drive file=rootfs.ext2,format=raw,if=scsi \
> > 	-append "panic=-1 slub_debug=FZPUA root=/dev/sda console=ttyS0"
> > 	-nographic -monitor none
> > 
> > The machine doesn't really matter, though.
> 
> It does, unfortunately - try that with SS-10 and watch what happens ;-/

Ugh...  It's actually something in -m handling: -m 256 passes, -m 512
leads to that panic.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
