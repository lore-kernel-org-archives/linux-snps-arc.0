From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 6 Nov 2015 05:25:07 +0000
Subject: [PATCH] MAINTAINERS: update DT binding doc locations
References: <1446752475-2708-1-git-send-email-robh@kernel.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075F44D0CB2@IN01WEMBXA.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Friday 06 November 2015 01:11 AM, Rob Herring wrote:
> After the recent moving of DT binding documents, some maintainers entries
> are stale. Update them to the new locations.
>
> In bindings/fb/, there were only 2 files and I'm assuming the FB
> maintainers don't want to be copied on all of bindings/display/. So I've
> dropped them.
>
> Reported-by: Thierry Reding <thierry.reding at gmail.com>
> Cc: Thierry Reding <thierry.reding at gmail.com>
> Cc: Jianwei Wang <jianwei.wang.chn at gmail.com>
> Cc: Alison Wang <alison.wang at freescale.com>
> Cc: Philipp Zabel <p.zabel at pengutronix.de>
> Cc: Mark Yao <mark.yao at rock-chips.com>
> Cc: Benjamin Gaignard <benjamin.gaignard at linaro.org>
> Cc: Vincent Abriou <vincent.abriou at st.com>
> Cc: Jean-Christophe Plagniol-Villard <plagnioj at jcrosoft.com>
> Cc: Tomi Valkeinen <tomi.valkeinen at ti.com>
> Cc: James Hogan <james.hogan at imgtec.com>
> Cc: Hans de Goede <hdegoede at redhat.com>
> Cc: Vineet Gupta <vgupta at synopsys.com>

For arc bits:
Acked-by: Vineet Gupta <vgupta at synopsys.com>

> Signed-off-by: Rob Herring <robh at kernel.org>
> ---
> ...
>  
> @@ -10072,6 +10072,7 @@ M:	Vineet Gupta <vgupta at synopsys.com>
>  S:	Supported
>  F:	arch/arc/
>  F:	Documentation/devicetree/bindings/arc/*
> +F:	Documentation/devicetree/bindings/interrupt-controller/snps,arc*
>  F:	drivers/tty/serial/arc_uart.c
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git
>  
