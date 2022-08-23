Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83D14C32772
	for <linux-snps-arc@archiver.kernel.org>; Tue, 23 Aug 2022 11:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QVgGLrIfz+/uApxveQiCBrmaP6r3wPXPkf7EQU+S/Sc=; b=fwQBver8W/EirY
	6ac5Y0uRN2yrShRWwnOm0jAEN3C74RBopQPYp2swt073leXGMDC9RM5W13JLIUlYWYVWhJsF5hos6
	R4TK2GydnZvKiXqjBZLeKfYlzssMja+5uqvvpVqrdnGw3vA4BYvWVjDtx2LBlhRTb0ggKKT49w2bi
	IS0wG1bdrOHyosZARP0d7ojN/Xr/dhypHI/Oo5NWPdqsON4hNEliUPop4CdwoCdjUfKi1z1zPhqlQ
	mYdGN+FtMmIbq4mQJeik7W2iFSH9m6VC47p4hP+7WfrldoRtNRz6bfD+cCOuacHtcsKo3DgnZ+hP2
	GkTBtxpyBgxZEzh/GaYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQS2Y-005Lde-QU; Tue, 23 Aug 2022 11:25:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQS2K-005LUu-0J; Tue, 23 Aug 2022 11:25:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 400D1612E7;
	Tue, 23 Aug 2022 11:25:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA8A2C433C1;
	Tue, 23 Aug 2022 11:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1661253932;
	bh=RHJfmfbErHaYXPty7Vle5Iu9cuS5MQAgVtFca0ryUqk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eJYYTySjiuQgiWdmHsEUf3gaqYRsV1W/Z9PLIP8bbagZnqtvifScrNxoueFvwcm3T
	 Yk1364u/0oUQTr/Hkj+z2Aw8PNbHS1Jg8lcSrwW47OgtNGbdVbQrShTlaHi6QTbXbk
	 EoqAhS4GC2KAhNC5E53bP4fCo7p4uCcB1QQ/uwdU=
Date: Tue, 23 Aug 2022 13:25:27 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Saravana Kannan <saravanak@google.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Laurentiu Tudor <laurentiu.tudor@nxp.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Paul Mackerras <paulus@samba.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Al Cooper <alcooperx@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Tobias Klauser <tklauser@distanz.ch>,
	Russell King <linux@armlinux.org.uk>,
	Vineet Gupta <vgupta@kernel.org>,
	Richard Genoud <richard.genoud@gmail.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Alexander Shiyan <shc_work@mail.ru>,
	Baruch Siach <baruch@tkos.co.il>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Karol Gugala <kgugala@antmicro.com>,
	Mateusz Holenko <mholenko@antmicro.com>,
	Gabriel Somlo <gsomlo@gmail.com>,
	Neil Armstrong <narmstrong@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Taichi Sugaya <sugaya.taichi@socionext.com>,
	Takao Orito <orito.takao@socionext.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Pali Rohar <pali@kernel.org>, Andreas Farber <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang7@gmail.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	"David S. Miller" <davem@davemloft.net>,
	Hammer Hsieh <hammerh0314@gmail.com>,
	Peter Korsgaard <jacmet@sunsite.dk>, Timur Tabi <timur@kernel.org>,
	Michal Simek <michal.simek@xilinx.com>,
	Rob Herring <robh@kernel.org>, sascha hauer <sha@pengutronix.de>,
	peng fan <peng.fan@nxp.com>, kevin hilman <khilman@kernel.org>,
	ulf hansson <ulf.hansson@linaro.org>,
	len brown <len.brown@intel.com>, pavel machek <pavel@ucw.cz>,
	joerg roedel <joro@8bytes.org>, will deacon <will@kernel.org>,
	andrew lunn <andrew@lunn.ch>,
	heiner kallweit <hkallweit1@gmail.com>,
	eric dumazet <edumazet@google.com>,
	jakub kicinski <kuba@kernel.org>, paolo abeni <pabeni@redhat.com>,
	linus walleij <linus.walleij@linaro.org>,
	hideaki yoshifuji <yoshfuji@linux-ipv6.org>,
	david ahern <dsahern@kernel.org>, kernel-team@android.com,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	iommu@lists.linux-foundation.org, netdev@vger.kernel.org,
	linux-gpio@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-rpi-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-tegra@vger.kernel.org, linux-snps-arc@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-actions@lists.infradead.org, linux-unisoc@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	sparclinux@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Fix console probe delay when stdout-path isn't set
Message-ID: <YwS5J3effuHQJRZ5@kroah.com>
References: <20220701012647.2007122-1-saravanak@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220701012647.2007122-1-saravanak@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220823_042536_168324_B40734EC 
X-CRM114-Status: GOOD (  13.08  )
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

On Thu, Jun 30, 2022 at 06:26:38PM -0700, Saravana Kannan wrote:
> These patches are on top of driver-core-next.
> 
> Even if stdout-path isn't set in DT, this patch should take console
> probe times back to how they were before the deferred_probe_timeout
> clean up series[1].

Now dropped from my queue due to lack of a response to other reviewer's
questions.

thanks,

greg k-h

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
