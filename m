Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF6DCEE645A
	for <linux-snps-arc@archiver.kernel.org>; Fri, 15 Sep 2023 12:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0WUTOltFUPT428kYXsOY77oB2mm3YzjfhhlrDp02jSk=; b=LWhKOIEcuXuoEV
	dCJfj7nXriYSYaPa9ZAWjsQ/8vBO/fJLjKM7uev5IpbqvRS5guLDAyrZYzrD+xhKuo+yxaXu0s+3U
	cbdJAUj7hBoVvvTjkfk6Mtox6CPaeDQc1mgqM81CSM9U6h/kDXzWwEnvunGZHJJNQpxq6iz26YD2i
	tKFMV4YjUJoD4Dj/q7BYJ5YiU2g6TN9QP2wP6X9bwWBqh3buzR2NUjej3Dpq2CW1nWTcfF6wjm7Aa
	BUZeghJviTcLkQrOiSZhY5/yF5aaVQq+g9OCRlVW8wV2ZKiHgMUKu3an/2W3Qrbw0y7Tz01NbN3l0
	21Pi0TFYK01ayh7MVTWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qh7Yb-00Agv8-2w;
	Fri, 15 Sep 2023 12:04:21 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qh7YX-00Agu5-0u;
	Fri, 15 Sep 2023 12:04:18 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1694779455;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=q3Ibg3p9cDagivhDktxq8eP8BYordpmk7hum3Axk04g=;
	b=hfofoNUXRajtM0GjlTDL3S8uCPrZulnUAl3sDOuUPa5oy4jGgAgNbuoN9zq30CvsIMo6cQ
	76S8YLIyYmUWLWqXq+B6LailcKKqcikZGHOc4Erpeot3J8LvMzg2R6WVBIi3xzRwnUY395
	pS/yCtuKAjRQXT0+x4oEIpQyUhpbeGdMECufG8cXCZoM+44lexmwXf4O2LHWyQ5xwYsTtI
	hG+jNq5wP5koi7uiKsR8aQVs4cDip7FcG5dlrN7qOoLDiEan+8YKeUcutQq6RBBnllQ/za
	F8F1a6fTyU+1T0L+VnAkTGdL1QBpNnEZDKqVeyezp0ZEm/31ANRktL+QyqAdKA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1694779455;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=q3Ibg3p9cDagivhDktxq8eP8BYordpmk7hum3Axk04g=;
	b=XoGHAuaQljzpxY7rNPRk66q5CkUTImgsUWadAIDMEofDY3WaI6vm1ZUxH4Wc2bfKw2zqPJ
	9SjBirKXUrFTwlAA==
To: "Maciej W. Rozycki" <macro@orcam.me.uk>, John Ogness
 <john.ogness@linutronix.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, linux-serial@vger.kernel.org, Petr Mladek <pmladek@suse.com>, linux-kernel@vger.kernel.org, Tobias Klauser <tklauser@distanz.ch>, Thierry Reding <treding@nvidia.com>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, Al Cooper <alcooperx@gmail.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Tony Lindgren <tony@atomide.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Ilpo =?utf-8?Q?J?= =?utf-8?Q?=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, Florian Fainelli <f.fainelli@gmail.com>, Andrew Davis <afd@ti.com>, Matthew Howell <matthew.howell@sealevel.com>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Johan Hovold <johan@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>, linux-mediatek@lists.infradead.org, Lukas Wunner <lukas@wunner.de>, Matthias Schiffer <matthias.schiffer@ew.tq-group.com>, Arnd Bergmann <arnd@arndb.de>, Kumaravel Thiagarajan <kumaravel.thiagarajan@microchip.com>, Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>, Russell King <linux@armlinux.org.uk>, Hongyu Xie <xiehongyu1@kylinos.cn>, Jiamei Xie <jiamei.xie@arm.com>, Rob Herring <robh@kernel.org>, delisun <delisun@pateo.com.cn>, Lino Sanfilippo <l.sanfilippo@kunbus.com>, Yangtao Li <frank.li@vivo.com>, Vineet Gupta <vgupta@kernel.org>, linux-snps-arc@lists.infradead.org, Richard Genoud <richard.genoud@gmail.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Arend van Spriel <arend.vanspriel@broadcom.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Baruch Siach <baruch@tkos.co.il>, Sherry Sun <sherry.sun@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Sergey Organov <sorganov@gmail.com>, Tom Rix <trix@redhat.com>, Marek Vasut <marex@denx.de>, Karol Gugala <kgugala@antmicro.com>, Mateusz Holenko <mholenko@antmicro.com>, Gabriel Somlo <gsomlo@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Dmitry Rokosov <ddrokosov@sberdevices.ru>, Lucas Tanure <tanure@linux.com>, linux-amlogic@lists.infradead.org, Taichi Sugaya <sugaya.taichi@socionext.com>, Takao Orito <orito.takao@socionext.com>, Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org, Pali =?utf-8?Q?Roh=C3=A1r?= <pali@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>, Manivannan Sadhasivam <mani@kernel.org>, linux-actions@lists.infradead.org, Xiongfeng Wang <wangxiongfeng2@huawei.com>, Yuan Can <yuancan@huawei.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, linux-unisoc@lists.infradead.org, Kevin Cernekee <cernekee@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, linux-samsung-soc@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@gmail.com>, Lech Perczak <lech.perczak@camlingroup.com>, Hugo Villeneuve <hvilleneuve@dimonoff.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Isaac True <isaac.true@canonical.com>, Laxman Dewangan <ldewangan@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-tegra@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Nick Hu <nick.hu@sifive.com>, Ruan Jinjie <ruanjinjie@huawei.com>, Samuel Holland <samuel.holland@sifive.com>, linux-riscv@lists.infradead.org, Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, Patrice Chotard <patrice.chotard@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Valentin Caron <valentin.caron@foss.st.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, linux-stm32@st-md-mailman.stormreply.com, "David S. Miller" <davem@davemloft.net>, sparclinux@vger.kernel.org, Hammer Hsieh <hammerh0314@gmail.com>, Peter Korsgaard <jacmet@sunsite.dk>, Timur Tabi <timur@kernel.org>, Mukesh Ojha <quic_mojha@quicinc.com>, Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Michal Simek <michal.simek@amd.com>
Subject: Re: [PATCH tty v1 00/74] serial: wrappers for uart port lock
In-Reply-To: <alpine.DEB.2.21.2309141959100.57368@angie.orcam.me.uk>
References: <20230914183831.587273-1-john.ogness@linutronix.de>
 <alpine.DEB.2.21.2309141959100.57368@angie.orcam.me.uk>
Date: Fri, 15 Sep 2023 14:04:14 +0200
Message-ID: <87il8b1w3l.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_050417_602009_1D7E4F3E 
X-CRM114-Status: GOOD (  10.52  )
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

On Thu, Sep 14 2023 at 20:01, Maciej W. Rozycki wrote:

> On Thu, 14 Sep 2023, John Ogness wrote:
>
>> Patches 2-74 switch all uart port locking call sites to use the new
>> wrappers. These patches were automatically generated using coccinelle.
>
>  Hmm, no need to do this for drivers/tty/serial/zs.c?

zs.c does not use port lock at all. It has like a couple of other
drivers a local homebrewn spinlock.

Thanks,

        tglx

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
