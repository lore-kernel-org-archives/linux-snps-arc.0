Return-Path: <SRS0=8txo=NI=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A3FDC4338F
	for <linux-snps-arc@archiver.kernel.org>; Tue, 17 Aug 2021 05:03:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D2C160EB5
	for <linux-snps-arc@archiver.kernel.org>; Tue, 17 Aug 2021 05:03:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9D2C160EB5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gGSGPTvMOWaS2XpdeZ1CRnuUG4qqIxbCTUtIwFzvEPY=; b=pGcMFbLFjyVHRz
	QmzkxoSR6gXqSxgH2dezi1dtS07YdR059kYXrOYA6YX25ht0iEQ5gS91yQsd0NUoNn96ZMRLNMAvI
	icjrMYn5B2291zhIyUq5Tfx220d1ufK+eMfEtx1g2kePMx5hUYn0rfc8Nv54bgCwdtNNgt+ZrlKw3
	Cwgd1HMvo3po4ymbeKQpnXdSH4Isci3SgSpHHFUY04YBuzrzM+I8vP+JpEQvk9lXtCnFFG8EwscMB
	eEw2kvus1DHe2ZKXr7DG2pJmp0HtcURn41S+xlN1MoIWwFUvKN+suQI9l2gY8qj5nnUld061FloY1
	EfAJNqm9qIxbG9lmGHXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFrFv-0019Cx-VP; Tue, 17 Aug 2021 05:03:19 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFrFs-0019C4-KN
 for linux-snps-arc@lists.infradead.org; Tue, 17 Aug 2021 05:03:18 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4E43660EB5;
 Tue, 17 Aug 2021 05:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629176596;
 bh=ZdHbkqKhc0WJo6VRir9iZIXmJbNq2k/EpQBReeUoodw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=D6p+2NrezK1PZFineProSDhHK2Mp8ojsGnV0RpW7OwpP1VV7PHtJfIQF3gaoppabR
 ktFjkmB11N4WnFi+fj74pzkJWZEui4Xly9RmFR+FKiLYU6ebRJUBF+jCCZfM5lXiQk
 kw9sCRG2/90ec+SfZnl1yJybh6ytvalkEyOEt4x8CklNPdasimB9fPNuyP19clL9iU
 dT/IakRGF0eeUaA2r0XPt8J+Idz5wus79s5OFC9rZWP0/oHMaf8DRJzbAd4U7bR3Dc
 OxMuWJQhToHTEpf1euqLN+kH7/sY8NlrTW+fkJLGRarg1cJ+TA0qEK++WnnOH9V0xt
 j7pXHGFBHUHBA==
Date: Tue, 17 Aug 2021 08:03:09 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Vineet Gupta <vgupta@kernel.org>
Cc: linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH v2 16/19] ARC: mm: support 3 levels of page tables
Message-ID: <YRtDDZ2PgfGo/eCT@kernel.org>
References: <20210812233753.104217-1-vgupta@kernel.org>
 <20210812233753.104217-17-vgupta@kernel.org>
 <YRjeHE19KXqYWgRp@kernel.org>
 <3878c8da-cba0-d4f5-90a7-f4024054872d@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3878c8da-cba0-d4f5-90a7-f4024054872d@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_220316_747679_3649AE98 
X-CRM114-Status: GOOD (  24.96  )
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

On Mon, Aug 16, 2021 at 12:53:46PM -0700, Vineet Gupta wrote:
> On 8/15/21 2:27 AM, Mike Rapoport wrote:
> > On Thu, Aug 12, 2021 at 04:37:50PM -0700, Vineet Gupta wrote:
> > > ARCv2 MMU is software walked and Linux implements 2 levels of paging: pgd/pte.
> > > Forthcoming hw will have multiple levels, so this change preps mm code
> > > for same. It is also fun to try multi levels even on soft-walked code to
> > > ensure generic mm code is robust to handle.
> > > 
> > > overview
> > > ________
> > > 
> > > 2 levels {pgd, pte} : pmd is folded but pmd_* macros are valid and operate on pgd
> > > 3 levels {pgd, pmd, pte}:
> > >    - pud is folded and pud_* macros point to pgd
> > >    - pmd_* macros operate on actual pmd
> > > 
> > > code changes
> > > ____________
> > > 
> > > 1. #include <asm-generic/pgtable-nopud.h>
> > > 
> > > 2. Define CONFIG_PGTABLE_LEVELS 3
> > > 
> > > 3a. Define PMD_SHIFT, PMD_SIZE, PMD_MASK, pmd_t
> > > 3b. Define pmd_val() which actually deals with pmd
> > >      (pmd_offset(), pmd_index() are provided by generic code)
> > > 3c. pmd_alloc_one()/pmd_free() also provided by generic code
> > >      (pmd_populate/pmd_free already exist)
> > > 
> > > 4. Define pud_none(), pud_bad() macros based on generic pud_val() which
> > >     internally pertains to pgd now.
> > > 4b. define pud_populate() to just setup pgd
> > > 
> > > Signed-off-by: Vineet Gupta <vgupta@kernel.org>
> > > ---
> > ...
> > 
> > > diff --git a/arch/arc/include/asm/pgtable-levels.h b/arch/arc/include/asm/pgtable-levels.h
> > > index 8ece75335bb5..1c2f022d4ad0 100644
> > > --- a/arch/arc/include/asm/pgtable-levels.h
> > > +++ b/arch/arc/include/asm/pgtable-levels.h
> > > @@ -10,6 +10,8 @@
> > >   #ifndef _ASM_ARC_PGTABLE_LEVELS_H
> > >   #define _ASM_ARC_PGTABLE_LEVELS_H
> > > +#if CONFIG_PGTABLE_LEVELS == 2
> > > +
> > >   /*
> > >    * 2 level paging setup for software walked MMUv3 (ARC700) and MMUv4 (HS)
> > >    *
> > > @@ -37,16 +39,38 @@
> > >   #define PGDIR_SHIFT		21
> > >   #endif
> > > -#define PGDIR_SIZE		BIT(PGDIR_SHIFT)	/* vaddr span, not PDG sz */
> > > -#define PGDIR_MASK		(~(PGDIR_SIZE - 1))
> > > +#else
> > Adding /* CONFIG_PGTABLE_LEVELS == 2 */ would make the whole thing a bit
> > more readable, I think.
> 
> You meant
> 
> +#else /* CONFIG_PGTABLE_LEVELS != 2

I don't think we are consistent about it in the kernel, there are places
that just copy the condition in #if and some change it to match the #else.
I don't have a preference, up to you.
 
> > 
> > > +
> > > +/*
> > > + * A default 3 level paging testing setup in software walked MMU
> > > + *   MMUv4 (8K page): <4> : <7> : <8> : <13>
> > > + */
> > > +#define PGDIR_SHIFT		28
> > > +#if CONFIG_PGTABLE_LEVELS > 2
> > > +#define PMD_SHIFT		21
> > > +#endif
> > > +
> > > +#endif
> > and here as well.
> 
> I added following to indicate conditional coding for levels related code
> 
> +#endif /* CONFIG_PGTABLE_LEVELS */
> 
> 
> > > +#define PGDIR_SIZE		BIT(PGDIR_SHIFT)
> > > +#define PGDIR_MASK		(~(PGDIR_SIZE - 1))
> > >   #define PTRS_PER_PGD		BIT(32 - PGDIR_SHIFT)
> > > -#define PTRS_PER_PTE		BIT(PGDIR_SHIFT - PAGE_SHIFT)
> > > +#if CONFIG_PGTABLE_LEVELS > 2
> > > +#define PMD_SIZE		BIT(PMD_SHIFT)
> > > +#define PMD_MASK		(~(PMD_SIZE - 1))
> > > +#define PTRS_PER_PMD		BIT(PGDIR_SHIFT - PMD_SHIFT)
> > > +#endif
> > > +
> > > +#define PTRS_PER_PTE		BIT(PMD_SHIFT - PAGE_SHIFT)
> 

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
