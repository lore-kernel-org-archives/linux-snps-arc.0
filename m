Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F369EC32793
	for <linux-snps-arc@archiver.kernel.org>; Wed, 24 Aug 2022 01:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7hvyLZjD6jRJmpmFryXj/7Rd3fAc0QZYYyuCEHhbxmE=; b=qjk6WyDUoLEBJx
	1AGCgOU7bPEUOSbcGFVIdcnVg1ITQSk7eHghVhvteyEPPBaZZyfEwktbFFaT5J997huyHRSdB+XXx
	A5FhmawNEW09XBUlrXXiatD6M5v1F967hU3MpLI0vPb1vYmRgvYsic96Vinadx5RKH0J5gcDBJqdT
	0XKqwfhiqpz62mj2kDdlD7tRsg7oRdfTDPkcDdnSp8bEUvCoGnaAZkJGsl0wmpKINIOtuAn9ag0Db
	Ca6Bn9PyOHkRzT1pgLcEV6YWYnSDJT/sBBv6aCEJ/ZWqZZ5GhXfaprGCwT8rL3Aa/hr8iWbLBETCY
	4uLYD1aEkJi+PzfQ+Chw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQfHM-009qQO-CN; Wed, 24 Aug 2022 01:34:00 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQfHB-009qHL-Te
	for linux-snps-arc@lists.infradead.org; Wed, 24 Aug 2022 01:33:58 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-33387bf0c4aso423784187b3.11
        for <linux-snps-arc@lists.infradead.org>; Tue, 23 Aug 2022 18:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=15+zFGICN73u7PZkuVftuGFAaRqO2hNiuUPbcuB/iDw=;
        b=ammrl+ffQIbxpXELKnFxaurs3Fbe2bx9R/IRI2+J5pQAM/wfjFh1aSFzyWG/E1RD5I
         rshOZlmvK+Bt4a2MNbUFbSpkCeSrrxRT3zaVTQqLRUMz4elzDZb4CyvIvtQzq4jGwi+1
         HBILJXTenmBL8ezDV/XzSltMyRVW8N5pGLVc6ZMhlIDEvl+mrwxpUc5n+db5z5Pfve4k
         jWbqAzYB3Hyg5oa2ZHgXfW73ElDNxOwcp7mMt28pojnFNBEyD2+0HttoLOb68bdPn3gz
         h+F5uqyOw5Q9oI+0N52Nr3XEpZ0TzyQMzlW05rWkdP3Hj3nW89n+8r+x6EjcJTcjYaCu
         dSgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=15+zFGICN73u7PZkuVftuGFAaRqO2hNiuUPbcuB/iDw=;
        b=x3oG78SscwgF0BRdB6Y1WkG7gjeLAgb68nBHnLcS4pDXYrjrVyV+/5wuB8QncoggKR
         FIJS1QlRtbBNt2O/doqFM52K5/nVY6Sn+pNDTavTF2300a6wGerGLy/ipJJn40s9Bw8c
         5AfrtqhqXdipCV9lccd4rOydi6VF+MYK6V9pivOhsr0sLEVE+5hyKgnaFHzXQ0BUhU0A
         QaY41xyadk6nIZk4Kd6COsxyr3M9DUR75nOFO6McQGPPkKFpmHOx3hQC6NcrbmBw7eFf
         nCyfEN/Yi+TzZqqzdWCHiJNh96dsPexcdAPMD+yumvb2NqRVJz1Oy78lue4o5pr7mlfl
         umOQ==
X-Gm-Message-State: ACgBeo1AeGUziP4G5oy2y7SFLom5H0Wiu4qi3zmwRR1K7DT+Sn8S0ban
	tNHnBphoJzNOrDJPSIo6fq/LBFPn1yYu+pWN30F+hg==
X-Google-Smtp-Source: AA6agR5VUVZnLczkpHKFOKrnd+Tscg/SlOlcCZoOHfOkTvdY9LhPO1gaSJJ+tW/v5A56NSwT8mnZVrMApq5J4jdaQcY=
X-Received: by 2002:a25:1546:0:b0:68f:8758:7348 with SMTP id
 67-20020a251546000000b0068f87587348mr24825887ybv.563.1661304824786; Tue, 23
 Aug 2022 18:33:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220701012647.2007122-1-saravanak@google.com> <YwS5J3effuHQJRZ5@kroah.com>
In-Reply-To: <YwS5J3effuHQJRZ5@kroah.com>
From: Saravana Kannan <saravanak@google.com>
Date: Tue, 23 Aug 2022 18:33:07 -0700
Message-ID: <CAGETcx8C_Hw588J_DsDELp2rS-UNnezpqqqvUixqGR7m2wDKaA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Fix console probe delay when stdout-path isn't set
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Laurentiu Tudor <laurentiu.tudor@nxp.com>, 
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
X-CRM114-CacheID: sfid-20220823_183349_968190_F8944E7F 
X-CRM114-Status: GOOD (  15.09  )
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

On Tue, Aug 23, 2022 at 4:25 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Thu, Jun 30, 2022 at 06:26:38PM -0700, Saravana Kannan wrote:
> > These patches are on top of driver-core-next.
> >
> > Even if stdout-path isn't set in DT, this patch should take console
> > probe times back to how they were before the deferred_probe_timeout
> > clean up series[1].
>
> Now dropped from my queue due to lack of a response to other reviewer's
> questions.

Sorry, I somehow missed those emails. I'll respond later today/tomorrow.

-Saravana

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
