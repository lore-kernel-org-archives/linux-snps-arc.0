Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B9A8C4332F
	for <linux-snps-arc@archiver.kernel.org>; Wed, 19 Oct 2022 00:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1Gj9xzDKF9irG5ZVmRlrcw280KhkVc5qVH6xOxCFGY8=; b=Fzv2SyfWSCTPKk
	g7RbCieudytX97WhCdYQb35wLFOtx29zMaOS4idnkqDhxSIGranIdv1gWy+cU1OgWyeTgVefd39iE
	8N8nNkpc8UnOqn9e2VRQQEz55f/oVARzXp8W2PAjm/BXTq0gsYfrB0eFOP4TZ9Q2XAgveNzQ76aMh
	+6gj44cAnbO5RLPDSeYe0eeQyLlIHCbRb8PNAp9xzTzDXiHBkgtRHDlc3VnPO6muwktry9/3R11Mw
	cTvzWp9XudyhQGJ9K0X0rQ/7NsXQ9fRDQTpNvQhW+jM1P/I3UG9uEyDw5lmJe0QcMc9gk2Qsi1OS3
	3nmrI11MAFHMjZQna7bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okwsv-00CFlh-9A; Wed, 19 Oct 2022 00:24:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okwss-00CFX0-81
	for linux-snps-arc@lists.infradead.org; Wed, 19 Oct 2022 00:24:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 622EB61737;
	Wed, 19 Oct 2022 00:24:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E809C433C1;
	Wed, 19 Oct 2022 00:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666139072;
	bh=fJDsvxvbiS6PeUatTvAK+KDfxKecYDKmx+l9E/r4RoA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lvt17nE49iaTbIYT3SlsksQJ8BwAO179kRlBkbZGfXVeGaDU2UXT5sPXJrfKCcPIy
	 dxrsyT0EPwId4WHP8e0j75RfSchYBpVD3FTpaqtmcirVEk0qQWsGYDTI5C7zseBPBC
	 QF7i1+tWXlsAGAKFNFZo///4C1XChS8yz15dm4FtuLrULe/evVb1lA3cGF/yBrUyFv
	 eEeuMX3lYxWY7nSokqJGsYCZjcBHo1MnRRnSwbXe4uBOYak4UGRq57w+UeHP28leUD
	 iuIvjdyAXUMp8wIS5aAAqUpAKsyit195yvwmuXTB2b/QI8SxXbtZ9vTZBygTf1LZ3J
	 zZZTYKzbU5+Nw==
Message-ID: <1d9772ac-4b73-4c76-8924-89425b7dd30b@kernel.org>
Date: Tue, 18 Oct 2022 17:24:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] ARC: mm: fix leakage of memory allocated for PTE
Content-Language: en-US
To: Pavel.Kozlov@synopsys.com, linux-snps-arc@lists.infradead.org
Cc: Vineet Gupta <vgupta@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 stable@vger.kernel.org
References: <20221017161127.24351-1-kozlov@synopsys.com>
From: Vineet Gupta <vgupta@kernel.org>
In-Reply-To: <20221017161127.24351-1-kozlov@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_172434_445564_5563352D 
X-CRM114-Status: GOOD (  22.91  )
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

On 10/17/22 09:11, Pavel.Kozlov@synopsys.com wrote:
> From: Pavel Kozlov <pavel.kozlov@synopsys.com>
>
> Since commit d9820ff ("ARC: mm: switch pgtable_t back to struct page *")
> a memory leakage problem occurs. Memory allocated for page table entries
> not released during process termination. This issue can be reproduced by
> a small program that allocates a large amount of memory. After several
> runs, you'll see that the amount of free memory has reduced and will
> continue to reduce after each run. All ARC CPUs are effected by this
> issue. The issue was introduced since the kernel stable release v5.15-rc1.
>
> As described in commit d9820ff after switch pgtable_t back to struct
> page *, a pointer to "struct page" and appropriate functions are used to
> allocate and free a memory page for PTEs, but the pmd_pgtable macro hasn't
> changed and returns the direct virtual address from the PMD (PGD) entry.
> Than this address used as a parameter in the __pte_free() and as a result
> this function couldn't release memory page allocated for PTEs.
>
> Fix this issue by changing the pmd_pgtable macro and returning pointer to
> struct page.

Good catch. Curious how did you find it. KMEMCHECK or some such or just oom.

> Fixes: d9820ff76f95 ("ARC: mm: switch pgtable_t back to struct page *")
> Signed-off-by: Pavel Kozlov <pavel.kozlov@synopsys.com>
> Cc: Vineet Gupta <vgupta@kernel.org>
> Cc: Mike Rapoport <rppt@kernel.org>
> Cc: <stable@vger.kernel.org> # 4.15.x

You meant 5.15.x

Added to for-curr.

Thx,
-Vineet

> ---
>   arch/arc/include/asm/pgtable-levels.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arc/include/asm/pgtable-levels.h b/arch/arc/include/asm/pgtable-levels.h
> index 64ca25d199be..ef68758b69f7 100644
> --- a/arch/arc/include/asm/pgtable-levels.h
> +++ b/arch/arc/include/asm/pgtable-levels.h
> @@ -161,7 +161,7 @@
>   #define pmd_pfn(pmd)		((pmd_val(pmd) & PAGE_MASK) >> PAGE_SHIFT)
>   #define pmd_page(pmd)		virt_to_page(pmd_page_vaddr(pmd))
>   #define set_pmd(pmdp, pmd)	(*(pmdp) = pmd)
> -#define pmd_pgtable(pmd)	((pgtable_t) pmd_page_vaddr(pmd))
> +#define pmd_pgtable(pmd)	((pgtable_t) pmd_page(pmd))
>   
>   /*
>    * 4th level paging: pte


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
