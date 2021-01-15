Return-Path: <SRS0=h9uo=GS=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF9E5C433DB
	for <linux-snps-arc@archiver.kernel.org>; Fri, 15 Jan 2021 20:31:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B50923A75
	for <linux-snps-arc@archiver.kernel.org>; Fri, 15 Jan 2021 20:31:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B50923A75
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NcbQUmLFdGDuVGyYwfjBttrBMqDbAEfVHMMbmItHWX4=; b=0A5q/6A0bUXGMsKSzI2Au2ZTf
	gI54a10n5t5qCmlZkjKIfpTL5sApmzoeVr7bqK14Bb6dCkKtlgc3ConlNoTl/1uxW+F1mCg/BSfoc
	gEMlf0QXv57l2c4GtJLo1eaVkrmQiUv51d2mJuxFmbCTMahwoKg56j5dQzyyCnQV5VWOOqRTd6EAv
	4fUmcVrhiInkxUOBoX9HqtzwXFr7rcxnhkwsjOcRuvXa/JlaPpJtrkzRg2dX5TCSmc/esJbcWivJY
	KGIpk/jQnzsalZEGqP7IFYQizRAVLfhQKtolYB+CuENDlQzwQbIQNamOH4Va6Q90WRljrudvsaHr4
	og/xCEAVw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0Vkc-0007wc-D0; Fri, 15 Jan 2021 20:31:18 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0VkZ-0007wD-Ij
 for linux-snps-arc@lists.infradead.org; Fri, 15 Jan 2021 20:31:16 +0000
Received: by mail-pl1-x636.google.com with SMTP id b8so5278637plh.12
 for <linux-snps-arc@lists.infradead.org>; Fri, 15 Jan 2021 12:31:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FCzJk7V8W0zjOgsrORXZNgr+zZX1wsc15/d2WDgjDY8=;
 b=FSS6QlmaaS9f+uq1UVc3TFlzCJBIGHmdpSnZgv5GdbjDEu3R45o0AZ5jeBF8mk7Bqs
 y4PjpeT0spnb+ypriv6yQ6nTlGpVRJpgGrNZGGG1sylS0ap+hAv8MuEvi8ZB/YhuRDzX
 phecwPL4mhs/CEi9hT3TFytgiGAfWxl7YngDgh5qROazoSoUTKHkwVVYzcEnqpXHUJhj
 oLU9lyoKnyroWgSXIG3F5Cj2peOffOeUmsbwGRAc28ydsUPW2XYPaKMDLmbdJnvLq2zP
 KzKTm4Olx/JObjJNpQy+EggJG+EnpTnHValOy7xeRMhVlqCktgzl0ei9iWxV0OH+u0MI
 Z4gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FCzJk7V8W0zjOgsrORXZNgr+zZX1wsc15/d2WDgjDY8=;
 b=dZV5NKBpyOLxdlKK2Fh9MOGVFo02Hurk7c2fwZQ6QRvNvbT6UgjPy6+QJgAnWCrA9S
 t01mjHPl4Qq5WNJxLTruSkD3gNEYeJzGGXIWy948VIO0ZBCNpYvh2wUoT29G+/eHyzST
 uBZ8EIxHv4RGncJXaxgOhVDAmEQS09DoY+NthMNAFrpTygjxQfvG3dqUjaIJ7ZdBee9S
 MnaX2QOD0hxBxRgozsDPvpeKEmSbTWUipxbCGDLBVCjsNIUzgJKa7fjhlWe8lLFXFKcd
 jf510Pjjt6pSjpXq4d8onBhgwMFgr2dQLbw9GIUMjelvClc6vmGT9j3ax2o1DuTjL30e
 9IWg==
X-Gm-Message-State: AOAM530tckrhLfQjLFFqiPutVALdnu02qOApWRKC6IPGFvc6VKWd4dMQ
 6ZhKdB+xdDCGzWmVFfmeBdnoh5vt5rC9YuT8
X-Google-Smtp-Source: ABdhPJxHaK/ejMCpLwgWFBqe7qpdng85R70jNSiKbQgV3lVZ93psmp01c7nl6qPjcyDYd6ysURqmrw==
X-Received: by 2002:a17:90a:f0c1:: with SMTP id
 fa1mr12421572pjb.3.1610742673463; 
 Fri, 15 Jan 2021 12:31:13 -0800 (PST)
Received: from [10.25.18.3] (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id gb9sm8841178pjb.40.2021.01.15.12.31.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Jan 2021 12:31:12 -0800 (PST)
Subject: Re: [PATCH 04/15] arc: TCG and decoder glue code and helpers
To: Cupertino Miranda <Cupertino.Miranda@synopsys.com>,
 "cupertinomiranda@gmail.com" <cupertinomiranda@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20201111161758.9636-1-cupertinomiranda@gmail.com>
 <20201111161758.9636-5-cupertinomiranda@gmail.com>
 <33ba8432-64c7-db76-459c-5fa6fd7e549a@linaro.org>
 <a1ea9064-dab5-c683-9899-bb19785f8ee4@synopsys.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e13f0b99-c5d5-4c8b-95c1-1ef79bdfd95a@linaro.org>
Date: Fri, 15 Jan 2021 10:31:09 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <a1ea9064-dab5-c683-9899-bb19785f8ee4@synopsys.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210115_153115_938319_E71EB4FD 
X-CRM114-Status: GOOD (  20.83  )
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
Cc: Shahab Vahedi <shahab.vahedi@gmail.com>,
 Claudiu Zissulescu <Claudiu.Zissulescu@synopsys.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 Claudiu Zissulescu <claziss@gmail.com>,
 Shahab Vahedi <Shahab.Vahedi@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 1/15/21 7:11 AM, Cupertino Miranda wrote:
>> Similarly.  I think that both of these could be implemented entirely in
>> translate, which is what
>>
>>> +    bool restore_fp    = u7 & 0x10; /* u[4] indicates if fp must be saved  */
>>> +    bool restore_blink = u7 & 0x20; /* u[5] indicates saving of blink      */
>>> +    bool jump_to_blink = u7 & 0x40; /* u[6] should we jump to blink?       */
>>
>> these bits strongly imply.
>>
> 
> For lack of knowing better, it is unclear to me where to draw the line 
> when choosing between a translate time (tcg) or helper implementation.
> Your suggestions for carry/overflow computation are sharp and we should 
> have never used an helper, however I wonder what would be the benefit of 
> implementing enter and leave through TCG.
> 
> We have dealt with those exception issues by just changing SP in the end 
> of the instruction implementation, when no exceptions can happen.

5-10 tcg opcodes is the rule of thumb.  A conditional exception (requiring a
branch) is a good reason to put the whole thing out of line.

In the case of enter or leave, this is one load/store plus one addition,
followed by a branch.  All of which is encoded as fields in the instruction.
Extremely simple.

> As far as I understand when an exception happens in the middle of the 
> helper or even on a TCG implementation, it jumps out of that TB 
> execution to deal with the exception. On rtie instead of it returning to 
> the same tcg_ld or tcg_st where it actually triggered the exception it 
> will re-decode the same instruction which triggered the exception, and 
> re-attempts to execute it.
> Is that the case in current TCG implementation, or did it improved and 
> it is now able to return to previous execution flow (i.e translation 
> block) ?

I think I don't understand your question.

An exception leaves the TB, via longjmp.  Before the longjmp, there is normally
an "unwind" or "restore" operation, to sync the cpu state with the middle of
the TB.  This happens in restore_state_to_opc().

When processing of the exception is complete, execution will continue with the
appropriate cpu state.  Which will probably be a new TB that (logically)
partially overlaps the previous TB.

I.e. everything will work as you'd expect.

So... what's the question?


r~


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
