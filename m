From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 6 Jun 2017 15:15:10 -0700
Subject: [PATCH v4] hsdk: initial port for HSDK board
In-Reply-To: <1496692249-11699-1-git-send-email-abrodkin@synopsys.com>
References: <1496692249-11699-1-git-send-email-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <c416d6e1-f4ae-e698-d96c-33390f062661@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 06/05/2017 12:50 PM, Alexey Brodkin wrote:
> This initial port adds support of ARC HS Development Kit board with some
> basic features such serial port, USB, SD/MMC and Ethernet.
> 
> Essentially we run Linux kernel on all 4 cores (i.e. utilize SMP) and
> heavily use IO Coherency for speeding-up DMA-aware peripherals.
> 
> Note as opposed to other ARC boards we link Linux kernel to
> 0x9000_0000 intentionally because cores 1 and 3 configured with DCCM
> situated at our more usual link base 0x8000_0000.
> 
> Signed-off-by: Eugeniy Paltsev <paltsev at synopsys.com>
> Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
> Cc: Vineet Gupta <vgupta at synopsys.com>
> Cc: Rob Herring <robh+dt at kernel.org>
> ---
> 
> Changes v3 -> v4:
>   * Removed senseless "ranges" property from "memory" node in .dts
>   * Refined early-boot code:
>      - CREG_PAE should be set only once thus master does that in init_early()
>      - ICCM relocation should be done on each and every core that sports ICCM
>        so we leave it in init_per_cpu(). Even though init_per_cpu() gets called
>        on the master core pretty late still it is way much earlier than that
>        moment when it might affect us - as it only huts us when addresses in
>        0x7z-0x7fff_ffff range are used, i.e. virtual addresses that we don't
>        use during init. This also makes code much cleaner compared to
>        additional check in case of master etc.

So you are assuming that vmalloc machinery would not have kicked in by then i.e. 
by the time of irq_init() i.e. - perhaps that is true. Lets go with what you have 
now....

-Vineet
