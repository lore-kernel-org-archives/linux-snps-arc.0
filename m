Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30DC9C433EF
	for <linux-snps-arc@archiver.kernel.org>; Tue,  1 Mar 2022 00:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=gIAQdJ6Z9kP9ynqdkT+W0Qtpvmz72gpUW5kQ6v7z45k=; b=dzcVIxZbSvPTRPN9HlSY1o5XK5
	wgbF9ESwGtXkwKn6FF0Ntw3ttaHBcLdnRUnCpjN5p5VE41O9b26JeNaiCLaSRp2D5asI8bD6lINCQ
	RAaGZX/fooI99Ym+SE6sjODbHMTDE7T3MRrPLy+93esrXbIvqZJEZeDObVlrU2DfsxG1RW2z0iArC
	7SQxstGVvxRRgOPKoRu49WRnlllyhPZl2AqGi/Lon9Vetsj7sE+Otfnf0y2BXO4G6Rhp9jDDQmXnu
	lACIyHNyG1xJoVS7IuZRhzpHqNCp1XmaPwf6QJ8Ez8JXh8XuQF7OaBNt9Z8hv/3flYo2cS5HPyq2/
	W9mmOVxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOpwv-00ERxp-SV; Tue, 01 Mar 2022 00:01:05 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOpwi-00ERth-8X; Tue, 01 Mar 2022 00:00:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7F9BAD6E;
 Mon, 28 Feb 2022 16:00:50 -0800 (PST)
Received: from [10.163.50.231] (unknown [10.163.50.231])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D52833F66F;
 Mon, 28 Feb 2022 16:00:43 -0800 (PST)
Subject: Re: [PATCH V3 09/30] arm/mm: Enable ARCH_HAS_VM_GET_PAGE_PROT
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org,
 linux-kernel@vger.kernel.org, geert@linux-m68k.org,
 Christoph Hellwig <hch@infradead.org>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, sparclinux@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-s390@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-alpha@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, linux-parisc@vger.kernel.org,
 openrisc@lists.librecores.org, linux-um@lists.infradead.org,
 linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-arch@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
References: <1646045273-9343-1-git-send-email-anshuman.khandual@arm.com>
 <1646045273-9343-10-git-send-email-anshuman.khandual@arm.com>
 <Yhyqjo/4bozJB6j5@shell.armlinux.org.uk>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <542fa048-131e-240b-cc3a-fd4fff7ce4ba@arm.com>
Date: Tue, 1 Mar 2022 05:30:41 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <Yhyqjo/4bozJB6j5@shell.armlinux.org.uk>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_160052_467441_E9D9C047 
X-CRM114-Status: GOOD (  18.92  )
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



On 2/28/22 4:27 PM, Russell King (Oracle) wrote:
> On Mon, Feb 28, 2022 at 04:17:32PM +0530, Anshuman Khandual wrote:
>> This defines and exports a platform specific custom vm_get_page_prot() via
>> subscribing ARCH_HAS_VM_GET_PAGE_PROT. Subsequently all __SXXX and __PXXX
>> macros can be dropped which are no longer needed.
> 
> What I would really like to know is why having to run _code_ to work out
> what the page protections need to be is better than looking it up in a
> table.
> 
> Not only is this more expensive in terms of CPU cycles, it also brings
> additional code size with it.
> 
> I'm struggling to see what the benefit is.
> 

Currently vm_get_page_prot() is also being _run_ to fetch required page
protection values. Although that is being run in the core MM and from a
platform perspective __SXXX, __PXXX are just being exported for a table.
Looking it up in a table (and applying more constructs there after) is
not much different than a clean switch case statement in terms of CPU
usage. So this is not more expensive in terms of CPU cycles.

--------------------------
pgprot_t protection_map[16] __ro_after_init = {
        __P000, __P001, __P010, __P011, __P100, __P101, __P110, __P111,
        __S000, __S001, __S010, __S011, __S100, __S101, __S110, __S111
};

#ifndef CONFIG_ARCH_HAS_FILTER_PGPROT
static inline pgprot_t arch_filter_pgprot(pgprot_t prot)
{
        return prot;
}
#endif

pgprot_t vm_get_page_prot(unsigned long vm_flags)
{
        pgprot_t ret = __pgprot(pgprot_val(protection_map[vm_flags &
                                (VM_READ|VM_WRITE|VM_EXEC|VM_SHARED)]) |
                        pgprot_val(arch_vm_get_page_prot(vm_flags)));

        return arch_filter_pgprot(ret);
}
EXPORT_SYMBOL(vm_get_page_prot)
----------------------------

There will be a single vm_get_page_prot() instance on a given platform
just like before. So this also does not bring any additional code size
with it.

As mentioned earlier on a previous version.

Remove multiple 'core MM <--> platform' abstraction layers to map
vm_flags access permission combination into page protection.

From the cover letter ......

----------
Currently there are multiple layers of abstraction i.e __SXXX/__PXXX macros
, protection_map[], arch_vm_get_page_prot() and arch_filter_pgprot() built
between the platform and generic MM, finally defining vm_get_page_prot().

Hence this series proposes to drop all these abstraction levels and instead
just move the responsibility of defining vm_get_page_prot() to the platform
itself making it clean and simple.
----------

Benefits

1. For platforms using arch_vm_get_page_prot() and/or arch_filter_pgprot()

	- A simplified vm_get_page_prot()
	- Dropped arch_vm_get_page_prot() and arch_filter_pgprot()
	- Dropped __SXXX, __PXXX macros

2. For platforms which just exported __SXXX, __PXXX

	- A simplified vm_get_page_prot()
	- Dropped __SXXX, __PXXX macros

3. For core MM

	- Dropped a complex vm_get_page_prot() with multiple layers
 	  of abstraction i.e __SXXX/__PXXX macros, protection_map[],
	  arch_vm_get_page_prot(), arch_filter_pgprot() etc.

- Anshuman

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
