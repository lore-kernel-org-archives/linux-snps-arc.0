Return-Path: <SRS0=Zh1A=HM=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE670C433E9
	for <linux-snps-arc@archiver.kernel.org>; Wed, 10 Feb 2021 18:43:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E638364E26
	for <linux-snps-arc@archiver.kernel.org>; Wed, 10 Feb 2021 18:43:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E638364E26
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baikalelectronics.ru
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Tb4WNvbVNrKNlpCYTbidgrx6+Avbv9J+tC3SafIaYsQ=; b=qrDqZ6D4xbc+MIe5OVIO2hd/p
	jSgrGR60UBpEGSE1EMfTNjO3SWRfxIY+J+FxSTSEE4qqsiVJ0hzo/mFB1b1YrtoK76CiGPZTLvRGu
	psHcuVOqRGT9aaLtXSHG1D8fX4IpZSJitYdLtoiAZU1l+a8+kJp05PAY7KvXmiA+2nsEMIYzKh0zs
	jUAuJiNwwZ/7H/BkPisv0q3UKw5gIRzSQu4OUoXG4b6olo3LmpJudAtmGgCLdUoKFtxNVdyQ6090K
	AR+zSm4RmahJir3v8gc0VNtbigcrcgNsg9GWxdT5ygp2EJ4YOfGy+/XwZtLo2kElzMuptGI54aXrH
	/yWVWI7OQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9uSO-0007sZ-Az; Wed, 10 Feb 2021 18:43:20 +0000
Received: from mail.baikalelectronics.com ([87.245.175.226]
 helo=mail.baikalelectronics.ru)
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9uSJ-0007qv-LB; Wed, 10 Feb 2021 18:43:17 +0000
Date: Wed, 10 Feb 2021 21:43:11 +0300
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH RESEND v6 00/10] dt-bindings: usb: Harmonize
 xHCI/EHCI/OHCI/DWC3 nodes name
Message-ID: <20210210184311.ouc6zft675kybyjx@mobilestation>
References: <20210210172850.20849-1-Sergey.Semin@baikalelectronics.ru>
 <e169630f-1255-7597-86f2-63ee8760cc8c@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e169630f-1255-7597-86f2-63ee8760cc8c@gmail.com>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210210_134315_942855_65E4F546 
X-CRM114-Status: GOOD (  30.63  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Cc: Andrew Lunn <andrew@lunn.ch>, Amelie Delaunay <amelie.delaunay@st.com>,
 Tony Lindgren <tony@atomide.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Paul Cercueil <paul@crapouillou.net>, Paul Mackerras <paulus@samba.org>,
 Wei Xu <xuwei5@hisilicon.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, Alexandre Torgue <alexandre.torgue@st.com>,
 Khuong Dinh <khuong@os.amperecomputing.com>, linux-samsung-soc@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Rafal Milecki <zajec5@gmail.com>, Alexey Brodkin <abrodkin@synopsys.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Andy Gross <agross@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 linux-arm-msm@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>,
 Hauke Mehrtens <hauke@hauke-m.de>, linuxppc-dev@lists.ozlabs.org,
 Maxime Ripard <mripard@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>,
 Rob Herring <robh+dt@kernel.org>, Jun Li <lijun.kernel@gmail.com>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Felipe Balbi <balbi@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Patrice Chotard <patrice.chotard@st.com>,
 Serge Semin <fancer.lancer@gmail.com>, Li Yang <leoyang.li@nxp.com>,
 Kukjin Kim <kgene@kernel.org>, Benoit Cousson <bcousson@baylibre.com>,
 Vineet Gupta <vgupta@synopsys.com>, linux-mediatek@lists.infradead.org,
 Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Wed, Feb 10, 2021 at 10:21:47AM -0800, Florian Fainelli wrote:
> On 2/10/21 9:28 AM, Serge Semin wrote:
> > As the subject states this series is an attempt to harmonize the xHCI,
> > EHCI, OHCI and DWC USB3 DT nodes with the DT schema introduced in the
> > framework of the patchset [1].
> > 
> > Firstly as Krzysztof suggested we've deprecated a support of DWC USB3
> > controllers with "synopsys,"-vendor prefix compatible string in favor of
> > the ones with valid "snps,"-prefix. It's done in all the DTS files,
> > which have been unfortunate to define such nodes.
> > 
> > Secondly we suggest to fix the snps,quirk-frame-length-adjustment property
> > declaration in the Amlogic meson-g12-common.dtsi DTS file, since it has
> > been erroneously declared as boolean while having uint32 type. Neil said
> > it was ok to init that property with 0x20 value.
> > 
> > Thirdly the main part of the patchset concern fixing the xHCI, EHCI/OHCI
> > and DWC USB3 DT nodes name as in accordance with their DT schema the
> > corresponding node name is suppose to comply with the Generic USB HCD DT
> > schema, which requires the USB nodes to have the name acceptable by the
> > regexp: "^usb(@.*)?". Such requirement had been applicable even before we
> > introduced the new DT schema in [1], but as we can see it hasn't been
> > strictly implemented for a lot the DTS files. Since DT schema is now
> > available the automated DTS validation shall make sure that the rule isn't
> > violated.
> > 
> > Note most of these patches have been a part of the last three patches of
> > [1]. But since there is no way to have them merged in in a combined
> > manner, I had to move them to the dedicated series and split them up so to
> > be accepted by the corresponding subsystem maintainers one-by-one.
> > 
> > [1] Link: https://lore.kernel.org/linux-usb/20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru/
> > Changelog v1:
> > - As Krzysztof suggested I've created a script which checked whether the
> >   node names had been also updated in all the depended dts files. As a
> >   result I found two more files which should have been also modified:
> >   arch/arc/boot/dts/{axc003.dtsi,axc003_idu.dtsi}
> > - Correct the USB DWC3 nodes name found in
> >   arch/arm64/boot/dts/apm/{apm-storm.dtsi,apm-shadowcat.dtsi} too.
> > 
> > Link: https://lore.kernel.org/linux-usb/20201020115959.2658-1-Sergey.Semin@baikalelectronics.ru
> > Changelog v2:
> > - Drop the patch:
> >   [PATCH 01/29] usb: dwc3: Discard synopsys,dwc3 compatibility string
> >   and get back the one which marks the "synopsys,dwc3" compatible string
> >   as deprecated into the DT schema related series.
> > - Drop the patches:
> >   [PATCH 03/29] arm: dts: am437x: Correct DWC USB3 compatible string
> >   [PATCH 04/29] arm: dts: exynos: Correct DWC USB3 compatible string
> >   [PATCH 07/29] arm: dts: bcm53x: Harmonize EHCI/OHCI DT nodes name
> >   [PATCH 08/29] arm: dts: stm32: Harmonize EHCI/OHCI DT nodes name
> >   [PATCH 16/29] arm: dts: bcm5301x: Harmonize xHCI DT nodes name
> >   [PATCH 19/29] arm: dts: exynos: Harmonize DWC USB3 DT nodes name
> >   [PATCH 21/29] arm: dts: ls1021a: Harmonize DWC USB3 DT nodes name
> >   [PATCH 22/29] arm: dts: omap5: Harmonize DWC USB3 DT nodes name
> >   [PATCH 24/29] arm64: dts: allwinner: h6: Harmonize DWC USB3 DT nodes name
> >   [PATCH 26/29] arm64: dts: exynos: Harmonize DWC USB3 DT nodes name
> >   [PATCH 27/29] arm64: dts: layerscape: Harmonize DWC USB3 DT nodes name
> >   since they have been applied to the corresponding maintainers repos.
> > - Fix drivers/usb/dwc3/dwc3-qcom.c to be looking for the "usb@"-prefixed
> >   sub-node and falling back to the "dwc3@"-prefixed one on failure.
> > 
> > Link: https://lore.kernel.org/linux-usb/20201111091552.15593-1-Sergey.Semin@baikalelectronics.ru
> > Changelog v3:
> > - Drop the patches:
> >   [PATCH v2 04/18] arm: dts: hisi-x5hd2: Harmonize EHCI/OHCI DT nodes name
> >   [PATCH v2 06/18] arm64: dts: hisi: Harmonize EHCI/OHCI DT nodes name
> >   [PATCH v2 07/18] mips: dts: jz47x: Harmonize EHCI/OHCI DT nodes name
> >   [PATCH v2 08/18] mips: dts: sead3: Harmonize EHCI/OHCI DT nodes name
> >   [PATCH v2 09/18] mips: dts: ralink: mt7628a: Harmonize EHCI/OHCI DT nodes name
> >   [PATCH v2 11/18] arm64: dts: marvell: cp11x: Harmonize xHCI DT nodes name
> >   [PATCH v2 12/18] arm: dts: marvell: armada-375: Harmonize DWC USB3 DT nodes name
> >   [PATCH v2 16/18] arm64: dts: hi3660: Harmonize DWC USB3 DT nodes name
> >   since they have been applied to the corresponding maintainers repos.
> > 
> > Link: https://lore.kernel.org/linux-usb/20201205155621.3045-1-Sergey.Semin@baikalelectronics.ru
> > Changelog v4:
> > - Just resend.
> > 
> > Link: https://lore.kernel.org/linux-usb/20201210091756.18057-1-Sergey.Semin@baikalelectronics.ru/
> > Changelog v5:
> > - Drop the patch:
> >   [PATCH v4 02/10] arm64: dts: amlogic: meson-g12: Set FL-adj property value
> >   since it has been applied to the corresponding maintainers repos.
> > - Get back the patch:
> >   [PATCH 21/29] arm: dts: ls1021a: Harmonize DWC USB3 DT nodes name
> >   as it has been missing in the kernel 5.11-rc7
> > - Rebase onto the kernel 5.11-rc7
> > 
> > Link: https://lore.kernel.org/lkml/20210208135154.6645-1-Sergey.Semin@baikalelectronics.ru/
> > Changelog v6:
> > - Just resend and add linux-usb.vger.kernel.org to the list of Ccecipients.
> 
> 

> If this needs to go on, can you drop the people who already took your
> patches (trying to lower my email amount to something manageable).
> Thank you.

Ah, sorry for the noise. I'll clean the Cc-list up in the next attempt
to have this finally fully accepted.

-Sergey

> -- 
> Florian

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
