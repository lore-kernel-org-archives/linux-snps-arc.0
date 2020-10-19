Return-Path: <SRS0=kEbr=D2=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A14BEC433E7
	for <linux-snps-arc@archiver.kernel.org>; Mon, 19 Oct 2020 16:23:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16A8621D81
	for <linux-snps-arc@archiver.kernel.org>; Mon, 19 Oct 2020 16:23:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wqVE9yiy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 16A8621D81
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baikalelectronics.ru
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2qLZ4v6GL1bWU/ekfjy4Ntv5eKdevvaVpT6tuY71i+4=; b=wqVE9yiy5veu1bBvY/X/5qWq/
	2NTAERHKaBBqosdcrM57HnThRJZXqBrBN85zDh3ynm863jcy3zSj8CSTA8wR5j0T0y8rRo9oPrd44
	/CTDV9Qtbr5j41vfnmjnFRV9PhtP1odCa0TC4Sx7LndrYIrmaY1efDyp0wHBFiNGvY6ZYoewggIvA
	Or0XC64nJbxrE78ObHX56NavMdp7YuapD7jTzYx5PVsiSFs3jbvUnFDIe2eoDBj9+YGOffUeFGuwU
	U9jEcs59hATYC6MLmhgygB23rhwWx41pg2d2SqX/JNSIoFWtTbrXWpV66rhdKXfWWTJewQ1piaQFt
	xY/pdtjig==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUXw3-0001eq-9t; Mon, 19 Oct 2020 16:22:59 +0000
Received: from mail.baikalelectronics.com ([87.245.175.226]
 helo=mail.baikalelectronics.ru)
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUXvy-0001cN-Vi; Mon, 19 Oct 2020 16:22:56 +0000
Received: from localhost (unknown [127.0.0.1])
 by mail.baikalelectronics.ru (Postfix) with ESMTP id 060F18030865;
 Mon, 19 Oct 2020 16:22:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
 by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3fyZBKMOX3_k; Mon, 19 Oct 2020 19:22:47 +0300 (MSK)
Date: Mon, 19 Oct 2020 19:22:45 +0300
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 11/20] dt-bindings: usb: dwc3: Add synopsys,dwc3
 compatible string
Message-ID: <20201019162245.j5fsvv355wchuhza@mobilestation.baikal.int>
References: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru>
 <20201014101402.18271-12-Sergey.Semin@baikalelectronics.ru>
 <20201014201818.GA6926@kozik-lap>
 <20201014213554.turskjyuntk35syj@mobilestation>
 <20201016185340.GA1734346@bogus>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201016185340.GA1734346@bogus>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201019_122255_151402_CFEE5BD4 
X-CRM114-Status: GOOD (  15.56  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 Kevin Hilman <khilman@baylibre.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Andy Gross <agross@kernel.org>, linux-snps-arc@lists.infradead.org,
 devicetree@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-arm-kernel@lists.infradead.org, Roger Quadros <rogerq@ti.com>,
 Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-usb@vger.kernel.org, linux-mips@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>, Manu Gautam <mgautam@codeaurora.org>,
 linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Fri, Oct 16, 2020 at 01:53:40PM -0500, Rob Herring wrote:
> On Thu, Oct 15, 2020 at 12:35:54AM +0300, Serge Semin wrote:
> > On Wed, Oct 14, 2020 at 10:18:18PM +0200, Krzysztof Kozlowski wrote:
> > > On Wed, Oct 14, 2020 at 01:13:53PM +0300, Serge Semin wrote:
> > > > The DWC USB3 driver and some DTS files like Exynos 5250, Keystone k2e, etc
> > > > expects the DWC USB3 DT node to have the compatible string with the
> > > > "synopsys" vendor prefix. Let's add the corresponding compatible string to
> > > > the controller DT schema, but mark it as deprecated seeing the Synopsys,
> > > > Inc. is presented with just "snps" vendor prefix.
> > > 
> > 
> > > Instead of adding deprecated schema just correct the DTSes to use snps.
> > > The "synopsys" is not even in vendor prefixes.
> > 
> > Yeah, it's not, but the driver and some dts'es use it this way. I am not sure
> > that the solution suggested by you is much better than mine. So let's hear the
> > Rob'es opinion out in this matter. @Rob, what do you think?
> 

> I think we should fix the dts files given there's only 5.

Ok. I'll do that.

-Sergey

> 
> Rob

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
