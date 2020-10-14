Return-Path: <SRS0=Sdks=DV=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07C8DC433DF
	for <linux-snps-arc@archiver.kernel.org>; Wed, 14 Oct 2020 17:37:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 619AD22227
	for <linux-snps-arc@archiver.kernel.org>; Wed, 14 Oct 2020 17:37:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GmiSM/J7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 619AD22227
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baikalelectronics.ru
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=f7S178KnA8faxafio4v+Nn9+obFq0Z480OXigSd+dDU=; b=GmiSM/J7NPccDBs3Z8dLIn3Pe
	tCt458kklmw7ecHjk6CL5osLsWwIivqNTpM+B6MrJtzjNvQXNNBvnMY6mJYFSmUO/4SDSSjh4bCoE
	zghbUf18H/rq4xRZOaziRdclWEjSmArVXEcA/at6emMF9hm6aLPcU5c7MsBOKaTNHBXaCog2/BNKl
	Tdn57NzVDl4Ydpktk53vyhyItb5gVLR45X6o54xPiT4xdcBIeAxjv+AiqvMIyxgawvWSoGNQxyqq/
	0NZziCQuwGP2fYWH99i6G09Xb+dS1wpCxqiZzlRZtbCcOIN2eNP/jreUttPnRcU/KLG7NZG0l/ExD
	WR0WsUIxw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSkiD-00087c-Bp; Wed, 14 Oct 2020 17:37:17 +0000
Received: from mail.baikalelectronics.com ([87.245.175.226]
 helo=mail.baikalelectronics.ru)
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSki5-00085W-Ns; Wed, 14 Oct 2020 17:37:10 +0000
Received: from localhost (unknown [127.0.0.1])
 by mail.baikalelectronics.ru (Postfix) with ESMTP id 0B34B803073E;
 Wed, 14 Oct 2020 17:37:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
 by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qiTZazrqpn09; Wed, 14 Oct 2020 20:37:08 +0300 (MSK)
Date: Wed, 14 Oct 2020 20:37:06 +0300
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 09/20] dt-bindings: usb: Convert DWC USB3 bindings to DT
 schema
Message-ID: <20201014173706.jojxkhdicyg62hlo@mobilestation>
References: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru>
 <20201014101402.18271-10-Sergey.Semin@baikalelectronics.ru>
 <20201014133219.GA1545403@bogus>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201014133219.GA1545403@bogus>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201014_133710_045333_6378F8F2 
X-CRM114-Status: GOOD (  19.44  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-mips@vger.kernel.org,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 Kevin Hilman <khilman@baylibre.com>, Andy Gross <agross@kernel.org>,
 linux-snps-arc@lists.infradead.org, devicetree@vger.kernel.org,
 Mathias Nyman <mathias.nyman@intel.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Rob Herring <robh+dt@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-arm-kernel@lists.infradead.org, Roger Quadros <rogerq@ti.com>,
 Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>, Manu Gautam <mgautam@codeaurora.org>,
 linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Wed, Oct 14, 2020 at 08:32:19AM -0500, Rob Herring wrote:
> On Wed, 14 Oct 2020 13:13:51 +0300, Serge Semin wrote:
> > DWC USB3 DT node is supposed to be compliant with the Generic xHCI
> > Controller schema, but with additional vendor-specific properties, the
> > controller-specific reference clocks and PHYs. So let's convert the
> > currently available legacy text-based DWC USB3 bindings to the DT schema
> > and make sure the DWC USB3 nodes are also validated against the
> > usb-xhci.yaml schema.
> > 
> > Note we have to discard the nodename restriction of being prefixed with
> > "dwc3@" string, since in accordance with the usb-hcd.yaml schema USB nodes
> > are supposed to be named as "^usb(@.*)".
> > 
> > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > 
> > ---
> > 
> > Changelog v2:
> > - Discard '|' from the descriptions, since we don't need to preserve
> >   the text formatting in any of them.
> > - Drop quotes from around the string constants.
> > - Fix the "clock-names" prop description to be referring the enumerated
> >   clock-names instead of the ones from the Databook.
> > ---
> >  .../devicetree/bindings/usb/dwc3.txt          | 125 --------
> >  .../devicetree/bindings/usb/snps,dwc3.yaml    | 295 ++++++++++++++++++
> >  2 files changed, 295 insertions(+), 125 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/usb/dwc3.txt
> >  create mode 100644 Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> > 
> 
> 

> My bot found errors running 'make dt_binding_check' on your patch:
> 
> ./Documentation/devicetree/bindings/usb/snps,dwc3.yaml:44:4: [warning] wrong indentation: expected 4 but found 3 (indentation)
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/qcom,dwc3.example.dt.yaml: dwc3@a600000: $nodename:0: 'dwc3@a600000' does not match '^usb(@.*)?'
> 	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.example.dt.yaml: usb@ff500000: snps,quirk-frame-length-adjustment: True is not of type 'array'
> 	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> 
> 
> See https://patchwork.ozlabs.org/patch/1382003
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure dt-schema is up to date:
> 
> pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade
> 
> Please check and re-submit.
> 

Both of these errors are fixed in the following patches of the series:
[PATCH 17/20] dt-bindings: usb: qcom,dwc3: Validate DWC3 sub-node
[PATCH 15/20] dt-bindings: usb: meson-g12a-usb: Fix FL-adj property value

This patch preserves the original legacy bindings and doesn't touch the
depended bogus DT schemas.

-Sergey


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
