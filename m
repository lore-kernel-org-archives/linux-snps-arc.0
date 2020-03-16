Return-Path: <SRS0=C9XM=5B=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 132AFC0044D
	for <linux-snps-arc@archiver.kernel.org>; Mon, 16 Mar 2020 15:08:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D219920663
	for <linux-snps-arc@archiver.kernel.org>; Mon, 16 Mar 2020 15:08:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iDkOwjiU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D219920663
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3sh10k+o/Unlc/CpXQwZiWIn1PVx0frSn6O7iRKfl3A=; b=iDkOwjiU5cyW/v
	qm7S/d8xKbvRC0l1sY2yJ/6dM4mjQSpAYsHLTevuqps6zIBNFX51NX29DUK7Mn8S4EK121K3ECG++
	gESJYoyxWCT30TeS9Sj9o/7C7E1tU4rPEwn6pPy3Wroe4tWHTiE1fcN7As6RxU19hN6M5XUQAV6TU
	wI9aThFFIt/vEQkagdhLQ+XwS2jAELxmF7gG+FeO1WC6hx5unKBUacOnIMdySZ0mSqFRSkh57V8xI
	/lGyfqWGoxRCkexou4RoUMIk+lykyEjoEwwLbPkBrrNbuIF18O6jcMi6DXh6pIpGO7B26SNS+pBr8
	VtDwvWI7InmYjegDpgpQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jDrLc-00029t-U8; Mon, 16 Mar 2020 15:08:08 +0000
Received: from asavdk3.altibox.net ([109.247.116.14])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jDrJa-0007zd-Bd
 for linux-snps-arc@lists.infradead.org; Mon, 16 Mar 2020 15:06:04 +0000
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id AFEF32003B;
 Mon, 16 Mar 2020 16:05:50 +0100 (CET)
Date: Mon, 16 Mar 2020 16:05:48 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Subject: Re: [PATCH 2/2] dt-bindings: Document the Synopsys ARC HDMI TX
 bindings
Message-ID: <20200316150548.GA25294@ravnborg.org>
References: <20200316144647.10416-1-Eugeniy.Paltsev@synopsys.com>
 <20200316144647.10416-3-Eugeniy.Paltsev@synopsys.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200316144647.10416-3-Eugeniy.Paltsev@synopsys.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=jIQo8A4GAAAA:8
 a=e5mUnYsNAAAA:8 a=M7aO59fNJ6i23PoMEtIA:9 a=OoSG_5CIhO75MOo9:21
 a=GlqmvLfQ7YiL8mw-:21 a=CjuIK1q_8ugA:10 a=Lf5xNeLK5dgiOs8hzIjU:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200316_080602_850710_E29E3A23 
X-CRM114-Status: GOOD (  17.92  )
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 linux-snps-arc@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi Eugeniy.

On Mon, Mar 16, 2020 at 05:46:47PM +0300, Eugeniy Paltsev wrote:
> This patch adds documentation of device tree bindings for the Synopsys
> HDMI 2.0 TX encoder driver for ARC SoCs.
> 
> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
> ---
>  .../display/bridge/snps,arc-dw-hdmi.txt       | 73 +++++++++++++++++++

New bindings in DT Schema format please (.yaml files).
We are working on migrating all bindings to DT Schema format.

	Sam

>  1 file changed, 73 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/snps,arc-dw-hdmi.txt
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/snps,arc-dw-hdmi.txt b/Documentation/devicetree/bindings/display/bridge/snps,arc-dw-hdmi.txt
> new file mode 100644
> index 000000000000..d5e006b392cc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/snps,arc-dw-hdmi.txt
> @@ -0,0 +1,73 @@
> +Synopsys DesignWare HDMI 2.0 TX encoder driver for ARC SoCs
> +================================
> +
> +The HDMI transmitter is a Synopsys DesignWare HDMI 2.0 TX controller IP
> +with a companion of Synopsys DesignWare HDMI 2.0 TX PHY IP.
> +
> +These DT bindings follow the Synopsys DWC HDMI TX bindings defined in
> +Documentation/devicetree/bindings/display/bridge/dw_hdmi.txt
> +with the following device-specific properties.
> +
> +
> +Required properties:
> +
> +- compatible : Shall contain
> +  - "snps,dw-hdmi-hsdk" for HSDK4xD compatible HDMI TX
> +
> +- reg: See dw_hdmi.txt.
> +- interrupts: HDMI interrupt number.
> +- clocks: See dw_hdmi.txt.
> +- clock-names: Must contain "iahb" and "isfr" as defined in dw_hdmi.txt.
> +- ports: See dw_hdmi.txt. The DWC HDMI shall have one port numbered 0
> +  corresponding to the video input of the controller and one port numbered 1
> +  corresponding to its HDMI output.
> +
> +Example:
> +
> +hdmi: hdmi@0x10000 {
> +	compatible = "snps,dw-hdmi-hsdk";
> +	reg = <0x10000 0x10000>;
> +	reg-io-width = <4>;
> +	interrupts = <14>;
> +	clocks = <&apbclk>, <&hdmi_pix_clk>;
> +	clock-names = "iahb", "isfr";
> +
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		port@0 {
> +			reg = <0>;
> +			hdmi_enc_input: endpoint {
> +				remote-endpoint = <&pgu_output>;
> +			};
> +		};
> +
> +		port@1 {
> +			reg = <1>;
> +			hdmi_enc_out: endpoint {
> +				remote-endpoint = <&hdmi_con>;
> +			};
> +		};
> +	};
> +};
> +
> +hdmi-out {
> +	...
> +
> +	port {
> +		hdmi_con: endpoint {
> +			remote-endpoint = <&hdmi_enc_out>;
> +		};
> +	};
> +};
> +
> +pgu {
> +	...
> +
> +	port_o: port {
> +		pgu_output: endpoint {
> +			remote-endpoint = <&hdmi_enc_input>;
> +		};
> +	};
> +};
> -- 
> 2.21.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
