Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CE2FC43334
	for <linux-snps-arc@archiver.kernel.org>; Fri, 24 Jun 2022 20:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rXSXfyqlVQFXkO4QJLU2VXH2FM7gbDW4tGiHPNnEejU=; b=Jfwmrj1WrvXj7E
	GEC3v1YvQCaa1gfWJt33ybEnipacD6WFfFo2g4i0XMwx34wk++rPOEKin5C4pzD9YCyIyEOkT0tWo
	TJiBdUVFrqmUnwYpqhtJEtVsTp5PjwyorSpZC3KMsL43yyCH9IWwkYlKlQkHdMInKd733WZx/+srR
	K11z/Rn1TBENHZos7+anpGvtWjGoXSgm958JPp8B5zGz+bXmT1JcocjPAYDRlTauDM1o3jc5nSxyi
	XzqXZgV94bPeNRT44Wbo6GGlQzquWwLgI6ekCggTq5OQWnE/QvOS9ZDpxwbpj4T1BX3RiCW0UTbFb
	5MX1HGHvEjRPQ4E3XbRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4qOc-003o61-Md; Fri, 24 Jun 2022 20:59:18 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4qOR-003o3g-Rn; Fri, 24 Jun 2022 20:59:09 +0000
Received: by mail-lj1-x22b.google.com with SMTP id c30so4065955ljr.9;
        Fri, 24 Jun 2022 13:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=eZSZCpbsimxpe8y0nI2vhGyb3S9o4fusHBXGkJK5Cfc=;
        b=QtMwHvmYMWJKh0ZLqnKgANF/OLV82B74Mco6zvnuZeUejNoYhy3/XMUTG/IZxeWN1g
         kJdFX7Hjjll5/gBbGDFfE6NZ8Z29REr8unbv/+Rw3EywhBgZrzUKHOFbsy+9hm74n6W9
         FgxFz9+BxFFugBZ7wGl/0JzWCFktsdwHV3yRMFgHnNXL54N/hJPqiRFrtpAHgfAV26va
         xmrjOfYjXA5cjt979wG15bgUAfQ9zTnFdadgyXYvvGP+unwebPCQDrxzW6mC4gLjZm8L
         VBd3ejedJJ834pxFVJIh0zkDdBaoMunu6IPVDte8eqiNoRGsva/W17BJryh5PbVTYkVi
         zfXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eZSZCpbsimxpe8y0nI2vhGyb3S9o4fusHBXGkJK5Cfc=;
        b=J9tIHWVciedvLpkPJUVb5iuzFUUxCRZQvVCNBKOFTT77gPkHWxytopDRpTdtfaty2s
         EhcdVfv/RInCWUBM8QQ9HYNV2U7Zi6vzBP0lcTrSoAFHuIrjfSzeGILtXfUW5NMk5EID
         i9NwnB3T/iSjvwM+wVq3a2sQMgGuYtydxKgzxb0L0trTdFxWy3VS76D60CTveN7IApmK
         PKQXkMKRUf3Oan7BxJvFOixwlQ47DY8sYFPhs9/CjwoFTV90L114KO9c56Rtc+rYYNkb
         EbrLFAX8xCJn/hSkC4+DUEMxoxAyfVuJE1O5MnOXgo1WYU8lgR8dn+kXH7UG7lYiWBKZ
         +bPA==
X-Gm-Message-State: AJIora9CWasoYe9t9k9e2/lmmHJcUH2bnLwBAcD2FWDmIUnB2McA7lXZ
	NWljj4v5pdRroBDtVSaBct8=
X-Google-Smtp-Source: AGRyM1v6fuennno+VmySkb2y5X/FFQLPUJh7sXw3iLNDmiKty2pRq4AJTIzsRg4onyEuYZ8fkJyBPA==
X-Received: by 2002:a05:651c:1617:b0:25a:9e88:af82 with SMTP id f23-20020a05651c161700b0025a9e88af82mr401410ljq.106.1656104345088;
        Fri, 24 Jun 2022 13:59:05 -0700 (PDT)
Received: from mobilestation ([95.79.189.214])
        by smtp.gmail.com with ESMTPSA id 13-20020ac2568d000000b0047fa40b5052sm523338lfr.62.2022.06.24.13.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jun 2022 13:59:04 -0700 (PDT)
Date: Fri, 24 Jun 2022 23:59:02 +0300
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
	Khuong Dinh <khuong@os.amperecomputing.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Patrice Chotard <patrice.chotard@st.com>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Paul Mackerras <paulus@samba.org>, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	linux-snps-arc@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v9 5/5] arm64: dts: apm: Harmonize DWC USB3 DT
 nodes name
Message-ID: <20220624205902.y2un4lr7d3zkc6jx@mobilestation>
References: <20220624141622.7149-1-Sergey.Semin@baikalelectronics.ru>
 <20220624141622.7149-6-Sergey.Semin@baikalelectronics.ru>
 <eb00b6c3-ae5e-9858-ab5f-fd78229ff436@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <eb00b6c3-ae5e-9858-ab5f-fd78229ff436@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220624_135907_939667_DF47FAC8 
X-CRM114-Status: GOOD (  25.65  )
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

On Fri, Jun 24, 2022 at 07:17:53PM +0200, Krzysztof Kozlowski wrote:
> On 24/06/2022 16:16, Serge Semin wrote:
> > In accordance with the DWC USB3 bindings the corresponding node
> > name is suppose to comply with the Generic USB HCD DT schema, which
> > requires the USB nodes to have the name acceptable by the regexp:
> > "^usb(@.*)?" . Make sure the "snps,dwc3"-compatible nodes are correctly
> > named despite of the warning comment about possible backward
> > compatibility issues.
> 

> Sometimes node name is exposed to user-space which depends on it. How
> did you check there is no issue here?

I well remember the Qcom problem caused by one of my patch:
https://lore.kernel.org/lkml/CALAqxLX_FNvFndEDWtGbFPjSzuAbfqxQE07diBJFZtftwEJX5A@mail.gmail.com/

The next patch caused the same problem, but hasn't been reverted.
https://lore.kernel.org/lkml/CALAqxLWGujgR7p8Vb5S_RimRVYxwm5XF-c4NkKgMH-43wEBaWg@mail.gmail.com/

As before I am more inclined to thinking that the problem was mainly caused
by the improper node-name utilization. Anyway John later noted that the
problem was fixed in the user-space. That why afterwards you were able
to provide the commit b77a1c4d6b05 ("arm64: dts: qcom: correct DWC3
node names and unit addresses").

Anyway I am not able to track the way the node-name is used on the
affected platform and can't make sure that the dts would be still
working well on that devices. But seeing nobody responded/commented on
this patch for more than a year we can at least try to merge this in
and see whether it causes any problem should the denoted platform is
still in use. If it does we can revert the update back and forget
about it.

-Sergey

> 
> > 
> > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
> > ---
> >  arch/arm64/boot/dts/apm/apm-shadowcat.dtsi | 4 ++--
> >  arch/arm64/boot/dts/apm/apm-storm.dtsi     | 6 +++---
> >  2 files changed, 5 insertions(+), 5 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/apm/apm-shadowcat.dtsi b/arch/arm64/boot/dts/apm/apm-shadowcat.dtsi
> > index a83c82c50e29..832dd85b00bd 100644
> > --- a/arch/arm64/boot/dts/apm/apm-shadowcat.dtsi
> > +++ b/arch/arm64/boot/dts/apm/apm-shadowcat.dtsi
> > @@ -597,8 +597,8 @@ serial0: serial@10600000 {
> >  			interrupts = <0x0 0x4c 0x4>;
> >  		};
> >  
> > -		/* Do not change dwusb name, coded for backward compatibility */
> > -		usb0: dwusb@19000000 {
> > +		/* Node-name might need to be coded as dwusb for backward compatibility */
> > +		usb0: usb@19000000 {
> >  			status = "disabled";
> >  			compatible = "snps,dwc3";
> >  			reg =  <0x0 0x19000000 0x0 0x100000>;
> > diff --git a/arch/arm64/boot/dts/apm/apm-storm.dtsi b/arch/arm64/boot/dts/apm/apm-storm.dtsi
> > index 0f37e77f5459..1520a945b7f9 100644
> > --- a/arch/arm64/boot/dts/apm/apm-storm.dtsi
> > +++ b/arch/arm64/boot/dts/apm/apm-storm.dtsi
> > @@ -923,8 +923,8 @@ sata3: sata@1a800000 {
> >  			phy-names = "sata-phy";
> >  		};
> >  
> > -		/* Do not change dwusb name, coded for backward compatibility */
> > -		usb0: dwusb@19000000 {
> > +		/* Node-name might need to be coded as dwusb for backward compatibility */
> > +		usb0: usb@19000000 {
> >  			status = "disabled";
> >  			compatible = "snps,dwc3";
> >  			reg =  <0x0 0x19000000 0x0 0x100000>;
> > @@ -933,7 +933,7 @@ usb0: dwusb@19000000 {
> >  			dr_mode = "host";
> >  		};
> >  
> > -		usb1: dwusb@19800000 {
> > +		usb1: usb@19800000 {
> >  			status = "disabled";
> >  			compatible = "snps,dwc3";
> >  			reg =  <0x0 0x19800000 0x0 0x100000>;
> 
> 
> Best regards,
> Krzysztof

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
