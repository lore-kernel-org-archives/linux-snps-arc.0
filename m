Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14A61C43334
	for <linux-snps-arc@archiver.kernel.org>; Fri,  1 Jul 2022 02:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Mime-Version:
	Message-Id:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=QGICQcVgK83tb/Yr0OpNORxLIRmPS13223jRsQUouz8=; b=DzK
	q2bWffOVXsAOYhmF3S246v31pgmDUgNb0Q8ibT11OUo+WDZJcNocaTIb1fFxI7C5Dinae9H1SwtLB
	tDgr/CP0EtX+BXXtMEwRKClJchelsfmJkst6B+rozsMyTO7JG5DEjjKBYEJ24oF6j4n2ZTOlcOwp7
	sXQxkETLOZqGXc9tQphHuAMW1rHe0CIX6nq9HnQeHdxKipu+F/b+ZAcX4h743OsiiqQq+gfBTM9P+
	yz/OdKos6GEoSDJZoFkQMcvjJix5ytxoqmJ6m60A7GsIDctkX9+vMb1rbLHpHtlHkvlq2Fe81h0L1
	GjWk/4ocLVVGeIA0G0nhXnOyP+yyupQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o76Qt-002QMv-8N; Fri, 01 Jul 2022 02:30:59 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o75Qw-002H4k-FS
	for linux-snps-arc@lists.infradead.org; Fri, 01 Jul 2022 01:27:06 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-31c20461d7eso8105767b3.19
        for <linux-snps-arc@lists.infradead.org>; Thu, 30 Jun 2022 18:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=enThZq3GNhnkWKPd/daPanpJOP+0ijq4hNHtFP2b8Uo=;
        b=ZGHrQo8oKcs/1MxqUV66WuroIOiuRhyDQTe/h9dNu56quZHoJH2GUaDbRl2ttRwgEe
         SWqVcY/Veo5jphceJDpwMYzMdOJ0QXdCPktWf948t9BiLW5nmwSSwTlpJciNH3VIewIt
         3ASh6A26F+KmkZttZjFaUnZEb4Vdr+50D/q0gexLqMMmpJA7NpBHgj2jcBkr1ZyXcHXM
         U6Xnoa3WH+ep5XzMHbrLnEz24W5g5SeejVYD0NuN3ckqaoVAfjVlh+5k/BsS4sAB5hq6
         ohdGwKO24kRPaNPr4udjwZ2k4/3lgZFaY78w+9+WaY8oo3hWqIQJ8JqaHbOBVz/YVY0e
         BS/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=enThZq3GNhnkWKPd/daPanpJOP+0ijq4hNHtFP2b8Uo=;
        b=hf46v27adcLI6tCfZ0an/9vroj3oKIomO4v1vmjE0fB7V2LFh98IRRY90kloLXGR99
         n6W5q2EXlS+cHbUz4GNUVjIwr3gk9ylKFx83hEpBePZVch6kid7ObPAQ52ZDE18dSL4I
         E8k1ZapY0AJ4XKs+60le+PY7au2d1hQ5toBtkJVFIVbRTTSPD22gUkA9lNVbKlDtr6ht
         PTf/f278vZwUaVYxHNNT+FrS+fob6uErqnItUWK6WBzCodN93fQSb63ycf6ThSswPCh4
         tGjCEqrtPXlqGM7QWXUpxjXnHvIHaSJ/aUZaNptNGyk323O/Co3tT+1jizsjrWQp09ie
         kKKQ==
X-Gm-Message-State: AJIora+QRQ7iITRjCuQOZj/3pzO00+XBM1dwmtWYI5eprqm/1GvhtdMw
	No21ngATmBMPD3Pn8iVbdoi90jasL4lNp+4=
X-Google-Smtp-Source: AGRyM1uVtkICZeFb41qzlKfYUlr23L197fZnFh7B1zLJMqch7Nth1saNWtsGGUH9YN1+Q9+ZxuB5n3WOpcD3GoA=
X-Received: from saravanak.san.corp.google.com ([2620:15c:2d:3:3973:d0f0:34a8:bf61])
 (user=saravanak job=sendgmr) by 2002:a25:4b02:0:b0:66c:8709:44d1 with SMTP id
 y2-20020a254b02000000b0066c870944d1mr12352911yba.602.1656638811027; Thu, 30
 Jun 2022 18:26:51 -0700 (PDT)
Date: Thu, 30 Jun 2022 18:26:38 -0700
Message-Id: <20220701012647.2007122-1-saravanak@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
Subject: [PATCH v2 0/2] Fix console probe delay when stdout-path isn't set
From: Saravana Kannan <saravanak@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Laurentiu Tudor <laurentiu.tudor@nxp.com>, Jiri Slaby <jirislaby@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
	Paul Mackerras <paulus@samba.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, 
	Nicolas Saenz Julienne <nsaenz@kernel.org>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Al Cooper <alcooperx@gmail.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Paul Cercueil <paul@crapouillou.net>, 
	Vladimir Zapolskiy <vz@mleia.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Tobias Klauser <tklauser@distanz.ch>, Russell King <linux@armlinux.org.uk>, 
	Vineet Gupta <vgupta@kernel.org>, Richard Genoud <richard.genoud@gmail.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@microchip.com>, Alexander Shiyan <shc_work@mail.ru>, 
	Baruch Siach <baruch@tkos.co.il>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
	Karol Gugala <kgugala@antmicro.com>, Mateusz Holenko <mholenko@antmicro.com>, 
	Gabriel Somlo <gsomlo@gmail.com>, Neil Armstrong <narmstrong@baylibre.com>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Taichi Sugaya <sugaya.taichi@socionext.com>, Takao Orito <orito.takao@socionext.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <bjorn.andersson@linaro.org>, Pali Rohar <pali@kernel.org>, 
	Andreas Farber <afaerber@suse.de>, Manivannan Sadhasivam <mani@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Laxman Dewangan <ldewangan@nvidia.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang7@gmail.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, "David S. Miller" <davem@davemloft.net>, 
	Hammer Hsieh <hammerh0314@gmail.com>, Peter Korsgaard <jacmet@sunsite.dk>, Timur Tabi <timur@kernel.org>, 
	Michal Simek <michal.simek@xilinx.com>, Saravana Kannan <saravanak@google.com>
Cc: Rob Herring <robh@kernel.org>, sascha hauer <sha@pengutronix.de>, peng fan <peng.fan@nxp.com>, 
	kevin hilman <khilman@kernel.org>, ulf hansson <ulf.hansson@linaro.org>, 
	len brown <len.brown@intel.com>, pavel machek <pavel@ucw.cz>, joerg roedel <joro@8bytes.org>, 
	will deacon <will@kernel.org>, andrew lunn <andrew@lunn.ch>, heiner kallweit <hkallweit1@gmail.com>, 
	eric dumazet <edumazet@google.com>, jakub kicinski <kuba@kernel.org>, paolo abeni <pabeni@redhat.com>, 
	linus walleij <linus.walleij@linaro.org>, hideaki yoshifuji <yoshfuji@linux-ipv6.org>, 
	david ahern <dsahern@kernel.org>, kernel-team@android.com, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, iommu@lists.linux-foundation.org, 
	netdev@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-serial@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-rpi-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-actions@lists.infradead.org, 
	linux-unisoc@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	sparclinux@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220630_182658_680105_6D784701 
X-CRM114-Status: GOOD (  11.06  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

These patches are on top of driver-core-next.

Even if stdout-path isn't set in DT, this patch should take console
probe times back to how they were before the deferred_probe_timeout
clean up series[1].

v1->v2:
- Fixed the accidental change that Tobias pointed out.
- Added Tested-by tag

[1] - https://lore.kernel.org/lkml/20220601070707.3946847-1-saravanak@google.com/

-Saravana

cc: Rob Herring <robh@kernel.org>
cc: sascha hauer <sha@pengutronix.de>
cc: peng fan <peng.fan@nxp.com>
cc: kevin hilman <khilman@kernel.org>
cc: ulf hansson <ulf.hansson@linaro.org>
cc: len brown <len.brown@intel.com>
cc: pavel machek <pavel@ucw.cz>
cc: joerg roedel <joro@8bytes.org>
cc: will deacon <will@kernel.org>
cc: andrew lunn <andrew@lunn.ch>
cc: heiner kallweit <hkallweit1@gmail.com>
cc: russell king <linux@armlinux.org.uk>
cc: "david s. miller" <davem@davemloft.net>
cc: eric dumazet <edumazet@google.com>
cc: jakub kicinski <kuba@kernel.org>
cc: paolo abeni <pabeni@redhat.com>
cc: linus walleij <linus.walleij@linaro.org>
cc: hideaki yoshifuji <yoshfuji@linux-ipv6.org>
cc: david ahern <dsahern@kernel.org>
cc: kernel-team@android.com
cc: linux-kernel@vger.kernel.org
cc: linux-pm@vger.kernel.org
cc: iommu@lists.linux-foundation.org
cc: netdev@vger.kernel.org
cc: linux-gpio@vger.kernel.org
Cc: kernel@pengutronix.de

Saravana Kannan (2):
  driver core: Add probe_no_timeout flag for drivers
  serial: Set probe_no_timeout for all DT based drivers

 drivers/base/base.h                         |  1 +
 drivers/base/core.c                         |  7 +++++++
 drivers/base/dd.c                           |  3 +++
 drivers/tty/ehv_bytechan.c                  |  1 +
 drivers/tty/goldfish.c                      |  1 +
 drivers/tty/hvc/hvc_opal.c                  |  1 +
 drivers/tty/serial/8250/8250_aspeed_vuart.c |  1 +
 drivers/tty/serial/8250/8250_bcm2835aux.c   |  1 +
 drivers/tty/serial/8250/8250_bcm7271.c      |  1 +
 drivers/tty/serial/8250/8250_dw.c           |  1 +
 drivers/tty/serial/8250/8250_em.c           |  1 +
 drivers/tty/serial/8250/8250_ingenic.c      |  1 +
 drivers/tty/serial/8250/8250_lpc18xx.c      |  1 +
 drivers/tty/serial/8250/8250_mtk.c          |  1 +
 drivers/tty/serial/8250/8250_of.c           |  1 +
 drivers/tty/serial/8250/8250_omap.c         |  1 +
 drivers/tty/serial/8250/8250_pxa.c          |  1 +
 drivers/tty/serial/8250/8250_tegra.c        |  1 +
 drivers/tty/serial/8250/8250_uniphier.c     |  1 +
 drivers/tty/serial/altera_jtaguart.c        |  1 +
 drivers/tty/serial/altera_uart.c            |  1 +
 drivers/tty/serial/amba-pl011.c             |  1 +
 drivers/tty/serial/apbuart.c                |  1 +
 drivers/tty/serial/ar933x_uart.c            |  1 +
 drivers/tty/serial/arc_uart.c               |  1 +
 drivers/tty/serial/atmel_serial.c           |  1 +
 drivers/tty/serial/bcm63xx_uart.c           |  1 +
 drivers/tty/serial/clps711x.c               |  1 +
 drivers/tty/serial/cpm_uart/cpm_uart_core.c |  1 +
 drivers/tty/serial/digicolor-usart.c        |  1 +
 drivers/tty/serial/fsl_linflexuart.c        |  1 +
 drivers/tty/serial/fsl_lpuart.c             |  1 +
 drivers/tty/serial/imx.c                    |  1 +
 drivers/tty/serial/lantiq.c                 |  1 +
 drivers/tty/serial/liteuart.c               |  1 +
 drivers/tty/serial/lpc32xx_hs.c             |  1 +
 drivers/tty/serial/max310x.c                |  1 +
 drivers/tty/serial/meson_uart.c             |  1 +
 drivers/tty/serial/milbeaut_usio.c          |  1 +
 drivers/tty/serial/mpc52xx_uart.c           |  1 +
 drivers/tty/serial/mps2-uart.c              |  1 +
 drivers/tty/serial/msm_serial.c             |  1 +
 drivers/tty/serial/mvebu-uart.c             |  1 +
 drivers/tty/serial/mxs-auart.c              |  1 +
 drivers/tty/serial/omap-serial.c            |  1 +
 drivers/tty/serial/owl-uart.c               |  1 +
 drivers/tty/serial/pic32_uart.c             |  1 +
 drivers/tty/serial/pmac_zilog.c             |  1 +
 drivers/tty/serial/pxa.c                    |  1 +
 drivers/tty/serial/qcom_geni_serial.c       |  1 +
 drivers/tty/serial/rda-uart.c               |  1 +
 drivers/tty/serial/samsung_tty.c            |  1 +
 drivers/tty/serial/sc16is7xx.c              |  1 +
 drivers/tty/serial/serial-tegra.c           |  1 +
 drivers/tty/serial/sh-sci.c                 |  1 +
 drivers/tty/serial/sifive.c                 |  1 +
 drivers/tty/serial/sprd_serial.c            |  1 +
 drivers/tty/serial/st-asc.c                 |  1 +
 drivers/tty/serial/stm32-usart.c            |  1 +
 drivers/tty/serial/sunhv.c                  |  1 +
 drivers/tty/serial/sunplus-uart.c           |  1 +
 drivers/tty/serial/sunsab.c                 |  1 +
 drivers/tty/serial/sunsu.c                  |  1 +
 drivers/tty/serial/sunzilog.c               |  1 +
 drivers/tty/serial/tegra-tcu.c              |  1 +
 drivers/tty/serial/uartlite.c               |  1 +
 drivers/tty/serial/ucc_uart.c               |  1 +
 drivers/tty/serial/vt8500_serial.c          |  1 +
 drivers/tty/serial/xilinx_uartps.c          |  1 +
 include/linux/device.h                      |  7 +++++++
 include/linux/device/driver.h               | 11 +++++++++++
 71 files changed, 95 insertions(+)

-- 
2.37.0.rc0.161.g10f37bed90-goog


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
