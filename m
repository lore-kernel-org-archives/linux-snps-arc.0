Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 884B3ECAAD3
	for <linux-snps-arc@archiver.kernel.org>; Mon, 19 Sep 2022 22:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PXGAn32vhxNCRXR24QmlA9TjRgKtbLhU+odmEEvLrNM=; b=pHgiUh41xx+FzM
	CRjlVYUYWJss0gnyAxp5p3jAUvsXaiQNUyWc0WQUOFkKsR2gyN5XDcTuHRVGMsOFLAs5SciX+RUn4
	rRgAdO3tqCvTVTMahyixhtL6tZfYC1EKTCaJ5r/DHADN4q4Cu8+cWLeptDJTw0Hl/+08TPw0hPlBJ
	tWr2oCfS+P+qnrCvsQ3TRDqXnkT+VF5CScsSk8BviASdXdDmhEi9nLWxJiOIIJR4OpO9C8IPjA9ev
	LYZl5E0+dcg+uvut8Fb7DAIoTeIEmLd+8eG38yPiV2abMQdtd6i7Z7WF4drC4AR/T3jrQCIigc1rj
	NMvBZy1zEBG7vzOD6MFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaPgh-00G3mB-KD; Mon, 19 Sep 2022 22:56:28 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaPge-00G3iG-29
	for linux-snps-arc@lists.infradead.org; Mon, 19 Sep 2022 22:56:25 +0000
Received: by mail-ej1-x634.google.com with SMTP id y3so2148749ejc.1
        for <linux-snps-arc@lists.infradead.org>; Mon, 19 Sep 2022 15:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=5S9VBftUHA8Ab+AfT1DhnDF/jWnQCvfphMhw9w+YVhc=;
        b=pT3AVw/XaQKfMJa28M67X6CWfwalI0Uvo6unsRjOTD2Z+d/hMLJagRy91+fB9mWt/H
         RvjlLsn+3FsNx74QkbruJHKtTQ+30w35PYmoN36zBZvRhmzaaut2t/ejO0VHEYQ77EDj
         OXDYFEqkBBbGSPaGws21i+7eNFUtsVpC10Ocfp53V0C+AqpxtnC2gWLf09NvoZb8DNZe
         nefkWz5Q2xpTnqPE/9sJZpmszdShkKibcjHKjjaL4N2+oQKOJucjE0sZV5m8l2gxJQLL
         eUTG5Bs9Z5UoBJW4L2zlLkhjGsOc0HVn5guvp/vsJvOqjFnEQJHDOGaHy7aMupntX7WF
         7vTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=5S9VBftUHA8Ab+AfT1DhnDF/jWnQCvfphMhw9w+YVhc=;
        b=yPdcq0pmuJLT6ZvIi3JW/cozr24DGTcU3LXsLds8B94vRUibcuevggyYOyIlQDF6kt
         O+rXF7gF7ZGZlSZ3apEvu2P9oAOPpP7iQioexTII9rjaKUGBLi5Qi2rSwHuBTjauGMtE
         CnD59yw3ylZN1+2NumEP5dbI4O3kCCR1pu55qaHCUn/w1iDVGeeTrSNG8TFl2TA1kZsM
         wB79fwmYpLG+dL5NYVxs2oT7Mp22cFgimamaKCiu5eJmfEi1zRHO2vFmZzY0SwBgYvYT
         qwnRccUJFfbr4WutgEcsRulmgtSaYXiNUqj8lY4W+orXTTLkJgKJYJR5bR7I9nYwL/gx
         9Weg==
X-Gm-Message-State: ACrzQf3U925YuQQcn5HSEDrBme6SC8SFYGE0iI/eLdzQcGy36/tDkRt/
	vIL6XIu+NqOXrvTtmoZ6N4euYFSHJfQ5EFV/fd79NQ==
X-Google-Smtp-Source: AMsMyM5kdxcAfNB78ChbidtnpNAMschNYMIGpvHRr7zgKTZ4CCEGx6bhJgHHTNr9SAgKH+LAmfDCBtvH2R9hQBackB8=
X-Received: by 2002:a17:906:ef8c:b0:77c:8f77:330 with SMTP id
 ze12-20020a170906ef8c00b0077c8f770330mr14503775ejb.604.1663628181793; Mon, 19
 Sep 2022 15:56:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220701012647.2007122-1-saravanak@google.com>
 <YwS5J3effuHQJRZ5@kroah.com> <CAOesGMivJ5Q-jdeGKw32yhjmNiYctHjpEAnoMMRghYqWD2m2tw@mail.gmail.com>
 <YygsEtxKz8dsEstc@kroah.com>
In-Reply-To: <YygsEtxKz8dsEstc@kroah.com>
From: Olof Johansson <olof@lixom.net>
Date: Mon, 19 Sep 2022 15:56:09 -0700
Message-ID: <CAOesGMh5GHCONTQ9M1Ro7zW-hkL_1F7Xt=xRV0vYSfPY=7LYkQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Fix console probe delay when stdout-path isn't set
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Saravana Kannan <saravanak@google.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
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
	Michal Simek <michal.simek@xilinx.com>, Rob Herring <robh@kernel.org>, 
	sascha hauer <sha@pengutronix.de>, peng fan <peng.fan@nxp.com>, kevin hilman <khilman@kernel.org>, 
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
X-CRM114-CacheID: sfid-20220919_155624_112880_ACA93599 
X-CRM114-Status: GOOD (  38.94  )
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

On Mon, Sep 19, 2022 at 1:44 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Sun, Sep 18, 2022 at 08:44:27PM -0700, Olof Johansson wrote:
> > On Tue, Aug 23, 2022 at 8:37 AM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Thu, Jun 30, 2022 at 06:26:38PM -0700, Saravana Kannan wrote:
> > > > These patches are on top of driver-core-next.
> > > >
> > > > Even if stdout-path isn't set in DT, this patch should take console
> > > > probe times back to how they were before the deferred_probe_timeout
> > > > clean up series[1].
> > >
> > > Now dropped from my queue due to lack of a response to other reviewer's
> > > questions.
> >
> > What happened to this patch? I have a 10 second timeout on console
> > probe on my SiFive Unmatched, and I don't see this flag being set for
> > the serial driver. In fact, I don't see it anywhere in-tree. I can't
> > seem to locate another patchset from Saravana around this though, so
> > I'm not sure where to look for a missing piece for the sifive serial
> > driver.
> >
> > This is the second boot time regression (this one not fatal, unlike
> > the Layerscape PCIe one) from the fw_devlink patchset.
> >
> > Greg, can you revert the whole set for 6.0, please? It's obviously
> > nowhere near tested enough to go in and I expect we'll see a bunch of
> > -stable fixups due to this if we let it remain in.
>
> What exactly is "the whole set"?  I have the default option fix queued
> up and will send that to Linus later this week (am traveling back from
> Plumbers still), but have not heard any problems about any other issues
> at all other than your report.

I stand corrected in this case, the issue on the Hifive Unmatched was
a regression due to a PWM clock change -- I just sent a patch for that
(serial driver fix).

So it seems like as long as the fw_devlink.strict=1 patch is reverted,
things are back to a working state here.

I still struggle with how the fw_devlink patchset is expected to work
though, since DT is expected to describe the hardware configuration,
and it has no knowledge of whether there are drivers that will be
bound to any referenced supplier devnodes. It's not going to work well
to assume that they will always be bound, and to add 10 second
timeouts for those cases isn't a good solution. Seems like the number
of special cases will keep adding up.

The whole design feels like it's falling short, and it's been patched
here and there to deal with the shortcomings, instead of revisiting
the full solution. (The patches are the console one, and another to
deal with nfsroot boots).

As long as it doesn't keep regressing others, I suppose the work to
redesign it can happen in-tree, but it's not usually how we try to do
it for new functionality. Especially since it's still being iterated
on (with active patch sets posted around -rc1 for improvements).

Oh, and one more thing for the future -- the main patch that changes
behavior due to dependency tracking is 2f8c3ae8288e, named "driver
core: Add wait_for_init_devices_probe helper function". It's easy to
overlook this when looking at a list of patches since it's said to
just introduce a helper.


-Olof

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
