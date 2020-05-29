Return-Path: <SRS0=GdQW=7L=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B066C433DF
	for <linux-snps-arc@archiver.kernel.org>; Fri, 29 May 2020 20:54:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 092CA208E4
	for <linux-snps-arc@archiver.kernel.org>; Fri, 29 May 2020 20:54:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BqFERscN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pt80huYj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 092CA208E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c699Q50rXe/B67JuvciWdmO/lOGvTsD7MnHad7PT5vc=; b=BqFERscNCHcSgs
	zNLV9xsyDfloM8c8sWdQZok8wioXMbP0Trj5e6oPkHWdoiu/WzD5lckaJ6HqJ3q+H07C1k0Noe6cj
	ihOiXI9LKY6b1VWkceMWy5m+7D16vF2sJ/Jp7jsDRbLCyW+d3fR9Li7KebTP7FWRT2a/7qJVNJHzH
	Y963x68zMD7M0+TSA030upukeMndjjYOhI7W9ijfUz3/aq/OYufHzVmzJKycXbWNcbDQ5COsdlOOy
	YPXj0Gy4IVmdwkOlPrjHoKDqytwKfurVSzxn3vJsnoc4OVIIL6KfFdtDHAtVhQCiYTmyhB0qYT4SS
	iaV6B2bSiqaZxByO+jaQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jem12-0007is-64; Fri, 29 May 2020 20:54:08 +0000
Received: from mail-qk1-x744.google.com ([2607:f8b0:4864:20::744])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jem0y-0007iL-Ti
 for linux-snps-arc@lists.infradead.org; Fri, 29 May 2020 20:54:06 +0000
Received: by mail-qk1-x744.google.com with SMTP id q8so3512914qkm.12
 for <linux-snps-arc@lists.infradead.org>; Fri, 29 May 2020 13:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KOrsXTAH2/upGmyaWOejgRbmQddpT+EdZe0/WSUpQSU=;
 b=pt80huYjqGtARRMBTRtDQEF8XRqfoqGw2xmp0E+oijdvLe4FFs3Q2xzEIWHPv2hljJ
 sdfHwub4in/+GzHK9htckUwpYgt77CrRQXJuxdA/VICVdNiSbkISuUJyM1E0Y0xEyOGR
 RmawlfAL4TBXrJk2dEadhp481paeuIwNPHIY9wDhYHrTF8Dl8xDzZ/qwx+8F5Y+VTfWK
 v1EgOcpUTsIho5mpywZ1N0oMFr6qW1Cn4qXVU+OroPOjfFpoocbWCUhceOUx84SJ6pdq
 5MlksoltswO0VrVd++RtCLZ3gFZK0KMdCUPbnzmpaLTteYBe9kMmrGzyvjkzc2gsY29W
 Gihg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=KOrsXTAH2/upGmyaWOejgRbmQddpT+EdZe0/WSUpQSU=;
 b=CAd92aGSLEHjvuinoZNcw1NL45Cw9CN4tUhrvar58ut/Aj4TeSlC0xaYD7uFYPon48
 e8mo6qMsRjMskqK1rhwQEYtTlSntEO9TSoY9hvId62fKFC8KI2hRaGwmX7lDjmLuXVVD
 kbYitXKorvurT5JExxmJQDDPVRFgpAP9XmzqnMWxtnixrk6gIb0Kn3m5AcyBJ0V7QSvx
 9Lrzhf/0PmFUtdppaF+j0rEIlapw2bL/YdmwKdpfUZSLiqTxqB4uP9MAL/gSA8sm4mJo
 Kl+NLB4Ib1XFR0m7nXIT2qpv9jdHvAr1NMdrCIy7jY1hdoKe/43b4UQz1NE+VNgSoQWx
 NU3w==
X-Gm-Message-State: AOAM532gXphXjBdjAkk+ittXGQKTUYrGoCtTzUl7ejwIsIFs2ZqeCR6V
 rX+zaGJ01bJJ1NZsxZuZK7c6h7Ol06o=
X-Google-Smtp-Source: ABdhPJymHul4VyItBUIDLO2BGMOyaKFDnRriCAxxgoxhodaCMk9Zg3tcqFSc+vmFMNbHUGWHPba8WA==
X-Received: by 2002:a05:620a:13b0:: with SMTP id
 m16mr9714286qki.292.1590785643388; 
 Fri, 29 May 2020 13:54:03 -0700 (PDT)
Received: from [192.168.1.4] ([177.194.48.209])
 by smtp.googlemail.com with ESMTPSA id r37sm8348021qtk.34.2020.05.29.13.54.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 May 2020 13:54:02 -0700 (PDT)
Subject: Re: [PATCH] dl-runtime: reloc_{offset,index} now functions arch
 overide'able
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
References: <20200528194345.9829-1-vgupta@synopsys.com>
 <4c346276-085a-6e2d-16a4-c2b88252a74d@linaro.org>
 <0f9ad824-2278-a55b-7203-96497f06c198@synopsys.com>
From: Adhemerval Zanella <adhemerval.zanella@linaro.org>
Autocrypt: addr=adhemerval.zanella@linaro.org; prefer-encrypt=mutual; keydata=
 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
Message-ID: <9ec385e5-3427-f3ac-f4c8-73f0c98aaa97@linaro.org>
Date: Fri, 29 May 2020 17:54:00 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <0f9ad824-2278-a55b-7203-96497f06c198@synopsys.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200529_135404_966158_D5C92E7B 
X-CRM114-Status: GOOD (  10.17  )
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
Cc: "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org



On 29/05/2020 14:39, Vineet Gupta wrote:
> On 5/29/20 5:58 AM, Adhemerval Zanella via Libc-alpha wrote:
>>
>>
>> On 28/05/2020 16:43, Vineet Gupta wrote:
>>> The existing macros are fragile and expect local variables with a
>>> certain name. Fix this by defining them as functions with defaul
>>> timplementation in a new header dl-runtime.h which arches can overrid
>>> eif need be.
>>>
>>> This came up during ARC port review.
>>>
>>> This patch potentially only affects hppa/x86 ports,
>>> build tested for both those configs and a few more.
>>>
>>> Suggested-by: Adhemerval Zanella <adhemerval.zanella@linaro.org>
>>
>> LGTM, thanks.
>>
>> Reviewed-by: Adhemerval Zanella <adhemerval.zanella@linaro.org>
> 
> Sorry I didn't think through this before, but ARC port needs pltgot arg (runtime
> address of plt0) in reloc_index not reloc_offset. I'll swap them and repost.

Hum I though I had it covered on my suggestion, but it seems I mixed them
up. Ok, I will review the new version.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
