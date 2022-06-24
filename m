Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6B5BC433EF
	for <linux-snps-arc@archiver.kernel.org>; Fri, 24 Jun 2022 20:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qveDS57kKuR+jhfoFoODejYLChHrKwp+GOwXSb8lzQw=; b=vKN/ltrUuU5Jfv
	JuxX+SdDWZcSWk0RFOnt5DRF2eK5vwm3YgtC8bkxYL6SRaGMNpSJflWVCTKPkNbeVCGUUuolaG0wp
	GFhItRHphefuZWKei6h8ZI05qWhmr97NJOmRDss5Y+OpOWn972m4Ui0lZPzORkJ8/Q4CkVfZx8uLA
	ah83oTpvu2Ttx+aIolK6eowX9mZOt8RLkwI+bckZVWNyL/IxE4XXixJqyYGMf/n57v2ec7zgOUbt/
	6fp60MS+IxwmMLE9ks08w6NsZOFW6EssepObwT9BtmcJJIPqRkq0Jl+s599tmmWzk2zAYqH0rSXzt
	vWeBrryw4MuUhjFw6Q1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4qBR-003mEc-KQ; Fri, 24 Jun 2022 20:45:41 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4qBG-003mB6-JY; Fri, 24 Jun 2022 20:45:31 +0000
Received: by mail-lj1-x233.google.com with SMTP id n15so4039013ljg.8;
        Fri, 24 Jun 2022 13:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=XsPmCVrvWo3jrtNwMSfS5IhEsF2y+irWuQjpTwNLwbU=;
        b=oL3YFnb6yhUXmkgjjd1lvH+Mnakr/Trrw8Jg/ll0PUnEhMbFLPfG9QsW5HS2vtk3ep
         s5MCgqPrNa6JWLDOWJHS9foJZq9VLOcRvCxl8Qjrhf4tTLhCB/NJ8HW/lVZHDs9/0Yev
         +lnsLbW481s52JVKA+OvkBMb20EARlVz9isBn4lOaVq9+5Rv/h2YGA62mJR1JmcSwUpW
         tbaD/YUz6crNdntJ7OPx4Ixl2Aba0wDUAiErgNloMpKUJqo4sKw8FhZLVTcP6R/zjyaZ
         R2KA51+tf9x+QNpU94JhsHUzJwX+LA1Tygwxy9BXJ8W17QjAbR2Icwrm1BG1Ths3Qb3b
         3xTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XsPmCVrvWo3jrtNwMSfS5IhEsF2y+irWuQjpTwNLwbU=;
        b=hwAUiHSd9KoZqZAvuNT9Dzyky/nomq7bnXzxZLxyGn1f8DGcIl9EGKXG8apKeGetoS
         D/hf9KelQtU1UjPnnX1xoHXzKh7AF8DHmtLMQ6la+lZ7L5vMyWLis8iEBocbn8347c2m
         zTx2Hr2GYM9R0bjJ3uqznSF19zpEFDuPpZ1SzsdrkZC7kib1v9y4/8YJE8CClZwJDqjH
         YvWNivTzxSYL7MQGHI/qahGYmV4LKe6E0ccTGs+4+KmrdSVvROpU8pQ5guUJ3wjKP4Ss
         7juZVkLZTAP6qDD7O9o5Bb69e7UccOas4V4pszbF1asCa11URgLWfaxFysDLg473WCAZ
         X8DA==
X-Gm-Message-State: AJIora8cvFVi/OsiXJBzsI7kmyvIYZrXt2QWCppq8XdbZUGtAfAx78rf
	FEpRIjB8xff+5PqUpQhzqX8=
X-Google-Smtp-Source: AGRyM1tHN9ziSmwLX3zRGPZmMV7l77sL9fX++ZZooIG5PTJnyB1ooTxjOOXRrC7+xhc190A83B6bxA==
X-Received: by 2002:a05:651c:1994:b0:255:aaa3:d02 with SMTP id bx20-20020a05651c199400b00255aaa30d02mr383340ljb.410.1656103528580;
        Fri, 24 Jun 2022 13:45:28 -0700 (PDT)
Received: from mobilestation ([95.79.189.214])
        by smtp.gmail.com with ESMTPSA id s8-20020a056512202800b0047f750ecd8csm519950lfs.67.2022.06.24.13.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jun 2022 13:45:27 -0700 (PDT)
Date: Fri, 24 Jun 2022 23:45:24 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Serge Semin <Sergey.Semin@baikalelectronics.ru>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Felipe Balbi <balbi@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Alexey Brodkin <abrodkin@synopsys.com>,
	Vineet Gupta <vgupta@synopsys.com>,
	Rob Herring <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk@kernel.org>, linux-usb@vger.kernel.org,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Khuong Dinh <khuong@os.amperecomputing.com>,
	Patrice Chotard <patrice.chotard@st.com>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Paul Mackerras <paulus@samba.org>, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	linux-snps-arc@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v9 4/5] arm: dts: stih407-family: Harmonize DWC
 USB3 DT nodes name
Message-ID: <20220624204524.nveittak6ruksuvq@mobilestation>
References: <20220624141622.7149-1-Sergey.Semin@baikalelectronics.ru>
 <20220624141622.7149-5-Sergey.Semin@baikalelectronics.ru>
 <59d8a34a-a211-d00a-2243-6ad51cfa4204@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <59d8a34a-a211-d00a-2243-6ad51cfa4204@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220624_134530_700563_FC78525E 
X-CRM114-Status: GOOD (  19.06  )
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

On Fri, Jun 24, 2022 at 07:18:57PM +0200, Krzysztof Kozlowski wrote:
> On 24/06/2022 16:16, Serge Semin wrote:
> > In accordance with the DWC USB3 bindings the corresponding node
> > name is suppose to comply with the Generic USB HCD DT schema, which
> > requires the USB nodes to have the name acceptable by the regexp:
> > "^usb(@.*)?" . Make sure the "snps,dwc3"-compatible nodes are correctly
> > named.
> > 
> > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
> > Reviewed-by: Patrice Chotard <patrice.chotard@st.com>
> > ---
> >  arch/arm/boot/dts/stih407-family.dtsi | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm/boot/dts/stih407-family.dtsi b/arch/arm/boot/dts/stih407-family.dtsi
> > index 1713f7878117..7ba528315dbe 100644
> > --- a/arch/arm/boot/dts/stih407-family.dtsi
> > +++ b/arch/arm/boot/dts/stih407-family.dtsi
> > @@ -725,7 +725,7 @@ st_dwc3: dwc3@8f94000 {
> >  
> >  			status = "disabled";
> >  
> > -			dwc3: dwc3@9900000 {
> > +			dwc3: usb@9900000 {
> 

> This does not apply. What tree is it based on?

That's weird. The series has been rebased onto the mainline kernel v5.19-rc3.
Do you have the stih407 dtsi fixed on your local repo?

-Sergey

> 
> 
> Best regards,
> Krzysztof

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
