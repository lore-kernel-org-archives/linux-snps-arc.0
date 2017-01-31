From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 31 Jan 2017 09:40:51 -0800
Subject: [PATCH v2 2/4] ARCv2: IRQ: Remove option for setting number of
 interrupts
In-Reply-To: <1485863124-26426-3-git-send-email-yuriy.kolerov@synopsys.com>
References: <1485863124-26426-1-git-send-email-yuriy.kolerov@synopsys.com>
 <1485863124-26426-3-git-send-email-yuriy.kolerov@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <ed50236e-a209-56be-e180-f03a0a24120d@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 01/31/2017 03:45 AM, Yuriy Kolerov wrote:
> When you set a value of ARC_NUMBER_OF_INTERRUPTS option
> it affects only a size of the interrupts table but macros
> for number of virtual interrupts (NR_IRQS) and for number
> of hardware interrupts (NR_CPU_IRQS) remain unchanged.
> Moreover usage of ARC_NUMBER_OF_INTERRUPTS is bad for
> portability since it is not possible to change size
> of the interrupts table after linkage.
> 
> This patch makes these changes in IRQ subsystem:
> 
>   * NR_CPU_IRQS defines a maximum number of hardware interrupts.
>   * Remove ARC_NUMBER_OF_INTERRUPTS option and create interrupts
>     table for all possible hardware interrupts.
>   * Increase a maximum number of virtual IRQs to 512. ARCv2 can
>     support 240 interrupts in the core interrupts controllers
>     and 128 interrupts in IDU. Thus 512 virtual IRQs must be
>     enough for most configurations of boards.
> 
> Signed-off-by: Yuriy Kolerov <yuriy.kolerov at synopsys.com>

Applied to for-next.

Thx,
-Vineet
