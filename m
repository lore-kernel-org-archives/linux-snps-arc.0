From: thomas.petazzoni@free-electrons.com (Thomas Petazzoni)
Date: Wed, 1 Mar 2017 21:25:33 +0100
Subject: [uclibc-ng-devel] [PATCH] ARC: Enable getpt() support in ARC
 defconfigs
In-Reply-To: <1488392734.4659.54.camel@synopsys.com>
References: <1488308547-10114-1-git-send-email-vzakhar@synopsys.com>
 <20170301162459.5d23c09e@free-electrons.com>
 <eaea2503-3a2a-2871-7f37-c57ed6504946@synopsys.com>
 <1488392734.4659.54.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20170301212533.6ddcfc0f@free-electrons.com>
To: linux-snps-arc@lists.infradead.org

Hello,

On Wed, 1 Mar 2017 18:25:35 +0000, Alexey Brodkin wrote:

> That means for building of our toolchain we'll need to have
> separately stored "defconfigs" in some form. Let's see what Anton says on that :)
> 
> And regardless of what mr Anton says having off-the-tree defconfigs is not the best idea
> because with time options will go in and out and occasionally we'll have outdated
> defconfigs.

What would they be off-tree?

What I meant is that when you look at the per architecture defconfigs,
they are also all exactly the same, except for the TARGET_<foo> option.

So instead of having this big duplication, my suggestion is to get rid
of architecture-specific defconfig, and just have a few
architecture-independent defconfig, addressing common use cases (such
as "minimal" and "feature full").

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
