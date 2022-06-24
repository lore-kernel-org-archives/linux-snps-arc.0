Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 007C6CCA473
	for <linux-snps-arc@archiver.kernel.org>; Fri, 24 Jun 2022 17:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/AzNiOza4lfTOZu88l/nJpURUFbLPkNlooPYM0PQqU0=; b=nNg0d8MUwYgi9u
	wDy//YrYV1OfZ4OuJHag63h719+X+85kPCQ+O5VplGXyvCwaS/Z/6X9uE4JDTENB3ngtr7kiqJe6F
	JJMDcJ73Ac93I+RyYMPeMtDdn/P+OHxqJQQ4gtQt1+osXrMKwTNNODcP70uoo1hJhKpvvKuHIo7i2
	vjh1WKJRrdiRNhSJ4eLg7Q4ig7yAgNU7nEmebPStRqMpXNjmdfyjscYwvE2z6JGycUqEwe4/3RMps
	yUQN9RxStMlx4XMtkWMa4737f3R8Ji3NREfXYQudwh3I7LaGQz0QOhJOAVqbQ8AWlfflGTA8d8UEi
	KeGOltDhhFIMG24HjrSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4mwU-003BYF-RK; Fri, 24 Jun 2022 17:18:02 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4mwR-003BVf-Fb
	for linux-snps-arc@lists.infradead.org; Fri, 24 Jun 2022 17:18:01 +0000
Received: by mail-ed1-x52a.google.com with SMTP id eq6so4378955edb.6
        for <linux-snps-arc@lists.infradead.org>; Fri, 24 Jun 2022 10:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=QO2xbsZ3DwvoKI/D5PILJK1SdhtLthoBmyVWXf1LehI=;
        b=riSm0FlJgfp0dBXID4v2NQTo8SOXgPflsvQMGoR86iK28ba4yxmwUwoptM5dWWwqiK
         l92EzP4jSf90Vr6x5ir0jYK5+FZ4heKpnbMunI96UycBMM/+hJ215k0q1ix6PoOI2thy
         lF0Wa4WLjnysW1sJOztWQ+P7JfqPzrCtfa7vIQVND31KXECN2mFIKtRLXEmjAht+RmTi
         YCgR9I+Q1NnYWY0f23VoAhWfs5dezqTksdH8IFWUG4gdSQjTNv8d9dn1JHcvhEhfCxI3
         aXbV6F/rzDH7S+weQyW9AQPMaB8I7rhhDZ6oT43UElcY5k5ZXd95jkJ9AVsarenT5E4O
         bzKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=QO2xbsZ3DwvoKI/D5PILJK1SdhtLthoBmyVWXf1LehI=;
        b=fmNksfOjfuqeYUEuMm13zBIYLdFIejtHnoIsYhYZNglMRysmQXt6REPoIZ/+34pZ6y
         CrmzPIQOjoR3cEVNrVm7WedcCnCP11y9wcqmNelaJZZbZMeWSdftiYUWnRYPudVJQseX
         boqknsVX9TpQxq4eK303xzMrrCvxM2ZRtBJsGP4oqOdL2WczHq4IwKLvk5aALn4pEC5X
         r3MR+tNjGC5qlq1hW3lRjVuco3N8MW2b5vBD1kmdB7Tuigj/OYWZN6V2OVFSbJUpgic+
         pHX4pvn9hXr1H3ZwTfCh1YPhK8gqLGNEm8Qb54XuFjh0mKXEiKromyW1sLchS/a0EFN0
         PpYg==
X-Gm-Message-State: AJIora+FOln489C3Dr1qUzU9aSC7B6twd5kUWcctPdu2GIIfalh5e3ZB
	B5e71A2ZrBWh/Om0OD8b9CuivA==
X-Google-Smtp-Source: AGRyM1vVErSqX7pCRC/e1QSjDBJkieHwm2TXbOHt/piwTVUPc3SDtWWTG3XRwFKOkHtmw9wUqQ2Gfw==
X-Received: by 2002:aa7:c45a:0:b0:435:d7a4:99bc with SMTP id n26-20020aa7c45a000000b00435d7a499bcmr168035edr.158.1656091075738;
        Fri, 24 Jun 2022 10:17:55 -0700 (PDT)
Received: from [192.168.0.237] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id z4-20020a1709060f0400b00722f069fd40sm1411264eji.159.2022.06.24.10.17.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jun 2022 10:17:55 -0700 (PDT)
Message-ID: <eb00b6c3-ae5e-9858-ab5f-fd78229ff436@linaro.org>
Date: Fri, 24 Jun 2022 19:17:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH RESEND v9 5/5] arm64: dts: apm: Harmonize DWC USB3 DT
 nodes name
Content-Language: en-US
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Felipe Balbi <balbi@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Vladimir Zapolskiy <vz@mleia.com>,
 Alexey Brodkin <abrodkin@synopsys.com>, Vineet Gupta <vgupta@synopsys.com>,
 Rob Herring <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-usb@vger.kernel.org,
 Khuong Dinh <khuong@os.amperecomputing.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Serge Semin <fancer.lancer@gmail.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, linux-arm-msm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-snps-arc@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20220624141622.7149-1-Sergey.Semin@baikalelectronics.ru>
 <20220624141622.7149-6-Sergey.Semin@baikalelectronics.ru>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220624141622.7149-6-Sergey.Semin@baikalelectronics.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220624_101759_609861_8A1DC4CF 
X-CRM114-Status: GOOD (  16.68  )
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
> named despite of the warning comment about possible backward
> compatibility issues.

Sometimes node name is exposed to user-space which depends on it. How
did you check there is no issue here?

> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  arch/arm64/boot/dts/apm/apm-shadowcat.dtsi | 4 ++--
>  arch/arm64/boot/dts/apm/apm-storm.dtsi     | 6 +++---
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/apm/apm-shadowcat.dtsi b/arch/arm64/boot/dts/apm/apm-shadowcat.dtsi
> index a83c82c50e29..832dd85b00bd 100644
> --- a/arch/arm64/boot/dts/apm/apm-shadowcat.dtsi
> +++ b/arch/arm64/boot/dts/apm/apm-shadowcat.dtsi
> @@ -597,8 +597,8 @@ serial0: serial@10600000 {
>  			interrupts = <0x0 0x4c 0x4>;
>  		};
>  
> -		/* Do not change dwusb name, coded for backward compatibility */
> -		usb0: dwusb@19000000 {
> +		/* Node-name might need to be coded as dwusb for backward compatibility */
> +		usb0: usb@19000000 {
>  			status = "disabled";
>  			compatible = "snps,dwc3";
>  			reg =  <0x0 0x19000000 0x0 0x100000>;
> diff --git a/arch/arm64/boot/dts/apm/apm-storm.dtsi b/arch/arm64/boot/dts/apm/apm-storm.dtsi
> index 0f37e77f5459..1520a945b7f9 100644
> --- a/arch/arm64/boot/dts/apm/apm-storm.dtsi
> +++ b/arch/arm64/boot/dts/apm/apm-storm.dtsi
> @@ -923,8 +923,8 @@ sata3: sata@1a800000 {
>  			phy-names = "sata-phy";
>  		};
>  
> -		/* Do not change dwusb name, coded for backward compatibility */
> -		usb0: dwusb@19000000 {
> +		/* Node-name might need to be coded as dwusb for backward compatibility */
> +		usb0: usb@19000000 {
>  			status = "disabled";
>  			compatible = "snps,dwc3";
>  			reg =  <0x0 0x19000000 0x0 0x100000>;
> @@ -933,7 +933,7 @@ usb0: dwusb@19000000 {
>  			dr_mode = "host";
>  		};
>  
> -		usb1: dwusb@19800000 {
> +		usb1: usb@19800000 {
>  			status = "disabled";
>  			compatible = "snps,dwc3";
>  			reg =  <0x0 0x19800000 0x0 0x100000>;


Best regards,
Krzysztof

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
