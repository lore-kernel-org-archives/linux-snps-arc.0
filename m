Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F7F0C43334
	for <linux-snps-arc@archiver.kernel.org>; Tue, 28 Jun 2022 02:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d2+x7sNBSNoMKOTA5BqqwO0UUCZ3b0Ar6jwZmiSO0Ds=; b=sLdQSQGa5vrbQj
	ZJXPQ1kK+NbrCouw/eN0PszgabGgSfNOaAJDdf9MetSNXt8AZbaqCBKRBwfdoFGYQs9lkxjPNnkky
	1WDU6qgs67++PV2R6vMK8cXfP3+UAGZGssP8DyDepJOYkmX2B4i/N3V4+sh6R3IxAxf5MoDSfHiPR
	SfNUm9mCjFp8rbaR1p+PAvJr4k9vsjFrnaZK1rmpwz1Q6YBrsy/DIPx2Kt51hdPQOlxtNmR89b3nq
	kNq1RvknNtMryM09iaxLPN8eS90SECT7bDQuXvYuB2bE9SvDfIkZMV4yaCTHXYIVWj0I8E6cM+hfF
	mlrSuq4xUP9Gl1kYaAUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o610S-003lCD-Rk; Tue, 28 Jun 2022 02:31:12 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o60sb-003ghz-91; Tue, 28 Jun 2022 02:23:07 +0000
Received: by mail-pf1-x42d.google.com with SMTP id x138so8019067pfc.3;
        Mon, 27 Jun 2022 19:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HJxtqab0/tMiakWNEyC3nFz1/Ap3ZwjlyjInjl9oQ08=;
        b=GtISRQAw32VwWkIqJjbS6kPz10YSeb/J+R05thf6bFPMAOY82jKQN3UdU/3Xm5A6wE
         tMPJ9jiXwXd5WIpoNmuhYObSQi+a4vbyn3XjCacf3FIX++nTWeWgUHF+xWdV2kFekLbZ
         0OzYqNi1FmudYoMCCJZeGvG2ye4sCgduv0rk2Zt4nVkQ98BfuFa3NPGjGKGgPVG9KtHY
         DntPc1msd2JalXRAlzsxyFpEjwPnKkzTvOPkfaVuXEaP+ZKelLBEm4Nr7ZrcOOgm/4RV
         HPa6kkD+OJGFCcd57tIyozXxW7wCGRkiieRac/DfVSrfyK1ch327OFoWU4ImG2SclPJ9
         uIig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HJxtqab0/tMiakWNEyC3nFz1/Ap3ZwjlyjInjl9oQ08=;
        b=gPq7GBn2xlBiHswEe8h7X99LpWc/2oe2LvqVGaoS2+xoYlbTcOIp1uWu/Fs0QeLfSg
         in6rDa+aQLZbvIidErD7Z/6kmTcrU2WObeDavZcSU4etgLPLmFkx9bQY4EqyhLN2odLs
         qCXS1ibOz+z7HbIkq/Jq0yIa/INbv8GEXqO9Srh+9jO7pk6mlfkkw4pXbyNwfnHumct5
         C06yXOQys08yaxqfX0tN+8KwTVfMNZLx/RZJSmq29fuDVbKRTsqn5aFdVdCTqKfSzCKC
         66C29orUXMGAhVVBRPZ/9Znc+ForTZD0gnSffIIcrXReeYVEHONHSGnza3uSuk0tPTzt
         jGYQ==
X-Gm-Message-State: AJIora8leMpDZn2itwTPafUknQcnjIQbSM4+MqMDhBF09ZcOTV1Yh8pV
	Dk1EWjl+o6V2LAbBbshZoPooXVFBVImZNMZ0yQ4=
X-Google-Smtp-Source: AGRyM1tkELEQsXZZ9rCiYz26Ox2Bo3COuaabo0ODviEYu2B5j99coTUXvXqjCJz9EcYG+uOHPMvd9KNaBAGlSJExO9A=
X-Received: by 2002:a65:6a0e:0:b0:405:2310:22d0 with SMTP id
 m14-20020a656a0e000000b00405231022d0mr15760605pgu.290.1656382983124; Mon, 27
 Jun 2022 19:23:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220628020110.1601693-1-saravanak@google.com>
In-Reply-To: <20220628020110.1601693-1-saravanak@google.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 27 Jun 2022 23:22:52 -0300
Message-ID: <CAOMZO5D29QqH_-pktht6yO_Ga7B7KgeGXxzyUHJWGYfGTJr4pw@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] Fix console probe delay when stdout-path isn't set
To: Saravana Kannan <saravanak@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Laurentiu Tudor <laurentiu.tudor@nxp.com>, Jiri Slaby <jirislaby@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
	Paul Mackerras <paulus@samba.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>, 
	Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Nicolas Saenz Julienne <nsaenz@kernel.org>, Al Cooper <alcooperx@gmail.com>, 
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
	NXP Linux Team <linux-imx@nxp.com>, Karol Gugala <kgugala@antmicro.com>, 
	Mateusz Holenko <mholenko@antmicro.com>, Gabriel Somlo <gsomlo@gmail.com>, 
	Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
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
	david ahern <dsahern@kernel.org>, kernel-team@android.com, 
	linux-kernel <linux-kernel@vger.kernel.org>, linux-pm@vger.kernel.org, 
	iommu@lists.linux-foundation.org, netdev <netdev@vger.kernel.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
	linux-serial@vger.kernel.org, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, linux-aspeed@lists.ozlabs.org, 
	linux-rpi-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-actions@lists.infradead.org, 
	linux-unisoc@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	sparclinux@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_192305_471155_47FD1E87 
X-CRM114-Status: GOOD (  14.72  )
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

Hi Saravana,

On Mon, Jun 27, 2022 at 11:03 PM Saravana Kannan <saravanak@google.com> wrote:
>
> Since the series that fixes console probe delay based on stdout-path[1] got
> pulled into driver-core-next, I made these patches on top of them.
>
> Even if stdout-path isn't set in DT, this patch should take console
> probe times back to how they were before the deferred_probe_timeout
> clean up series[2].
>
> Fabio/Ahmad/Sascha,
>
> Can you give this a shot please?

This series works fine for me (with and without stdout-path), thanks:

Tested-by: Fabio Estevam <festevam@gmail.com>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
