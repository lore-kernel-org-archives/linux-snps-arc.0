From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 27 Oct 2017 13:33:43 -0700
Subject: [PATCH] ARC: Memory barriers for everyone!
In-Reply-To: <0962ea206d9480abb7084bfbca86237cfc69b16b.1505301175.git.joabreu@synopsys.com>
References: <0962ea206d9480abb7084bfbca86237cfc69b16b.1505301175.git.joabreu@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <2dc629e1-a538-e051-f616-76798f695413@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Jose,

On 09/13/2017 04:24 AM, Jose Abreu wrote:
> By default __iormb() and __iowmb() translate into a do { } while(0) for
> AXS10x platform. As ARC700 supports the sync op we can use the standard
> memory barriers that are supplied by asm-generic headers.
> 
> Signed-off-by: Jose Abreu <joabreu at synopsys.com>
> Cc: Vineet Gupta <vgupta at synopsys.com>
> Cc: Alexey Brodkin <abrodkin at synopsys.com>
> Cc: Joao Pinto <jpinto at synopsys.com>
> ---
> Hi Vineet,
> 
> This is the final patch for the series which should fix all the stacktracing
> mechanism for Bus Error messages. In this one we force memory barriers for
> all IO operations 

SYNC is a performance killer - it makes the processor wait for all memory 
operations to complete before proceeding. So the justification for adding it to 
all io accessors has to be more than getting correct stack traces.

> which will prevent op reordering by gcc and which will
> *really* correct blink and eret regs to show where exactly the error happened.

I don't think this is the precise reason why it works. Adding the SYNC likely adds 
enough delay between the IO r/w such that CPU doesn't move to the next instruction.

As you would know very well, Bus Errors on ARC are imprecise and that is the root 
of the issue. The bus fabric can take arbitrary amount of time to come back with 
an error and ARC would have moved on to next instruction(s) when it is actually 
notified. Thus the exception is "charged" to whatever the current PC was when it 
is actually taken, which accounts for the bogus ERET and hence broken call chains 
etc. Note that sdding SYNC delays things just enough but it is still not 
guaranteed that you will correct ERET, depending on your bus network.

Hence the reason this patch is not acceptable.

Apologies for the delay in responding..

Thx,
-Vineet

> With this fix I get a correct stacktrace upon a readl() from a non-existent
> register which causes a Bus Error. Without this, I would get non-correct
> blink and eret addresses because the ld operation would launch a bus error
> way after we performed readl().
> 
> I am sending this but I'm not exactly sure if all platforms support
> the sync op. Could you confirm this?
> 
> Best regards,
> Jose Miguel Abreu
> ---
>   arch/arc/include/asm/io.h | 7 +------
>   1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/arch/arc/include/asm/io.h b/arch/arc/include/asm/io.h
> index c22b181..712defd 100644
> --- a/arch/arc/include/asm/io.h
> +++ b/arch/arc/include/asm/io.h
> @@ -12,15 +12,10 @@
>   #include <linux/types.h>
>   #include <asm/byteorder.h>
>   #include <asm/page.h>
> -
> -#ifdef CONFIG_ISA_ARCV2
>   #include <asm/barrier.h>
> +
>   #define __iormb()		rmb()
>   #define __iowmb()		wmb()
> -#else
> -#define __iormb()		do { } while (0)
> -#define __iowmb()		do { } while (0)
> -#endif
>   
>   extern void __iomem *ioremap(phys_addr_t paddr, unsigned long size);
>   extern void __iomem *ioremap_prot(phys_addr_t paddr, unsigned long size,
> 
