Return-Path: <SRS0=WOcc=ND=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1579C4320A
	for <linux-snps-arc@archiver.kernel.org>; Thu, 12 Aug 2021 06:18:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3DAC460F91
	for <linux-snps-arc@archiver.kernel.org>; Thu, 12 Aug 2021 06:18:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3DAC460F91
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8YY7eiUkLIAdeJch+JsEnHHArXNyTYoNmrMTmwKjPKc=; b=YU/SfQ3xY9X+Fe
	zvDE61HDixwbhZeX/Ge8QhhvbTPssXgYdxOOmY58B/0Gnd7xJVEAA0D6ilWyi23qqfDkpMr921kZG
	432vBpgcedQNC3faC188pdriemd5nsTkLJzMqYA3jeed06zrZtQ9dZ8aC3ed4MLgQUX2oA2ies2Ds
	IU+MTTqjw+HFxaEY7n171zeyerppK8SyGytG8aE1aStyKpjhuA4kKeTvirKiVgv2n8OwZTX0jEyKJ
	poYitHTy5Orv/J0Fb631lB6UeNDaBPBXZuRrZawDCEmWzmZ+TWZqWlWuKnk8h4dXtHope45ZrBJ9y
	5gD+M5ScMRFQJDQr0EMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mE438-008km8-Lm; Thu, 12 Aug 2021 06:18:42 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mE436-008klm-MP
 for linux-snps-arc@lists.infradead.org; Thu, 12 Aug 2021 06:18:41 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7519560F57;
 Thu, 12 Aug 2021 06:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628749119;
 bh=SruAedw0pxejnRXjingrcJLTyjDFY9+CyOnUc7yNQmI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CFsIWVtNpplZxYYRWthnJL2sIAGAuI8SF/piyN76QRpS8JmdMB0WDhMZZjlzJopzZ
 Q9yjN04o9z4H7ZklEW5PlUTU9A79tm5HZ2lkk4IwkV6+KEonIxkSbThvjw7ZU4OHG/
 C7LlBN+BdaYBJ/uSr6XZFxx3EZb6If5gmsYmVON+GXK3PTqN8wmmgv1ilAtyaI/Ztq
 M7/MTS1P6X1/ftmcwmilgN8LWbawKEoNpKW2Jv2iv/nfA60xKaQj+RiQPQlgCIiCXv
 hEgwVW4rqQOmInP35LWKck+fYFkZ0vgg0BUYjG1DwI5jrBuFpkJmsKa7cniIRqXTMp
 X2e+2Pf60nzHw==
Date: Thu, 12 Aug 2021 09:18:34 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Vineet Gupta <vgupta@kernel.org>
Cc: linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH 09/18] ARC: mm: non-functional code cleanup ahead of 3
 levels
Message-ID: <YRS9OvkgaQxOfkkg@kernel.org>
References: <20210811004258.138075-1-vgupta@kernel.org>
 <20210811004258.138075-10-vgupta@kernel.org>
 <YRPDL90Qr5RLDmnT@kernel.org>
 <7d022d55-c70b-b3ac-4f0b-1faa26c0d4bd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7d022d55-c70b-b3ac-4f0b-1faa26c0d4bd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210811_231840_789950_14A6BC6F 
X-CRM114-Status: GOOD (  16.93  )
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

On Wed, Aug 11, 2021 at 06:37:19PM -0700, Vineet Gupta wrote:
> On 8/11/21 5:31 AM, Mike Rapoport wrote:
> > > +/*
> > > + * For ARC, pgtable_t is not struct page *, but pte_t * (to avoid
> > > + * extraneous page_address() calculations) hence can't use
> > > + * use asm-generic/pgalloc.h which assumes it being struct page *
> > > + */
> > Another reason to leave ARC without asm-generic/pgalloc.h was
> > __get_order_pte() that other arches don't have.
> > So this and pgtable_t aliased to pte_t * seemed to me too much to bother
> > then, but probably it's worth reconsidering with addition of 3rd and 4th
> > levels.
> 
> I agree that savings of not havign page_address() might not be huge. However
> asm-generic/pgalloc.h only has pte allocation routines and all other
> allocation levels come from arch file

asm-generic/pgalloc.h has allocation routines up to PUD.
There is also pgtable_pmd_page_ctor() and pgtable_pmd_page_dtor() called in
the generic versions of PMD allocation, it seems they are not called in ARC
implementation.

So using asm-generic/pgalloc.h would probably save you some THP debugging ;-)

We may even probably accommodate multi-page PTEs in asm-generic/pgalloc.h
with something like

#ifndef __HAVE_ARCH_PTE_GET_ORDER
static inline int __pte_get_order(void)
{
	return 0;
}
#endif

> Also for ARCv2, given the arbitrary address split and ensuing paging levels
> (as well as support for different page sizes) we will need to make sure that
> one page is enough to hold any level's paging using say BUILD_BUG_ON. In
> fact that should also be done for 3rd and 4th levels for sanity.

Right, these sanity checks would be useful, but they may live in one of .c
files in arch/arc/mm.
 
> -Vineet
> 
> 

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
