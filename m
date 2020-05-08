Return-Path: <SRS0=84Jg=6W=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EACEAC38A2A
	for <linux-snps-arc@archiver.kernel.org>; Fri,  8 May 2020 13:32:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BCF7E206D6
	for <linux-snps-arc@archiver.kernel.org>; Fri,  8 May 2020 13:32:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DDSPFIea";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RiaE2E5t"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BCF7E206D6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:Subject:From:References:To:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rjh/RFNbrFoCmdaIolpuYBux2l8sN7GHCag4tIZIfGc=; b=DDSPFIeaBlig1b
	cRKdUolNS7eytlPhGac1oiqRQ12kVPtRIx8bs8eh7CUrwf1t0ju1eRwCE64wqwd5EvQAfTxtNONbZ
	+anh+2Jy4HVJedHpy7cMzpIOc45GxP8nsj/NJ7dfrAH0FWLqD0ZyJFa9dvuFDcUDP0X5S8gXRmkdM
	c+y52biPlcq+ckPgN3B+yROjYo3CuMbqYTf3SARHr3ik9Aq+exwyO4vFnJ88ZK2TAaAcvfk5Z5GMA
	Yc9HLOb36HU3IdJqhd29BmRUTj12RGvaCcb10cmoZAlsFqIGKI768Ze4Vo71ng665Gi44nCQz7Lb1
	oOnmGJXUmX0FfaRPIeUQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jX36o-0004W5-AU; Fri, 08 May 2020 13:32:10 +0000
Received: from mail-qv1-xf43.google.com ([2607:f8b0:4864:20::f43])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jX36l-0004VV-Qo
 for linux-snps-arc@lists.infradead.org; Fri, 08 May 2020 13:32:09 +0000
Received: by mail-qv1-xf43.google.com with SMTP id r3so714135qvm.1
 for <linux-snps-arc@lists.infradead.org>; Fri, 08 May 2020 06:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=to:cc:references:from:autocrypt:subject:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=C6G+eq6IVxwMm7qG+lFUcvmO2qSwrp1ezRNxI93wIGk=;
 b=RiaE2E5t3FkFdNfSzmVtaPfyI2zG+bPWZ6P6cIzSZpmTbNMAbP0Vu03Ku9e0VUmKkl
 oIuOxZEfDVcMA13VwXmgT4gMfLpTXWwdqxDy58Yvk4n00TLGOpGk/C2Z0DAEYeVBd6DG
 KYCPDFG2AS5hpie8BB/BdTrb6KjRvftFAJJquieQrVUekssl83/+VjIvOZqMW50HOIqu
 bfNSWOKgSvXLc2D+kq3C5hupl8TBEKZE/MdASpeU/FqAi9x9lR6iw8hVYHFdTfR0u6ZM
 volaCV+Tzd1hv+Az+iLU9Yqy3+n0AnwheX2KEtHoli95g/4mdGX74u+SzSDaJ9L89xRn
 dilw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:autocrypt:subject
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=C6G+eq6IVxwMm7qG+lFUcvmO2qSwrp1ezRNxI93wIGk=;
 b=itZlU+Uy7M9Pbxqit8xtDTXB9nSXgLLB59jJ/xHYaMr5Bh7b5fsxCDfw1/d3+MQIYE
 K+eAQ90eT1O0anxjVRbqFa7mbuYh5afwg/Wzky2yfxfQ4A5yTtM2A1NcrgIF6sXCJyZb
 1Fbs2fVtlVUJXpAxkTVX1A/HKuDFqY4SDUx3p/bgxJ3KflcbJQTp/+ubnu8mVb2n6uHy
 qRp9Z4F2dQAkW+nG7WaD9FLw3BJfiL1ygVGtMq3pshfYjnlR2MPRDl7xcTY9w9KLk56q
 o8L8AL+cn/PAuMQndm5+BYe0bak6nTVrXslfQ6H9rBmbdl8+2QiNZZosihIdBEYXquMg
 krTA==
X-Gm-Message-State: AGi0PuapTmahjWKjwC+EijAx4wpM58MGPhwPtMwxpIbBkNkwBKKGFn3Q
 KVT8eRr6uE+vqIyFfhsUgW46lhETIlk=
X-Google-Smtp-Source: APiQypKOzGFpUz8UH/hEq/vhDu5FP9t0h4XyqoiNrabXR+hSpoRgtV+yUnkvYdrchZWuXMMlf8lKxg==
X-Received: by 2002:a0c:fd8c:: with SMTP id p12mr2859518qvr.163.1588944726108; 
 Fri, 08 May 2020 06:32:06 -0700 (PDT)
Received: from [192.168.1.4] ([177.194.48.209])
 by smtp.googlemail.com with ESMTPSA id k2sm1420201qte.16.2020.05.08.06.32.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 May 2020 06:32:05 -0700 (PDT)
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 "libc-alpha@sourceware.org" <libc-alpha@sourceware.org>
References: <03f4a9b3-b1ca-90fa-0b6a-609a3135267d@linaro.org>
 <20200427215938.14136-1-vgupta@synopsys.com>
 <ac93c301-36d3-b20a-d31c-50c1f3264c68@linaro.org>
 <9b8f822b-0df7-d3b2-eb6e-eaa07216a589@synopsys.com>
From: Adhemerval Zanella <adhemerval.zanella@linaro.org>
Autocrypt: addr=adhemerval.zanella@linaro.org; prefer-encrypt=mutual; keydata=
 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
Subject: Re: [PATCH] semaphore: consolidate arch headers into a generic one
Message-ID: <c13250ef-0a59-703b-f4b9-9a96fb3dfb5a@linaro.org>
Date: Fri, 8 May 2020 10:32:03 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <9b8f822b-0df7-d3b2-eb6e-eaa07216a589@synopsys.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200508_063207_898476_B0F76CE2 
X-CRM114-Status: GOOD (  11.17  )
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



On 05/05/2020 19:59, Vineet Gupta wrote:
> On 5/5/20 12:05 PM, Adhemerval Zanella via Libc-alpha wrote:
>>> diff --git a/sysdeps/s390/nptl/bits/semaphore.h b/sysdeps/unix/sysv/linux/bits/semaphore.h
>>> similarity index 100%
>>> rename from sysdeps/s390/nptl/bits/semaphore.h
>>> rename to sysdeps/unix/sysv/linux/bits/semaphore.h
>>
>> Ok, although I think we should handle as a new file: add a online description and
>> remove any 'Contributed by' line.
> 
> Ok did explicit add/del but still git rename detection triggers, this time
> matching it to x86 version (with 90% similarity). I'm pretty sure in the past
> delete/add used to elide renames, perhaps the heuristics have gotten better. AFAIK
> there is no gitconfig setting to disable the rename detection.
> 
> ...
>  sysdeps/{x86 => unix/sysv/linux}/bits/semaphore.h |  5 ++---
>  sysdeps/unix/sysv/linux/powerpc/bits/semaphore.h  | 40
> 

I use both -C (detect copies as well as renames) and -M (detect renames)
with git format-patch and send-email to try avoid such issues. Sometimes
it is required to change the -M threshold to get the rename right.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
