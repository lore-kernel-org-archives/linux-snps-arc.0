Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2083E77188
	for <linux-snps-arc@archiver.kernel.org>; Fri, 20 Dec 2024 11:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2+C56cuOheNfkPJ/QZiOK9eKr8Ni70Ho/YajOVNlyHw=; b=t+vrVB+rux+fAd
	Fyhe0xbfn96baEQxPqo1DquXBbAjA/BiOW/fBwCPHA2Q5L2vCIQ89DHhQJjEhrpLgTka/YFn/GG06
	F2T0MhLMIj1QsxOm0WnKFxq4IWQJpZ7RsXz6oy83M92eFITNtcMgED59hsplsnZYZZbadSfSKjHZ9
	tXI6hu4gls3xvpGKpR2OdNfE76kAM/QD2XAZ5gLUsmwo2mO04gfhVMm9JJFJh2qfxFmKhmjoyhITX
	multC9hextfWcb91SFNKiDCECe1aPc01XkW6e9CPEhYgJ00/Re9FEQID2K2LkA6R2WHam0RNZYmtY
	Jxt5JSBQvxvJOVt11tww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tObTe-00000004olg-2MLs;
	Fri, 20 Dec 2024 11:47:30 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tObSS-00000004oYU-3L6O
	for linux-snps-arc@lists.infradead.org;
	Fri, 20 Dec 2024 11:46:19 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-218c8aca5f1so20101995ad.0
        for <linux-snps-arc@lists.infradead.org>; Fri, 20 Dec 2024 03:46:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1734695175; x=1735299975; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mBRlMffFmN+hz5HGm/qsvwuPzuwmJovQ60y3/xe1EoY=;
        b=ebwtpK7IIoH28LnyqjcYWkmWPPc3T38g7rzHUvDlCDDAToJkKjkisqqolYFrzO8VIx
         HMeK4v8sfbtxpc5RhFtZnG89PKYriLOG7AYGcgjuFOGy5/dP1yx8GJcyph/sWqndTVwI
         DTBBQv27tyQ2YDFfFPE9ASqCjIv7QPiSysn2mje/4oT+y5aEdsbqKQ48s8temTqR4x/a
         jut9Yjufk7QWz2m31teCJpfdilvIyhAU2+TVYVbOI1XCX/7Np2EdTrle0lYHVSCWM916
         U0mDWvbfQLEiaWvg8gwxfHqGvecel1+/M/4QNn1cTFtdC4GhtjGbLsB08Mm9z39gOgri
         pkwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734695175; x=1735299975;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mBRlMffFmN+hz5HGm/qsvwuPzuwmJovQ60y3/xe1EoY=;
        b=NwueA/mevoslqHJX8Vgfmf/GLZjGlkn0dWIhaPetXF4uIGt3O7Af8eKiYelK+UCPaC
         z3/GjUeQ9lO4ntB2VVpD9EzBE0oUOTgBCAbv2A7YGH0ZOamuV45Ji7nveTEclizpSDwh
         MofkbFZUQngc5wWK3NZhSlERfy18eevj9jBUddwhrOykfli36AbXqhVPU+J4UxJYszok
         1Uoxgn5Ryi/4ajgCV2M7uJpoufrAPQ/74uIMVxe9m9BEMx8QAJjGy6bJHzhf7r49Xz6w
         hlGiYyIyKm+aiCDf7ljtc5wtcahCBFySlvDuHM01tjoutpucAp6MrY8MttTWruihNNmg
         VfVw==
X-Forwarded-Encrypted: i=1; AJvYcCVWOVHNCdMipy3FrQV5d+ZYN9prmLaDXXqEHOuXOHLEVf680dsJflDv+4ulnlk+Tg78owW/xA6ULeOoZxkyVw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxCDTWhAQNaSU0QHetQrENhu63ZPu4JL9nJgqWWcJ3H2El8HHcX
	X1oEZUx5dZYpJBRpdb2/WVzxS+BE48XLoVi0F9WHSJBUr//gjF3251h/SVFZVsU=
X-Gm-Gg: ASbGncuZmkR/ykELsmJM+qwGt9ZKJc1MmxS9Y1ZSBTFVLJsAU1/ZsBRjr61EhS7iEBu
	7/VxyHuFSIaIdJ9O6NqulEXeLkMSWath8VBzMhsknDauMrcaf7PLGLEOY41lVnMVVJDHm3cM9+E
	n72Q17+acIWApliIK+uuA/n3b5cVMVvMLDDhFElDCQ1McfpUqQzgBQhzHwEiGTEQj1leVsMmkGY
	Ql46ijXNFsCfner1xoLPP2dX+4shhqccNnaHIuwzpOUVwXJ4dWXFi8gbLFk/l2zOpi2C3ld37ku
	GG7VNeBYSkh3mcSD9yw1gMqIOKmm46VaiMJUmQ+84GtGaYcxzH2zxjs=
X-Google-Smtp-Source: AGHT+IG40UPaAgLiyyOp9k8XqW2vPy2P2eyTWxZSuqMQTAARXLtkQgcz7lH63J8oRPI229SK+RLglg==
X-Received: by 2002:a17:902:ce92:b0:216:4169:f9d7 with SMTP id d9443c01a7336-219e6e8bc7cmr41107195ad.2.1734695174995;
        Fri, 20 Dec 2024 03:46:14 -0800 (PST)
Received: from ?IPV6:2409:8a28:f44:3764:680a:144b:d927:5a3b? ([2409:8a28:f44:3764:680a:144b:d927:5a3b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f2db9939b5sm5267286a91.1.2024.12.20.03.46.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 03:46:14 -0800 (PST)
Message-ID: <0daabd32-cba4-4345-baa8-e8c66bc899ff@bytedance.com>
Date: Fri, 20 Dec 2024 19:46:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/10] mm: Move common parts of pagetable_*_[cd]tor to
 helpers
Content-Language: en-US
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Linus Walleij <linus.walleij@linaro.org>, Andy Lutomirski <luto@kernel.org>,
 "Mike Rapoport (IBM)" <rppt@kernel.org>, Ryan Roberts
 <ryan.roberts@arm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Will Deacon <will@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 linux-alpha@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org,
 loongarch@lists.linux.dev, x86@kernel.org,
 Alexander Gordeev <agordeev@linux.ibm.com>
References: <20241219164425.2277022-1-kevin.brodsky@arm.com>
 <20241219164425.2277022-2-kevin.brodsky@arm.com>
 <20241219171920.GB26279@noisy.programming.kicks-ass.net>
 <75cb4ff8-eb0c-4519-a30a-f8be717ba278@arm.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <75cb4ff8-eb0c-4519-a30a-f8be717ba278@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_034616_841914_497098FC 
X-CRM114-Status: GOOD (  20.65  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi Kevin,

On 2024/12/20 18:49, Kevin Brodsky wrote:
> Hi Peter, Qi,
> 
> On 19/12/2024 18:19, Peter Zijlstra wrote:
>> On Thu, Dec 19, 2024 at 04:44:16PM +0000, Kevin Brodsky wrote:
>>> Besides the ptlock management at PTE/PMD level, all the
>>> pagetable_*_[cd]tor have the same implementation. Introduce common
>>> helpers for all levels to reduce the duplication.
>> Uff, I forgot to Cc you on the discussion here, sorry!:
>>
>>    https://lkml.kernel.org/r/cover.1734526570.git.zhengqi.arch@bytedance.com
>>
>> we now have two series doing more or less overlapping things :/
>>
>> You can in fact trivially merge the all the implementations -- the
>> apparent non-common bit (ptlock_free) is a no-op for all those other
>> levels because they'll be having ptdesc->lock == NULL.
> 
> Ah that is good to know, thanks for letting me know about that and Qi's
> series! Fortunately there isn't that much overlap between our series - I
> think we can easily sort this out.
> 
> Qi, shall we collaborate to make our series complementary? I believe my
> series covers patch 2 and 4 of your series, but it goes further by
> covering all levels and all architectures, and patches introducing
> ctor/dtor are already split as Alexander suggested on your series. So my
> suggestion would be:
> 
> * Remove patch 1 in my series - I'd just introduce
> pagetable_{p4d,pgd}_[cd]tor with the same implementation as
> pagetable_pud_[cd]tor.
> * Remove patch 2 and 4 from your series and rebase it on mine.

I quickly went through your patch series. It looks like my patch 2 and
your patch 6 are duplicated, so you want me to remove my patch 2.

But I think you may not be able to simple let arm64, riscv and x86 to
use generic p4d_{alloc_one,free}(). Because even if
CONFIG_PGTABLE_LEVELS > 4, the pgtable_l5_enabled() may not be true.

For example, in arm64:

#if CONFIG_PGTABLE_LEVELS > 4

static __always_inline bool pgtable_l5_enabled(void)
{
	if (!alternative_has_cap_likely(ARM64_ALWAYS_BOOT))
		return vabits_actual == VA_BITS;
	return alternative_has_cap_unlikely(ARM64_HAS_VA52);
}

Did I miss something?

My patch series is not only for cleanup, but also for fixes of
UAF issue [1], so is it possible to rebase your patch series onto
mine? I can post v3 ASAP.

[1]. 
https://lore.kernel.org/all/67548279.050a0220.a30f1.015b.GAE@google.com/

Thanks!

> 
> Let me know if that makes sense, if so I'll post a v2.
> 
> Cheers,
> - Kevin

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
