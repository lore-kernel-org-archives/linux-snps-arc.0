Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30567C43334
	for <linux-snps-arc@archiver.kernel.org>; Fri,  1 Jul 2022 10:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gBTA9HJMPbEzgy/cGwo/Wg/5msjjPqNTYmP2t2O51iU=; b=WLn3LFN0hlHKTr
	BgZLz2xA9kxwg/hHZpJFe6rZka1jOtSyctAbXIHyiHXbxOZd01ITW5cGS2v2ddEG/iB2/COkOLb5q
	uQnBc8WskSJexJEmvslL7lkT22T5f4ZH8f0Wxjt/L8/Dsu6sHRpdG8rbppK/wJRxwjhxSsOXNkm6y
	MYVMXofsOdmw0BTv9rSOzBjwdN4NXWorNb1yD7/LAhz/a8L4Oa+5Ee9Gw7d/RkN6XMdp0Nz4KoUV9
	ZVjaoLPoABMvrdnD0Pz22ppTGoFsp6cowy4xbNRDqN0i7zebd85X9v7W4aY9L68YtwK89IhWFjUEi
	6+EdrXgZ9HKiM3KTWpLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7Dj7-00436n-1a; Fri, 01 Jul 2022 10:18:17 +0000
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7Dj2-004356-Ql; Fri, 01 Jul 2022 10:18:14 +0000
Received: by mail-yb1-xb31.google.com with SMTP id r3so3229330ybr.6;
        Fri, 01 Jul 2022 03:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IK1q7pWvnzmd2/yzmMQOB6gFUgHkXgsyzwODpSKqHtU=;
        b=jSDpH5b4ezTXYDkI+Kv1qjoulW4GueRKAo9MfvH6Or74WD1aO19b0yl9X6h7ikpgsb
         Yzj9/9QR8pvv9s537mQBeUk8bodicRt2sYNtrKP02dXkQyCDQKSj99VRGbrzh5/zLrXe
         3DbujuLPciSi5vALJ+old//V6zoLm6pd0LhvBAARG1SXsh/2UP6qVVa/FfV3DuM5if+u
         lMLgaAYtih653stfzpF6JzV1TgtPEvIAiwFM7x+VFO7m6+ikg5S95jdc8NlSpoxf6NUC
         chD7vf96GrCNEtWT2dpp9TfC5k1TkiGvGH1SczyJzPL6/3uFcjCYC/RxAKuWF753UD7k
         NBBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IK1q7pWvnzmd2/yzmMQOB6gFUgHkXgsyzwODpSKqHtU=;
        b=bKEW8Ry0Dc7JWpcsTzfqOEZXgVD93DyEcOHHsubyywQFfUZ94PG/REMiyCQ1yFPlc1
         ayfM0chkW6AIr9cJsCf65QdK7Gx6bgoQqYkqS7TIcnHhAU15zwITAxAgqUKThdLs1A+Y
         wonqxW0cs1f5vojvbilC4isezZD5wp536hZin0Lw7cLD+7+tp1zUynbdzPEBPpx1Ooyr
         lil0LPOX4PUc3JRNAcgQzi0r6i9/+YQD2G9MdVguJO/GgctbNCiPbPF7IwnOjfE/t8u2
         iKaXmZN5w3gfbiWMUewxWHOCpDGetzs/dkuz1o2lpGiano869IqEsNYly1o5J2I/eUBy
         m1hw==
X-Gm-Message-State: AJIora89JqE6zL3KgHUrUS5nkhzJQEf+MmiTpkt2dH/dd9IfNjyCRe8j
	of8hqQn5oJ9w5XuycenQ27US2xNEWzhjsrJ/LwI=
X-Google-Smtp-Source: AGRyM1tvrcPaXjb6qpRZmlm3mN1+HaZ3X5zFt5Vb6BDK08mCBJ8qF4vfcIrvo5gC3LEAhM4YrPgldTFVhwpUgFcS228=
X-Received: by 2002:a05:6902:1549:b0:66d:5f76:27ba with SMTP id
 r9-20020a056902154900b0066d5f7627bamr14092504ybu.385.1656670690515; Fri, 01
 Jul 2022 03:18:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220701012647.2007122-1-saravanak@google.com> <20220701012647.2007122-3-saravanak@google.com>
In-Reply-To: <20220701012647.2007122-3-saravanak@google.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 1 Jul 2022 12:17:33 +0200
Message-ID: <CAHp75Vdw8pZePnqR=mmJh4pv0bPMRJE=p7-cG3akskdxMHmoKw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] serial: Set probe_no_timeout for all DT based drivers
To: Saravana Kannan <saravanak@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
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
	david ahern <dsahern@kernel.org>, Android Kernel Team <kernel-team@android.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>, 
	"list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>, netdev <netdev@vger.kernel.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	"open list:LINUX FOR POWERPC PA SEMI PWRFICIENT" <linuxppc-dev@lists.ozlabs.org>, 
	"open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>, 
	linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>, 
	linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>, 
	"open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
	linux-tegra <linux-tegra@vger.kernel.org>, linux-snps-arc@lists.infradead.org, 
	linux-amlogic <linux-amlogic@lists.infradead.org>, 
	linux-arm-msm <linux-arm-msm@vger.kernel.org>, linux-actions@lists.infradead.org, 
	linux-unisoc@lists.infradead.org, 
	Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, linux-stm32@st-md-mailman.stormreply.com, 
	Sparc kernel list <sparclinux@vger.kernel.org>, Ahmad Fatoum <a.fatoum@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220701_031812_944217_140ACF2F 
X-CRM114-Status: GOOD (  15.23  )
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

On Fri, Jul 1, 2022 at 3:28 AM Saravana Kannan <saravanak@google.com> wrote:
>
> With commit 71066545b48e ("driver core: Set fw_devlink.strict=1 by
> default") the probing of TTY consoles could get delayed if they have
> optional suppliers that are listed in DT, but those suppliers don't
> probe by the time kernel boot finishes. The console devices will probe
> eventually after driver_probe_timeout expires.
>
> However, since consoles are often used for debugging kernel issues, it
> does not make sense to delay their probe. So, set the newly added
> probe_no_timeout flag for all serial drivers that at DT based. This way,
> fw_devlink will know not to delay the probing of the consoles past
> kernel boot.

Same question, do you think only serial drivers need that?

-- 
With Best Regards,
Andy Shevchenko

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
