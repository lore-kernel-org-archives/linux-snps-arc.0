From: linux@roeck-us.net (Guenter Roeck)
Date: Thu, 28 Feb 2019 09:47:42 -0800
Subject: [PATCH] ARCv2: Add explcit unaligned access support (and ability
 to disable too)
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190228174742.GA18868@roeck-us.net>
To: linux-snps-arc@lists.infradead.org

On Wed, Jan 30, 2019@07:32:41PM +0300, Eugeniy Paltsev wrote:
> As of today we enable unaligned access unconditionally on ARCv2.
> Do this under a Kconfig option to allow disable it for test, benchmarking
> etc. Also while at it
> 
>   - Select HAVE_EFFICIENT_UNALIGNED_ACCESS
>   - Although gcc defaults to unaligned access (since GNU 2018.03), add the
>     right toggles for enabling or disabling as appropriate
>   - update bootlog to prints both HW feature status (exists, enabled/disabled)
>     and SW status (used / not used).
>   - wire up the relaxed memcpy for unaligned access
> 
> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
> Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
> [vgupta: squashed patches, handle gcc -mno-unaligned-access quick]

Hi,

with my brand-new gcc-8.3.0, built from upstream gcc, this patch
results in

arch/arc/kernel/setup.c: In function 'arc_cpu_mumbojumbo.constprop':
include/linux/compiler.h:348:38: error:
	call to '__compiletime_assert_326' declared with attribute error: gcc doesn't support -mno-unaligned-access

when trying to build allnoconfig or tinyconfig. I get the same results
with gcc-8.2.0.

Do I need some special compiler configuration flag when building the
arcv2 toolchain ? Or am I simply out of luck for using upstream gcc ?

Thanks,
Guenter
