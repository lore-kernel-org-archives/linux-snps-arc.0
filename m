From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 15 Mar 2016 11:13:47 +0000
Subject: [PATCH] Remove the inclusion of pci-bridge.h and pci-dma-compat.h
References: <d3ed7b3e4f746831a5d0469da5361b4cd176f5c6.1457978659.git.jpinto@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075F4E8FE6E@us01wembx1.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Tuesday 15 March 2016 04:36 PM, Joao Pinto wrote:
> While building linux-next the test robot detected that the pci.h was including
> two removed header files (pci-dma-compat.h and pci-bridge.h) causing the
> process to fail:
> http://lists.infradead.org/pipermail/linux-snps-arc/2016-March/000711.html
>
> This patch has the goal to fix the build problem.
>
> Signed-off-by: Joao Pinto <jpinto at synopsys.com>

Acked-by: Vineet Gupta <vgupta at synopsys.com>

@Bjorn since the ARC PCI support is still not upstream, and was slated to go via
you, please pick this one up as well.

Thx,
-Vineet

> ---
>  arch/arc/include/asm/pci.h | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/arch/arc/include/asm/pci.h b/arch/arc/include/asm/pci.h
> index 2f2011c..ba56c23 100644
> --- a/arch/arc/include/asm/pci.h
> +++ b/arch/arc/include/asm/pci.h
> @@ -10,9 +10,6 @@
>  #define _ASM_ARC_PCI_H
>  
>  #ifdef __KERNEL__
> -#include <asm-generic/pci-dma-compat.h>
> -#include <asm-generic/pci-bridge.h>
> -
>  #include <linux/ioport.h>
>  
>  #define PCIBIOS_MIN_IO 0x100
