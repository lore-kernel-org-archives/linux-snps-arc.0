From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 8 Nov 2016 12:25:09 -0800
Subject: [PATCH v4 0/2] ARC: Set of patches for IRQ subsystem
In-Reply-To: <1478588912-3991-1-git-send-email-yuriy.kolerov@synopsys.com>
References: <1478588912-3991-1-git-send-email-yuriy.kolerov@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <f6aa5332-bd7d-d37d-eda7-e6d7033005fc@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 11/07/2016 11:08 PM, Yuriy Kolerov wrote:
> The first patch fixes misuse of IRQ numbers. In some places of the
> Linux kernel for ARC hardware IRQ numbers are used as virtual IRQ
> numbers and obviously it is wrong.
>
> The second patch forces the kernel to set a simple distribution mode
> for common interrupts in cases when such interrupts are routed to a
> single core.
>
> Yuriy Kolerov (2):
>   ARC: IRQ: Do not use hwirq as virq and vice versa
>   ARCv2: MCIP: Use IDU_M_DISTRI_DEST mode if there is only 1 destination
>     core
>
>  arch/arc/include/asm/smp.h |  4 ++--
>  arch/arc/kernel/mcip.c     | 33 ++++++++++++++++++++-------------
>  arch/arc/kernel/smp.c      | 13 +++++++++----
>  3 files changed, 31 insertions(+), 19 deletions(-)

Thx Yuriy.

Added to for-curr !

-Vineet
