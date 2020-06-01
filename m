Return-Path: <SRS0=EH8H=7O=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A83B0C433E0
	for <linux-snps-arc@archiver.kernel.org>; Mon,  1 Jun 2020 18:53:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C51B206C3
	for <linux-snps-arc@archiver.kernel.org>; Mon,  1 Jun 2020 18:53:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="n1SLYyFq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JAVJEIWG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C51B206C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:Subject:From:References:To:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UZxss0Ni0jwVu1zM4neEBB6fzNSG+zLhwseYx8vDJiQ=; b=n1SLYyFqbS6OTw
	s1l18YqQg0cR6wFVL5Ve/y2gPpRs8YvUeuwkPOlFXJmos04KXls+wzZCk1xOJWNaNIWAFBumOxDqH
	KPGIxxB+scMREvbb6vafbBDYfKWaPHsRSkuHClts5jrk9yMNbqgR18NuNSemPTWnS9niIzqip9xsf
	/Iwh2lSVmHVwgrqYbwzfv5qT7XPefAa34RBxHC0tCtC7v78FAM7hcCz9E7YVVInEbf+BMPrCW+irn
	N9lOAbeHXRXqGHeYN48axDZJQsVCwmAGC+V5rvlb8xcM+UGV2+UqUJANYV60IwPrPAEqlrr3Aaa9W
	PcOK9AidhdSOojfixfFg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jfpZ0-0003pj-PF; Mon, 01 Jun 2020 18:53:34 +0000
Received: from mail-qk1-x744.google.com ([2607:f8b0:4864:20::744])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jfpYx-0003pD-Ri
 for linux-snps-arc@lists.infradead.org; Mon, 01 Jun 2020 18:53:33 +0000
Received: by mail-qk1-x744.google.com with SMTP id w3so10099397qkb.6
 for <linux-snps-arc@lists.infradead.org>; Mon, 01 Jun 2020 11:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=to:cc:references:from:autocrypt:subject:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GlX8fRInifAflyVbuvZBN/174txPocZ1vwPU4q/EfUc=;
 b=JAVJEIWGO/heID6uCGw3i77TsWk1WCQGF4tfy2iHfJ3wOBSFfKPqZnzrIP0O5Jua+x
 9rBH2i/iJCIXpA34UiG/Pbmk5++egZpVOJZ3Ucjl0eNahaJK57JpWwz1A+L6bikBJxPp
 XdOouSYJ3eObsnxMPNaEPVCNuxoshOlG2RWQsTUqm7ZZGgxQ/UL7N0KiDllHIc2K2NUi
 0i9mlTiGDMSBJVqzl0zxnEJUDHVxt10nEP4tnVMT2i0AUmkHGNk8Mzqll7t653ahsfNj
 mBUztXK7RERMNrHit+HKAknyK6Mboii8a0gfmi34cBsoJ8mKXRPWT+LXlIDHmVzVI/P0
 QFhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:autocrypt:subject
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=GlX8fRInifAflyVbuvZBN/174txPocZ1vwPU4q/EfUc=;
 b=EE9fL47GyCnvGSRzYUWHKDwubvUWFDK336kbvG26ZPg0ARDCpb+8OdIaRallAjQNif
 H8Vee4/6xMJTKR2gnE5gp79qMVRtG7L/G/Hu4t+uiEbwCZ4BuKFvNImxTz62Dz5ZhBvC
 kDWh/Nlr8gxNPvJEfKzlgl6OLA8Y+vbwY4Q8vVSkIxagXJr0DqC0jNfoOlAMfUL8ssVR
 vb3CMrb5JMfVYnZOREABW8UhqnDCAHEC0UDafWinaWkCyXxCSKcib63hoWmBI83DI+vi
 TcAoDFegBsU7coE+qTY1BdbVhZ/Uzwja+77IQljQFEALt2rWgPZ3OIOBttcrLK3JGi0h
 hbBw==
X-Gm-Message-State: AOAM533pxCCNA8a1wdnCyuSNtPHhHANnnUaFU5trhVKCMVtCv0xXsVpD
 wzPtrZs9dJbg/+6oQljS8CtYe3junjA=
X-Google-Smtp-Source: ABdhPJw3cycMO7hgdi69Ql05eY/coNzSrtnMfDdwksVjUbXdC2thUobtQ7MZnB7hnibwzLo249VpDg==
X-Received: by 2002:a37:486:: with SMTP id 128mr20035458qke.187.1591037610182; 
 Mon, 01 Jun 2020 11:53:30 -0700 (PDT)
Received: from [192.168.1.4] ([177.194.48.209])
 by smtp.googlemail.com with ESMTPSA id d78sm53865qkg.106.2020.06.01.11.53.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jun 2020 11:53:29 -0700 (PDT)
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
References: <20200423014126.10417-1-vgupta@synopsys.com>
 <20200423014126.10417-4-vgupta@synopsys.com>
 <4f7a67fb-6f96-57e6-b827-d1ab5dd6733f@linaro.org>
 <18a9ff31-baea-c916-4377-76b77976c169@synopsys.com>
From: Adhemerval Zanella <adhemerval.zanella@linaro.org>
Autocrypt: addr=adhemerval.zanella@linaro.org; prefer-encrypt=mutual; keydata=
 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
Subject: Re: [PATCH v6 03/13] ARC: Thread Local Storage support
Message-ID: <65de7a88-593f-faa0-4ce6-c62b91b04249@linaro.org>
Date: Mon, 1 Jun 2020 15:53:27 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <18a9ff31-baea-c916-4377-76b77976c169@synopsys.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200601_115331_900973_8AAE2429 
X-CRM114-Status: GOOD (  14.99  )
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
Cc: arcml <linux-snps-arc@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org



On 27/05/2020 22:36, Vineet Gupta wrote:
> On 5/27/20 12:17 PM, Adhemerval Zanella via Libc-alpha wrote:
>>
>>
>> On 22/04/2020 22:41, Vineet Gupta via Libc-alpha wrote:
>>> This includes all 4 TLS addressing models
>>>
>>> Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
>>
>> As prior patch we do not use DCO, but rather copyright assignment.
>>
>> Looks ok in general, with some comments below.
> 
>>> +
>>> +register struct pthread *__thread_self __asm__("r25");
>>
>> This is used on other ports, but I am not sure if this is a valid definition
>> for a global variable. 
> 
> Not valid from gcc implementation POV ? The syntax seems to work alright in ARC
> linux kernel where we use r25 to cache the current task pointer.

The gcc documentation [1] does specify register global variables, but it
also states that 

"[...] it is recommended that you choose a register that is normally saved and 
restored by function calls on your machine, so that calls to library routines
will not clobber it."

So I see that the semantic of global register is kind fragile and since
it is usage is solely for asm inline argument I don't see a very compelling
reason to keep using it.

[1] https://gcc.gnu.org/onlinedocs/gcc/Local-Register-Variables.html

> 
>> Usually the register specifier is used as an input 
>> for inline assembly.  Do we really need this global on ARC port? Couldn't
>> we replace it with __builtin_thread_pointer where applicable?
> 
> We do use __builtin_thread_pointer and actually __thread_self is not used in ARC
> port :-) so I can just drop it

Ack.

> 
> Many thx for reviewing.
> -Vineet
> 

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
