Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A7AAC54FC6
	for <linux-snps-arc@archiver.kernel.org>; Sun, 25 May 2025 02:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zxtTG3D4tfCqaIaftivuWPppxWg7QKmJncUrm52wWIk=; b=0UmTU8R7BZOfMa
	ocqMQCA7GObEPHXbmey8CDBCs1NtcD+bJ1xwhH22SylJ8YOtXKQKkysxusIBznI1H86/fBDwa2vy3
	7XcrWPJAa8P0Nm0QH9CJ15iHPT6S57igkkg1cKW4fDqQaD8aYQY4TX0kekNGTgjpY7tckRkVBLS/F
	AwvMhQ9xxeELrlRYVhlJu14I5liEIofqonrN10+4CrcbimoB60Tji7QLC8/1UEFA5RA1PT+D2kpRb
	97fdNIeX/fl6yJgx0S90It3IYSuSIbmSoqrUEXkwPMnep12vybNbuUBobdKv6gRGQxjnaWmtkr9O2
	HeEn4+AtGVowN4RmbPUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJ1Ms-00000006USu-45zQ;
	Sun, 25 May 2025 02:45:42 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJ1Mq-00000006US2-2KjM
	for linux-snps-arc@lists.infradead.org;
	Sun, 25 May 2025 02:45:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 70DD05C481B;
	Sun, 25 May 2025 02:43:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9EBDC4CEF0;
	Sun, 25 May 2025 02:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748141139;
	bh=S6Fau+ry1gmJ6BpShZI9+5zRHmA6PBzL9b3ZyN/ZoAY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=aVKw7+5iupi3Y9ILHEI4pFZ+xnMoGtWMW2sTqOeyKlgRw0uspJ3XyNrTuQhAmG7kA
	 8okJyEQpPynzufkWu95qyqm5r8gYJvuU/FCLdAhe45pCN/er+YOmwMWOW0ubCfyF91
	 mQgwQiwQgKVU1EUkj8liRV898khMrh7Iaz2ZVmXtP3TvD9o7AHoLRLJObXzxbowjwl
	 roNC1Mjfo8meSpNheCS2hTakBW4vnKB3Sed8zmHqbLQCrFR2Nlqf9KA83bhuPBBrXX
	 U7Vy6ay9hVEX5rnydR9tcKycUeAWqxHAVrFG3fygb0Vw31c8LQQ0fY7NyHUcFBNYZC
	 BsRR3Ri8XyLSA==
Message-ID: <902daf9d-c728-420e-b6e7-4f52a0833e02@kernel.org>
Date: Sat, 24 May 2025 19:45:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: interrupt-controller: Convert
 snps,archs-intc to DT schema
To: "Rob Herring (Arm)" <robh@kernel.org>, Vineet Gupta <vgupta@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250505144834.1292666-1-robh@kernel.org>
From: Vineet Gupta <vgupta@kernel.org>
Content-Language: en-US
In-Reply-To: <20250505144834.1292666-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250524_194540_680887_5A46B095 
X-CRM114-Status: GOOD (  16.57  )
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
> Convert the ARC-HS incore interrupt controller binding to schema format.
> It's a straight-forward conversion of the typical interrupt controller.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>



Acked-by: Vineet Gupta <vgupta@kernel.org>

Thx,
-Vineet

> ---
>  .../interrupt-controller/snps,archs-intc.txt  | 22 ---------
>  .../interrupt-controller/snps,archs-intc.yaml | 48 +++++++++++++++++++
>  2 files changed, 48 insertions(+), 22 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/snps,archs-intc.txt
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/snps,archs-intc.yaml
>
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/snps,archs-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/snps,archs-intc.txt
> deleted file mode 100644
> index 69f326d6a5ad..000000000000
> --- a/Documentation/devicetree/bindings/interrupt-controller/snps,archs-intc.txt
> +++ /dev/null
> @@ -1,22 +0,0 @@
> -* ARC-HS incore Interrupt Controller (Provided by cores implementing ARCv2 ISA)
> -
> -Properties:
> -
> -- compatible: "snps,archs-intc"
> -- interrupt-controller: This is an interrupt controller.
> -- #interrupt-cells: Must be <1>.
> -
> -  Single Cell "interrupts" property of a device specifies the IRQ number
> -  between 16 to 256
> -
> -  intc accessed via the special ARC AUX register interface, hence "reg" property
> -  is not specified.
> -
> -Example:
> -
> -	intc: interrupt-controller {
> -		compatible = "snps,archs-intc";
> -		interrupt-controller;
> -		#interrupt-cells = <1>;
> -		interrupts = <16 17 18 19 20 21 22 23 24 25>;
> -	};
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/snps,archs-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/snps,archs-intc.yaml
> new file mode 100644
> index 000000000000..9d248ef7fe3d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/snps,archs-intc.yaml
> @@ -0,0 +1,48 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/interrupt-controller/snps,archs-intc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ARC-HS incore Interrupt Controller
> +
> +maintainers:
> +  - Vineet Gupta <vgupta@kernel.org>
> +
> +description:
> +  ARC-HS incore Interrupt Controller provided by cores implementing ARCv2 ISA.
> +  intc accessed via the special ARC AUX register interface, hence "reg" property
> +  is not specified.
> +
> +properties:
> +  compatible:
> +    const: snps,archs-intc
> +
> +  interrupt-controller: true
> +
> +  '#interrupt-cells':
> +    const: 1
> +
> +  interrupts:
> +    description: List of IRQ numbers between 16 and 256
> +    items:
> +      items:
> +        - minimum: 16
> +          maximum: 256
> +
> +required:
> +  - compatible
> +  - interrupt-controller
> +  - '#interrupt-cells'
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    interrupt-controller {
> +        compatible = "snps,archs-intc";
> +        interrupt-controller;
> +        #interrupt-cells = <1>;
> +        interrupts = <16>, <17>, <18>, <19>, <20>, <21>, <22>, <23>, <24>, <25>;
> +    };


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
