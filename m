From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Wed, 1 Mar 2017 21:30:31 +0000
Subject: [uclibc-ng-devel] [PATCH] ARC: Enable getpt() support in ARC
 defconfigs
In-Reply-To: <20170301212533.6ddcfc0f@free-electrons.com>
References: <1488308547-10114-1-git-send-email-vzakhar@synopsys.com>
 <20170301162459.5d23c09e@free-electrons.com>
 <eaea2503-3a2a-2871-7f37-c57ed6504946@synopsys.com>
 <1488392734.4659.54.camel@synopsys.com>
 <20170301212533.6ddcfc0f@free-electrons.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1488403830.5447.5.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Thomas,

On Wed, 2017-03-01@21:25 +0100, Thomas Petazzoni wrote:
> Hello,
> 
> On Wed, 1 Mar 2017 18:25:35 +0000, Alexey Brodkin wrote:
> 
> > 
> > That means for building of our toolchain we'll need to have
> > separately stored "defconfigs" in some form. Let's see what Anton says on that :)
> > 
> > And regardless of what mr Anton says having off-the-tree defconfigs is not the best idea
> > because with time options will go in and out and occasionally we'll have outdated
> > defconfigs.
> 
> What would they be off-tree?
> 
> What I meant is that when you look at the per architecture defconfigs,
> they are also all exactly the same, except for the TARGET_<foo> option.
> 
> So instead of having this big duplication, my suggestion is to get rid
> of architecture-specific defconfig, and just have a few
> architecture-independent defconfig, addressing common use cases (such
> as "minimal" and "feature full").

That was exactly my understanding :)

Speaking of "defconfigs" I really meant something that we may use
for building our toolchain outside of Buildroot if we want something that
differs from uClibc's defaults/defconfig - and most probably we'll need something
either to add to uClibc's minimal_defconfig or exclude from _maximal_defconfig.

Otherwise how may we be in control of libc in our "reference" toolchain?

-Alexey
