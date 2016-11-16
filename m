From: andriy.shevchenko@linux.intel.com (Andy Shevchenko)
Date: Wed, 16 Nov 2016 17:10:42 +0200
Subject: [PATCH 4/4] Update device tree Synopsys DW DMAC documentation
In-Reply-To: <1479304615-11360-5-git-send-email-Eugeniy.Paltsev@synopsys.com>
References: <1479304615-11360-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
 <1479304615-11360-5-git-send-email-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1479309042.24056.40.camel@linux.intel.com>
To: linux-snps-arc@lists.infradead.org

On Wed, 2016-11-16@16:56 +0300, Eugeniy Paltsev wrote:
> ?* Rename is_private to is-private as ordered by DT policy.
> ?The change leaves the support for the old format.
> 
> ?* Add is-memcpu property, so it is possible to
> ?enable memory-to-memory transfers support via DT.
> 
> ?* Add hw-llp property, so it is possible to enable
> ?hardware multi block transfers support via DT.
> 
> ?Fix white spaces.
> 
> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
> ---
> ?Documentation/devicetree/bindings/dma/snps-dma.txt | 10 ++++++++--
> ?1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/dma/snps-dma.txt
> b/Documentation/devicetree/bindings/dma/snps-dma.txt
> index 0f55832..d41d960 100644
> --- a/Documentation/devicetree/bindings/dma/snps-dma.txt
> +++ b/Documentation/devicetree/bindings/dma/snps-dma.txt
> @@ -20,13 +20,19 @@ Required properties:
> ?Deprecated properties:
> ?- data_width: Maximum data width supported by hardware per AHB master
> ???(0 - 8bits, 1 - 16bits, ..., 5 - 256bits)

> +- is_private: The device channels should be marked as private and not
> for by the
> +??general purpose DMA channel allocator. False if not passed.

This...

> ?
> ?
> ?Optional properties:
> ?- interrupt-parent: Should be the phandle for the interrupt
> controller
> ???that services interrupts for this device

> -- is_private: The device channels should be marked as private and not
> for by the
> +- is-private: The device channels should be marked as private and not
> for by the
> ???general purpose DMA channel allocator. False if not passed.

...and this is a part of patch 1.

> +- is-memcpu: The device channels do support memory-to-memory 

memcpy

> transfers. 

> False
> +??if not passed.
> +- hw-llp: Multi block transfers supported by hardware per AHB master.
> +??0 (default): not supported, 1: supported.

Overall, since we are going to expose some properties to the Device Tree
I would really think twice about naming. Better if we reuse something
existing already.

So, what I can see is

dmacap,private
dmacap,memcpy

Here is a selling point as well, i.e. standardization.

'hw-llp' sounds too tricky, perhaps 'multi-block' is better and could be
re-used.

> ?
> ?Example:
> ?
> @@ -56,7 +62,7 @@ The four cells in order are:
> ?4. Peripheral master for transfers on allocated channel
> ?

> ?Example:
> -	
> +

No, no need to touch this.

-- 
Andy Shevchenko <andriy.shevchenko at linux.intel.com>
Intel Finland Oy
