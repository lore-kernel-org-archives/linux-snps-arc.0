From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 1 Feb 2017 12:58:24 -0800
Subject: [PATCH v2 0/4] Use build registers for getting numbers of
 interrupts
In-Reply-To: <1485863124-26426-1-git-send-email-yuriy.kolerov@synopsys.com>
References: <1485863124-26426-1-git-send-email-yuriy.kolerov@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <e3e7f7c8-57f3-e9da-158d-6bae19dd87a8@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 01/31/2017 03:45 AM, Yuriy Kolerov wrote:
> A summary:
> 
>   * Use build registers for getting numbers of interrupts both for
>     core interrupt controller and for IDU interrupt controller.
>   * Set a default priority for all core interrupt to prevent
>     unexpected switching of banks of registers.
>   * Remove option for setting number of interrupts since it does
>     not affect a number of interrupts in IRQ domains and breaks
>     portability since it is impossible to change size of table of
>     interrupts after linkage.
> 
> Change in v2:
> 
>   * Squash some commits.
>   * Do not move a structure for control register of core intc to
>     the header since it is used only once.
> 
> Yuriy Kolerov (4):
>   ARCv2: IRQ: Move structure for build register of core intc to the
>     header
>   ARCv2: IRQ: Remove option for setting number of interrupts
>   ARCv2: IRQ: Use build registers for getting numbers of interrupts
>   ARCv2: IRQ: Set a default priority for all core interrupts
> 
>  arch/arc/Kconfig               | 11 -----------
>  arch/arc/include/asm/arcregs.h | 11 +++++++++++
>  arch/arc/include/asm/irq.h     | 32 +++++++++++++++++++++++++++++---
>  arch/arc/kernel/entry-arcv2.S  |  3 ++-
>  arch/arc/kernel/intc-arcv2.c   | 31 ++++++++++++++++++++-----------
>  arch/arc/kernel/mcip.c         | 31 +++++++++++++++++++------------
>  include/soc/arc/mcip.h         | 17 +++++++++++++++++
>  7 files changed, 98 insertions(+), 38 deletions(-)
> 

Hi Yuriy,

I've reworked your series a bit and pushed to my for-next.

Care to take a look please.

Thx,
-Vineet
