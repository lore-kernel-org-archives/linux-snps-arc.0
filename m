From: thomas.petazzoni@free-electrons.com (Thomas Petazzoni)
Date: Wed, 1 Mar 2017 22:45:24 +0100
Subject: [uclibc-ng-devel] [PATCH] ARC: Enable getpt() support in ARC
 defconfigs
In-Reply-To: <1488403830.5447.5.camel@synopsys.com>
References: <1488308547-10114-1-git-send-email-vzakhar@synopsys.com>
 <20170301162459.5d23c09e@free-electrons.com>
 <eaea2503-3a2a-2871-7f37-c57ed6504946@synopsys.com>
 <1488392734.4659.54.camel@synopsys.com>
 <20170301212533.6ddcfc0f@free-electrons.com>
 <1488403830.5447.5.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20170301224524.4c0f5d56@free-electrons.com>
To: linux-snps-arc@lists.infradead.org

Hello,

On Wed, 1 Mar 2017 21:30:31 +0000, Alexey Brodkin wrote:

> Speaking of "defconfigs" I really meant something that we may use
> for building our toolchain outside of Buildroot if we want something that
> differs from uClibc's defaults/defconfig - and most probably we'll need something
> either to add to uClibc's minimal_defconfig or exclude from _maximal_defconfig.
> 
> Otherwise how may we be in control of libc in our "reference" toolchain?

A defconfig is what it is: a configuration provided as an example.
Nothing forces you to use it. It's just an example.

Buildroot doesn't use any of the uClibc-ng defconfigs. Buildroot has
its own configuration for uClibc. You could just do the same for your
reference toolchain.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
