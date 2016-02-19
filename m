From: jason@lakedaemon.net (Jason Cooper)
Date: Fri, 19 Feb 2016 14:03:53 +0000
Subject: [PATCH v5 3/3] irqchip: add nps Internal and external irqchips
In-Reply-To: <1455216059-29632-4-git-send-email-noamc@ezchip.com>
References: <1455159741-21722-1-git-send-email-noamc@ezchip.com>
 <1455216059-29632-4-git-send-email-noamc@ezchip.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20160219140353.GV5183@io.lakedaemon.net>
To: linux-snps-arc@lists.infradead.org

Hey Noam,

Could you please re-send and attach a changelog:

On Thu, Feb 11, 2016@08:40:59PM +0200, Noam Camus wrote:
> From: Noam Camus <noamc at ezchip.com>
> 
> Adding EZchip NPS400 support.
> NPS internal interrupts are internally handled at
> Multi Thread Manager (MTM) that is signaled for deactivating
> an interrupt.
> External interrupts is handled also at Global Interrupt
> Controller (GIC) e.g. serial and network devices.
> 
> Signed-off-by: Noam Camus <noamc at ezchip.com>
> Cc: Thomas Gleixner <tglx at linutronix.de>
> Cc: Jason Cooper <jason at lakedaemon.net>
> Cc: Marc Zyngier <marc.zyngier at arm.com>
> ---

* here?

>  .../interrupt-controller/ezchip,nps400-ic.txt      |   17 +++
>  drivers/irqchip/Kconfig                            |    6 +
>  drivers/irqchip/Makefile                           |    1 +
>  drivers/irqchip/irq-eznps.c                        |  149 ++++++++++++++++++++
>  4 files changed, 173 insertions(+), 0 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/ezchip,nps400-ic.txt
>  create mode 100644 drivers/irqchip/irq-eznps.c

Thanks, it greatly assists review.  If you need an example, please take
a look at the patch submitted this morning by Thomas Petazzoni [1].

thx,

Jason.

[1] https://lkml.kernel.org/r/1455888883-5127-1-git-send-email-thomas.petazzoni at free-electrons.com
