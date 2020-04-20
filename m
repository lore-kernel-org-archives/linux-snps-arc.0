Return-Path: <SRS0=KDTa=6E=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AA49C55181
	for <linux-snps-arc@archiver.kernel.org>; Mon, 20 Apr 2020 21:25:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 477EE207FC
	for <linux-snps-arc@archiver.kernel.org>; Mon, 20 Apr 2020 21:25:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="G3JnwjI8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 477EE207FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SIAwa/WkOdGN4OiZASFxqyyfap5dj7hD6qTFXuRPf3w=; b=G3JnwjI86j6WQY
	UVEbMlVBOoAdq0OQFjquzJk1U7RFR+J4N2AzoIj0pbFuVvQJyPSRQVgIDiIG5Tk+/E0jqho9SCNMX
	5YpIh0ggkHnBHEUe0KAnFJwPj1t873R75hZVP58kRfMPfdYhJndg99+3lOgg5SFczsYRSEtdvpXyB
	xDoN+PFGkrP4ZUFJuVmnX7j7zBAfdLMP4l+i0wgS0e6KKD0EfA4Z2G5uhgLtIlNX+sQkW1h7klsO+
	IJVLjZ3a1g65K83et22Lzyo0eFRzbidwVypYiqaddDMlhp7oqokeSNF74SYGz6oa/RlxIL/odnBLJ
	BG87v7CLhCRZ1cZYTSEA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQduV-0002YD-FW; Mon, 20 Apr 2020 21:24:59 +0000
Received: from mail-ot1-f67.google.com ([209.85.210.67])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQduR-0002XB-UW
 for linux-snps-arc@lists.infradead.org; Mon, 20 Apr 2020 21:24:57 +0000
Received: by mail-ot1-f67.google.com with SMTP id i27so9463001ota.7
 for <linux-snps-arc@lists.infradead.org>; Mon, 20 Apr 2020 14:24:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=/PYRUd145uwywq6C1mfwPkvq46x3zUYySJRsVBrwgD0=;
 b=piCzEuayCrvMFWTsZLhIzTNOTbgN4V20CLfHC4LG2SrFeP7CTOAvJCYCORn2wNgGa7
 o0VphlC9oQBZG979fI0pyw1lcU9cVVy+LsuINu1Q3jXRbRJ1woB2AtLapZ2neDxqOt5C
 XPWQodmpMelVUvWGz87UAnYrysZswPFAtv1jVxxYsvL1kqoMn2J3eoMKGnHiBSyjRvz5
 SAfOBmgEp/kmYoJmuH8MsK8xOmehUfvI2EAl72PqOAun/L5iGfogG7Ru8R103cEZR78r
 k9PBk631xvBClUTq6hVcQVcd3RW17Xz6NzgpA8gbKkIp0hhsxNYYYQ4Z33XNa17Cjz45
 x+Tg==
X-Gm-Message-State: AGi0PubEDGRgA2Mqbug5U2sgkfABUAiqOvB1LRQW7pb97lXVk3a7bXo4
 VlNfGJMf+caygWSLlHgHzA==
X-Google-Smtp-Source: APiQypKHGZeotSvJnLU+HKhQIe9WZ4T519yDeefcTOMv5aOAD9cDz6Px0Xs8V3iP/9aejEJL9YmFXQ==
X-Received: by 2002:a9d:72c2:: with SMTP id d2mr11805918otk.260.1587417891893; 
 Mon, 20 Apr 2020 14:24:51 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id q206sm172423oib.2.2020.04.20.14.24.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2020 14:24:51 -0700 (PDT)
Received: (nullmailer pid 6994 invoked by uid 1000);
 Mon, 20 Apr 2020 21:24:50 -0000
Date: Mon, 20 Apr 2020 16:24:50 -0500
From: Rob Herring <robh@kernel.org>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Subject: Re: [PATCH v3 2/2] dt-bindings: Document the Synopsys ARC HDMI TX
 bindings
Message-ID: <20200420212450.GA16835@bogus>
References: <20200414232929.22788-1-Eugeniy.Paltsev@synopsys.com>
 <20200414232929.22788-3-Eugeniy.Paltsev@synopsys.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200414232929.22788-3-Eugeniy.Paltsev@synopsys.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200420_142455_981795_93FD3CE4 
X-CRM114-Status: GOOD (  19.91  )
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
 Alexey Brodkin <Alexey.Brodkin@synopsys.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 linux-snps-arc@lists.infradead.org, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Wed, Apr 15, 2020 at 02:29:29AM +0300, Eugeniy Paltsev wrote:
> This patch adds documentation of device tree bindings for the Synopsys
> HDMI 2.0 TX encoder driver for ARC SoCs.

You're going to need to base this on top of Laurent's conversion of 
dw_hdmi.txt to schema.

> 
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
> ---
>  .../display/bridge/snps,arc-dw-hdmi.yaml      | 136 ++++++++++++++++++
>  1 file changed, 136 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/snps,arc-dw-hdmi.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/snps,arc-dw-hdmi.yaml b/Documentation/devicetree/bindings/display/bridge/snps,arc-dw-hdmi.yaml
> new file mode 100644
> index 000000000000..9b2fdfecd5b3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/snps,arc-dw-hdmi.yaml
> @@ -0,0 +1,136 @@
> +# SPDX-License-Identifier: GPL-2.0

Dual license new bindings please:

(GPL-2.0-only OR BSD-2-Clause)

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/snps,arc-dw-hdmi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Synopsys DesignWare HDMI 2.0 TX encoder driver

Bindings are for h/w blocks, not drivers.

> +
> +maintainers:
> +  - Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
> +
> +description: |
> +  The HDMI transmitter is a Synopsys DesignWare HDMI 2.0 TX controller IP
> +  with a companion of Synopsys DesignWare HDMI 2.0 TX PHY IP.

Sounds like 2 blocks?

> +
> +  These DT bindings follow the Synopsys DWC HDMI TX bindings defined in
> +  Documentation/devicetree/bindings/display/bridge/dw_hdmi.txt
> +  with the following device-specific properties.
> +
> +properties:
> +  compatible:
> +    const: snps,arc-dw-hdmi-hsdk
> +
> +  reg:
> +    maxItems: 1
> +    description: |
> +      Memory mapped base address and length of the DWC HDMI TX registers.

Can drop.

> +
> +  clocks:
> +    items:
> +      - description: The bus clock for AHB / APB
> +      - description: The internal register configuration clock
> +
> +  clock-names:
> +    items:
> +      - const: iahb
> +      - const: isfr
> +
> +  interrupts:
> +    maxItems: 1
> +    description: Reference to the DWC HDMI TX interrupt

Can drop.

> +
> +  reg-io-width:
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +      - enum: [1, 4]
> +        description: |
> +          Width of the registers specified by the reg property. The
> +          value is expressed in bytes and must be equal to 1 or 4 if specified.
> +          The register width defaults to 1 if the property is not present.

default: 1

The description is pretty much a plain text version of the constraints, 
so all but the first sentence can be dropped.

> +
> +  ports:
> +    type: object
> +    description: |
> +      A ports node with endpoint definitions as defined in
> +      Documentation/devicetree/bindings/media/video-interfaces.txt

Can drop. That's all 'ports'.

> +
> +    properties:
> +      "#address-cells":
> +        const: 1
> +
> +      "#size-cells":
> +        const: 0
> +
> +      port@0:
> +        type: object
> +        description: |
> +          Video input endpoints of the controller.
> +          Usually it is associated with ARC PGU.
> +
> +      port@1:
> +        type: object
> +        description: |
> +          Output endpoints of the controller. HDMI connector.
> +
> +    required:
> +      - "#address-cells"
> +      - "#size-cells"
> +      - port@0
> +      - port@1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    hdmi@10000 {
> +        compatible = "snps,arc-dw-hdmi-hsdk";
> +        reg = <0x10000 0x10000>;
> +        reg-io-width = <4>;
> +        interrupts = <14>;
> +        clocks = <&apbclk>, <&hdmi_pix_clk>;
> +        clock-names = "iahb", "isfr";
> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            port@0 {
> +                reg = <0>;
> +                hdmi_enc_input: endpoint {
> +                    remote-endpoint = <&pgu_output>;
> +                };
> +            };
> +
> +            port@1 {
> +                reg = <1>;
> +                hdmi_enc_out: endpoint {
> +                    remote-endpoint = <&hdmi_con>;
> +                };
> +            };
> +        };
> +    };
> +
> +    hdmi-out {
> +        port {
> +            hdmi_con: endpoint {
> +                remote-endpoint = <&hdmi_enc_out>;
> +            };
> +        };
> +    };
> +
> +    pgu {
> +        port_o: port {
> +            pgu_output: endpoint {
> +                remote-endpoint = <&hdmi_enc_input>;
> +            };
> +        };
> +    };
> -- 
> 2.21.1
> 

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
