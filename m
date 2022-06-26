Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1133C43334
	for <linux-snps-arc@archiver.kernel.org>; Sun, 26 Jun 2022 10:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MDFjvQ5wutjbWocNhCXKdbyEg8hNNDIeoY2MNgqffYI=; b=A3R9Y8GF9JTXLa
	BxkQDUgm1X0p/evqAfl5YuZlt2Mta7dXvkZESBeLxgtdWlTZkVmun9ELbme5Zh/p3htwthglYl02q
	q0xtGjCLlcjx9lVZVeeH9yV7jHnyfZUGFx2k71ncO7uLL/u6+DTVMeY38MvFs4L9OPjnjYW24KTu4
	5aRugexve37nqMeM+22+UyWE06x5xPRaDxQEDn6X591xgZRhCEn4wdTquRAjj6qi0wjlZ+BhxkEtI
	OfcSZVzkIhjs8/rpLQZ4gypwmQmazMgNIZ9TBpBR+vEF0cL4dyxpKtQfV0TQ8Ye9r+KFtbmbH1gL/
	LdWiMvOPoXiXX/OU1TrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5PjF-00BFg2-7v; Sun, 26 Jun 2022 10:42:57 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5PjD-00BFcq-4i
	for linux-snps-arc@lists.infradead.org; Sun, 26 Jun 2022 10:42:56 +0000
Received: by mail-ed1-x535.google.com with SMTP id o10so9312092edi.1
        for <linux-snps-arc@lists.infradead.org>; Sun, 26 Jun 2022 03:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=+7oDvDolVgyiWCBP1kGvDhx2VojLawcjdaZLLC+Q36w=;
        b=s6B+CpTs4RD/gcT1faaJi6ASL1l5+sjwqAltmmk46YurGaSsYbCZr16lzlZNTYBFtb
         CiBnpSMUKdq0DlYTvdb5vsrU1gMOwRt5vsSFFr3TKOMJFbaYyA6TBoktOa+Bn4A5BGiI
         KahyH4DScCPH6S/oe8Tz6vPR7r9Ewip0HtLcEUKs/mv2CkwDDgL6r5Fa0gpbJ9jJdAQ6
         YY9DOOdDGKWldDluxU0eVDBwbqLZ1hQ209Pl8DX7SnKoqJy34VLuSqnBYS43673oKJ5Q
         2ni2cU2cYyt/aoo32PmMZy1ewJOURm6AfBUtUScTZrdsZtx9+kAceYdpH5VwQR+im1ih
         bATA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=+7oDvDolVgyiWCBP1kGvDhx2VojLawcjdaZLLC+Q36w=;
        b=a+M7M4m06ocwMzur5AxEmorv/Isd7TOJRxZs0AjWFiQpqpKjXGosTJQRJczOCNnzj/
         7Rb/ypB88RxEdvzreRhAX7XI9lBrmutXFCdcoMCMPsASaWg8qXuwos+qUHylQbAjH9Xn
         4MKxCi2r9RYvWcbtKw+5ZMg3EjWPxnFjG1Y+z99fPW+zQyySZ7RAUMEzw2NMnDm/vv+a
         Fzs4XiKoc09zSlvgZWeVTrvFbj1pH6rgxkk+besr08yGsFwiRIk7PcaW8zGCahnqk/7H
         Z+8OXuo/xSsN8fFW9TWJWtPTpE4M44D56pOen9N6/THlAgrXXQE3QERwrgZuFkFR41fS
         BnFw==
X-Gm-Message-State: AJIora8dlES5QU1N9x2dB1kt9nJu+8U0LWV29ZYJ6SxcF1IsQp2OECrP
	jIwRWJsKk/HxRet+3KE1hYtihA==
X-Google-Smtp-Source: AGRyM1u1d/DmBwJzEStyDHpQojeLaBFX8PgoTatK6v58i5U80IJg6lCXoo9PZ/Lil9R60f4Yaccg6A==
X-Received: by 2002:a05:6402:2929:b0:435:6dfc:c4f2 with SMTP id ee41-20020a056402292900b004356dfcc4f2mr10120571edb.284.1656240170903;
        Sun, 26 Jun 2022 03:42:50 -0700 (PDT)
Received: from [192.168.0.239] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id p22-20020a170906839600b00711d5bc20d5sm3561921ejx.221.2022.06.26.03.42.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jun 2022 03:42:50 -0700 (PDT)
Message-ID: <8b384f4e-7114-7afb-98d6-af71709525d6@linaro.org>
Date: Sun, 26 Jun 2022 12:42:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH RESEND v9 4/5] arm: dts: stih407-family: Harmonize DWC
 USB3 DT nodes name
Content-Language: en-US
To: Serge Semin <fancer.lancer@gmail.com>
Cc: Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Felipe Balbi <balbi@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Vladimir Zapolskiy <vz@mleia.com>,
 Alexey Brodkin <abrodkin@synopsys.com>, Vineet Gupta <vgupta@synopsys.com>,
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
References: <20220624141622.7149-1-Sergey.Semin@baikalelectronics.ru>
 <20220624141622.7149-5-Sergey.Semin@baikalelectronics.ru>
 <59d8a34a-a211-d00a-2243-6ad51cfa4204@linaro.org>
 <20220624204524.nveittak6ruksuvq@mobilestation>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220624204524.nveittak6ruksuvq@mobilestation>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220626_034255_239568_9D1B504D 
X-CRM114-Status: GOOD (  15.00  )
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

On 24/06/2022 22:45, Serge Semin wrote:
> On Fri, Jun 24, 2022 at 07:18:57PM +0200, Krzysztof Kozlowski wrote:
>> On 24/06/2022 16:16, Serge Semin wrote:
>>> In accordance with the DWC USB3 bindings the corresponding node
>>> name is suppose to comply with the Generic USB HCD DT schema, which
>>> requires the USB nodes to have the name acceptable by the regexp:
>>> "^usb(@.*)?" . Make sure the "snps,dwc3"-compatible nodes are correctly
>>> named.
>>>
>>> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
>>> Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
>>> Reviewed-by: Patrice Chotard <patrice.chotard@st.com>
>>> ---
>>>  arch/arm/boot/dts/stih407-family.dtsi | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm/boot/dts/stih407-family.dtsi b/arch/arm/boot/dts/stih407-family.dtsi
>>> index 1713f7878117..7ba528315dbe 100644
>>> --- a/arch/arm/boot/dts/stih407-family.dtsi
>>> +++ b/arch/arm/boot/dts/stih407-family.dtsi
>>> @@ -725,7 +725,7 @@ st_dwc3: dwc3@8f94000 {
>>>  
>>>  			status = "disabled";
>>>  
>>> -			dwc3: dwc3@9900000 {
>>> +			dwc3: usb@9900000 {
>>
> 
>> This does not apply. What tree is it based on?
> 
> That's weird. The series has been rebased onto the mainline kernel v5.19-rc3.
> Do you have the stih407 dtsi fixed on your local repo?

It conflicts with my change:
https://lore.kernel.org/all/20220526203632.831039-1-krzysztof.kozlowski@linaro.org/

I'll apply with local fixups.


Best regards,
Krzysztof

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
