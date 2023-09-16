Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6543AC2BA18
	for <linux-snps-arc@archiver.kernel.org>; Sat, 16 Sep 2023 19:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1IbK0pEld3cidkxPWDazZYvNB0nlsXW5JoEYlv95cM0=; b=ff4wKTVEQDlpAz
	WSqIBm68yrdJOQsiP2RogAOpLlbdBH7yvxNrd6xJiPqMrlHGYrWzXPpMtUhWqQ1aJ8zMNVvx0inEm
	ZRyWp9vXb/1qIljikokAM0CCR6TCAUNCOxQojM4yzU3A0uk31hO6bOaMwlKtdVTl9Th+yPc+coBLH
	pX8LiHBIcUKZCGZEscqsXwkq7n04Ng0ucb1K2blUMouhS2vAKqMo0g+E/wJX1ky2u/KTfvzBQtKpj
	RPjqfxu0ehEnR00KmbIzFflAEq/kosFwewMHRfAaF9DGaoz6XkdCAh/Iq9NBikPbc2G3e00qYEH77
	L8XCvSr8KxQc4ovToouw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhbBb-00Cm6y-2T;
	Sat, 16 Sep 2023 19:42:35 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhbBX-00Cm4z-0f;
	Sat, 16 Sep 2023 19:42:32 +0000
From: John Ogness <john.ogness@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1694893343;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/zPwTVnbIqykq0xrJwLN9r6avPOKHnWBnlaBD7Ntd/o=;
	b=CUQAEeiOCW0UB0mZHKKbATmxrT7v104AXTk8BgIS3LnhJdkwcK31VIKNUWTyr5NJ5FDSAZ
	1rUmkomzu0i8ra8Pr7MuVj6uXx2bx2AvsuHAsgoTtNXk1SlphGsF2Tko1c6bGtCosz+5D3
	3LvB5+XWrTyiZslCvN25C026vuzPMwe37ifQkKb5hvuaQ1IXWgjVHVi1QG1ERhp6yVLoCG
	KEjXv3lRy4sKTNf9zIytvVhfEZiamkJbj8QmGaOgd3j5PMU/plPNL9TqQlN3PM7t/8qtdr
	r8HTYvNQEPG5ZOF1NNpsGWfBpFE4WC9xOJQFYPlGWWvKaI1nzHahesMl0GR2sw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1694893343;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/zPwTVnbIqykq0xrJwLN9r6avPOKHnWBnlaBD7Ntd/o=;
	b=/s+j74ZDjoLeO5pQcnU/VyXRmqc0m+3/h/bRCXztbsATbbfdFH/5imwYhMMMSk+geHP+hf
	BWo+CyCuYQ4k1qBQ==
To: Ilpo =?utf-8?Q?J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, linux-serial <linux-serial@vger.kernel.org>, Petr Mladek <pmladek@suse.com>, Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>, Tobias Klauser <tklauser@distanz.ch>, Thierry Reding <treding@nvidia.com>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, Al Cooper <alcooperx@gmail.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Tony Lindgren <tony@atomide.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Ilpo =?utf-8?Q?J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, Florian Fainelli <f.fainelli@gmail.com>, Andrew Davis <afd@ti.com>, Matthew Howell <matthew.howell@sealevel.com>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Johan Hovold <johan@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>, linux-mediatek@lists.infradead.org, Lukas Wunner <lukas@wunner.de>, Matthias Schiffer <matthias.schiffer@ew.tq-group.com>, Arnd Bergmann <arnd@arndb.de>, Kumaravel Thiagarajan <kumaravel.thiagarajan@microchip.com>, Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>, Russell King <linux@armlinux.org.uk>, "Maciej W. Rozycki" <macro@orcam.me.uk>, Hongyu Xie <xiehongyu1@kylinos.cn>, Jiamei Xie <jiamei.xie@arm.com>, Rob Herring <robh@kernel.org>, delisun <delisun@pateo.com.cn>, Lino Sanfilippo <l.sanfilippo@kunbus.com>, Yangtao Li <frank.li@vivo.com>, Vineet Gupta <vgupta@kernel.org>, linux-snps-arc@lists.infradead.org, Richard Genoud <richard.genoud@gmail.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Arend van Spriel <arend.vanspriel@broadcom.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Baruch Siach <baruch@tkos.co.il>, Sherry Sun <sherry.sun@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Sergey Organov <sorganov@gmail.com>, Tom Rix <trix@redhat.com>, Marek Vasut <marex@denx.de>, Karol Gugala <kgugala@antmicro.com>, Mateusz Holenko <mholenko@antmicro.com>, Gabriel Somlo <gsomlo@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Dmitry Rokosov <ddrokosov@sberdevices.ru>, Lucas Tanure <tanure@linux.com>, linux-amlogic@lists.infradead.org, Taichi Sugaya <sugaya.taichi@socionext.com>, Takao Orito <orito.takao@socionext.com>, Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org, Pali =?utf-8?Q?Roh=C3=A1r?= <pali@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>, Manivannan Sadhasivam <mani@kernel.org>, linux-actions@lists.infradead.org, Xiongfeng Wang <wangxiongfeng2@huawei.com>, Yuan Can <yuancan@huawei.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, linux-unisoc@lists.infradead.org, Kevin Cernekee <cernekee@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, linux-samsung-soc@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@gmail.com>, Lech Perczak <lech.perczak@camlingroup.com>, Hugo Villeneuve <hvilleneuve@dimonoff.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, Isaac True <isaac.true@canonical.com>, Laxman Dewangan <ldewangan@nvidia.com>, Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Nick Hu <nick.hu@sifive.com>, Ruan Jinjie <ruanjinjie@huawei.com>, Samuel Holland <samuel.holland@sifive.com>, linux-riscv@lists.infradead.org, Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, Patrice Chotard <patrice.chotard@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Valentin Caron <valentin.caron@foss.st.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, linux-stm32@st-md-mailman.stormreply.com, "David S. Miller" <davem@davemloft.net>, sparclinux@vger.kernel.org, Hammer Hsieh <hammerh0314@gmail.com>, Peter Korsgaard <jacmet@sunsite.dk>, Timur Tabi <timur@kernel.org>, Mukesh Ojha <quic_mojha@quicinc.com>, Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Michal Simek <michal.simek@amd.com>
Subject: Re: [PATCH tty v1 00/74] serial: wrappers for uart port lock
In-Reply-To: <1446dc6-5ab0-629-45c8-3b7d8c76367d@linux.intel.com>
References: <20230914183831.587273-1-john.ogness@linutronix.de>
 <1446dc6-5ab0-629-45c8-3b7d8c76367d@linux.intel.com>
Date: Sat, 16 Sep 2023 21:48:14 +0206
Message-ID: <878r95nbvt.fsf@jogness.linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230916_124231_535235_188833AA 
X-CRM114-Status: GOOD (  12.50  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

T24gMjAyMy0wOS0xNSwgSWxwbyBKw6RydmluZW4gPGlscG8uamFydmluZW5AbGludXguaW50ZWwu
Y29tPiB3cm90ZToKPiBXb3VsZCB0aGlzIGFsc28gYmUgdXNlZnVsIHRvIGVuYWJsZSBwcmludGlu
ZyB0byBjb25zb2xlIHdoaWxlIHVuZGVyCj4gcG9ydCdzIGxvY2sgKGJ5IHBvc3Rwb25pbmcgdGhl
IG91dHB1dCB1bnRpbCB0aGUgbG9jayBpcyByZWxlYXNlZCk/Cj4KPiBFLmcuLCA4MjUwX2R3LmMg
aGFzIGhhZCB0aGlzIGNvbW1lbnRlZCBvdXQgc2luY2UgdGhlIGRhd24gb24gdGltZToKPiAgICAg
ICAgIC8qCj4gICAgICAgICAgKiBGSVhNRTogdGhpcyBkZWFkbG9ja3MgaWYgcG9ydC0+bG9jayBp
cyBhbHJlYWR5IGhlbGQKPiAgICAgICAgICAqIGRldl9lcnIocC0+ZGV2LCAiQ291bGRuJ3Qgc2V0
IExDUiB0byAlZFxuIiwgdmFsdWUpOwo+ICAgICAgICAgICovCgpZZXMsIHRoaXMgd2lsbCBmaXgg
c3VjaCBpc3N1ZXMuIEhvd2V2ZXIsIG9ubHkgZm9yIGNvbnNvbGVzIHRoYXQgYXJlCmNvbnZlcnRl
ZCB0byB0aGUgbmV3IE5CQ09OIGNvbnNvbGUgdHlwZS4KCkdvb2QgbmV3cywgdGhlIDgyNTAgZHJp
dmVyIHdpbGwgYmUgdGhlIGZsYWdzaGlwIGRyaXZlciB0aGF0IGlzIGNvbnZlcnRlZAphcyBwYXJ0
IG9mIHRoZSByZXdvcmsuIFNvIHRoaXMgcGFydGljdWxhciBpc3N1ZSB3aWxsIGJlIHNvbHZlZCB0
aGVuLiBJCndpbGwgdHJ5IHRvIHJlbWVtYmVyIHRoaXMgc28gdGhhdCBJIGNhbiByZW1vdmUgdGhl
IEZJWE1FIGluIHRoZSBzZXJpZXMuCgpUaGFua3MgZm9yIG1lbnRpb25pbmcgaXQuCgpKb2huCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1zbnBz
LWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
