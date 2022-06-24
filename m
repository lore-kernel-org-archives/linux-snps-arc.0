Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81BBFC43334
	for <linux-snps-arc@archiver.kernel.org>; Fri, 24 Jun 2022 17:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JaF5/vT3yYcudaeXWCSEwmuu2B9PJWqU9cKTutTERpc=; b=o9j5etVIW/2+FQ
	+GOb9XV02U3Kg4ysMveU/F+nIkczwv81cN/3L5mAtbyvhliuefK/YB9yMcmiiChbdPHur3DrpQnO9
	hCeaUR8qK4LO69VB4Pmk4IPxfU/HHJrP0ZtfGlutwsPTEOCzwACIddhFJ2l6ZOuN9znThPpzjLgIq
	2KGUh7QqBXSQ8exIdr19Il4tcDYecj1/8bLlltfYQ63wVWjagd6NZl0kdCfC+k2lbTxpJXe621kyK
	yR4Za5qM93/khlv8gY+rqVeEp8uPmw4T11thAExOxHANx6H2bubTW7By6sTx7Pwsw5GASLXHs4dyq
	HbCHhCQs+ZrZcgcPeQtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4mtq-003ALr-W1; Fri, 24 Jun 2022 17:15:19 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4mtO-003A1L-Q4
	for linux-snps-arc@lists.infradead.org; Fri, 24 Jun 2022 17:14:52 +0000
Received: by mail-wr1-x42a.google.com with SMTP id r20so3997947wra.1
        for <linux-snps-arc@lists.infradead.org>; Fri, 24 Jun 2022 10:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=ktu3ikYNE7irPLarQIpMZpPOBYDmyDcsFDEun1kygEY=;
        b=xi9MZOPXRCdoh9sO8tIFIGDgvS9dqWXO3XDyam9oNMuirIIWFHfz20y14sMxxpqGIT
         SOcuoeLbfj3s7aZMasQ/REd2xJGE4+YLgO8TbMaT+gCZtd9H+0LRXQUWB16W0htXNpuf
         nyYqF+5xS1ZaUFBVys39bJUQo+t/uRywgLUcgb1hs/5GkNWejnhrGHhGW9VKrld0n2EW
         AbETSPvLqdL8vVWVydLgUG3xWQY15O1Gd04XuAI9KzhYlOfcHS/WllVm89ucIjkc/2gH
         Rq78KNq0DxCHzgnb5pD+cOJdCidEfOF4jfIbwUrMxQj2EGvD2Z5WAwARhkifoDNmf05e
         qeZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ktu3ikYNE7irPLarQIpMZpPOBYDmyDcsFDEun1kygEY=;
        b=vd3u4h9K2+Zav/kh2xeL6WETpWFs7mgSD9zND1aGEV2lnXqLdyohQWTCv73pclfjZp
         PmlLKDr/Zs+xrZIca80XiY6z37LEGJfdSIpOf1RrXxjyB1NgsRO7lievRytTPPPoM/hV
         Jf6deGHsdzyqSMQWTdWLX0jyhYvETCnqaYJhqKpPyaQde6ZWLfa9J9DnGWD6JlB1n7OX
         yDq83DV/nofGoM7l/IqkR5Crz6bfGid429EKCjQ3Urjm/E/zNwzSe8UnAMQnyfcJu4Tr
         /qrRdgQ8e9q4n+XRbccc2dv92ktzgVJAMEFLcky4NETG3TK0w1+uY6/sLbCGkT1yty69
         vDMg==
X-Gm-Message-State: AJIora+nu+CHO+Mh+o0O/UeEZLQGHJBKS3S9B4PzsdkCCCIHEKnx018i
	dlNs8w8IwUYGa5FkXrfAGzw0eQ==
X-Google-Smtp-Source: AGRyM1sLQYGZAaX+lFxtBA94oQIWAvZYbgECA77xFxvwaOZQm0PFlwQ5AY512c5CrAbgrYnDliPWmg==
X-Received: by 2002:a05:6000:184c:b0:21b:b6ac:8cb6 with SMTP id c12-20020a056000184c00b0021bb6ac8cb6mr197570wri.154.1656090886924;
        Fri, 24 Jun 2022 10:14:46 -0700 (PDT)
Received: from [192.168.0.237] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id az33-20020a05600c602100b003a03b4cb7cfsm2781255wmb.38.2022.06.24.10.14.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jun 2022 10:14:46 -0700 (PDT)
Message-ID: <1f426a67-2cf2-b67e-3cd0-a4c452591baa@linaro.org>
Date: Fri, 24 Jun 2022 19:14:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH RESEND v9 2/5] arm: dts: lpc18xx: Harmonize EHCI/OHCI DT
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
 <20220624141622.7149-3-Sergey.Semin@baikalelectronics.ru>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220624141622.7149-3-Sergey.Semin@baikalelectronics.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220624_101450_948623_47B28DC2 
X-CRM114-Status: UNSURE (   9.80  )
X-CRM114-Notice: Please train this message.
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
> In accordance with the Generic EHCI/OHCI bindings the corresponding node
> name is suppose to comply with the Generic USB HCD DT schema, which
> requires the USB nodes to have the name acceptable by the regexp:
> "^usb(@.*)?" . Make sure the "generic-ehci" and "generic-ohci"-compatible
> nodes are correctly named.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Acked-by: Vladimir Zapolskiy <vz@mleia.com>
> Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  arch/arm/boot/dts/lpc18xx.dtsi | 4 ++--

You should split the patchset per architecture, because maybe that's why
no one picks it up?

Let me pick up ARM bits through my cleanup series. If anyone objects,
please let me know.

Best regards,
Krzysztof

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
