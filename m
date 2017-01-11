From: gregkh@linuxfoundation.org (Greg Kroah-Hartman)
Date: Wed, 11 Jan 2017 07:46:24 +0100
Subject: [PATCH 2/9] Move dma_ops from archdata into struct device
In-Reply-To: <20170111005648.14988-3-bart.vanassche@sandisk.com>
References: <20170111005648.14988-1-bart.vanassche@sandisk.com>
 <20170111005648.14988-3-bart.vanassche@sandisk.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20170111064624.GA26893@kroah.com>
To: linux-snps-arc@lists.infradead.org

On Tue, Jan 10, 2017@04:56:41PM -0800, Bart Van Assche wrote:
> Several RDMA drivers, e.g. drivers/infiniband/hw/qib, use the CPU to
> transfer data between memory and PCIe adapter. Because of performance
> reasons it is important that the CPU cache is not flushed when such
> drivers transfer data. Make this possible by allowing these drivers to
> override the dma_map_ops pointer. Additionally, introduce the function
> set_dma_ops() that will be used by a later patch in this series.
> 
> Signed-off-by: Bart Van Assche <bart.vanassche at sandisk.com>
> Cc: Greg Kroah-Hartman <gregkh at linuxfoundation.org>
> Cc: Aurelien Jacquiot <a-jacquiot at ti.com>
> Cc: Catalin Marinas <catalin.marinas at arm.com>
> Cc: Chris Zankel <chris at zankel.net>
> Cc: David Howells <dhowells at redhat.com>
> Cc: David S. Miller <davem at davemloft.net>
> Cc: Fenghua Yu <fenghua.yu at intel.com>
> Cc: Geert Uytterhoeven <geert at linux-m68k.org>
> Cc: Geoff Levand <geoff at infradead.org>
> Cc: H. Peter Anvin <hpa at zytor.com>
> Cc: Haavard Skinnemoen <hskinnemoen at gmail.com>
> Cc: Hans-Christian Egtvedt <egtvedt at samfundet.no>
> Cc: Helge Deller <deller at gmx.de>
> Cc: Ingo Molnar <mingo at redhat.com>
> Cc: James E.J. Bottomley <jejb at parisc-linux.org>
> Cc: Jesper Nilsson <jesper.nilsson at axis.com>
> Cc: Joerg Roedel <joro at 8bytes.org>
> Cc: Jon Mason <jdmason at kudzu.us>
> Cc: Jonas Bonn <jonas at southpole.se>
> Cc: Ley Foon Tan <lftan at altera.com>
> Cc: Mark Salter <msalter at redhat.com>
> Cc: Max Filippov <jcmvbkbc at gmail.com>
> Cc: Mikael Starvik <starvik at axis.com>
> Cc: Muli Ben-Yehuda <mulix at mulix.org>
> Cc: Rich Felker <dalias at libc.org>
> Cc: Russell King <linux at armlinux.org.uk>
> Cc: Stafford Horne <shorne at gmail.com>
> Cc: Stefan Kristiansson <stefan.kristiansson at saunalahti.fi>
> Cc: Thomas Gleixner <tglx at linutronix.de>
> Cc: Tony Luck <tony.luck at intel.com>
> Cc: Will Deacon <will.deacon at arm.com>
> Cc: x86 at kernel.org
> Cc: Yoshinori Sato <ysato at users.sourceforge.jp>
> Cc: adi-buildroot-devel at lists.sourceforge.net
> Cc: iommu at lists.linux-foundation.org
> Cc: linux-alpha at vger.kernel.org
> Cc: linux-am33-list at redhat.com
> Cc: linux-arm-kernel at lists.infradead.org
> Cc: linux-c6x-dev at linux-c6x.org
> Cc: linux-cris-kernel at axis.com
> Cc: linux-hexagon at vger.kernel.org
> Cc: linux-ia64 at vger.kernel.org
> Cc: linux-m68k at lists.linux-m68k.org
> Cc: linux-metag at vger.kernel.org
> Cc: linux-mips at linux-mips.org
> Cc: linux-parisc at vger.kernel.org
> Cc: linux-pci at vger.kernel.org
> Cc: linux-rdma at vger.kernel.org
> Cc: linux-s390 at vger.kernel.org
> Cc: linux-sh at vger.kernel.org
> Cc: linux-snps-arc at lists.infradead.org
> Cc: linux-xtensa at linux-xtensa.org
> Cc: linuxppc-dev at lists.ozlabs.org
> Cc: nios2-dev at lists.rocketboards.org
> Cc: openrisc at lists.librecores.org
> Cc: sparclinux at vger.kernel.org
> Cc: uclinux-h8-devel at lists.sourceforge.jp

That's a crazy cc: list, you should break this up into smaller pieces,
otherwise it's going to bounce...

> diff --git a/include/linux/device.h b/include/linux/device.h
> index 491b4c0ca633..c7cb225d36b0 100644
> --- a/include/linux/device.h
> +++ b/include/linux/device.h
> @@ -885,6 +885,8 @@ struct dev_links_info {
>   * a higher-level representation of the device.
>   */
>  struct device {
> +	const struct dma_map_ops *dma_ops; /* See also get_dma_ops() */
> +
>  	struct device		*parent;
>  
>  	struct device_private	*p;

Why not put this new pointer down with the other dma fields in this
structure?  Any specific reason it needs to be first?

thanks,

greg k-h
