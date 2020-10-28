Return-Path: <SRS0=9eah=ED=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D24C9C388F7
	for <linux-snps-arc@archiver.kernel.org>; Wed, 28 Oct 2020 11:16:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 070F6246B4
	for <linux-snps-arc@archiver.kernel.org>; Wed, 28 Oct 2020 11:16:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lzjfjFL6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="nNqIykwP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 070F6246B4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wuGbXhKudDaJsrbb5OfyzfFf9Uv6qBhp4UQVjNFlwYE=; b=lzjfjFL62mkAsGJmnfWh4VYgv
	Cx56M3qYKLSRGwVLKLBJpdpi/Jxds1pmb+dLoR39S1667uDdq+0GDcyyyV3QzweGfzfP86dmx6qxv
	4Fwyw7lz3I5lZEzhzNMr8K7YXoVEurWlICIMZ95caASuSaOnAveolhMmYRHAqfkriiqx1jafv5tt4
	6zWhVLsp/4Q8nlsSURo2WNwFS9XsWqIHUVklIw10yopH+NRNoUAk/0OoJPMRVvZffoO54tfGg0nOh
	I5x5/ubWvjFvztqPfiHX7NMKZoZr6YosBuYhWKmPsuxm0T3qfpr9xYvEBUm/L2KX0ayE6pRz+5QYb
	EIQlSIiEw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXjRi-0005uZ-Os; Wed, 28 Oct 2020 11:16:51 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXjRc-0005sU-FN; Wed, 28 Oct 2020 11:16:45 +0000
Received: from kernel.org (unknown [87.70.96.83])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7666B246B2;
 Wed, 28 Oct 2020 11:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603883801;
 bh=3DtSsbNWZaTf7v/7udK+AIDJ92sxyETNXeC2IzpbaLk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nNqIykwPXzPeiPb6AYNYHQQXiJyXiYtwLr73B//voWR8TZa6Eb5++4CieyFXxEh1h
 1/1jSd7uHggtcYYQ6K5jPMWeaE8D3Si3dAD3bEDewru+HlpqXxaIyeUj0n/GkzF1sK
 d2ZhRYNYGHxIcFCusFeRPJXtjEnybkIYxxUOxr+4=
Date: Wed, 28 Oct 2020 13:16:31 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 11/13] m68k/mm: make node data and node setup depend on
 CONFIG_DISCONTIGMEM
Message-ID: <20201028111631.GF1428094@kernel.org>
References: <20201027112955.14157-1-rppt@kernel.org>
 <20201027112955.14157-12-rppt@kernel.org>
 <CAMuHMdU4r4CJ1kBu7gx1jkputjDn2S8Lqkj7RPfa3XUnM1QOFg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdU4r4CJ1kBu7gx1jkputjDn2S8Lqkj7RPfa3XUnM1QOFg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201028_071644_753443_BB3AC1C2 
X-CRM114-Status: GOOD (  29.29  )
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

Hi Geert,

On Wed, Oct 28, 2020 at 10:25:49AM +0100, Geert Uytterhoeven wrote:
> Hi Mike,
> 
> On Tue, Oct 27, 2020 at 12:31 PM Mike Rapoport <rppt@kernel.org> wrote:
> > From: Mike Rapoport <rppt@linux.ibm.com>
> >
> > The pg_data_t node structures and their initialization currently depends on
> > !CONFIG_SINGLE_MEMORY_CHUNK. Since they are required only for DISCONTIGMEM
> > make this dependency explicit and replace usage of
> > CONFIG_SINGLE_MEMORY_CHUNK with CONFIG_DISCONTIGMEM where appropriate.
> >
> > The CONFIG_SINGLE_MEMORY_CHUNK was implicitly disabled on the ColdFire MMU
> > variant, although it always presumed a single memory bank. As there is no
> > actual need for DISCONTIGMEM in this case, make sure that ColdFire MMU
> > systems set CONFIG_SINGLE_MEMORY_CHUNK to 'y'.
> >
> > Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> 
> Thanks for your patch!
> 
> > ---
> >  arch/m68k/Kconfig.cpu           | 6 +++---
> >  arch/m68k/include/asm/page_mm.h | 2 +-
> >  arch/m68k/mm/init.c             | 4 ++--
> >  3 files changed, 6 insertions(+), 6 deletions(-)
> 
> Is there any specific reason you didn't convert the checks for
> CONFIG_SINGLE_MEMORY_CHUNK in arch/m68k/kernel/setup_mm.c

In arch/m68k/kernel/setup_mm.c the CONFIG_SINGLE_MEMORY_CHUNK is needed
for the case when a system has two banks, the kernel is loaded into the
second bank and so the first bank cannot be used as normal memory. It
does not matter what memory model will be used in this case. 

> and arch/m68k/include/asm/virtconvert.h?
 
I remember I had build errors and troubles with include file
dependencies if I changed it there, but I might be mistaken. I'll
recheck again.

> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
