Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D974C2BA12
	for <linux-snps-arc@archiver.kernel.org>; Sat, 16 Sep 2023 19:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LBsczI5kpeDFTzOF5hhYNUIPOJXl2mij96L6Q58hfc4=; b=v1+nli681h+jg/
	S64fNLtmGg4w5pDlsJN4fwRQ8Wh7XXZo2aG+6LVAHkBdeMErqBLFeGwjF7iI5AKeMd7FUpFVOaKpw
	zlDtoZC/vqxlGxC/rt8c1KbC5nVl006yIkOu8RG3gG/I+v3dgiblx3xog64EQgNpumofp1kYGKGmT
	J3bx4Czcy6L48dTr7fJ4vZ+4UKusnJJh7R1levfl+dZhPzIoWM18RPQMFTVFz5gwonzvpECh9nQsn
	ioM/AWZHswqNAIwSuoac1fR8PWmwNWtzeedO6ihwx2+6R/IQ1nyV6cyGL/x648ORizOdffSuBlBbA
	/sDHEwB9IoO7tLbGCsxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhauq-00ClUn-0J;
	Sat, 16 Sep 2023 19:25:16 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhaul-00ClTR-1O;
	Sat, 16 Sep 2023 19:25:13 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1694892303;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=a8n0XjUZ6thKLzBg4zGbfNoI7edHQdzShat04z4KQ9g=;
	b=1595OreDibrVkdt7HvKfIXGBRdDhpkYF4va8Y5P7THyGu6IKEtBOpeRp+5ix70xySRzy43
	asMvQZecCOmGMWRYcu080G+L9CWyUXq6Ici0UHMCmWNOFiA6J0kEtVZfLTLrvZ/B2J0Oc+
	wDGYuaobj/tfH9xqGfogbuUFtjeQGmKtjsJ1qU43qxM7Pjppc2jZQ32ZjMFlthF2SQaBJj
	O2JwVy7ARL8HzUSjoago9x/w5z5h6ZhUSr40SKlB14BW6OAMzGEzY18YoDWTdX6sLf2nUI
	TP8oLq2rZdl72SNz3pZDP6UC9LErJsogIkFN6HkmJFqBPd5i6OONJrz7mxpLzw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1694892303;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=a8n0XjUZ6thKLzBg4zGbfNoI7edHQdzShat04z4KQ9g=;
	b=UAIBu/8YLJZNb8MQTJRU7mPKHsPbGztf8IDiPVKNv8oW2oQvlyr/pxxvzQH6JIayVVmAHv
	JW7Glm3VPddLt6AA==
To: "Maciej W. Rozycki" <macro@orcam.me.uk>, Thomas Gleixner
 <tglx@linutronix.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, linux-serial@vger.kernel.org, Petr Mladek <pmladek@suse.com>, linux-kernel@vger.kernel.org, Tobias Klauser <tklauser@distanz.ch>, Thierry Reding <treding@nvidia.com>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, Al Cooper <alcooperx@gmail.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Tony Lindgren <tony@atomide.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Ilpo =?utf-8?Q?J?= =?utf-8?Q?=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, Florian Fainelli <f.fainelli@gmail.com>, Andrew Davis <afd@ti.com>, Matthew Howell <matthew.howell@sealevel.com>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Johan Hovold <johan@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>, linux-mediatek@lists.infradead.org, Lukas Wunner <lukas@wunner.de>, Matthias Schiffer <matthias.schiffer@ew.tq-group.com>, Arnd Bergmann <arnd@arndb.de>, Kumaravel Thiagarajan <kumaravel.thiagarajan@microchip.com>, Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>, Russell King <linux@armlinux.org.uk>, Hongyu Xie <xiehongyu1@kylinos.cn>, Jiamei Xie <jiamei.xie@arm.com>, Rob Herring <robh@kernel.org>, delisun <delisun@pateo.com.cn>, Lino Sanfilippo <l.sanfilippo@kunbus.com>, Yangtao Li <frank.li@vivo.com>, Vineet Gupta <vgupta@kernel.org>, linux-snps-arc@lists.infradead.org, Richard Genoud <richard.genoud@gmail.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Arend van Spriel <arend.vanspriel@broadcom.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Baruch Siach <baruch@tkos.co.il>, Sherry Sun <sherry.sun@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Sergey Organov <sorganov@gmail.com>, Tom Rix <trix@redhat.com>, Marek Vasut <marex@denx.de>, Karol Gugala <kgugala@antmicro.com>, Mateusz Holenko <mholenko@antmicro.com>, Gabriel Somlo <gsomlo@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Dmitry Rokosov <ddrokosov@sberdevices.ru>, Lucas Tanure <tanure@linux.com>, linux-amlogic@lists.infradead.org, Taichi Sugaya <sugaya.taichi@socionext.com>, Takao Orito <orito.takao@socionext.com>, Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org, Pali =?utf-8?Q?Roh=C3=A1r?= <pali@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>, Manivannan Sadhasivam <mani@kernel.org>, linux-actions@lists.infradead.org, Xiongfeng Wang <wangxiongfeng2@huawei.com>, Yuan Can <yuancan@huawei.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, linux-unisoc@lists.infradead.org, Kevin Cernekee <cernekee@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, linux-samsung-soc@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@gmail.com>, Lech Perczak <lech.perczak@camlingroup.com>, Hugo Villeneuve <hvilleneuve@dimonoff.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Isaac True <isaac.true@canonical.com>, Laxman Dewangan <ldewangan@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-tegra@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Nick Hu <nick.hu@sifive.com>, Ruan Jinjie <ruanjinjie@huawei.com>, Samuel Holland <samuel.holland@sifive.com>, linux-riscv@lists.infradead.org, Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, Patrice Chotard <patrice.chotard@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Valentin Caron <valentin.caron@foss.st.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, linux-stm32@st-md-mailman.stormreply.com, "David S. Miller" <davem@davemloft.net>, sparclinux@vger.kernel.org, Hammer Hsieh <hammerh0314@gmail.com>, Timur Tabi <timur@kernel.org>, Mukesh Ojha <quic_mojha@quicinc.com>, Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Michal Simek <michal.simek@amd.com>
Subject: Re: [PATCH tty v1 00/74] serial: wrappers for uart port lock
In-Reply-To: <alpine.DEB.2.21.2309151739290.57368@angie.orcam.me.uk>
References: <20230914183831.587273-1-john.ogness@linutronix.de>
 <alpine.DEB.2.21.2309141959100.57368@angie.orcam.me.uk>
 <87il8b1w3l.ffs@tglx>
 <alpine.DEB.2.21.2309151739290.57368@angie.orcam.me.uk>
Date: Sat, 16 Sep 2023 21:30:54 +0206
Message-ID: <87edixncop.fsf@jogness.linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230916_122511_777026_B71A4BB1 
X-CRM114-Status: UNSURE (   8.46  )
X-CRM114-Notice: Please train this message.
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

On 2023-09-15, "Maciej W. Rozycki" <macro@orcam.me.uk> wrote:
> Maybe dz.c shouldn't be touched by this series then?

Correct. This series is only wrapping the uart port lock, which dz.c is
not using.

> Though obviously both drivers will have to be eventually adapted for
> the ultimate console rework.

Correct.

Thanks for clarifying how the hardware works.

John

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
