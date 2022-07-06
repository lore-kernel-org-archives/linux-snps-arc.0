Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB2C9C43334
	for <linux-snps-arc@archiver.kernel.org>; Wed,  6 Jul 2022 11:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HisMekqK2VWgidnk2ZVfWY7Fy/6pO+HTvBfJ2vNJkYA=; b=lqnyHw0xNDtk6s
	5kuIu3Pesz5creyiAkdmnI46pYv69UDtbU5PryvSVuYProoL3O9uDr3qlEhqjsZ1z6Kfb0DXaF+3f
	wajglnlbWPvaipVVa7ZFXw3HodG9RYbErZPfi8y0CB0eBk4pejf7y1V5p49L6PLHRZacGGDpy84gm
	gdP9QJL/aMGNe104T8bpej60fkxT8tSyaS4G11JTpQkq3hX/Y/AAjrKbM4wVbexinAidpPC9eCPli
	N7ZXhXcfNt3q/ChIjnDKn6cgDY5T97uWYtmYwp5gk/UySsPduCX0bRWr76QE9ZLahLlLyUq8Sjz5m
	574U6TsCMwIhjnlYoYJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o930c-009JVq-IL; Wed, 06 Jul 2022 11:15:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o930P-009JG4-Rx; Wed, 06 Jul 2022 11:15:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CFE831042;
	Wed,  6 Jul 2022 04:15:39 -0700 (PDT)
Received: from [10.163.43.16] (unknown [10.163.43.16])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 60BFD3F66F;
	Wed,  6 Jul 2022 04:15:31 -0700 (PDT)
Message-ID: <ea0f8db8-831b-dcb4-b8c7-ab651f1e1713@arm.com>
Date: Wed, 6 Jul 2022 16:45:27 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH V6 21/26] m68k/mm: Enable ARCH_HAS_VM_GET_PAGE_PROT
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux MM <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>,
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-s390 <linux-s390@vger.kernel.org>,
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Christoph Hellwig <hch@infradead.org>,
 arcml <linux-snps-arc@lists.infradead.org>,
 "open list:TENSILICA XTENSA PORT (xtensa)" <linux-xtensa@linux-xtensa.org>,
 linux-um <linux-um@lists.infradead.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Openrisc <openrisc@lists.librecores.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Parisc List <linux-parisc@vger.kernel.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 alpha <linux-alpha@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
References: <20220630051630.1718927-1-anshuman.khandual@arm.com>
 <20220630051630.1718927-22-anshuman.khandual@arm.com>
 <CAMuHMdX_Ji7dCzzCc3xw5ic6J=0PaPkyzXKpOgUFjjEkR+yJOw@mail.gmail.com>
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <CAMuHMdX_Ji7dCzzCc3xw5ic6J=0PaPkyzXKpOgUFjjEkR+yJOw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220706_041542_085826_B82C0A8C 
X-CRM114-Status: GOOD (  26.35  )
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



On 7/6/22 15:33, Geert Uytterhoeven wrote:
> Hi Anshuman,
> 
> On Thu, Jun 30, 2022 at 7:19 AM Anshuman Khandual
> <anshuman.khandual@arm.com> wrote:
>> This enables ARCH_HAS_VM_GET_PAGE_PROT on the platform and exports standard
>> vm_get_page_prot() implementation via DECLARE_VM_GET_PAGE_PROT, which looks
>> up a private and static protection_map[] array. Subsequently all __SXXX and
>> __PXXX macros can be dropped which are no longer needed.
>>
>> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
>> Cc: linux-m68k@lists.linux-m68k.org
>> Cc: linux-kernel@vger.kernel.org
>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> 
> Thanks for your patch!
> 
>> --- a/arch/m68k/include/asm/mcf_pgtable.h
>> +++ b/arch/m68k/include/asm/mcf_pgtable.h
>> @@ -91,60 +91,6 @@
>>   * for use. In general, the bit positions are xwr, and P-items are
>>   * private, the S-items are shared.
>>   */
> 
> The comment above should be removed, too.

Sure, will do.

> 
>> -#define __P000         PAGE_NONE
>> -#define __P001         __pgprot(CF_PAGE_VALID \
>> -                                | CF_PAGE_ACCESSED \
>> -                                | CF_PAGE_READABLE)
> 
>> --- a/arch/m68k/include/asm/motorola_pgtable.h
>> +++ b/arch/m68k/include/asm/motorola_pgtable.h
>> @@ -83,28 +83,6 @@ extern unsigned long mm_cachebits;
>>  #define PAGE_COPY_C    __pgprot(_PAGE_PRESENT | _PAGE_RONLY | _PAGE_ACCESSED)
>>  #define PAGE_READONLY_C        __pgprot(_PAGE_PRESENT | _PAGE_RONLY | _PAGE_ACCESSED)
> 
> You might move the *_C definitions above into arch/m68k/mm/motorola.c
> as well, as they are only used in the latter.

Okay, will do.

> 
>>
>> -/*
>> - * The m68k can't do page protection for execute, and considers that the same are read.
>> - * Also, write permissions imply read permissions. This is the closest we can get..
>> - */
>> -#define __P000 PAGE_NONE_C
>> -#define __P001 PAGE_READONLY_C
>> -#define __P010 PAGE_COPY_C
>> -#define __P011 PAGE_COPY_C
>> -#define __P100 PAGE_READONLY_C
>> -#define __P101 PAGE_READONLY_C
>> -#define __P110 PAGE_COPY_C
>> -#define __P111 PAGE_COPY_C
>> -
>> -#define __S000 PAGE_NONE_C
>> -#define __S001 PAGE_READONLY_C
>> -#define __S010 PAGE_SHARED_C
>> -#define __S011 PAGE_SHARED_C
>> -#define __S100 PAGE_READONLY_C
>> -#define __S101 PAGE_READONLY_C
>> -#define __S110 PAGE_SHARED_C
>> -#define __S111 PAGE_SHARED_C
>> -
>>  #define pmd_pgtable(pmd) ((pgtable_t)pmd_page_vaddr(pmd))
>>
>>  /*
>> diff --git a/arch/m68k/include/asm/sun3_pgtable.h b/arch/m68k/include/asm/sun3_pgtable.h
>> index 5e4e753f0d24..9d919491765b 100644
>> --- a/arch/m68k/include/asm/sun3_pgtable.h
>> +++ b/arch/m68k/include/asm/sun3_pgtable.h
>> @@ -71,23 +71,6 @@
>>   * protection settings, valid (implying read and execute) and writeable. These
>>   * are as close as we can get...
>>   */
> 
> The comment above should be removed, too.

Sure, will do.

> 
>> -#define __P000 PAGE_NONE
>> -#define __P001 PAGE_READONLY
> 
> With the above fixed:
> Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
> 

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
