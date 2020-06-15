Return-Path: <SRS0=fi28=74=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB929C433E0
	for <linux-snps-arc@archiver.kernel.org>; Mon, 15 Jun 2020 19:43:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 856AF20714
	for <linux-snps-arc@archiver.kernel.org>; Mon, 15 Jun 2020 19:43:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="X9YKprme";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Iv5/XHDf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 856AF20714
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g+Yjzu5Bd+mg8Co0Dt0z+68KjI0LNxxNxHf0b+2+SIs=; b=X9YKprmeH1E8/y
	nSwYqd+fYlOD4ehhXEmTP9n0BYIipx26ct8sfLX+/sl3oPsAv8yjz0vZgrIN3fcLCaDAiZWXcR951
	FXOsTp2Fcs7v7L5CWr/NqSNDV4iBBJJzemEHYwFz+363ew3QoekOlDRGZMYzos+w8eYjCtRdrI6Fo
	N6ym1ffrGZIrm7BweG11cyEQOlJTU8oofmh77CTtLY9kla4a6uQLw/Cuprilx4wkPPU+5/0ZF0S8i
	Qsegh2rHGXd4BWdocQkPwEl2Y01Z4BNQAaN4vtheqj4lwgl3Mk7jaWlFV33jmgkaH8qux4SCbZs2c
	wTP73LVaYO9W0pXvqwPQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jkv1D-0008EP-BS; Mon, 15 Jun 2020 19:43:43 +0000
Received: from mail-qk1-x741.google.com ([2607:f8b0:4864:20::741])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jkv19-0008Ds-Q1
 for linux-snps-arc@lists.infradead.org; Mon, 15 Jun 2020 19:43:41 +0000
Received: by mail-qk1-x741.google.com with SMTP id q8so16921552qkm.12
 for <linux-snps-arc@lists.infradead.org>; Mon, 15 Jun 2020 12:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ujPfX7bGBpr+cv4J7c6a62EtWSdTnS+3JLQcCIhIpCI=;
 b=Iv5/XHDfwEQEouoXW6C4qK+kpAiEsSYuAnATCLTdbCzA3+j9HVgZyXpFAHI+BesDh4
 IOVk88N7reJAM8IQbX/C/OXNBrlQUUnKULjyWPfUHD2Op7+eJKNdjY2ayZoOhCBdYTdT
 YmMBpo8Ii4elR6pr3uGWshnOkxIWE4uul577kxgV+m4AEyzljAs6LvQWRDpROkOYIBRj
 UKrOzWvD0cgfNqWcoG5l/eQsxTz3686SwKrddXofREpbj8GMTBct0vIEzEvBdamna4Zq
 2OPpQA2EkU0y61I6d+SaqQKOLy8xS570k30rsydkkmWv53lzVx/oaD/R+iXHbvJpMTU6
 5hDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=ujPfX7bGBpr+cv4J7c6a62EtWSdTnS+3JLQcCIhIpCI=;
 b=RAOstT8M0Sg79xKqjgYFIzIC88zc7z11YJxw2SfbuL7hiItVxuthwsvIpyFNxf89P/
 ESNxZLlxgzIcD3mh4+Dh5GuSMQwcFhWcVllP0uWgtqDVEDjWPB7c0Cn9HECY56nz5nqw
 7JbwQNkPSg3hi+XElMOdNVhnXv96MZqvvhbJbVr/f+9/u05fDdr+ceW2jWelL7HzIelM
 TcDH7HOVZgAnSe+BqGD3uq5z9C0g656Qod50Yoo8uxRBB4e/EWFYyfx5VA0N343trqfC
 rpatmgU0L9IFC7roAL0De7K/e5Dng0TKLD9VFDWEeByGPVNlRakqQS2JgRjCRnd0J1J1
 86Pw==
X-Gm-Message-State: AOAM530DELYZSAMkfRhDr5q1eNBXh8N3gxmoyk7pNmIgjGu0q4fsCMho
 EwSLLPFRPA6lntYqXoikLLyjm8I0aJQ=
X-Google-Smtp-Source: ABdhPJz4SBQDxrLJVbwO4gN6wz+uRhrk2i3titFKV4K0S+iftiQVCL5fjMAqP1l0JfFRVhzQxS3Hag==
X-Received: by 2002:a05:620a:2153:: with SMTP id
 m19mr15823353qkm.1.1592250218513; 
 Mon, 15 Jun 2020 12:43:38 -0700 (PDT)
Received: from [192.168.1.4] ([177.194.48.209])
 by smtp.googlemail.com with ESMTPSA id v2sm12184320qtq.8.2020.06.15.12.43.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jun 2020 12:43:37 -0700 (PDT)
Subject: Re: [PATCH v2] ieee754/dbl-64: Reduce the scope of temporary storage
 variables
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
References: <alpine.DEB.2.21.1911112247180.30786@digraph.polyomino.org.uk>
 <20200602023223.13823-1-vgupta@synopsys.com>
 <alpine.DEB.2.21.2006021814210.3673@digraph.polyomino.org.uk>
 <d38b8dfe-5caa-5884-8843-0a845afbbb67@synopsys.com>
 <115b2236-e994-cdfd-d96e-2e8d354b7fde@synopsys.com>
 <6d22b849-e27d-9843-90e3-7ea635c6d863@synopsys.com>
From: Adhemerval Zanella <adhemerval.zanella@linaro.org>
Autocrypt: addr=adhemerval.zanella@linaro.org; prefer-encrypt=mutual; keydata=
 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
Message-ID: <04e95814-5f81-1ca8-f0fb-1f6bb53eff78@linaro.org>
Date: Mon, 15 Jun 2020 16:43:34 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <6d22b849-e27d-9843-90e3-7ea635c6d863@synopsys.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200615_124339_880065_5B872BDA 
X-CRM114-Status: GOOD (  10.15  )
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
Cc: "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 Joseph Myers <joseph@codesourcery.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org



On 15/06/2020 16:09, Vineet Gupta via Libc-alpha wrote:
> On 6/4/20 12:08 PM, Vineet Gupta via Libc-alpha wrote:
>> On 6/2/20 1:31 PM, Vineet Gupta via Libc-alpha wrote:
>>> On 6/2/20 11:16 AM, Joseph Myers wrote:
>>>> On Mon, 1 Jun 2020, Vineet Gupta via Libc-alpha wrote:
>>>>
>>>>> Also as suggested by Joseph [1] used --strip and compared the libs with
>>>>> and w/o patch and their sizes are exactly same (with gcc 9).
>>>>
>>>> My suggestion was to compare the *contents* of the libraries, not just 
>>>> their sizes.  Either they should be byte-for-byte identical, or if there 
>>>> are other differences (register allocation, line numbers in assertions, 
>>>> etc.) a more detailed investigation will be needed.
>>>>
>>>
>>> Here's my diff of the 2 --strip builds
>>>
>>> for i in `find . -name libm-2.31.9000.so`; do echo $i; diff $i
>>> /SCRATCH/vgupta/gnu2/install/glibcs/$i ; echo $?; done
>>>
>>> ./aarch64-linux-gnu/lib64/libm-2.31.9000.so
>>> 0
>>> ./arm-linux-gnueabi/lib/libm-2.31.9000.so
>>> 0
>>> ./x86_64-linux-gnu/lib64/libm-2.31.9000.so
>>> 0
>>> ./arm-linux-gnueabihf/lib/libm-2.31.9000.so
>>> 0
>>> ./riscv64-linux-gnu-rv64imac-lp64/lib64/lp64/libm-2.31.9000.so
>>> 0
>>> ./riscv64-linux-gnu-rv64imafdc-lp64/lib64/lp64/libm-2.31.9000.so
>>> 0
>>> ./powerpc-linux-gnu/lib/libm-2.31.9000.so
>>> 0
>>> ./microblaze-linux-gnu/lib/libm-2.31.9000.so
>>> 0
>>> ./nios2-linux-gnu/lib/libm-2.31.9000.so
>>> 0
>>> ./hppa-linux-gnu/lib/libm-2.31.9000.so
>>> 0
>>> ./s390x-linux-gnu/lib64/libm-2.31.9000.so
>>> 0
>>
>> Is this sufficient for comparison ?
> 
> ping !
> 

This analysis looks good me, although I can't voucher for Joseph.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
