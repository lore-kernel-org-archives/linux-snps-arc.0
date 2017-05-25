From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Thu, 25 May 2017 11:14:59 +0000
Subject: [PATCH 10/10] ARC: [plat-eznps] Handle memory error as an
 exception
In-Reply-To: <1495679660-9598-11-git-send-email-noamca@mellanox.com>
References: <1495679660-9598-1-git-send-email-noamca@mellanox.com>
 <1495679660-9598-11-git-send-email-noamca@mellanox.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1495710896.5393.32.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Noam,

On Thu, 2017-05-25@05:34 +0300, Noam Camus wrote:
> From: Noam Camus <noamca at mellanox.com>
> 
> This commit adds the configuration CONFIG_EZNPS_MEM_ERROR.
> If set, it will cause the kernel to handle user memory error
> as a machine check exception.
> It is required in order to align the NPS simulator memory
> error handling to the one of the NPS400 real chip behavior.
> 
> Signed-off-by: Elad Kanfi <eladkan at mellanox.com>
> Signed-off-by: Noam Camus <noamca at mellanox.com>
> ---
> ?arch/arc/kernel/entry-compact.S |???11 +++++++++++
> ?arch/arc/plat-eznps/Kconfig?????|???11 +++++++++++
> ?2 files changed, 22 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arc/kernel/entry-compact.S b/arch/arc/kernel/entry-compact.S
> index f285dbb..d152d36 100644
> --- a/arch/arc/kernel/entry-compact.S
> +++ b/arch/arc/kernel/entry-compact.S
> @@ -203,6 +203,17 @@ END(handle_interrupt_level2)
> ?; ---------------------------------------------
> ?ENTRY(mem_service)
> ?
> +#if defined(CONFIG_EZNPS_MEM_ERROR)
> +????????; SW workaround to cover up on a difference between
> +????????; NPS real chip and simulator behaviors.
> +????????; NPS real chip will activate a machine check exception
> +????????; in case of memory error, while the simulator will
> +????????; trigger a level 2 interrupt. Therefor this code section
> +????????; should be reached only in simulation mode.
> +????????; DEAD END: display Regs and HALT

I'm not really buying that.

Why don't you just make simulator behaving exactly as your real chip?

Adding those stubs for some corner-cases here and there complicate code,
affect maintainability etc.

-Alexey
