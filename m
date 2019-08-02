From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Fri, 2 Aug 2019 16:25:39 +0000
Subject: [PATCH v2 2/2] ARC: enable uboot support unconditionally
In-Reply-To: <20190802074053.GE26174@kroah.com>
References: <20190214150745.18773-1-Eugeniy.Paltsev@synopsys.com>
 <20190214150745.18773-3-Eugeniy.Paltsev@synopsys.com>
 <CY4PR1201MB0120530B12273DDC5B06D823A1C80@CY4PR1201MB0120.namprd12.prod.outlook.com>
 <20190802074053.GE26174@kroah.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CY4PR1201MB01209C2D14AEE1A81164FE99A1D90@CY4PR1201MB0120.namprd12.prod.outlook.com>
To: linux-snps-arc@lists.infradead.org

Hi Greg,

> > May we have this one back-ported to linux-4.19.y?
> >
> > It was initially applied to Linus' tree during 5.0 development
> > cycle [1] but was never back-ported.
> >
> > Now w/o that patch in KernelCI we see boot failure on ARC HSDK
> > board [2] as opposed to normally working later kernel versions.
> >
> > [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=493a2f812446e92bcb1e69a77381b4d39808d730
> > [2] https://storage.kernelci.org/stable/linux-4.19.y/v4.19.59/arc/hsdk_defconfig/gcc-8/lab-baylibre/boot-hsdk.txt
> >
> > Below is that same patch but rebased on linux-4.19 as in its pristine
> > form it won't apply due to offset of one of hunks.
> 
> Why is this patch ok for stable kernel trees?  Are you not removing
> existing support in 4.19 for a feature that people might be using there?
> What bug is this fixing that requires this removal?

This patch removes a Kconfig option in a trade for properly working
detection of arguments passed from U-Boot.

Back in the day [3] we had to add that option to get kernel reliably working
in use-cases w/o U-Boot (those were typically loading kernel image via JTAG).
But with a couple of fixes applied to linux-4.19.y already we no longer need
that explicit toggle as we may rely on data passed via dedicated registers
and thus automatically know if there was U-Boot which passed some info to
the kernel or there was no U-Boot and we don't need to mess with garbage in
those registers.

Main reason is to make vanilla 4.19.y kernels usable on HSDK board in KernelCI
environment. Now they don't boot, see [2] as in HSDK's defconfig ARC_UBOOT_SUPPORT
is not set. So we have 2 solutions:

1. Add ARC_UBOOT_SUPPORT to arch/arc/configs/hsdk_defconfig
   But we cannot do it for vanilla kernel because we simply cannot even submit that
   change to the Linus' tree as that Kconfig option was removed.
   Which means we cannot back-port it, right :)

2. Back-port proposed patch which already exists in the Linus'tree and thus is
   perfectly back-portable.

Makes sense?

-Alexey

[2] https://storage.kernelci.org/stable/linux-4.19.y/v4.19.59/arc/hsdk_defconfig/gcc-8/lab-baylibre/boot-hsdk.txt
[3] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=036b2c5664281e7da5a89c9f742491f30966485f
