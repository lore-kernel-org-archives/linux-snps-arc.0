From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Mon, 3 Jun 2019 16:34:43 +0000
Subject: [PATCH] ARC: build: Try to guess CROSS_COMPILE with
 cc-cross-prefix
In-Reply-To: <C2D7FE5348E1B147BCA15975FBA2307501A2522AB4@us01wembx1.internal.synopsys.com>
References: <20190603063119.36544-1-abrodkin@synopsys.com>
 <C2D7FE5348E1B147BCA15975FBA2307501A2522AB4@us01wembx1.internal.synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CY4PR1201MB012022B3EBC7F7C2788E7B06A1140@CY4PR1201MB0120.namprd12.prod.outlook.com>
To: linux-snps-arc@lists.infradead.org

Hi Vineet,

> -----Original Message-----
> From: Vineet Gupta <vgupta at synopsys.com>
> Sent: Monday, June 3, 2019 7:25 PM
> To: Alexey Brodkin <abrodkin at synopsys.com>; linux-snps-arc at lists.infradead.org
> Cc: linux-kernel at vger.kernel.org; Masahiro Yamada <yamada.masahiro at socionext.com>
> Subject: Re: [PATCH] ARC: build: Try to guess CROSS_COMPILE with cc-cross-prefix
> 
> On 6/2/19 11:31 PM, Alexey Brodkin wrote:
> > For a long time we used to hard-code CROSS_COMPILE prefix
> > for ARC until it started to cause problems, so we decided to
> > solely rely on CROSS_COMPILE externally set by a user:
> > commit 40660f1fcee8 ("ARC: build: Don't set CROSS_COMPILE in arch's Makefile").
> >
> > While it works perfectly fine for build-systems where the prefix
> > gets defined anyways for us human beings it's quite an annoying
> > requirement especially given most of time the same one prefix
> > "arc-linux-" is all what we need.
> >
> > It looks like finally we're getting the best of both worlds:
> >  1. W/o cross-toolchain we still may install headers, build .dtb etc
> >  2. W/ cross-toolchain get the kerne built with only ARCH=arc
> >
> > Inspired by [1] & [2].
> >
> > [1] http://lists.infradead.org/pipermail/linux-snps-arc/2019-May/005788.html
> > [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=fc2b47b55f17
> >
> > A side note: even though "cc-cross-prefix" does its job it pollutes
> > console with output of "which" for all the prefixes it didn't manage to find
> > a matching cross-compiler for like that:
> > | # ARCH=arc make defconfig
> > | which: no arceb-linux-gcc in (~/.local/bin:~/bin:/usr/bin:/usr/sbin)
> > | *** Default configuration is based on 'nsim_hs_defconfig'
> >
> > Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
> > Cc: Masahiro Yamada <yamada.masahiro at socionext.com>
> > Cc: Vineet Gupta <vgupta at synopsys.com>
> 
> Not a big deal but I'd propose we add "Suggested-by: vgupta" since that is where
> it came from.

Ooops, indeed that should have been added, but instead I just
mentioned your earlier email in the mailing list.

Care to add yourself on patch application?

-Alexey
