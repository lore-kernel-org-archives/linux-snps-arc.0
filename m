Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8153ACCA47B
	for <linux-snps-arc@archiver.kernel.org>; Tue, 28 Jun 2022 03:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5jbWrodiIWhYYVd0WUlKyms1AJhD/haNQo27jtFtiPE=; b=Cdd3ODVqaXQTZU
	hFmhjWlObnGwY40QJZwAzGrlVhh/qVzcO5cgqchI+flGqWbnjEC87MUyc75vwhIYpVrJnrOCWeQVE
	R0tOf/v+vtrH85lK0ntR1DO+Hd/1BS38ynFF2h16v1Ud2gnqKL1PF4fvrNl6DS6Ddtmt8PbmdIZEN
	guWvuGU5x5ktXa9Y/KP+cl5WjmR3UTp7mvX9iU6k05qjYreVhfUPS7AUq3WxEDl7HR323GWYlLkrw
	2ErReq+WGMyOgFJbbnINQc4oLgNtKKN7Yl2qnynLhWKntzim8SFXJbTDDJJ9ljQOvdYA9490ckK68
	5mwCWe/Mwm5cSK9uJWLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o61ek-003yF9-L8; Tue, 28 Jun 2022 03:12:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o61eX-003yCU-Py; Tue, 28 Jun 2022 03:12:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 71983150C;
	Mon, 27 Jun 2022 20:12:34 -0700 (PDT)
Received: from [10.162.42.7] (unknown [10.162.42.7])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0D7AC3F792;
	Mon, 27 Jun 2022 20:12:26 -0700 (PDT)
Message-ID: <f26804cf-e342-5826-8f01-4b087a7baa63@arm.com>
Date: Tue, 28 Jun 2022 08:42:24 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH V5 04/26] sparc/mm: Move protection_map[] inside the
 platform
Content-Language: en-US
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-mm@kvack.org, hch@infradead.org, christophe.leroy@csgroup.eu,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, x86@kernel.org, openrisc@lists.librecores.org,
 linux-xtensa@linux-xtensa.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-um@lists.infradead.org, linux-sh@vger.kernel.org,
 linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
References: <20220627045833.1590055-1-anshuman.khandual@arm.com>
 <20220627045833.1590055-5-anshuman.khandual@arm.com>
 <YrnlkLbyYSbI0EQw@ravnborg.org>
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <YrnlkLbyYSbI0EQw@ravnborg.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_201237_992364_16022BE7 
X-CRM114-Status: GOOD (  17.08  )
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



On 6/27/22 22:44, Sam Ravnborg wrote:
> Hi Anshuman,
> 
> On Mon, Jun 27, 2022 at 10:28:11AM +0530, Anshuman Khandual wrote:
>> This moves protection_map[] inside the platform and while here, also enable
>> ARCH_HAS_VM_GET_PAGE_PROT on 32 bit platforms via DECLARE_VM_GET_PAGE_PROT.
>>
>> Cc: "David S. Miller" <davem@davemloft.net>
>> Cc: sparclinux@vger.kernel.org
>> Cc: linux-kernel@vger.kernel.org
>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
>> ---
>>  arch/sparc/Kconfig                  |  2 +-
>>  arch/sparc/include/asm/pgtable_32.h | 19 -------------------
>>  arch/sparc/include/asm/pgtable_64.h | 19 -------------------
>>  arch/sparc/mm/init_32.c             | 20 ++++++++++++++++++++
>>  arch/sparc/mm/init_64.c             |  3 +++
>>  5 files changed, 24 insertions(+), 39 deletions(-)
>>
>> diff --git a/arch/sparc/Kconfig b/arch/sparc/Kconfig
>> index ba449c47effd..09f868613a4d 100644
>> --- a/arch/sparc/Kconfig
>> +++ b/arch/sparc/Kconfig
>> @@ -13,6 +13,7 @@ config 64BIT
>>  config SPARC
>>  	bool
>>  	default y
>> +	select ARCH_HAS_VM_GET_PAGE_PROT
>>  	select ARCH_MIGHT_HAVE_PC_PARPORT if SPARC64 && PCI
>>  	select ARCH_MIGHT_HAVE_PC_SERIO
>>  	select DMA_OPS
>> @@ -84,7 +85,6 @@ config SPARC64
>>  	select PERF_USE_VMALLOC
>>  	select ARCH_HAVE_NMI_SAFE_CMPXCHG
>>  	select HAVE_C_RECORDMCOUNT
>> -	select ARCH_HAS_VM_GET_PAGE_PROT
>>  	select HAVE_ARCH_AUDITSYSCALL
>>  	select ARCH_SUPPORTS_ATOMIC_RMW
>>  	select ARCH_SUPPORTS_DEBUG_PAGEALLOC
>> diff --git a/arch/sparc/include/asm/pgtable_32.h b/arch/sparc/include/asm/pgtable_32.h
>> index 4866625da314..8ff549004fac 100644
>> --- a/arch/sparc/include/asm/pgtable_32.h
>> +++ b/arch/sparc/include/asm/pgtable_32.h
>> @@ -64,25 +64,6 @@ void paging_init(void);
>>  
>>  extern unsigned long ptr_in_current_pgd;
>>  
>> -/*         xwr */
>> -#define __P000  PAGE_NONE
>> -#define __P001  PAGE_READONLY
>> -#define __P010  PAGE_COPY
>> -#define __P011  PAGE_COPY
>> -#define __P100  PAGE_READONLY
>> -#define __P101  PAGE_READONLY
>> -#define __P110  PAGE_COPY
>> -#define __P111  PAGE_COPY
>> -
>> -#define __S000	PAGE_NONE
>> -#define __S001	PAGE_READONLY
>> -#define __S010	PAGE_SHARED
>> -#define __S011	PAGE_SHARED
>> -#define __S100	PAGE_READONLY
>> -#define __S101	PAGE_READONLY
>> -#define __S110	PAGE_SHARED
>> -#define __S111	PAGE_SHARED
>> -
>>  /* First physical page can be anywhere, the following is needed so that
>>   * va-->pa and vice versa conversions work properly without performance
>>   * hit for all __pa()/__va() operations.
>> diff --git a/arch/sparc/include/asm/pgtable_64.h b/arch/sparc/include/asm/pgtable_64.h
>> index 4679e45c8348..a779418ceba9 100644
>> --- a/arch/sparc/include/asm/pgtable_64.h
>> +++ b/arch/sparc/include/asm/pgtable_64.h
>> @@ -187,25 +187,6 @@ bool kern_addr_valid(unsigned long addr);
>>  #define _PAGE_SZHUGE_4U	_PAGE_SZ4MB_4U
>>  #define _PAGE_SZHUGE_4V	_PAGE_SZ4MB_4V
>>  
>> -/* These are actually filled in at boot time by sun4{u,v}_pgprot_init() */
>> -#define __P000	__pgprot(0)
>> -#define __P001	__pgprot(0)
>> -#define __P010	__pgprot(0)
>> -#define __P011	__pgprot(0)
>> -#define __P100	__pgprot(0)
>> -#define __P101	__pgprot(0)
>> -#define __P110	__pgprot(0)
>> -#define __P111	__pgprot(0)
>> -
>> -#define __S000	__pgprot(0)
>> -#define __S001	__pgprot(0)
>> -#define __S010	__pgprot(0)
>> -#define __S011	__pgprot(0)
>> -#define __S100	__pgprot(0)
>> -#define __S101	__pgprot(0)
>> -#define __S110	__pgprot(0)
>> -#define __S111	__pgprot(0)
>> -
>>  #ifndef __ASSEMBLY__
>>  
>>  pte_t mk_pte_io(unsigned long, pgprot_t, int, unsigned long);
>> diff --git a/arch/sparc/mm/init_32.c b/arch/sparc/mm/init_32.c
>> index 1e9f577f084d..8693e4e28b86 100644
>> --- a/arch/sparc/mm/init_32.c
>> +++ b/arch/sparc/mm/init_32.c
>> @@ -302,3 +302,23 @@ void sparc_flush_page_to_ram(struct page *page)
>>  		__flush_page_to_ram(vaddr);
>>  }
>>  EXPORT_SYMBOL(sparc_flush_page_to_ram);
>> +
>> +static pgprot_t protection_map[16] __ro_after_init = {
> This can be const - like done for powerpc and others.
> sparc32 and sparc64 uses each their own - and I do not see sparc32 do
> any modifications to protection_map.

Indeed protection_map[] arrays are independent both for sparc32 and spacr64.
sparc32 platform never changes the protection_map[] array during boot. Sure,
will make it into a const instead. Thanks for pointing this out.

> 
> With this change:
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> 

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
