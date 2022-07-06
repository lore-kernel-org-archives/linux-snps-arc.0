Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABAAECCA473
	for <linux-snps-arc@archiver.kernel.org>; Wed,  6 Jul 2022 05:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oWHQK2VnByAFJUZ56fBHVaQumichIY+bGN0xovx9xnQ=; b=kk4NNlHG10pPO9
	cLyuV+XxLSMqTZujFy2SwHwyhPYcfZaDqQUo8HGM8mahsLzntbU37E2TrnxN9D6jW1G73C1qI74KW
	+QyBdakK7kwojv1sbyT9haDlrQ/xfxHlOSDScSodsToh5MILPFw1dsQo9jzid0jR84WbuUuJ3xzqJ
	YQxHsS6oQ1pBloAmpiWIXY0bh68bwTHbgha0+oipSIAPukjC2WXFO16XzYzAaAck4/L5CRuYHNPwv
	LUi8Ly0CJpGvLow25PudSQJm7XNLhiQz75GdvUr/nvGC5ntZM3awNPHLaYX1cnpSlC+RIF8PRvGPu
	Hd8ku58lXyclKzlvpTQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8y3O-006QvO-9E; Wed, 06 Jul 2022 05:58:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8y3A-006Qd9-Ve; Wed, 06 Jul 2022 05:58:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EBF5A1570;
	Tue,  5 Jul 2022 22:58:09 -0700 (PDT)
Received: from [10.163.43.16] (unknown [10.163.43.16])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3C01D3F70D;
	Tue,  5 Jul 2022 22:58:01 -0700 (PDT)
Message-ID: <8a6ccbae-7d7c-6e08-cc28-eeb649f86112@arm.com>
Date: Wed, 6 Jul 2022 11:27:59 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH V6 00/26] mm/mmap: Drop __SXXX/__PXXX macros from across
 platforms
Content-Language: en-US
To: linux-mm@kvack.org, akpm@linux-foundation.org
Cc: hch@infradead.org, christophe.leroy@csgroup.eu,
 linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org, x86@kernel.org,
 openrisc@lists.librecores.org, linux-xtensa@linux-xtensa.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-snps-arc@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-um@lists.infradead.org,
 linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220630051630.1718927-1-anshuman.khandual@arm.com>
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20220630051630.1718927-1-anshuman.khandual@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_225813_161910_717ABC60 
X-CRM114-Status: GOOD (  17.96  )
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



On 6/30/22 10:46, Anshuman Khandual wrote:
> __SXXX/__PXXX macros is an unnecessary abstraction layer in creating the
> generic protection_map[] array which is used for vm_get_page_prot(). This
> abstraction layer can be avoided, if the platforms just define the array
> protection_map[] for all possible vm_flags access permission combinations
> and also export vm_get_page_prot() implementation.
> 
> This series drops __SXXX/__PXXX macros from across platforms in the tree.
> First it build protects generic protection_map[] array with '#ifdef __P000'
> and moves it inside platforms which enable ARCH_HAS_VM_GET_PAGE_PROT. Later
> this build protects same array with '#ifdef ARCH_HAS_VM_GET_PAGE_PROT' and
> moves inside remaining platforms while enabling ARCH_HAS_VM_GET_PAGE_PROT.
> This adds a new macro DECLARE_VM_GET_PAGE_PROT defining the current generic
> vm_get_page_prot(), in order for it to be reused on platforms that do not
> require custom implementation. Finally, ARCH_HAS_VM_GET_PAGE_PROT can just
> be dropped, as all platforms now define and export vm_get_page_prot(), via
> looking up a private and static protection_map[] array. protection_map[]
> data type has been changed as 'static const' on all platforms that do not
> change it during boot.
> 
> This series applies on v5.19-rc4 and has been build tested for multiple
> platforms. While here it has dropped off all previous tags from folks after
> the current restructuring. Series common CC list has been expanded to cover
> all impacted platforms for wider reach.
> 
> - Anshuman
> 
> Changes in V6:
> 
> - Converted protection_map[] array as 'static const' on sparc32 platform
> - Rebased on v5.19-rc4
> - Collected tags

There are two linux-next based build fixes for this series (listed below), when
vm_get_page_prot() gets redefined with !CONFIG_MMU. Platform vm_get_page_prot()
is required only with CONFIG_MMU enabled, otherwise there is a generic fallback
stub in include/linux/mm.h

https://lore.kernel.org/all/20220705221411.3381797-1-jcmvbkbc@gmail.com/	[xtensa]
https://lore.kernel.org/all/20220706054002.1936820-1-anshuman.khandual@arm.com/ [sh]

It does not seem CONFIG_MMU can be disabled on other platforms thus exposing a build
failure. But just to be on the safer side, should all vm_get_page_prot() be wrapped
around with #ifdef CONFIG_MMU ? In that case will resend the series with above build
fixes folded back in as well. Please do suggest. Thank you.

- Anshuman

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
