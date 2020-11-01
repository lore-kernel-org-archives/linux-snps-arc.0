Return-Path: <SRS0=uxeU=EH=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E475BC2D0A3
	for <linux-snps-arc@archiver.kernel.org>; Sun,  1 Nov 2020 16:55:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 840F22071E
	for <linux-snps-arc@archiver.kernel.org>; Sun,  1 Nov 2020 16:55:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UUufkZr8";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="A3apdqu3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 840F22071E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IdrDB5kx2ZSdwq3+LpKCEB+yDy+vL1ZLAcbgy58fKQI=; b=UUufkZr80k34EOM4vwb4rqkvR
	uvzDQRTo7Riq1F4cC4/+xqcLayr+7iivS+91dkyCqH2AX1AkygByGBDX1jePh3EVI14tYSfgVS9rx
	f/EWpkRL66RbRwidwYEZ8CYg3gKLBMj7wbuxf6sGCn/ArH+zj//2cmr3OBacIpI7Tt7sS1tDZWmrl
	CvUbKuJaMxQBmk4RRHtbip5Egg1jb20rXiM51dGs5R7mJ7vDDg60WY+OhWGzN8Y3SLCg7AIZHB7+x
	TQ+fbvxgJnfRmAAoTnlQ3Pw0YQMUuiBWu4orGzzxwDjwJoH/L7MCUJnYXoKynPA9A4qczbBorPiJZ
	NxFSW2GfA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZGe4-0001JO-VZ; Sun, 01 Nov 2020 16:55:57 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZGdv-0001Gv-8G; Sun, 01 Nov 2020 16:55:53 +0000
Received: from kernel.org (unknown [87.71.17.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 673912071E;
 Sun,  1 Nov 2020 16:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604249745;
 bh=me4MsVHOGb1kHLMx0QFDtSp3fp/hBgcTORNpqfrV948=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=A3apdqu37Rlq64w8q2pkI+YeBpa8D4B/wsympS+rsBaw49qC+5sxiByYpHZldiFQb
 XIKhz4x43dHQ39bkFfr913JJpTMF43YXNFYvw5EnO/1Go+qWIcy+xQO2Q9PVRii51P
 xaN5ZCMTifLvBqcqx2m9x99vE77vBNkZFEXSON90=
Date: Sun, 1 Nov 2020 18:55:34 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 11/13] m68k/mm: make node data and node setup depend on
 CONFIG_DISCONTIGMEM
Message-ID: <20201101165534.GC14628@kernel.org>
References: <20201027112955.14157-1-rppt@kernel.org>
 <20201027112955.14157-12-rppt@kernel.org>
 <CAMuHMdU4r4CJ1kBu7gx1jkputjDn2S8Lqkj7RPfa3XUnM1QOFg@mail.gmail.com>
 <20201028111631.GF1428094@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201028111631.GF1428094@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201101_115547_459301_C71BE918 
X-CRM114-Status: GOOD (  34.55  )
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
 Matt Turner <mattst88@gmail.com>, arcml <linux-snps-arc@lists.infradead.org>,
 Alexey Dobriyan <adobriyan@gmail.com>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Michael Schmitz <schmitzmic@gmail.com>, Tony Luck <tony.luck@intel.com>,
 Vineet Gupta <vgupta@synopsys.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 alpha <linux-alpha@vger.kernel.org>,
 Linux FS Devel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Wed, Oct 28, 2020 at 01:16:41PM +0200, Mike Rapoport wrote:
> Hi Geert,
> 
> On Wed, Oct 28, 2020 at 10:25:49AM +0100, Geert Uytterhoeven wrote:
> > Hi Mike,
> > 
> > On Tue, Oct 27, 2020 at 12:31 PM Mike Rapoport <rppt@kernel.org> wrote:
> > > From: Mike Rapoport <rppt@linux.ibm.com>
> > >
> > > The pg_data_t node structures and their initialization currently depends on
> > > !CONFIG_SINGLE_MEMORY_CHUNK. Since they are required only for DISCONTIGMEM
> > > make this dependency explicit and replace usage of
> > > CONFIG_SINGLE_MEMORY_CHUNK with CONFIG_DISCONTIGMEM where appropriate.
> > >
> > > The CONFIG_SINGLE_MEMORY_CHUNK was implicitly disabled on the ColdFire MMU
> > > variant, although it always presumed a single memory bank. As there is no
> > > actual need for DISCONTIGMEM in this case, make sure that ColdFire MMU
> > > systems set CONFIG_SINGLE_MEMORY_CHUNK to 'y'.
> > >
> > > Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> > 
> > Thanks for your patch!
> > 
> > > ---
> > >  arch/m68k/Kconfig.cpu           | 6 +++---
> > >  arch/m68k/include/asm/page_mm.h | 2 +-
> > >  arch/m68k/mm/init.c             | 4 ++--
> > >  3 files changed, 6 insertions(+), 6 deletions(-)
> > 
> > Is there any specific reason you didn't convert the checks for
> > CONFIG_SINGLE_MEMORY_CHUNK in arch/m68k/kernel/setup_mm.c
> 
> In arch/m68k/kernel/setup_mm.c the CONFIG_SINGLE_MEMORY_CHUNK is needed
> for the case when a system has two banks, the kernel is loaded into the
> second bank and so the first bank cannot be used as normal memory. It
> does not matter what memory model will be used in this case. 
> 
> > and arch/m68k/include/asm/virtconvert.h?
>  
> I remember I had build errors and troubles with include file
> dependencies if I changed it there, but I might be mistaken. I'll
> recheck again.

There indeed was an issue with SINGLE_MEMORY_CHUNK that selected
NEED_MULTIPLE_NODES for some reason.
With that fixed and removed CONFIG_SINGLE_MEMORY_CHUNK in
arch/m68k/include/asm/virtconvert.h I'm going to send v2 soon.

I've kept CONFIG_SINGLE_MEMORY_CHUNK for now for backwards compatibility
with the plan to remove it along with DISCONTIGMEM.

> > Gr{oetje,eeting}s,
> > 
> >                         Geert
> > 
> > -- 
> > Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> > 
> > In personal conversations with technical people, I call myself a hacker. But
> > when I'm talking to journalists I just say "programmer" or something like that.
> >                                 -- Linus Torvalds
> 
> -- 
> Sincerely yours,
> Mike.

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
