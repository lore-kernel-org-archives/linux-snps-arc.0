Return-Path: <SRS0=h9uo=GS=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CB89C433E0
	for <linux-snps-arc@archiver.kernel.org>; Fri, 15 Jan 2021 21:51:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 263DF239FC
	for <linux-snps-arc@archiver.kernel.org>; Fri, 15 Jan 2021 21:51:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 263DF239FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lB9bmWH33sSzHupcGtqX2hmXRJDNmpLfyBTM/wxp6+c=; b=S/twLpuAOVjhmVL1Ti8D0yU3J
	lOsHaWxZd6lBnx5hfo+TVQgAQXwiPttDv67sxGaBJAMmM9FxBqPBcNNO1TtBD9lnmO0cP+b5uw/9B
	PmJXCcYAHAjbKahMA0IvcJNx3nrxpJy8DcgSeZsHEbfa7xzpLqSUGVKVfui4eVyTaw0JPXz+CWvHd
	+0vyC5Mb0MkVnIADadRKztoItAeaQcg5TtEs/kqyfzJNYajMQIKuYc8jaSDApvuBpI7cHdcqa0/HP
	Lj1iOG2mCXfaC2Mnz30JiL6fL59m/N9nyNCdnVhitE0nlyZXzQkvJkR4jYpvDmHSa3IsY2FFCk60D
	bVFrKeBAg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0Wzx-0006B8-E3; Fri, 15 Jan 2021 21:51:13 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0Wzu-0006Ak-QL
 for linux-snps-arc@lists.infradead.org; Fri, 15 Jan 2021 21:51:12 +0000
Received: by mail-pj1-x1033.google.com with SMTP id v1so5826950pjr.2
 for <linux-snps-arc@lists.infradead.org>; Fri, 15 Jan 2021 13:51:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jz3EiJ+oClwZejEb7ZzSpC3TiYzEL7QLTnZboUuVmPw=;
 b=Qfvd+7JCsA6kK3Jp19PpywdWcwvoaM3yIGFUr/3H+nU96T+JHS4CO9xNsN+M/yFPLs
 jLGC/4NcK0DrLVqzxv7xE01Y9cW/xHzBMknU2pX5L1bfh0GPM855rSF2oarRDT2SjPhU
 26o7gZZGaDYHomFk9yaCMYoqwf2CUK+zl4wnPC/mLIyje5w0k5e9s1oUqHrdRNgnX2l6
 T8EtvdAe/KXuW61Jkk29HGBjVIQWzHQj4xvyRiCvwQ9kjCcPjA4Gk7POa2E/UAr8ROiv
 yJrRBi76Byfv+6Eqenw8j/KZHVi9KwkJE8+2b+Yo5mCP2wkV1cCSzq6KPruUw4aKCj7b
 XrtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jz3EiJ+oClwZejEb7ZzSpC3TiYzEL7QLTnZboUuVmPw=;
 b=SwFsP/ivMFBuf7EmXJDf4TlJI7PwaLFm9Nc8pAFTI8Se4QKuGPMsEk8YiJTld0kH1O
 Xi5RIKp/iVQVhHraNth6Mpy2DFGmSkpdAUySGBkO7eq0v25BfD8/OhGXWZ7Ekb2l5fGP
 SbZnZs048Nu6Oi/qVCXvXulu1aAPOUJn3KFSTDy7wREBFy/d2SRvNHzvym3BDW8ReM9U
 6U9Zs1H7CJHQSSzOmuY6T2/rmluECys1K1ttVacVf2oIgHjvYzpRiC+/BlhOEGHEgIei
 a1OQ3SOKEbdmISxsbe38jX/2tjwbrX1V1nWnB8gnw0LLc4tqxSe1dAFSfVnwwZKMBVmq
 r+pg==
X-Gm-Message-State: AOAM532UOzrUJh7p2iSOF/CY5YxKtVlJ3bTT4k2rS/ClwrI42dORAEj2
 1Q4Y0g8ukbPuNdg5n0SC+WEkvw==
X-Google-Smtp-Source: ABdhPJyB/WDdYRza0pqO58tSA4NmusMlPG388XfgEAHRIXNhG4OumD+NTRRKrwIN4WJKSqBaz/j9JA==
X-Received: by 2002:a17:90a:ae07:: with SMTP id
 t7mr12293447pjq.115.1610747467304; 
 Fri, 15 Jan 2021 13:51:07 -0800 (PST)
Received: from [10.25.18.3] (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id y8sm1805492pfq.106.2021.01.15.13.51.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Jan 2021 13:51:06 -0800 (PST)
Subject: Re: [PATCH 04/15] arc: TCG and decoder glue code and helpers
To: Shahab Vahedi <Shahab.Vahedi@synopsys.com>,
 "cupertinomiranda@gmail.com" <cupertinomiranda@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20201111161758.9636-1-cupertinomiranda@gmail.com>
 <20201111161758.9636-5-cupertinomiranda@gmail.com>
 <33ba8432-64c7-db76-459c-5fa6fd7e549a@linaro.org>
 <c1e9d63a-ee10-5a85-57d2-3c4ad2a86980@synopsys.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <aeb86191-5fde-5f8f-7319-cc6375d02bf6@linaro.org>
Date: Fri, 15 Jan 2021 11:51:03 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <c1e9d63a-ee10-5a85-57d2-3c4ad2a86980@synopsys.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210115_165111_206092_DC78DE4F 
X-CRM114-Status: GOOD (  15.58  )
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
 Cupertino Miranda <Cupertino.Miranda@synopsys.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 Claudiu Zissulescu <claziss@gmail.com>,
 Claudiu Zissulescu <Claudiu.Zissulescu@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 1/15/21 11:28 AM, Shahab Vahedi wrote:
>>> +        cpu_stl_data(env, tmp_sp, CPU_FP(env));
>>> +    }
>>
>> And what if these stores raise an exception?  I doubt you're going to get an
>> exception at the correct pc.
> 
> I've added a few bad-weather test cases [1] and they work as expected. Indeed,
> none of those tests trigger an exception during the "cpu_stl_data()". Could you
> elaborate why you think the PC might be incorrect? Then I can add the corresponding
> tests and fix the behavior.

Because you're using cpu_stl_data_ra, with GETPC, if the store faults (e.g.
SIGSEGV) then the exception unwind will not be done.  This will happen to work
ok if and only if "enter" is the first insn of the TB.

>> In the case of enter or leave, this is one load/store plus one addition,
>> followed by a branch.  All of which is encoded as fields in the instruction.
>> Extremely simple.
> 
> You're suggesting that "enter/leave" should use TCG opcodes instead of
> helpers? If yes, do you really think it is possible to implement each with ~10
> opcodes?

More or less.  Two per registers stored, plus two moves.  It looks like the
limit of registers is either 3 or 14, depending on the cpu configuration.

Certainly this is no different from other "push multiple" type of instructions
of other architectures, which do exactly this.


r~

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
