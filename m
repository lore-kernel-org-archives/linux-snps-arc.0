Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16D49C021B0
	for <linux-snps-arc@archiver.kernel.org>; Wed, 19 Feb 2025 11:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9xXkimdmkS9z8P/6/T6XqENm/m7/5Kopnql3Y/bYofo=; b=JmGZtICB9d9s9d
	i8PnUp4I8qOyzEVp02roJ3+syuqIX43XpCNaj++bAryuI7A8YhMlcSWj16GzK0SwvAVjMoSdF0FAG
	jhsmoflukqAZ5I7FUfnTKBUVIVJMyKo+agjA5G0YhOIEnNGZGCjl5h21M8aeuqzmqoAe93ABZK1tN
	omYxHW1GVn5wqHPRnUCnQeNdsNxv20iI1lDcYwDA8OAP0gGib13kupVK39k38XhOETiGcyaaqDdcl
	mb8BRKXxSb0ZEfAvzAQU2jaMtT1e1DY7AbUWqwwly9dPnmiXnfx+4SPSPhstspbmf7OOlkpaDOGZd
	ugsLf3eOGEDMMB1aaJng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkie4-0000000CWza-2U80;
	Wed, 19 Feb 2025 11:53:40 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkicZ-0000000CWa5-39wm;
	Wed, 19 Feb 2025 11:52:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3E51DA41E00;
	Wed, 19 Feb 2025 11:50:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C01EC4CED1;
	Wed, 19 Feb 2025 11:52:03 +0000 (UTC)
Date: Wed, 19 Feb 2025 11:52:01 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-mm@kvack.org, Ryan Roberts <ryan.roberts@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-snps-arc@lists.infradead.org, linux-riscv@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, linux-parisc@vger.kernel.org,
	linux-csky@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-s390@vger.kernel.org, linux-arch@vger.kernel.org,
	loongarch@lists.linux.dev, linux-sh@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/ioremap: Pass pgprot_t to ioremap_prot() instead of
 unsigned long
Message-ID: <Z7XF4Y3FIbSrSP9u@arm.com>
References: <20250218101954.415331-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250218101954.415331-1-anshuman.khandual@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_035207_855034_CD177DD6 
X-CRM114-Status: GOOD (  11.74  )
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

On Tue, Feb 18, 2025 at 03:49:54PM +0530, Anshuman Khandual wrote:
> From: Ryan Roberts <ryan.roberts@arm.com>
> 
> ioremap_prot() currently accepts pgprot_val parameter as an unsigned long,
> thus implicitly assuming that pgprot_val and pgprot_t could never be bigger
> than unsigned long. But this assumption soon will not be true on arm64 when
> using D128 pgtables. In 128 bit page table configuration, unsigned long is
> 64 bit, but pgprot_t is 128 bit.
> 
> Passing platform abstracted pgprot_t argument is better as compared to size
> based data types. Let's change the parameter to directly pass pgprot_t like
> another similar helper generic_ioremap_prot().
> 
> Without this change in place, D128 configuration does not work on arm64 as
> the top 64 bits gets silently stripped when passing the protection value to
> this function.
> 
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-snps-arc@lists.infradead.org
> Cc: linux-riscv@lists.infradead.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-parisc@vger.kernel.org
> Cc: linux-csky@vger.kernel.org
> Cc: linux-mips@vger.kernel.org
> Cc: linux-s390@vger.kernel.org
> Cc: linux-arch@vger.kernel.org
> Cc: loongarch@lists.linux.dev
> Cc: linux-sh@vger.kernel.org
> Cc: linux-mm@kvack.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> Co-developed-by: Anshuman Khandual <anshuman.khandual@arm.com>
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>

For arm64:

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
