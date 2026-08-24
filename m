Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CBD9C5DF9C
	for <linux-snps-arc@archiver.kernel.org>; Mon, 24 Aug 2026 15:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5jqRyQXad+oWNCA8t/ly7r02EM6HJbf2wnj464U9Y4k=; b=RlM97p1jURReJH
	hbAoD502Yx+Oy85VzfMd2gfCHvEvcZVxRNLPU0a1Dorqn/WT+ichiTwWjMtQK1OV1j7KEkU/4zstT
	giaLzehVBJHtbkSgJVRqvQD4ln+X+u5iCKV0LY80nS4IhmQ12bvIeYGxMcnupc18v+s0QK1p+wneS
	kdlPaOAXUXHLTvqutbfgVLjqhoFZWRd7jFo1Ne4x2jrAZj1e2c1BQOWXuR98bOkiboxK+RW5wy/EZ
	iZ/XODsW1tklPvMwPLdpDNQw9n566xNIWTTt/o1SxZYTm8/2Wfj/MVFl6dD7P1vu7tgsdqTPiBmsW
	FBp1NidXO/R6+PPxlndw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyWwd-0000000Gxxr-0HI8;
	Mon, 24 Aug 2026 15:50:43 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyWwa-0000000GxwP-1Fh5
	for linux-snps-arc@lists.infradead.org;
	Mon, 24 Aug 2026 15:50:41 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-84874b52eabso4705961b3a.0
        for <linux-snps-arc@lists.infradead.org>; Mon, 24 Aug 2026 08:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1787586639; x=1788191439; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8n2sUFyNkTeeyJ480adWKOU51gCub2/F4WE3r3BRNf0=;
        b=Icpr5OJVzI/ZGQpR09V3wtZh0ZpIHijKFiv0/dYpIoGAi9bzWAbInYHAtDc6Tq4aLB
         BjmpScVMTThtnz4QDstISghXHm+FsH9ZqqvWACs65UjHZf6hSpUxa2WXHh55bA/b8uMu
         elQZnZfq16DtIIPin4mNrlvI3z6uZqKiHrqr4X7y+ujnV2HIUmaLUsfu87IkmXWPV1h7
         0+vc2FrFcug5LUdWQdi2XZ6CJ2WQzgsgl8ihDm1N6aeuV/mediAp965wW0rh7V0/eNxi
         lLEXAXqo/Y1TP9dp+naV75cSno57O/MvTEZj58xXKa64nGMujxyPcMXZDgzCkKYMLei5
         U3Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787586639; x=1788191439;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8n2sUFyNkTeeyJ480adWKOU51gCub2/F4WE3r3BRNf0=;
        b=RfXPFOVmXx5kNSzYp4/tDdznzBYU6+fX6JU9gXfWYz1Vj6EEMafB8aFo3VlrOe204s
         Y7WT8KATWDiS7N84D8BONUHQO7bAdcMwQWXKwA56r+sw61dRCnDuSJd+kuIY22xydbth
         549Tf0RSQN8cksOZSbe+vAbG6rT9k1U6hA77oF3crzhVdG2oRvNjBA6XRvaQbZBotIJH
         UMvIjz3HIBSIgtMr83sgz841bm0ag+1KYyTNXX3ED1Fc3iv0IYXQ9HnlJMtbTnSF0h6u
         WDCl4gGA5YFwZiCcVc8O0+aiUqfcBjTvBQ4tceS02pg1gR3UT3VaS6qIucic7x5ZYs5y
         S8Tw==
X-Forwarded-Encrypted: i=1; AHgh+RpSfOGtC0YNRRHNOKE+Myj39X/TAhtjHhnPKtvuz3RfRw9RjW3ZBZyXWAuv/xb8XT5EFgfmKEfoPNeeDinGMQ==@lists.infradead.org
X-Gm-Message-State: AFuF++kqPZFiAxAEM3AKQBbGCxDLQ4t6h2g1vtPwsrHxHRP3141r7V+N
	Vq36SkqI/ryHEwuRr93UYioVTKWao30l0oMh6cPda/QQpDiXSpo4cPFugNP1gpIIfC4=
X-Gm-Gg: AR+sD115Rkd1qYniGhy8d0iXbo3U0zb1yY3jjm/rslHWmdpFufv1BZmw9bEhFESduiQ
	JDs/CCVFbAgNJ/7lsHy2qfATfz4ZDKVeEqiI/sxo/8WdV2IkLuwwuwAFaS3osBcEK8Gm2SIrRI8
	cLhwrG3bf/RVm8vX+aVN/Qt+KidSEDPFH37Pqe2zgo8eQAtlOdRCXHc2/0JK8e7RFM1I86RlzMb
	BmXBNl5ktGMXd6WynnOrFeRUFt0poGbbvgwAmbsVRQ69abKMc00evhFSp0pPGTW6zaNhzx5tPaL
	8o0SvXQqRxJsUaykWjd57J0kOsQUyBJXwLEQIv95GTohZyHImCUS3oaypaZDiiSRLciN4rm8mO5
	Cs9MnaOujiT3moR0wRtA/sHHWk9FgqN89MMQC5dw0ri9GMHM7gRElD0PKTUcO9s36BTzbOKOz8w
	g5+WyfMU0oa3ezdJYvKCBuUhDB3dBmWkbwRJHmQ2spd8AbkgB9Plrjc2Kk3AXqB49w
X-Received: by 2002:a05:6a00:10d1:b0:848:5540:2377 with SMTP id d2e1a72fcca58-851fa070c14mr40910400b3a.17.1787586639434;
        Mon, 24 Aug 2026 08:50:39 -0700 (PDT)
Received: from [100.64.0.1] ([165.225.242.163])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8520ef36048sm2219670b3a.26.2026.08.24.08.50.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 08:50:38 -0700 (PDT)
Message-ID: <6dae9cae-9665-4dc8-9a49-d6e5acda221b@sifive.com>
Date: Mon, 24 Aug 2026 10:50:37 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC V3 8/8] mm: Drop pxd_ERROR()
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker
 <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, linux-alpha@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-um@lists.infradead.org, linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-mm@kvack.org, akpm@linux-foundation.org, david@kernel.org
References: <20260818040041.1891769-1-anshuman.khandual@arm.com>
 <20260818040041.1891769-9-anshuman.khandual@arm.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20260818040041.1891769-9-anshuman.khandual@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_085040_381212_319F6A49 
X-CRM114-Status: GOOD (  15.09  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 2026-08-17 11:00 PM, Anshuman Khandual wrote:
> There are no more users left for any pxd_ERROR() either in generic MM or in
> the platform MM. Hence all these platform macros along with their generic
> fallback could be dropped across the tree.
> 
> Cc: linux-alpha@vger.kernel.org
> Cc: linux-snps-arc@lists.infradead.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-csky@vger.kernel.org
> Cc: linux-hexagon@vger.kernel.org
> Cc: loongarch@lists.linux.dev
> Cc: linux-m68k@lists.linux-m68k.org
> Cc: linux-mips@vger.kernel.org
> Cc: linux-openrisc@vger.kernel.org
> Cc: linux-parisc@vger.kernel.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-riscv@lists.infradead.org
> Cc: linux-s390@vger.kernel.org
> Cc: linux-sh@vger.kernel.org
> Cc: sparclinux@vger.kernel.org
> Cc: linux-um@lists.infradead.org
> Cc: linux-arch@vger.kernel.org
> Cc: linux-mm@kvack.org
> Cc: linux-kernel@vger.kernel.org
> Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # m68k
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
> Changes in RFC V3
> 
> - Moved ptrval_to_str() as header in a [PATCH 1/8]
> - Stopped using pxd_ERROR() in generic MM in [PATCH 2/8]
> - Dropped pxd_ERRO() macros from all platforms in this patch
> 
>  arch/alpha/include/asm/pgtable.h               |  7 -------
>  arch/arc/include/asm/pgtable-levels.h          | 11 -----------
>  arch/arm/include/asm/pgtable.h                 |  7 -------
>  arch/arm/kernel/traps.c                        | 17 -----------------
>  arch/arm64/include/asm/pgtable.h               | 15 ---------------
>  arch/csky/include/asm/pgtable.h                |  4 ----
>  arch/hexagon/include/asm/pgtable.h             |  3 ---
>  arch/loongarch/include/asm/pgtable.h           | 11 -----------
>  arch/m68k/include/asm/mcf_pgtable.h            |  6 ------
>  arch/m68k/include/asm/motorola_pgtable.h       |  8 --------
>  arch/m68k/include/asm/sun3_pgtable.h           |  7 -------
>  arch/microblaze/include/asm/pgtable.h          |  7 -------
>  arch/mips/include/asm/pgtable-32.h             | 10 ----------
>  arch/mips/include/asm/pgtable-64.h             | 13 -------------
>  arch/nios2/include/asm/pgtable.h               |  7 -------
>  arch/openrisc/include/asm/pgtable.h            |  7 -------
>  arch/parisc/include/asm/pgtable.h              |  9 ---------
>  arch/powerpc/include/asm/book3s/32/pgtable.h   |  2 --
>  arch/powerpc/include/asm/book3s/64/pgtable.h   |  7 -------
>  arch/powerpc/include/asm/nohash/32/pgtable.h   |  2 --
>  .../powerpc/include/asm/nohash/64/pgtable-4k.h |  3 ---
>  arch/powerpc/include/asm/nohash/64/pgtable.h   |  5 -----
>  arch/riscv/include/asm/pgtable-64.h            |  9 ---------
>  arch/riscv/include/asm/pgtable.h               |  4 ----
>  arch/s390/include/asm/pgtable.h                | 11 -----------
>  arch/sh/include/asm/pgtable-3level.h           |  3 ---
>  arch/sh/include/asm/pgtable_32.h               |  8 --------
>  arch/sparc/include/asm/pgtable_32.h            |  3 ---
>  arch/sparc/include/asm/pgtable_64.h            | 10 ----------
>  arch/um/include/asm/pgtable-2level.h           |  7 -------
>  arch/um/include/asm/pgtable-4level.h           | 13 -------------
>  arch/x86/include/asm/pgtable-2level.h          |  5 -----
>  arch/x86/include/asm/pgtable-3level.h          | 11 -----------
>  arch/x86/include/asm/pgtable_64.h              | 18 ------------------
>  arch/xtensa/include/asm/pgtable.h              |  4 ----
>  include/asm-generic/pgtable-nop4d.h            |  1 -
>  include/asm-generic/pgtable-nopmd.h            |  1 -
>  include/asm-generic/pgtable-nopud.h            |  1 -
>  38 files changed, 277 deletions(-)
> ...
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 5d5756bda82e..993a6505eb8f 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -559,10 +559,6 @@ static inline pte_t pte_modify(pte_t pte, pgprot_t newprot)
>  	return __pte((pte_val(pte) & _PAGE_CHG_MASK) | newprot_val);
>  }
>  
> -#define pgd_ERROR(e) \
> -	pr_err("%s:%d: bad pgd " PTE_FMT ".\n", __FILE__, __LINE__, pgd_val(e))

We can drop the PTE_FMT macro now too.

Regards,
Samuel


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
