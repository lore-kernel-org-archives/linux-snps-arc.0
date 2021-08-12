Return-Path: <SRS0=WOcc=ND=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98DF3C4338F
	for <linux-snps-arc@archiver.kernel.org>; Thu, 12 Aug 2021 18:58:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B59161077
	for <linux-snps-arc@archiver.kernel.org>; Thu, 12 Aug 2021 18:58:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5B59161077
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vU43ThR1mpw/xpUnOhgP/m9r+/XuOAc/cmveXM39y3s=; b=4EDNB9mY1ppDTHqLk8+Vy4WTjB
	Yy/WUSGyFwFYWhgtGe4VY7zF24qqL7WxQB41hiPu9XWnaMt6x51Tc/zFwVPsb2KhGSoFljHn93+ft
	T36mmpDjQ/MlzQytUM8G7PuBsaTTm5gtYb07/uWBOUx/VgQTrOGY9zlc8G7PxHMNCj0bCqvDyRP6+
	ODMhBJls2EvwzXOvDYwIj8QsI7URq9RxHZbcuXaP5q/qS+eBlpLsmj2GoUw5bZ43rCBXjMP8tkDWX
	1RJJpdc+d27YP+GU2H7Uj3G39g524bPKxILXDaHM9zme52aDF4VMHNh9dUGhW57DdGRosIbSeonWe
	vl0ETrDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEFu3-00AwYr-NG; Thu, 12 Aug 2021 18:58:07 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEFu0-00AwXf-Q6
 for linux-snps-arc@lists.infradead.org; Thu, 12 Aug 2021 18:58:06 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 236EC61077;
 Thu, 12 Aug 2021 18:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628794684;
 bh=qInDITMHlKZExB3w3owcOP9e470UVRLbvU7avF4jbl8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=O8jhfdOWyyaLym8+6X2BZWzwaLe2fLqCOanrK2udvM8aquWfSiWF1pjewgQzxDAPL
 vQismJEz4AhBVaavdyc5nXhmSUoeJfpekbERnI61osLXV8kY4L9ym+/mgI5b7/jkuJ
 2KlU82IYMPi4qgxp8llZFr6q9/qFdcnKKh09kwBSd2V1RhICi+JJjRjBq+bKH2o+DG
 YRlMFtLaQgn3zV+0Y1oV+DbP32ss8RBc4BGYfyaNkDs0WeyBP0bm7KP6eU3vrByPCh
 eOEhufPXNMcVr6FWJgSU4yrw/LI0TiX3IUHAMubZ3cnQTn6m20bZGDZhhdrk9aTApN
 aUW9tGPMQ+Gdg==
Subject: Re: [PATCH 09/18] ARC: mm: non-functional code cleanup ahead of 3
 levels
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Anshuman Khandual <anshuman.khandual@arm.com>
References: <20210811004258.138075-1-vgupta@kernel.org>
 <20210811004258.138075-10-vgupta@kernel.org> <YRPDL90Qr5RLDmnT@kernel.org>
 <7d022d55-c70b-b3ac-4f0b-1faa26c0d4bd@kernel.org>
 <YRS9OvkgaQxOfkkg@kernel.org>
From: Vineet Gupta <vgupta@kernel.org>
Message-ID: <f77ac5df-c92c-321a-7624-35520b386f6f@kernel.org>
Date: Thu, 12 Aug 2021 11:58:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YRS9OvkgaQxOfkkg@kernel.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210812_115804_924007_19E72005 
X-CRM114-Status: GOOD (  18.60  )
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

On 8/11/21 11:18 PM, Mike Rapoport wrote:
> On Wed, Aug 11, 2021 at 06:37:19PM -0700, Vineet Gupta wrote:
>> On 8/11/21 5:31 AM, Mike Rapoport wrote:
>>>> +/*
>>>> + * For ARC, pgtable_t is not struct page *, but pte_t * (to avoid
>>>> + * extraneous page_address() calculations) hence can't use
>>>> + * use asm-generic/pgalloc.h which assumes it being struct page *
>>>> + */
>>> Another reason to leave ARC without asm-generic/pgalloc.h was
>>> __get_order_pte() that other arches don't have.
>>> So this and pgtable_t aliased to pte_t * seemed to me too much to bother
>>> then, but probably it's worth reconsidering with addition of 3rd and 4th
>>> levels.
>> I agree that savings of not havign page_address() might not be huge. However
>> asm-generic/pgalloc.h only has pte allocation routines and all other
>> allocation levels come from arch file
> asm-generic/pgalloc.h has allocation routines up to PUD.
> There is also pgtable_pmd_page_ctor() and pgtable_pmd_page_dtor() called in
> the generic versions of PMD allocation, it seems they are not called in ARC
> implementation.

:-(

> So using asm-generic/pgalloc.h would probably save you some THP debugging ;-)
>
> We may even probably accommodate multi-page PTEs in asm-generic/pgalloc.h
> with something like
>
> #ifndef __HAVE_ARCH_PTE_GET_ORDER
> static inline int __pte_get_order(void)
> {
> 	return 0;
> }
> #endif

Not needed - those cases are unreal, esoteric at best. I'm working on 
switching back to canonical struct page based pgtable_t, will do that in v2.

>> Also for ARCv2, given the arbitrary address split and ensuing paging levels
>> (as well as support for different page sizes) we will need to make sure that
>> one page is enough to hold any level's paging using say BUILD_BUG_ON. In
>> fact that should also be done for 3rd and 4th levels for sanity.
> Right, these sanity checks would be useful, but they may live in one of .c
> files in arch/arc/mm.

Sure !

Thx,
-Vineet

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
