From: thomas.petazzoni@free-electrons.com (Thomas Petazzoni)
Date: Wed, 1 Mar 2017 16:24:59 +0100
Subject: [uclibc-ng-devel] [PATCH] ARC: Enable getpt() support in ARC
 defconfigs
In-Reply-To: <1488308547-10114-1-git-send-email-vzakhar@synopsys.com>
References: <1488308547-10114-1-git-send-email-vzakhar@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20170301162459.5d23c09e@free-electrons.com>
To: linux-snps-arc@lists.infradead.org

Hello,

On Tue, 28 Feb 2017 22:02:27 +0300, Vlad Zakharov wrote:
> This commit enables getpt() support in ARC defconfigs as some packages
> need it. E.g. we need this to be able to build xterm package as it uses
> getpt().
> 
> As an example I can refer to buildroot autobuilds where xterm build is
> failing when using prebuilt ARC toolchain (which in its turn uses uClibc
> without getpt() support):
> http://autobuild.buildroot.net/results/28a/28a92049a6ceef005787c5779f77ecf3fe8ad642/build-end.log
> 
> Signed-off-by: Vlad Zakharov <vzakhar at synopsys.com>
> ---
>  extra/Configs/defconfigs/arc/arcv2_defconfig | 1 +
>  extra/Configs/defconfigs/arc/defconfig       | 1 +
>  2 files changed, 2 insertions(+)

That's more of a question for Waldemar: does it really makes sense to
have defconfigs for each architecture? I mean how do they differ
between each other?

For example, the ARC arcv2_defconfig and defconfig only differ by the
option CONFIG_ARC_CPU_HS, whose only purpose is to pass -mcpu=archs.
Shouldn't be the solution used on ARM (removing all options to select
the compiler flags, and leave it to the user to pass the appropriate
options) be used as well ?

So, are they really useful? Shouldn't uclibc-ng instead come with just
one or two defconfigs, like a "minimal" one and "full-featured" one?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
