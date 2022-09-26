Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42F2FC32771
	for <linux-snps-arc@archiver.kernel.org>; Mon, 26 Sep 2022 18:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bEJy0LFapkBI2gD1QiBbQoqC9xcozbknljVqb9pLikc=; b=jzChBFSDVmEN2k
	Eg+7kTKw3IiGupUA06B5yAUZiJx+EtPT7ZA8/jv95yvKV5ivaDjhz0ytUpxLL543SzebyjKDhQb8D
	AELINUw/gmxPfLzEyAJB6+5xTgmYcYJ2wdeJcyuCf6m42Ald6Eqp5YrEvrkuIpPGCQVQGOsopYLZB
	j/t22aWtKwwgKNTiiehHirKC/A7xUx+i932KVuDOjH9robv7ff47r3HVvDtC7eFt6jN76gi0XerMp
	zqisL+XQTHUoq1x7nrRPf5Eb9cSYoL9xLv6+rvJjVPQkkoOZHoH1Owy7yyzc6FsyhDeShkynafte/
	3lxPcnrtvzg2yB6WdfvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocsnT-006H4S-SX; Mon, 26 Sep 2022 18:25:39 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocsnM-006H1h-Jy; Mon, 26 Sep 2022 18:25:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 2EE95B80D38;
	Mon, 26 Sep 2022 18:25:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 511A9C4314F;
	Mon, 26 Sep 2022 18:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664216729;
	bh=Y5qLzRGdsOCwx5ouHFiN9SCKtz+YXlGNMDHQ/+qU8uw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=J4Gpyrjp5Ac3/0WEXKzD2q8xPAGnJawSZa8f6rOYxdt0mKmkj9MN103fi8O8KaXQr
	 rKWbgtkn5zJF3KKNnZSQ2JILojCcgiBN0x9ZmlZL2GWqEeKQ2pnT/IWJv7Iu+jDIOh
	 96blNui3VgWUy3swBEpS0oA6MLP9rJH0OAtT9Od305+7MRAmsIyCAIiUz2OBTF0k7d
	 eFkt78ESdu5i0S+8YOqHyVZJX5e+tQFk5eoCDYSLZSngY7LY4QoLDMkkzhldYUbQsv
	 TGBigf9PLmjOkjjLolgemDpPgE6cZ2Kk9OjuxUnAkhFtQMWWo0u/C1+B6MAJ1CUpMy
	 dmsu9IhVknvqQ==
Received: by mail-ot1-f45.google.com with SMTP id u6-20020a056830118600b006595e8f9f3fso5010228otq.1;
        Mon, 26 Sep 2022 11:25:29 -0700 (PDT)
X-Gm-Message-State: ACrzQf11g9A7M3StcyolYbQsjGXKDIdMAVksmRSMWbLvr6KSqSI4sZjk
	2jwo26V2YTdm2PFFUeTL5THnDXfhkQsPi3cP2A==
X-Google-Smtp-Source: AMsMyM5WOL0fZfHYzWaw2DdaPSr6kh7DGRI2ScO+UdVg2zStt3aJXG4qtOOC5FFK87yV5Mi/AUvaSMeil9/+6K1KBfA=
X-Received: by 2002:a81:6608:0:b0:351:4cd2:d59a with SMTP id
 a8-20020a816608000000b003514cd2d59amr1485347ywc.432.1664216717388; Mon, 26
 Sep 2022 11:25:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220701012647.2007122-1-saravanak@google.com>
 <YwS5J3effuHQJRZ5@kroah.com> <CAOesGMivJ5Q-jdeGKw32yhjmNiYctHjpEAnoMMRghYqWD2m2tw@mail.gmail.com>
 <YygsEtxKz8dsEstc@kroah.com> <CAOesGMh5GHCONTQ9M1Ro7zW-hkL_1F7Xt=xRV0vYSfPY=7LYkQ@mail.gmail.com>
In-Reply-To: <CAOesGMh5GHCONTQ9M1Ro7zW-hkL_1F7Xt=xRV0vYSfPY=7LYkQ@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 26 Sep 2022 13:25:05 -0500
X-Gmail-Original-Message-ID: <CAL_JsqK7auA8coB3DCqSDKw1ept_yQihVs-Me3bvU923os23xg@mail.gmail.com>
Message-ID: <CAL_JsqK7auA8coB3DCqSDKw1ept_yQihVs-Me3bvU923os23xg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Fix console probe delay when stdout-path isn't set
To: Olof Johansson <olof@lixom.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Saravana Kannan <saravanak@google.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Laurentiu Tudor <laurentiu.tudor@nxp.com>, 
	Jiri Slaby <jirislaby@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, 
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
	Michal Simek <michal.simek@xilinx.com>, sascha hauer <sha@pengutronix.de>, 
	peng fan <peng.fan@nxp.com>, kevin hilman <khilman@kernel.org>, 
	ulf hansson <ulf.hansson@linaro.org>, len brown <len.brown@intel.com>, 
	pavel machek <pavel@ucw.cz>, joerg roedel <joro@8bytes.org>, will deacon <will@kernel.org>, 
	andrew lunn <andrew@lunn.ch>, heiner kallweit <hkallweit1@gmail.com>, 
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
X-CRM114-CacheID: sfid-20220926_112532_980528_FEA43B50 
X-CRM114-Status: GOOD (  42.90  )
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

On Mon, Sep 19, 2022 at 5:56 PM Olof Johansson <olof@lixom.net> wrote:
>
> On Mon, Sep 19, 2022 at 1:44 AM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Sun, Sep 18, 2022 at 08:44:27PM -0700, Olof Johansson wrote:
> > > On Tue, Aug 23, 2022 at 8:37 AM Greg Kroah-Hartman
> > > <gregkh@linuxfoundation.org> wrote:
> > > >
> > > > On Thu, Jun 30, 2022 at 06:26:38PM -0700, Saravana Kannan wrote:
> > > > > These patches are on top of driver-core-next.
> > > > >
> > > > > Even if stdout-path isn't set in DT, this patch should take console
> > > > > probe times back to how they were before the deferred_probe_timeout
> > > > > clean up series[1].
> > > >
> > > > Now dropped from my queue due to lack of a response to other reviewer's
> > > > questions.
> > >
> > > What happened to this patch? I have a 10 second timeout on console
> > > probe on my SiFive Unmatched, and I don't see this flag being set for
> > > the serial driver. In fact, I don't see it anywhere in-tree. I can't
> > > seem to locate another patchset from Saravana around this though, so
> > > I'm not sure where to look for a missing piece for the sifive serial
> > > driver.
> > >
> > > This is the second boot time regression (this one not fatal, unlike
> > > the Layerscape PCIe one) from the fw_devlink patchset.
> > >
> > > Greg, can you revert the whole set for 6.0, please? It's obviously
> > > nowhere near tested enough to go in and I expect we'll see a bunch of
> > > -stable fixups due to this if we let it remain in.
> >
> > What exactly is "the whole set"?  I have the default option fix queued
> > up and will send that to Linus later this week (am traveling back from
> > Plumbers still), but have not heard any problems about any other issues
> > at all other than your report.
>
> I stand corrected in this case, the issue on the Hifive Unmatched was
> a regression due to a PWM clock change -- I just sent a patch for that
> (serial driver fix).
>
> So it seems like as long as the fw_devlink.strict=1 patch is reverted,
> things are back to a working state here.
>
> I still struggle with how the fw_devlink patchset is expected to work
> though, since DT is expected to describe the hardware configuration,
> and it has no knowledge of whether there are drivers that will be
> bound to any referenced supplier devnodes. It's not going to work well
> to assume that they will always be bound, and to add 10 second
> timeouts for those cases isn't a good solution. Seems like the number
> of special cases will keep adding up.

Since the introduction of deferred probe, the kernel has always
assumed if there is a device described, then there is or will be a
driver for it. The result is you can't use new DTs (if they add
providers) with older kernels.

We've ended up with a timeout because no one has come up with a better
way to handle it. What the kernel needs is userspace saying "I'm done
loading modules", but it's debatable whether that's a good solution
too.

Rob

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
