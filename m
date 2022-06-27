Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EF32CCA47F
	for <linux-snps-arc@archiver.kernel.org>; Mon, 27 Jun 2022 21:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nw9ekbuUjJtSoQwYZtpDUSr/uIiYA/QXIOsPDsDXixc=; b=Zxqjb1h+9wo9X5
	UO1qXwU3MpCLxaL5rHw9oeRyGHQojWGoh5siukGiOy/wTFlv/fuxzjy3WomaPw14d7kScLnigm/at
	kRVdQWecRz3Va6pVIW2KquxuAKLtjjjYw0rshGomKOepGgzmd2wdLmo4OwHJp4v+2FvdJeSJq+rZH
	8rNYFV2FPISs2Va/5QxKxpMDWWS7jb+q61yVtd0CKGV56KwcdVEQbjkicYs4eaQWJxz95+KSXHHtL
	gVkN4tEGlLa3e5xR8Vid05e5QdyMIfX72Q51NTEA5+WHBCeq2jCpy+ro3p749T/s4N7yjRx14Yzkx
	uzhZMo22zjfuaFi1h/oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5whV-002xso-Ir; Mon, 27 Jun 2022 21:55:21 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5whK-002xnR-Cp; Mon, 27 Jun 2022 21:55:11 +0000
Received: by mail-lf1-x12f.google.com with SMTP id a13so18919473lfr.10;
        Mon, 27 Jun 2022 14:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=F2rE4WiiB56ceX/DgU00bSkUe75l3cXsNOMmf38a5Zs=;
        b=FEQZCSvyunp3uzDnTXHU3J/w472GKsWStwPmmqVUW3M4BP99nff9fjklYCAHVRzl+l
         7PdPnItOj7cM3MRIkTh9SYZeCgI860HuNoo0QIqzoGF7nPyBNo87fn1boR9Pp1JAzIJ/
         q+JiDvehmhxeWN2Gd/gusxeyvN+rP1/yIu3lX0trXcrL4GgpR6enBsApW/oo3wMQY7q9
         Fwb0vnJ60iHDy91jMTXIicoxCKhW+TwmfcozTcVnc5LaahfYFH6N1f5Qk0Uzdc1nm25J
         uoTGc0lXxv1te35Psxvd38IaQ3ajm5XnaZKZJ43VPquSrUEPOgTbqT8XLbioBY3VSeSU
         a1VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=F2rE4WiiB56ceX/DgU00bSkUe75l3cXsNOMmf38a5Zs=;
        b=ZNn2qhjSi6Kg0nwhfzzpnTKV7axyQ9pURSDdhg1CsECxIwjwd9EUrnPeAi/K3ym+P7
         /65Z3ZyVOwOYUXApwvN8/w3kAd7thBjmJmFudiIA/foq3trm2d0Jdf0ppwd81Zv9bJ9h
         InDT7cdh98vp3xUf90sP4SKjzewzo6LEHvW/cT7S9CV5HY5gcWQ+vGSTS95ZfSwCtxXB
         onYEMjJpVprrmcwiK8RLwci5Xves0DaRbCCUW51VqcCxXNMcBzuumR3wwZxlu5+bDSlG
         T2+C3V/ZGIJOccqpR5wFGCefyRQr66b2dlUP5YE1t5ALIhsg3yN+V28dChAZmqS/i1eD
         9xiQ==
X-Gm-Message-State: AJIora8nOIlBywjKNeD9oS9XavepC6x0x+Cady8dZ0fLt8NM722ckIls
	sWXnlKBpyuxphL53NBXa4Klu7Ylxb5UkTQ==
X-Google-Smtp-Source: AGRyM1uL2KKsGpEUiiGMb12gLYw6jj+9Trew1WchHkWhPJ/Yvh3dZrjyPSRGRIj4HHPU4BOHiEr71Q==
X-Received: by 2002:a05:6512:2356:b0:47f:8756:737b with SMTP id p22-20020a056512235600b0047f8756737bmr9981225lfu.212.1656366905748;
        Mon, 27 Jun 2022 14:55:05 -0700 (PDT)
Received: from mobilestation ([95.79.140.178])
        by smtp.gmail.com with ESMTPSA id g1-20020a0565123b8100b0047f9d9a4186sm1944482lfv.165.2022.06.27.14.55.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 14:55:05 -0700 (PDT)
Date: Tue, 28 Jun 2022 00:55:02 +0300
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
Message-ID: <20220627215502.4caxt2ebsdi4ue7l@mobilestation>
References: <20220624141622.7149-1-Sergey.Semin@baikalelectronics.ru>
 <20220624141622.7149-5-Sergey.Semin@baikalelectronics.ru>
 <59d8a34a-a211-d00a-2243-6ad51cfa4204@linaro.org>
 <20220624204524.nveittak6ruksuvq@mobilestation>
 <8b384f4e-7114-7afb-98d6-af71709525d6@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8b384f4e-7114-7afb-98d6-af71709525d6@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_145510_482452_B845CE6E 
X-CRM114-Status: GOOD (  21.55  )
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

On Sun, Jun 26, 2022 at 12:42:48PM +0200, Krzysztof Kozlowski wrote:
> On 24/06/2022 22:45, Serge Semin wrote:
> > On Fri, Jun 24, 2022 at 07:18:57PM +0200, Krzysztof Kozlowski wrote:
> >> On 24/06/2022 16:16, Serge Semin wrote:
> >>> In accordance with the DWC USB3 bindings the corresponding node
> >>> name is suppose to comply with the Generic USB HCD DT schema, which
> >>> requires the USB nodes to have the name acceptable by the regexp:
> >>> "^usb(@.*)?" . Make sure the "snps,dwc3"-compatible nodes are correctly
> >>> named.
> >>>
> >>> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> >>> Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
> >>> Reviewed-by: Patrice Chotard <patrice.chotard@st.com>
> >>> ---
> >>>  arch/arm/boot/dts/stih407-family.dtsi | 2 +-
> >>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/arch/arm/boot/dts/stih407-family.dtsi b/arch/arm/boot/dts/stih407-family.dtsi
> >>> index 1713f7878117..7ba528315dbe 100644
> >>> --- a/arch/arm/boot/dts/stih407-family.dtsi
> >>> +++ b/arch/arm/boot/dts/stih407-family.dtsi
> >>> @@ -725,7 +725,7 @@ st_dwc3: dwc3@8f94000 {
> >>>  
> >>>  			status = "disabled";
> >>>  
> >>> -			dwc3: dwc3@9900000 {
> >>> +			dwc3: usb@9900000 {
> >>
> > 
> >> This does not apply. What tree is it based on?
> > 
> > That's weird. The series has been rebased onto the mainline kernel v5.19-rc3.
> > Do you have the stih407 dtsi fixed on your local repo?
> 

> It conflicts with my change:
> https://lore.kernel.org/all/20220526203632.831039-1-krzysztof.kozlowski@linaro.org/
> 
> I'll apply with local fixups.

Ok. Thanks.

-Sergey

> 
> 
> Best regards,
> Krzysztof

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
