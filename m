Return-Path: <SRS0=GdQW=7L=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5591C433E0
	for <linux-snps-arc@archiver.kernel.org>; Fri, 29 May 2020 13:56:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7670D206A1
	for <linux-snps-arc@archiver.kernel.org>; Fri, 29 May 2020 13:56:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CG8yeRv6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B6ziA4wC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7670D206A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:Subject:From:References:To:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v67YHF/hPrCBNYqpLYwP5nIUPwgMK8F3gzvZvmPHQhc=; b=CG8yeRv6ZD6xOV
	iWuzwucBONhTiCfFH8LJWu2xBclILSVmjwHJ7YPWzgXQDd1vj3KCR4Y1EznM5q+1Le6saos4jx0rF
	h+nnx0DL3o69lwUF8dRuRKFB9mvxZfJrhny00dA7SnWTGq6RCTPkQ03aLmJ8KhCt8Tqh0spiTWmbD
	nLmvTZpDKKlu0VMGCufFlJ5pgOYFliW9k+iIah7OSja4s0BfMduXV5ii8T2WGDXAJJBmiX+0wHyaD
	W0tI1KGJqU2h8yNM76yVhRN6C5xMvTyfomyG08cGs/MGbVzaTh8ZqYoo4uYc8pmjRrzh++ctiQ/dh
	NJezfJhv3Pi0w1L9pQ5w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jefUn-0003li-FS; Fri, 29 May 2020 13:56:25 +0000
Received: from mail-qt1-x844.google.com ([2607:f8b0:4864:20::844])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jefUk-0003lD-F8
 for linux-snps-arc@lists.infradead.org; Fri, 29 May 2020 13:56:23 +0000
Received: by mail-qt1-x844.google.com with SMTP id z1so1970132qtn.2
 for <linux-snps-arc@lists.infradead.org>; Fri, 29 May 2020 06:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=to:cc:references:from:autocrypt:subject:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ociXOm3U8Fu29DhHGrK+iA+mhbwB74cyxrshQ+0fscs=;
 b=B6ziA4wC7K71QUMkULwxr7y8GM9a5lx1ZkPnH8bY0oaQz1QSBDsDcHYGfZiIJnyB3D
 M1fOLWMBVCjbusNTR/WV51HLFguOmwC0JTSbM2JBDx3ibf8yk0/cJUEUSglDm4q+Q69J
 I8YQvWT0C6H8TiUbczIHeGrjNfEZFlIMZZtyDxse8IoH0anQlwCRFXLeKqbQjv8uWSUI
 ZwxXScJToJGDZVJ71Vlu7u6kuSyHTo3kmT1KF/xMBbv3lwH5DtYMa35GR2PUwABLGIIM
 qOZcgRDTEYj7d3iUMKTyVXlHNA6f86zkJMMnk2kIjxHGN/6ZTZGcgZ47IlGLD7JVeYs+
 btNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:autocrypt:subject
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=ociXOm3U8Fu29DhHGrK+iA+mhbwB74cyxrshQ+0fscs=;
 b=h+zIEYJxPmFV0ileB+BP4X0deq/BGUSQg/GRLrHkPS2aIRQA+VWvRBzUrv1xzcXH9K
 ew/zhQ5RDqEVQDj0e1LGQ+LO2DJsnDFEcRINq49oH7CGLw+8U+id+GzQLokXTmIIIcE7
 BX+zsJxfp6asTHdOTA1XDR5tdXLeMdzMjUPv7hq1fAk6xFWr0TxMn/owh674cM6LDTuC
 PSCsfZztFdMmdwioTJkj/bdxi4cjd9yq75IEj5EnKBYphDchktlkm/+TQy5FU0SGxB8I
 +vi4GwAkWrKkcIdlEfNl/S+i2RXQA3lriEU1BFxTU2EO6+SrPYwkADBH+USjEa9Hg30K
 kBDg==
X-Gm-Message-State: AOAM530fvZT0pgAnhkJX+x1JI+fLn88wYlmwZii3WR3dInm3F2LNZBVk
 nZ093rO7P8WL2s6ya9K6sho56+au8hQ=
X-Google-Smtp-Source: ABdhPJxIegJDwWH9hmIVpjfvf8jUm56EzoQ1FMkHFD3sLc1QPMCMEzQ4AB62xuGPVuHXHntea55ZZw==
X-Received: by 2002:ac8:1942:: with SMTP id g2mr9117858qtk.107.1590760580382; 
 Fri, 29 May 2020 06:56:20 -0700 (PDT)
Received: from [192.168.1.4] ([177.194.48.209])
 by smtp.googlemail.com with ESMTPSA id l64sm6886255qkd.15.2020.05.29.06.56.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 May 2020 06:56:19 -0700 (PDT)
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
References: <20200423014126.10417-1-vgupta@synopsys.com>
 <20200423014126.10417-2-vgupta@synopsys.com>
 <88508d10-2d29-026a-bb54-ad607154ab87@linaro.org>
 <f36112c7-b7d6-243a-73eb-74d5b3772135@synopsys.com>
From: Adhemerval Zanella <adhemerval.zanella@linaro.org>
Autocrypt: addr=adhemerval.zanella@linaro.org; prefer-encrypt=mutual; keydata=
 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
Subject: Re: [PATCH v6 01/13] ARC: ABI Implementation
Message-ID: <129265eb-c39a-6394-24ab-8734b04649bb@linaro.org>
Date: Fri, 29 May 2020 10:56:17 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <f36112c7-b7d6-243a-73eb-74d5b3772135@synopsys.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200529_065622_513880_D6C413E6 
X-CRM114-Status: GOOD (  16.20  )
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



On 27/05/2020 19:15, Vineet Gupta wrote:
> On 5/27/20 11:26 AM, Adhemerval Zanella via Libc-alpha wrote:
>>
>>
>> On 22/04/2020 22:41, Vineet Gupta via Libc-alpha wrote:
>>> This code deals with the ARC ABI.
>>>
>>> Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
>>
>> We do not use DCO, but rather copyright assignment.
> 
> Right, removed that now.
> 
>> Looks ok in general, with some comments below.
> 
> Thx for taking a look.
> 
>>> +;@ r1 = value that setjmp( ) will return due to this longjmp
>>
>> Since all .S files are processed by gcc assembly implementation usually
>> use C style comment (/* ... */). Same applies to other assembly
>> implementations.
> 
> OK, I can update throughout, although I like the small assembler comments which
> are on the same line.

I don't have a strong preference and I am not sure if there is a strict
code guideline for comment in assembly implementations. It was more a
suggestion, since other assembly implementations tend to use C style
comment as well.


>>> diff --git a/sysdeps/arc/memusage.h b/sysdeps/arc/memusage.h
> 
>>> +
>>> +#define GETSP() ({ register uintptr_t stack_ptr asm ("sp"); stack_ptr; })
>>> +
>>> +#define uatomic32_t unsigned int
>>
>> Not sure if this is really required now that we are moving to C11 atomic
>> model withing glibc itself. Maybe we could just use uint32_t on
>> malloc/memusage.c and rely on atomic macros instead.
> 
> But that would be much bigger change, and orthogonal to the port. So perhaps we
> add it for now and then do the bigger/sweeping change.
> 

Indeed, it was more a open note for a future cleanup. The current
definition is fine as is.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
