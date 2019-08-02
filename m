From: gregkh@linuxfoundation.org (Greg Kroah-Hartman)
Date: Fri, 2 Aug 2019 09:40:53 +0200
Subject: [PATCH v2 2/2] ARC: enable uboot support unconditionally
In-Reply-To: <CY4PR1201MB0120530B12273DDC5B06D823A1C80@CY4PR1201MB0120.namprd12.prod.outlook.com>
References: <20190214150745.18773-1-Eugeniy.Paltsev@synopsys.com>
 <20190214150745.18773-3-Eugeniy.Paltsev@synopsys.com>
 <CY4PR1201MB0120530B12273DDC5B06D823A1C80@CY4PR1201MB0120.namprd12.prod.outlook.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20190802074053.GE26174@kroah.com>
To: linux-snps-arc@lists.infradead.org

On Thu, Jul 18, 2019@08:51:23PM +0000, Alexey Brodkin wrote:
> Hi Greg,
> 
> > -----Original Message-----
> > From: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
> > Sent: Thursday, February 14, 2019 6:08 PM
> > To: linux-snps-arc at lists.infradead.org; Vineet Gupta <vgupta at synopsys.com>
> > Cc: linux-kernel at vger.kernel.org; Alexey Brodkin <abrodkin at synopsys.com>; Corentin Labbe
> > <clabbe at baylibre.com>; khilman at baylibre.com; Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
> > Subject: [PATCH v2 2/2] ARC: enable uboot support unconditionally
> > 
> > After reworking U-boot args handling code and adding paranoid
> > arguments check we can eliminate CONFIG_ARC_UBOOT_SUPPORT and
> > enable uboot support unconditionally.
> > 
> > For JTAG case we can assume that core registers will come up
> > reset value of 0 or in worst case we rely on user passing
> > '-on=clear_regs' to Metaware debugger.
> > 
> > Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
> 
> May we have this one back-ported to linux-4.19.y?
> 
> It was initially applied to Linus' tree during 5.0 development
> cycle [1] but was never back-ported.
> 
> Now w/o that patch in KernelCI we see boot failure on ARC HSDK
> board [2] as opposed to normally working later kernel versions.
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=493a2f812446e92bcb1e69a77381b4d39808d730
> [2] https://storage.kernelci.org/stable/linux-4.19.y/v4.19.59/arc/hsdk_defconfig/gcc-8/lab-baylibre/boot-hsdk.txt
> 
> Below is that same patch but rebased on linux-4.19 as in its pristine
> form it won't apply due to offset of one of hunks.

Why is this patch ok for stable kernel trees?  Are you not removing
existing support in 4.19 for a feature that people might be using there?
What bug is this fixing that requires this removal?

thanks,

greg k-h
