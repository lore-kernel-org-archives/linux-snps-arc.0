Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA93ECCA47E
	for <linux-snps-arc@archiver.kernel.org>; Fri, 24 Jun 2022 17:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EiPN6kD/bM7FlDXYrJkjw9PL7mp03uVNUG3lmE4Qkp4=; b=ORX9HP0A/5IJhw
	Ra+w15WwowFQktVD1+ptQXuPt+zfyA142UmMXQBT96fRbwzvgERQBmW0GIRRvBNQZ6nCa1HQr468o
	ik9cqWdQ6Ot1zaNI/5n8/5gaFkAPiJ6o6psxEYU75TOP6DKpG4RHbEoHs/OcDTdLhFdunLLjcitl5
	PFavQ9GKOdvA19Newu90n0JuQ5+CJtjonmMRaVIB1iS+bRpMJHYdlsm9sdlQ532pd3NWvV9ZDPDvp
	holiniJWc3IhE4y6v/897iZJm7E8tPYGw1ebhDAwibPte8iZ6Xt8WH87PnTcLUNp61KGr1G0vW9PM
	GxPBPHr4qyghuS6LWqNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4mxU-003C1V-SM; Fri, 24 Jun 2022 17:19:04 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4mxS-003ByB-8y
	for linux-snps-arc@lists.infradead.org; Fri, 24 Jun 2022 17:19:03 +0000
Received: by mail-ed1-x52c.google.com with SMTP id fd6so4395990edb.5
        for <linux-snps-arc@lists.infradead.org>; Fri, 24 Jun 2022 10:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=1mS7MeLhqDF7A//E5jhahypB/uovVI38NPPCc6RFQiA=;
        b=wK1ybY4CMPD/YhNJv23Qg1YqoIQNUGv2qDLbhKLlEQ5sqGRcXIZl4ppBi5VxBgUEZP
         Q5E31vOb3OBa5sHriAEnzm8iG/QPcJZ6C4WNwsRfovG9jffNupHbCS320644Ira5RO5+
         e0nkL2q9J7UDXrq+Z9XEtGorNlDdpAtEgcKrvPRgG+Dfc1/ss0mkrDvgndsYowaOvZi7
         H0f71PiR3zR6BVxvifMWTAjd/ucp6t8aaZsi2Zn2jth4JGkKV/weLgkEIDmqdP3FIXQ0
         SH2e30+e009E3e8qOZq8XwLFbRhQBIr9UqCXxjjGaBJleMnleMlL51oDiM1gUUdlilcI
         rQcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=1mS7MeLhqDF7A//E5jhahypB/uovVI38NPPCc6RFQiA=;
        b=jez82crDyb90bA1nCTLnsGpmEWpHIhQqADLbRS0DAoqiJBLWZkQ0n6zdE9dtiTB6cq
         5hqKV9IpJ7+LBUt8kFlwMVKrB/vfQFrlsH8WkRbP11dAOBAduXZV7YucTJ15TRDhTu1a
         LlcS81lZY4RHL5NEJ7I/40Kb+FAEqQnrSEe73krnzcsIrIRlN1DnN1FfQTQ912XO27i3
         irJiL9Nvgb9Ttq5INqpVa3hTmGEtkoqeA29MaYsnsYVKtom1FHu7e7oocTXOSMMSCGnA
         CL87WsElmM8sKfOm/C+10DbqRbSIsvnYzvjkmC7EpoxGO6A9bl1Wzr+m1Jx+oPlgzvlY
         hvdA==
X-Gm-Message-State: AJIora9p14SrsY7y01qs5fK6Qc1UFlcPhkpm6caEQog8kjqJmHNoobXb
	/pY8RcPpBS7CDxvHj/kgcvihfw==
X-Google-Smtp-Source: AGRyM1tGTpZKHip8vrhphzvWpCMKPL/90cL8453ozIuX6HfyfUoBcF1h+aKQ1UNEk0xmQKnKS7KfJQ==
X-Received: by 2002:a05:6402:104a:b0:435:c7cd:11dc with SMTP id e10-20020a056402104a00b00435c7cd11dcmr105928edu.335.1656091140072;
        Fri, 24 Jun 2022 10:19:00 -0700 (PDT)
Received: from [192.168.0.237] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id r13-20020a170906a20d00b006fec9cf9237sm1419402ejy.130.2022.06.24.10.18.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jun 2022 10:18:59 -0700 (PDT)
Message-ID: <59d8a34a-a211-d00a-2243-6ad51cfa4204@linaro.org>
Date: Fri, 24 Jun 2022 19:18:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH RESEND v9 4/5] arm: dts: stih407-family: Harmonize DWC
 USB3 DT nodes name
Content-Language: en-US
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Felipe Balbi <balbi@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Vladimir Zapolskiy <vz@mleia.com>,
 Alexey Brodkin <abrodkin@synopsys.com>, Vineet Gupta <vgupta@synopsys.com>,
 Rob Herring <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-usb@vger.kernel.org,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Serge Semin <fancer.lancer@gmail.com>,
 Khuong Dinh <khuong@os.amperecomputing.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, linux-arm-msm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-snps-arc@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20220624141622.7149-1-Sergey.Semin@baikalelectronics.ru>
 <20220624141622.7149-5-Sergey.Semin@baikalelectronics.ru>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220624141622.7149-5-Sergey.Semin@baikalelectronics.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220624_101902_457007_0349A21F 
X-CRM114-Status: GOOD (  15.13  )
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

On 24/06/2022 16:16, Serge Semin wrote:
> In accordance with the DWC USB3 bindings the corresponding node
> name is suppose to comply with the Generic USB HCD DT schema, which
> requires the USB nodes to have the name acceptable by the regexp:
> "^usb(@.*)?" . Make sure the "snps,dwc3"-compatible nodes are correctly
> named.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
> Reviewed-by: Patrice Chotard <patrice.chotard@st.com>
> ---
>  arch/arm/boot/dts/stih407-family.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/stih407-family.dtsi b/arch/arm/boot/dts/stih407-family.dtsi
> index 1713f7878117..7ba528315dbe 100644
> --- a/arch/arm/boot/dts/stih407-family.dtsi
> +++ b/arch/arm/boot/dts/stih407-family.dtsi
> @@ -725,7 +725,7 @@ st_dwc3: dwc3@8f94000 {
>  
>  			status = "disabled";
>  
> -			dwc3: dwc3@9900000 {
> +			dwc3: usb@9900000 {

This does not apply. What tree is it based on?


Best regards,
Krzysztof

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
