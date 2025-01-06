Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58BE1E77188
	for <linux-snps-arc@archiver.kernel.org>; Mon,  6 Jan 2025 08:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A2rV8ujVT55bLeuA6BZ2C3h/tQQ+jRrMYzkNXIM7q4A=; b=30UiRIrM3xPaas
	fh4dOGMocqtPSlf3lsJ1JKtl1upubKoAZb0tVjnyC5JUEpD3PzrZjgLAktgfapDw50qkfEsHWFdAX
	FVAU7G6mJwKzXC7rc4dn8r+0fnsuXMfk8K4gWLXDwu8T74te3INVAci10coT02qKt1j9gnBN8W7Uh
	2Xi4y+VjovV4TkBASVd7mdHeQUu3ILp/JzlCumxhAbVGVbp9b/frNF4+UfseBqWdVIvZZcCUDN0A/
	nSplf/pnwQ5Nz5Wp8gZhDJBBqba84U6nalEz3hcZ0wB7V1uHcmCeNcl0/lvdl91i6oD5jo1dZFkbL
	fNHNeTNcMUOiNQdDnDtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUidP-00000000Y3r-0FCK;
	Mon, 06 Jan 2025 08:38:51 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUidL-00000000Y1h-1wI4
	for linux-snps-arc@lists.infradead.org;
	Mon, 06 Jan 2025 08:38:49 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-21619108a6bso186784375ad.3
        for <linux-snps-arc@lists.infradead.org>; Mon, 06 Jan 2025 00:38:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736152725; x=1736757525; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YiOAOk5kGRx9rmUPaHmWdeff0Y5xhlY6UwwEsQqm8Hw=;
        b=YhLtHRliJAH+nVaGq9JLlfFq/roSt+Z5/uK/lPENt7TByuZgR+ZRXkjHkEPJMrPKbg
         Uqv+xKC41iZMdIKj7jXF+j3Ist/TOq3kGaZL912TdGa7i212Pb3JLnmdZW7oOy4fnCzP
         2aAQeZpgD9L8OWFWh/8NKye0niQQ+TMk7BJBlESC/gmNZ39daKZhbzFLb+c74ff/amfU
         MX1W1FyuKlzJqmQ3raCpD+zHRKNDw9fsbsEJFgNSwEPfUO1W0c1u2dKkNQZb4g2ufM2V
         y+Vqs5BjODGIbjPo0+gmmpGoeFKfduXtJBXHFZfskc6kiwm7niramZK4m2DdT+9099Xy
         qjdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736152725; x=1736757525;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YiOAOk5kGRx9rmUPaHmWdeff0Y5xhlY6UwwEsQqm8Hw=;
        b=nAcjC/+/OfiIDKqaLURBsrk1J0Ib48yB68ya10IvF83dFUvVFgmJ640CEtU/gn5I9L
         35nhiQUUIfVadiZq36MbtdHOlc5jCXpPlvDzAhFpgUynyTBV0W41TrunWWmVmnlRBJsZ
         OyLyFjG8cD4h/jzU7Q4g0tXOCroHt9vCePUkxRVKPWGj8bWoCymj/xwgW2+7pOG9rQtQ
         E31PS6RgxFtBrubQuchzoTbtMRgBjpchIYAgizjHhlGrYNebg/wCSmzkVg/Zn12GtufV
         0Ai7YU/+9WFEb59I7DbdzItRW5hrphMmtT+3xvf6tmW10rp3edALMKDOOXRR7EwMC94Z
         cr3A==
X-Forwarded-Encrypted: i=1; AJvYcCXc760Fc6yito1VDTnryPvpiOZ7NLCbJYvo1WFt7vLec86sCzDggAbBun9J7dyNT2lPjc33PUZi9lQhTNoGoQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyg4at1EfUcAidVp91tIHUwLIAk9D5XWSyDMGEGfc4dyrX0eIOJ
	Khf7CsgVU1XspnBeq/csD1hwe2D4DZLYx8CQlSB8QGWmLL9dk7uepn0WtM97m2w=
X-Gm-Gg: ASbGncucY2+/yw+9NKkhJZvh5Q71scnw1r4miDPyXJ7sIZ+NQoolBFZgdKeD6huZxFF
	Fxn/hRVAq2Q7d6fGJqijvLtrvRLBZHaavE2derBZK28FomdT/n7P7j4UQ+0LmiVttNM31rgRmaG
	wsuMcM/SAiV+5Euc6fyiFGFW8LTRPoleeNNttRDcCtH1b5iHtJNzzBSwudNLeucdihRMcPgTRLq
	hNiPzxS8O5WIFcIvwf+EPU4yWYH749Md5ymYTT20tbJife8efrXaft15L42/T/6bjuORDdBpdAw
	Y42yXQ==
X-Google-Smtp-Source: AGHT+IGUVd4iqCCZ9lciazZSWpc6AL/Za8b2BM7ngUBHt9ys8AcRhMXZRUNC6JrwIwMnpr/5pGC4Lg==
X-Received: by 2002:a17:903:234c:b0:215:5a53:edee with SMTP id d9443c01a7336-219e6e85b25mr837178605ad.9.1736152725600;
        Mon, 06 Jan 2025 00:38:45 -0800 (PST)
Received: from [10.84.148.23] ([203.208.167.148])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f5087sm282364745ad.202.2025.01.06.00.38.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 00:38:45 -0800 (PST)
Message-ID: <ae8aa8d7-4121-4939-9890-c54e0aee7896@bytedance.com>
Date: Mon, 6 Jan 2025 16:38:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] Account page tables at all levels
Content-Language: en-US
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Linus Walleij <linus.walleij@linaro.org>, Andy Lutomirski <luto@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, "Mike Rapoport (IBM)"
 <rppt@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 Matthew Wilcox <willy@infradead.org>, linux-alpha@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-um@lists.infradead.org, loongarch@lists.linux.dev, x86@kernel.org
References: <20250103184415.2744423-1-kevin.brodsky@arm.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <20250103184415.2744423-1-kevin.brodsky@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_003847_830264_9CDDAE87 
X-CRM114-Status: GOOD (  15.61  )
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



On 2025/1/4 02:44, Kevin Brodsky wrote:
> v1: https://lore.kernel.org/linux-mm/20241219164425.2277022-1-kevin.brodsky@arm.com/
> 
> This series should be considered in conjunction with Qi's series [1].
> Together, they ensure that page table ctor/dtor are called at all levels
> (PTE to PGD) and all architectures, where page tables are regular pages.
> Besides the improvement in accounting and general cleanup, this also
> create a single place where construction/destruction hooks can be called
> for all page tables, namely the now-generic pagetable_dtor() introduced
> by Qi, and __pagetable_ctor() introduced in this series.
> 
> v2 is essentially v1 rebased on top of mm-unstable, which includes Qi's
> v4 series. A number of patches from v1 were dropped:
> 
> * v1 patch 4 is superseded by patch 6 in Qi's series.
> * v1 patch 5 and 6 moved to Qi's series from v3 onwards.
> * v1 patch 7 is superseded by patch 4 in Qi's series.
> 
> Changes from v1 in the remaining patches:
> 
> * Patch 1 only introduces __pagetable_ctor() as there is now a single
>    generic pagetable_dtor().
> 
> * Patch 3 and 6: in arch/m68k/mm/motorola.c, free_pointer_table() can
>    now unconditionally call pagetable_dtor() since it is the same for all
>    levels.
> 
> * Patch 6 just uses pagetable_dtor() instead of introducing
>    pagetable_pgd_dtor().
> 
> * Added Dave Hansen's Acked-by to all patches.
> 
> - Kevin
> 
> [1] https://lore.kernel.org/linux-mm/cover.1735549103.git.zhengqi.arch@bytedance.com/
> ---
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Andy Lutomirski <luto@kernel.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: "Mike Rapoport (IBM)" <rppt@kernel.org>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Will Deacon <will@kernel.org>
> Cc: Matthew Wilcox <willy@infradead.org>
> Cc: Qi Zheng <zhengqi.arch@bytedance.com>
> Cc: linux-alpha@vger.kernel.org
> Cc: linux-arch@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-csky@vger.kernel.org
> Cc: linux-hexagon@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-m68k@lists.linux-m68k.org
> Cc: linux-mips@vger.kernel.org
> Cc: linux-openrisc@vger.kernel.org
> Cc: linux-parisc@vger.kernel.org
> Cc: linux-riscv@lists.infradead.org
> Cc: linux-s390@vger.kernel.org
> Cc: linux-snps-arc@lists.infradead.org
> Cc: linux-um@lists.infradead.org
> Cc: loongarch@lists.linux.dev
> Cc: x86@kernel.org
> ---
> Kevin Brodsky (6):
>    mm: Move common part of pagetable_*_ctor to helper
>    parisc: mm: Ensure pagetable_pmd_[cd]tor are called
>    m68k: mm: Add calls to pagetable_pmd_[cd]tor
>    ARM: mm: Rename PGD helpers
>    asm-generic: pgalloc: Provide generic __pgd_{alloc,free}
>    mm: Introduce ctor/dtor at PGD level

For this series:

Acked-by: Qi Zheng <zhengqi.arch@bytedance.com>

Thanks!


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
