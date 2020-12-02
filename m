Return-Path: <SRS0=Gk/u=FG=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DF13C71155
	for <linux-snps-arc@archiver.kernel.org>; Wed,  2 Dec 2020 08:47:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F647221FB
	for <linux-snps-arc@archiver.kernel.org>; Wed,  2 Dec 2020 08:47:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F647221FB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3mDPAqZxGSo7R5V4haOXyoM+gDhY15ZBGLZJuVe94+E=; b=xQVAFXAT2M6NCo+1c7Ot/5OX8
	A4dtEC7b6rEHxWDJl9jNLcre5vutfr4BrAtZhFWo5N0ND/2iMuARYg3xqUfcLkXX1hZx6Lo1uC5Xx
	yRm/jgvMuFNx3+S4aTRc4A0hdILlOVMa6CE4SLLy9gJNvhqNzSOjIhV5FWiYnaMBWL7JBh6SAELBA
	dRTYoraodOQeMDbipagVbKkBL2hKfFouI4NNgoEKYjq9gdnsDnbvmF86Nlk2Y6lo/u8KfqUvdIQCI
	oBxFTHi/J4csIMApFiX9CYf8UgU9bi7rZ/lM70mtqQ9zg0tIOZT7hk9pFhJRfUolMiVm716Yx7SiL
	E/9hMwdRw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkNnm-0005FK-Jf; Wed, 02 Dec 2020 08:47:54 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkNnk-0005ET-NV; Wed, 02 Dec 2020 08:47:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=CVfOdWh+yCP6h1F0F6Of76KYCDkJveNNCxoXWjniDQ8=; b=e7DptqrforPKS+KzFh7cyuGU1W
 2FiwYJVlbozwB6UUNloOzV4jlkH4tBq0v/zasHMMZ/BQBM5hNHZK+rxCh+01H4IR7rlyVso0AUGRq
 NkJuYXEV+Ol+tq8ukVcBghP1zDn1ibZlgeLhsJcGh0YJMLZF2QKe4SkagSTnbMvnBppCmcvYx36gQ
 WMRZZFAVGP0lIG6UcbLOy2i7py227429EA7sw6NBgYucoytYH9gZt/4XjOSzwoz0jtTN9Jp0I9MXA
 ne6yiO2hY1o06RlxADSY3TIq+ENmblMwUXvD9+QC8tqYCND3c6jza/N1jKC6jC7v7Suo+rFGxS8+F
 J+ImQ3ww==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1kkNni-0007Rp-PY; Wed, 02 Dec 2020 08:47:50 +0000
Date: Wed, 2 Dec 2020 08:47:50 +0000
From: Christoph Hellwig <hch@infradead.org>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH v2 00/13] arch, mm: deprecate DISCONTIGMEM
Message-ID: <20201202084750.GA28341@infradead.org>
References: <a7d01146-77f9-d363-af99-af3aee3789b4@physik.fu-berlin.de>
 <20201201102901.GF557259@kernel.org>
 <e3d5d791-8e4f-afcc-944c-24f66f329bd7@physik.fu-berlin.de>
 <20201201121033.GG557259@kernel.org>
 <49a2022c-f106-55ec-9390-41307a056517@physik.fu-berlin.de>
 <20201201135623.GA751215@kernel.org>
 <59351dbb-96cc-93b2-f2ec-b8968e935845@kernel.dk>
 <CAMuHMdWRc8W7U0LKyH9u1hdMuN515PCZiTEJ12FrDaCx-eTdaQ@mail.gmail.com>
 <20201202084326.GA26573@infradead.org>
 <20201202084628.GE751215@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201202084628.GE751215@kernel.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Linux MM <linux-mm@kvack.org>,
 Will Deacon <will@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>,
 Jonathan Corbet <corbet@lwn.net>, Meelis Roos <mroos@linux.ee>,
 Russell King <linux@armlinux.org.uk>, Mike Rapoport <rppt@linux.ibm.com>,
 Christoph Hellwig <hch@infradead.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Matt Turner <mattst88@gmail.com>,
 arcml <linux-snps-arc@lists.infradead.org>,
 Alexey Dobriyan <adobriyan@gmail.com>, Michael Schmitz <schmitzmic@gmail.com>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, Jens Axboe <axboe@kernel.dk>,
 Tony Luck <tony.luck@intel.com>, Vineet Gupta <vgupta@synopsys.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 alpha <linux-alpha@vger.kernel.org>,
 Linux FS Devel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Wed, Dec 02, 2020 at 10:46:28AM +0200, Mike Rapoport wrote:
> On Wed, Dec 02, 2020 at 08:43:26AM +0000, Christoph Hellwig wrote:
> > On Tue, Dec 01, 2020 at 04:33:01PM +0100, Geert Uytterhoeven wrote:
> > > > That's a lot of typos in that patch... I wonder why the buildbot hasn't
> > > > complained about this. Thanks for fixing this up! I'm going to fold this
> > > > into the original to avoid the breakage.
> > > 
> > > Does lkp@intel.com do ia64 builds? Yes, it builds zx1_defconfig.
> > 
> > I've never got results.  Which is annoying, as debian doesn't ship an
> > ia64 cross toolchain either, and I can't find any pre-built one that
> > works for me.
> 
> Arnd publishes a bunch of cross compilers here:
> 
> https://mirrors.edge.kernel.org/pub/tools/crosstool/

This is my source for those architectures where debian doesn't ship
cross compilers.  I'm stuck with mostly gcc 7/8 so I'm glad to see there
have been some major updates.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
