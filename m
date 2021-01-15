Return-Path: <SRS0=h9uo=GS=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2151C433E6
	for <linux-snps-arc@archiver.kernel.org>; Fri, 15 Jan 2021 21:53:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CE0C239FC
	for <linux-snps-arc@archiver.kernel.org>; Fri, 15 Jan 2021 21:53:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3CE0C239FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4pyWczkNM4izhNUYSueMCRZsS46e9kLXvN8be+TgAUM=; b=pw5js9ZUFEOIP+Zoju+nTKDqA
	8nf64qUpfENjZzeOa1gzKpAG0KQC/3ybYusgkHIK7qNb46EOAN/Si2PPDii81z09G5ulVr/Z0vtuI
	I+tQMfp+bPU/IWMcyFNi4WbH3C+SYJWGr2vf38jk3I6WWxVAKSWGwpt2ejO6RPzxs9wp90tMTe5cE
	qYAeP218/bA7RSQ5nEIbNJrGO9x976z05sk8xLOhvPVmi7l+LUFcwjdDHKy9alIfHjxucHeNJ+JLA
	VuV+03cBaViypUjQo0w65wZrIW9P67b09gEM6i29p4z/P7XHvWkyRPIx4ujf/FzQZa6toC6q9CS+P
	OZTHaygwQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0X2c-0006Hv-31; Fri, 15 Jan 2021 21:53:58 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0X2Z-0006HC-UA
 for linux-snps-arc@lists.infradead.org; Fri, 15 Jan 2021 21:53:56 +0000
Received: by mail-pf1-x435.google.com with SMTP id b3so6343651pft.3
 for <linux-snps-arc@lists.infradead.org>; Fri, 15 Jan 2021 13:53:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+HSO1qHsUTuXT/LQbM9nbpBuogn7b/Ulne2GCwHCTqY=;
 b=R7058WbcIMbaus2QwEL+nzg9CDeiuQWk8BpUHTNzQ/9NsrT00t0lNEIEwNOPguVAK8
 wccFHxMtI45/CuMW34d3kgw+FUZ6Fbq1TqIHEKha484L3dgs48vYE12uB9mzk0i3z52G
 gBGxhrlcPI84vsSc3Nh+xwVDu9FYmIb/P4KMolnilx39m/AqZie2zeOlNUllyx/x/Gkg
 taqre60eygvtQ9LX0pHiCyAKWNZ2Z93RAn87JTzJSC+8H5GCMe8cF529l1e8wc0ph+vQ
 oYntU9nBedtgK2GnrLe6SFm5/8OxyQRJWffFQFTU557KR05sbUac/u/TRRl5HQCluJr7
 gojg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+HSO1qHsUTuXT/LQbM9nbpBuogn7b/Ulne2GCwHCTqY=;
 b=NbWZHGwW7m+5JM+BhknMGE99HJnoq32NToxVVwTUMtvzUGs/o0Edjah21Y3YrfuSXc
 RC8n+Os1SYgljMq31fyyFPisT9n7ocCJUnUk8cTgjAG6l6gfan3Y2M5CC7+Cg9cBiGjt
 RujqJUkmNy8Hb72Y4T99gh5eL51K2u8gmC7ouSK/RVZBV8lab7I7oYNG5OZdEfs9MRoz
 1+CeoOcHVGprbzFwyPM8XKb+jgRYcQ8uayXkJeaiDI6+RVp2wgiByNy90jqt0jIvPU2N
 WnjcCSr2de9bN7TV1TtSKnX4dPDBm2DraJAJnHqGl31L43yrTYjCCOrgvW48J3Logy23
 lzZg==
X-Gm-Message-State: AOAM532eolwsXzVatHpSDKqPdWigo8dEuSTtO+4Ik3r8dXoMT0XAnFHM
 XshPKCuZZGFV8jaQZkjTIE3JUQ==
X-Google-Smtp-Source: ABdhPJwpC0r8fJgz1O5ypDyGcWPhF3fx/oC7CFOEhXTzFYqEi9s7tXuOZxow02K0qOAiPxCCE7hMNw==
X-Received: by 2002:aa7:8104:0:b029:1ae:684f:d140 with SMTP id
 b4-20020aa781040000b02901ae684fd140mr14770951pfi.62.1610747633735; 
 Fri, 15 Jan 2021 13:53:53 -0800 (PST)
Received: from [10.25.18.3] (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id b129sm9745933pgc.52.2021.01.15.13.53.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Jan 2021 13:53:53 -0800 (PST)
Subject: Re: [PATCH 04/15] arc: TCG and decoder glue code and helpers
To: Cupertino Miranda <Cupertino.Miranda@synopsys.com>,
 "cupertinomiranda@gmail.com" <cupertinomiranda@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20201111161758.9636-1-cupertinomiranda@gmail.com>
 <20201111161758.9636-5-cupertinomiranda@gmail.com>
 <33ba8432-64c7-db76-459c-5fa6fd7e549a@linaro.org>
 <a1ea9064-dab5-c683-9899-bb19785f8ee4@synopsys.com>
 <e13f0b99-c5d5-4c8b-95c1-1ef79bdfd95a@linaro.org>
 <826051d0-623c-9e29-e62d-8c3818c3e0af@synopsys.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <83e57a69-5d2f-0c6d-4f65-44ef0669d71e@linaro.org>
Date: Fri, 15 Jan 2021 11:53:49 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <826051d0-623c-9e29-e62d-8c3818c3e0af@synopsys.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210115_165356_089531_53534E16 
X-CRM114-Status: UNSURE (   9.73  )
X-CRM114-Notice: Please train this message.
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

On 1/15/21 11:48 AM, Cupertino Miranda wrote:
>> In the case of enter or leave, this is one load/store plus one addition,
>> followed by a branch.  All of which is encoded as fields in the instruction.
>> Extremely simple.
> 
> So your recommendation is leave the conditional exception triggering of 
> enter and leave in a helper and move the loads/stores to tcg ?

What?  No.


r~

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
