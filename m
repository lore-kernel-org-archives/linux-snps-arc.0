Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8E74C54ED1
	for <linux-snps-arc@archiver.kernel.org>; Sun, 25 May 2025 02:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XinektYpZoDeux2mu/gOQVk+LdwjiyAEeD8Qi48K5rI=; b=WqxfBm3wXROpCh
	MCmSUnG9dA4LyChd6+HPFHvIGDZqtRFTkZwOb5lv4nnx8Xy/8Z5mNDK5mlI+2YFJ81p1K4tMoNXQ3
	oyML+NWC3Rz44zNEMotJ9wEHXuVymmwu1dP4nPvQA+VMy3aoRnJ0GBw4KUOaVKAErUHqFa2DvM0uG
	ESF/wNxsxs3M7shgwT39uvvmD1r03GumJDkCWuNjU5U17YOfJAXylFV8pEbfODnVm+laUSNj2VCfh
	869W8Q6af0ginffnmV+EjNTgO2bb+l0CaN0Nz/5BwvKt8/EyMEKUjoZ8NJRjtvoW9T/WIF+DsACtu
	1ahichn+QBcNlTzJWJ1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJ1Mg-00000006UPo-2xHQ;
	Sun, 25 May 2025 02:45:30 +0000
Received: from out-176.mta1.migadu.com ([2001:41d0:203:375::b0])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJ1Md-00000006UP7-3RYR
	for linux-snps-arc@lists.infradead.org;
	Sun, 25 May 2025 02:45:29 +0000
Message-ID: <2ea8e74c-ae85-48ac-b6b2-9d2d07c2efcb@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1748141124;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z/VGYMPCRsZqyLoORFYnZrDpnhIcMfNxO5C+FLY1phw=;
	b=lCvLQmPLL/pHbkotWbuX/47ZwArlPfr4LlMOSHH0WtcBost3uR7bOFS32Sp7ndIDMYwvWa
	+n/D93CDC3SzmlNbsigju+w8H+cUDpFSCh82j97d3vxDTXkvXWZk6DFiyo28L60IbGihqs
	2+PpQ4CuFPVwchmb9Eqc+v4XBRf71kI=
Date: Sat, 24 May 2025 19:45:17 -0700
MIME-Version: 1.0
Subject: Re: [PATCH] dt-bindings: interrupt-controller: Convert
 snps,archs-idu-intc to DT schema
To: "Rob Herring (Arm)" <robh@kernel.org>, Vineet Gupta <vgupta@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250505144830.1292495-1-robh@kernel.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vineet Gupta <vineet.gupta@linux.dev>
Content-Language: en-US
In-Reply-To: <20250505144830.1292495-1-robh@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250524_194528_145038_731AED47 
X-CRM114-Status: GOOD (  20.39  )
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

On 5/5/25 07:48, Rob Herring (Arm) wrote:
> Convert the ARC-HS Interrupt Distribution Unit interrupt controller
> binding to schema format. It's a straight-forward conversion of the
> typical interrupt controller.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>


Acked-by: Vineet Gupta <vgupta@kernel.org>

Thx,
-Vineet

> ---
>  .../snps,archs-idu-intc.txt                   | 46 ------------------
>  .../snps,archs-idu-intc.yaml                  | 48 +++++++++++++++++++
>  2 files changed, 48 insertions(+), 46 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/snps,archs-idu-intc.txt
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/snps,archs-idu-intc.yaml
>
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/snps,archs-idu-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/snps,archs-idu-intc.txt
> deleted file mode 100644
> index a5c1db95b3ec..000000000000
> --- a/Documentation/devicetree/bindings/interrupt-controller/snps,archs-idu-intc.txt
> +++ /dev/null
> @@ -1,46 +0,0 @@
> -* ARC-HS Interrupt Distribution Unit
> -
> -  This optional 2nd level interrupt controller can be used in SMP configurations
> -  for dynamic IRQ routing, load balancing of common/external IRQs towards core
> -  intc.
> -
> -Properties:
> -
> -- compatible: "snps,archs-idu-intc"
> -- interrupt-controller: This is an interrupt controller.
> -- #interrupt-cells: Must be <1> or <2>.
> -
> -  Value of the first cell specifies the "common" IRQ from peripheral to IDU.
> -  Number N of the particular interrupt line of IDU corresponds to the line N+24
> -  of the core interrupt controller.
> -
> -  The (optional) second cell specifies any of the following flags:
> -    - bits[3:0] trigger type and level flags
> -        1 = low-to-high edge triggered
> -        2 = NOT SUPPORTED (high-to-low edge triggered)
> -        4 = active high level-sensitive <<< DEFAULT
> -        8 = NOT SUPPORTED (active low level-sensitive)
> -  When no second cell is specified, the interrupt is assumed to be level
> -  sensitive.
> -
> -  The interrupt controller is accessed via the special ARC AUX register
> -  interface, hence "reg" property is not specified.
> -
> -Example:
> -	core_intc: core-interrupt-controller {
> -		compatible = "snps,archs-intc";
> -		interrupt-controller;
> -		#interrupt-cells = <1>;
> -	};
> -
> -	idu_intc: idu-interrupt-controller {
> -		compatible = "snps,archs-idu-intc";
> -		interrupt-controller;
> -		interrupt-parent = <&core_intc>;
> -		#interrupt-cells = <1>;
> -	};
> -
> -	some_device: serial@c0fc1000 {
> -		interrupt-parent = <&idu_intc>;
> -		interrupts = <0>;	/* upstream idu IRQ #24 */
> -	};
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/snps,archs-idu-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/snps,archs-idu-intc.yaml
> new file mode 100644
> index 000000000000..286a964f23e1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/snps,archs-idu-intc.yaml
> @@ -0,0 +1,48 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/snps,archs-idu-intc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ARC-HS Interrupt Distribution Unit
> +
> +maintainers:
> +  - Vineet Gupta <vgupta@kernel.org>
> +
> +description: >
> +  ARC-HS Interrupt Distribution Unit is an optional 2nd level interrupt
> +  controller which can be used in SMP configurations for dynamic IRQ routing,
> +  load balancing of common/external IRQs towards core intc.
> +
> +  The interrupt controller is accessed via the special ARC AUX register
> +  interface, hence "reg" property is not specified.
> +
> +properties:
> +  compatible:
> +    const: snps,archs-idu-intc
> +
> +  interrupt-controller: true
> +
> +  '#interrupt-cells':
> +    description: |
> +      Number of interrupt specifier cells:
> +        - 1: only a common IRQ is specified.
> +        - 2: a second cell encodes trigger type and level flags:
> +            1 = low-to-high edge triggered
> +            4 = active high level-sensitive (default)
> +    enum: [1, 2]
> +
> +required:
> +  - compatible
> +  - interrupt-controller
> +  - '#interrupt-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    interrupt-controller {
> +        compatible = "snps,archs-idu-intc";
> +        interrupt-controller;
> +        #interrupt-cells = <1>;
> +    };


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
