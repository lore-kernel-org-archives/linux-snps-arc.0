From: helgaas@kernel.org (Bjorn Helgaas)
Date: Thu, 4 Feb 2016 12:19:11 -0600
Subject: [PATCH v8 2/2] add new platform driver for PCI RC
In-Reply-To: <c7af1603d4f18d11cb0ccee1c07708a1455ea4ed.1454600622.git.jpinto@synopsys.com>
References: <cover.1454600622.git.jpinto@synopsys.com>
 <c7af1603d4f18d11cb0ccee1c07708a1455ea4ed.1454600622.git.jpinto@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160204181911.GA2143@localhost>
To: linux-snps-arc@lists.infradead.org

On Thu, Feb 04, 2016@03:52:10PM +0000, Joao Pinto wrote:
> This patch adds a new driver that will be the reference platform driver
> for all PCI RC IP Protoyping Kits based on ARC SDP.
> 
> Signed-off-by: Joao Pinto <jpinto at synopsys.com>
> ---
> Change v7 -> v8 (Bjorn Helgaas and Arnd Bergmann):
> - driver name was changed from pcie-synopsys to pcie-dw-pltfm

"pcie-dw-pltfm" seems worse to me.  We have eight existing drivers
that call dw_pcie_host_init(), and they're all platform_drivers.
"pcie-dw-pltfm" could apply equally well to any of them.

I think I see what happened: I wrote "It doesn't seem necessary to me
to include both 'synopsys' and 'ipk' in the filename and the driver
name."  I meant that using one of them should be sufficient, not that
*both* should be removed.

I don't know the SoC landscape, but from Arnd's comment, it sounds
like "synopsys" might be too generic because many of the other drivers
are connected with Synopsys.  I don't know what "ipk" means, but maybe
that could work.  It's convenient if the name *means* something, and
if "ipk" stands for "IP Prototyping Kit", that sounds pretty generic.
Is "haps" or "haps_dx" a name people would associate with this
hardware?  I guess it'd be nice if the driver name were related to the
DT compat strings, so "ipk" is better from that perspective.

My pci/host-synopsys branch (which is still published even though I
removed it from for-linus) contains your v7 series plus some fixes.
This v8 series lost the fixes.  For example:

> +static irqreturn_t dw_pltfm_pcie_msi_irq_handler(int irq, void *arg)
> +{
> +	struct pcie_port *pp = arg;
> +
> +	dw_handle_msi_irq(pp);
> +
> +	return dw_handle_msi_irq(pp);
> +}

This is a bug.  You should call dw_handle_msi_irq() *once* and return
the value it returns.  I already fixed this in my pci/host-synopsys
branch, so you should start with that, and then apply your v7-v8
changes.

Bjorn
