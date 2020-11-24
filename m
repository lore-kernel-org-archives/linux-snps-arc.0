Return-Path: <SRS0=6yCX=E6=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA924C2D0E4
	for <linux-snps-arc@archiver.kernel.org>; Tue, 24 Nov 2020 00:26:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 071FA20729
	for <linux-snps-arc@archiver.kernel.org>; Tue, 24 Nov 2020 00:26:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yEL54Hfa";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oc54z6HI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 071FA20729
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	To:Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=soi3ZB2JscCEl/EnYZ9VWSgJ3UFmO/3XAMUh/keCMxY=; b=yEL54Hfa/vEWd4KD6085o9WiE
	/FScSquZ+l+H2W5R/OTnIOQ51aOKvICZdAx2nzxADNgKXdMEc8hto3elbkJ8LICfVPgMSVcphMh/C
	tnXHJgheMf03JD58oMmXevQKLtpPGOqU6doourhXwKZ3HGpVN6KZkgLUFflKu1MZM/X64UjKY51Sh
	bATLTNCMngIpKCvupo4KlLYmdL0tYuoMdsAVkaOPHksTiwbroWcmRv7O4m008R1YV54KIzo0aRxVw
	oPcFnKAFAQni6aYEueYN9vkF+2T8l+TvvcUK7ulIz3okRkQcX5/4dJ+1JczgWxDb+EhYhvkoMliOm
	FGiAvf7mA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khMAE-0002Xn-Ow; Tue, 24 Nov 2020 00:26:34 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khMAB-0002Ww-Je; Tue, 24 Nov 2020 00:26:33 +0000
Received: by mail-pl1-x644.google.com with SMTP id p6so7357586plr.7;
 Mon, 23 Nov 2020 16:26:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:subject:to:cc:newsgroups:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Nt3WL/sMZDFdQ0jAbOhXhrOfUwobfRhA4oYHScZyEuA=;
 b=Oc54z6HIkJQlFjkPTcr65cfgUp+grLzgjNRN4/CJ1+XKQWLG5D12r7elXf4hS19Uap
 7S6Kbe4/Xau6BCwvExNeAoQ4jm1ZA49Ex76lhFBxxcLfCGTAyxqnZb6LJKtir5hanryj
 W/novpTZ0kcl/7Lt3HhjbZQvL8hLnEMnJOKsGrNGGY5YxLoedCtMLiZFiKAIknj1sIGa
 KrPYNf3D2q1jAzZACjf2b36x7EpsJwo6CLbMoQdRfFu0GzXwP7nwF6a8+bLz0HHwzQMu
 tmwVtWgApsX8Jo00b+rsMZLa52Kfxozy1t4hV/QAvfnJtcI0Bn+XqCeK4LODz51vbCko
 EE6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:subject:to:cc:newsgroups:references
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Nt3WL/sMZDFdQ0jAbOhXhrOfUwobfRhA4oYHScZyEuA=;
 b=AE5inZUxP26IP3Rx5Ns5EQ+ANNBVv2pQputtTNOFZc/IVn41tU76+FU5ux9tq/SFCo
 sUhOSpk86cRTTzMdTxlLMpLDij/XOqMPVePiybJBpbbUTM0l+v3gCQxQOjovIl0Ne4WC
 JSF3Q2xLig84LBBl/5NlNQZQGhdXcNkRcEvWhzY57vNGs9if8ODQfLRLeoKuyIgsIjG5
 qMRH5eUhbwUeaHKnesHaxjL+ZQ2Q64lfuPwNYujXFouRtbHvNsOgPvInF+25nm0kghqp
 A09xElEBB+Zn+IPFCtw8JvvHJjnB1z8DAlORS+vyQFh27lC1kNzQfOrL/rrNxjv0pO23
 Mrzw==
X-Gm-Message-State: AOAM5315h9VHhJtoiJ0SHuIbcCrYGQ6Uz4qhfKsJgPWy1zvMEkL0/lCR
 fzLhvi2gjnoaSKoNUR3YjLna1gAyL5pFiSj4
X-Google-Smtp-Source: ABdhPJxCEhCjGIy2PVAc5Q4JGQ5FebvcnHmsaAsAUqP8ddjKTbGi1i1Ua+KLRC8mYp1dd9Lt347RqA==
X-Received: by 2002:a17:902:778e:b029:d8:d024:a9a with SMTP id
 o14-20020a170902778eb02900d8d0240a9amr1721810pll.12.1606177584778; 
 Mon, 23 Nov 2020 16:26:24 -0800 (PST)
Received: from [192.168.50.50] (c-24-4-73-83.hsd1.ca.comcast.net. [24.4.73.83])
 by smtp.gmail.com with ESMTPSA id ha21sm529493pjb.2.2020.11.23.16.26.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Nov 2020 16:26:24 -0800 (PST)
From: Vineet Gupta <vgupta@synopsys.com>
Subject: Re: [PATCH v2 10/13] arc: use FLATMEM with freeing of unused memory
 map instead of DISCONTIGMEM
To: Mike Rapoport <rppt@kernel.org>
Newsgroups: gmane.linux.ports.ia64, gmane.linux.ports.alpha,
 gmane.linux.ports.arm.kernel, gmane.linux.documentation,
 gmane.linux.file-systems, gmane.linux.kernel, gmane.linux.kernel.mm
References: <20201101170454.9567-1-rppt@kernel.org>
 <20201101170454.9567-11-rppt@kernel.org>
 <3a1ef201-611b-3eb0-1a8a-4fcb05634b85@synopsys.com>
 <20201117065708.GD370813@kernel.org>
X-Mozilla-News-Host: news://news.gmane.io
Message-ID: <dfbbfa6c-15ea-bc64-d163-5c96c1df43a3@synopsys.com>
Date: Mon, 23 Nov 2020 16:26:20 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201117065708.GD370813@kernel.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201123_192631_692239_F71DDBC7 
X-CRM114-Status: GOOD (  28.32  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Cc: Michael Schmitz <schmitzmic@gmail.com>, Tony Luck <tony.luck@intel.com>,
 arcml <linux-snps-arc@lists.infradead.org>, Jonathan Corbet <corbet@lwn.net>,
 Catalin Marinas <catalin.marinas@arm.com>, Meelis Roos <mroos@linux.ee>,
 "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 Russell King <linux@armlinux.org.uk>, Greg Ungerer <gerg@linux-m68k.org>,
 Matt Turner <mattst88@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Will Deacon <will@kernel.org>,
 Alexey Dobriyan <adobriyan@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 11/16/20 10:57 PM, Mike Rapoport wrote:
> On Tue, Nov 17, 2020 at 06:40:16AM +0000, Vineet Gupta wrote:
>> Hi Mike,
>>
>> On 11/1/20 9:04 AM, Mike Rapoport wrote:
>>> From: Mike Rapoport <rppt@linux.ibm.com>
>>>
>>> Currently ARC uses DISCONTIGMEM to cope with sparse physical memory address
>>> space on systems with 2 memory banks. While DISCONTIGMEM avoids wasting
>>> memory on unpopulated memory map, it adds both memory and CPU overhead
>>> relatively to FLATMEM. Moreover, DISCONTINGMEM is generally considered
>>> deprecated.
>>>
>>> The obvious replacement for DISCONTIGMEM would be SPARSEMEM, but it is also
>>> less efficient than FLATMEM in pfn_to_page() and page_to_pfn() conversions.
>>> Besides it requires tuning of SECTION_SIZE which is not trivial for
>>> possible ARC memory configuration.
>>>
>>> Since the memory map for both banks is always allocated from the "lowmem"
>>> bank, it is possible to use FLATMEM for two-bank configuration and simply
>>> free the unused hole in the memory map. All is required for that is to
>>> provide ARC-specific pfn_valid() that will take into account actual
>>> physical memory configuration and define HAVE_ARCH_PFN_VALID.
>>>
>>> The resulting kernel image configured with defconfig + HIGHMEM=y is
>>> smaller:
>>>
>>> $ size a/vmlinux b/vmlinux
>>>      text    data     bss     dec     hex filename
>>> 4673503 1245456  279756 6198715  5e95bb a/vmlinux
>>> 4658706 1246864  279756 6185326  5e616e b/vmlinux
>>>
>>> $ ./scripts/bloat-o-meter a/vmlinux b/vmlinux
>>> add/remove: 28/30 grow/shrink: 42/399 up/down: 10986/-29025 (-18039)
>>> ...
>>> Total: Before=4709315, After=4691276, chg -0.38%
>>>
>>> Booting nSIM with haps_ns.dts results in the following memory usage
>>> reports:
>>>
>>> a:
>>> Memory: 1559104K/1572864K available (3531K kernel code, 595K rwdata, 752K rodata, 136K init, 275K bss, 13760K reserved, 0K cma-reserved, 1048576K highmem)
>>>
>>> b:
>>> Memory: 1559112K/1572864K available (3519K kernel code, 594K rwdata, 752K rodata, 136K init, 280K bss, 13752K reserved, 0K cma-reserved, 1048576K highmem)
>>>
>>> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>

To avoid any surprises later, I tested that highmem was actually working 
on real hardware (HSDK-4xD dev platform) with modified hsdk.dts to 
enable 2 GB of memory.

        reg = <0x0 0x80000000 0x0 0x40000000    /* 1 GB low mem */
-         0x1 0x00000000 0x0 0x40000000>;  /* 1 GB highmem PAE */
+         0x0 0x00000000 0x0 0x40000000>;  /* 1 GB highmem low phy mem*/
         };

A simple malloc+memset program can allocate upto 1.98 GB of memory.

# cat /proc/meminfo | grep Mem
MemTotal:        2077984 kB
MemFree:         2047512 kB
MemAvailable:    2005712 kB

# /oom 1000 &
# malloc 1000 MB
# Done memset, sleeping for 20 secs

# cat /proc/meminfo | grep Mem
MemTotal:        2077984 kB
MemFree:         1163888 kB
MemAvailable:    1122088 kB

# /oom 980 &
# malloc 980 MB
# Done memset, sleeping for 20 secs

# cat /proc/meminfo | grep Mem
MemTotal:        2077984 kB
MemFree:          239096 kB
MemAvailable:     197296 kB

# Done free.
Done free.

So this is all hunky-dory. Thanks for working on this Mike and improving 
things.

Acked-by: Vineet Gupta <vgupta@synopsys.com>

-Vineet

>>
>> Sorry this fell through the cracks. Do you have a branch I can checkout
>> and do a quick test.
> 
> It's in mmotm and in my tree:
> https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git memory-models/rm-discontig/v0
> 
>> Thx,
>> -Vineet
>>
>>> ---
>>>    arch/arc/Kconfig            |  3 ++-
>>>    arch/arc/include/asm/page.h | 20 +++++++++++++++++---
>>>    arch/arc/mm/init.c          | 29 ++++++++++++++++++++++-------
>>>    3 files changed, 41 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
>>> index 0a89cc9def65..c874f8ab0341 100644
>>> --- a/arch/arc/Kconfig
>>> +++ b/arch/arc/Kconfig
>>> @@ -67,6 +67,7 @@ config GENERIC_CSUM
>>>    
>>>    config ARCH_DISCONTIGMEM_ENABLE
>>>    	def_bool n
>>> +	depends on BROKEN
>>>    
>>>    config ARCH_FLATMEM_ENABLE
>>>    	def_bool y
>>> @@ -506,7 +507,7 @@ config LINUX_RAM_BASE
>>>    
>>>    config HIGHMEM
>>>    	bool "High Memory Support"
>>> -	select ARCH_DISCONTIGMEM_ENABLE
>>> +	select HAVE_ARCH_PFN_VALID
>>>    	help
>>>    	  With ARC 2G:2G address split, only upper 2G is directly addressable by
>>>    	  kernel. Enable this to potentially allow access to rest of 2G and PAE
>>> diff --git a/arch/arc/include/asm/page.h b/arch/arc/include/asm/page.h
>>> index b0dfed0f12be..23e41e890eda 100644
>>> --- a/arch/arc/include/asm/page.h
>>> +++ b/arch/arc/include/asm/page.h
>>> @@ -82,11 +82,25 @@ typedef pte_t * pgtable_t;
>>>     */
>>>    #define virt_to_pfn(kaddr)	(__pa(kaddr) >> PAGE_SHIFT)
>>>    
>>> -#define ARCH_PFN_OFFSET		virt_to_pfn(CONFIG_LINUX_RAM_BASE)
>>> +/*
>>> + * When HIGHMEM is enabled we have holes in the memory map so we need
>>> + * pfn_valid() that takes into account the actual extents of the physical
>>> + * memory
>>> + */
>>> +#ifdef CONFIG_HIGHMEM
>>> +
>>> +extern unsigned long arch_pfn_offset;
>>> +#define ARCH_PFN_OFFSET		arch_pfn_offset
>>> +
>>> +extern int pfn_valid(unsigned long pfn);
>>> +#define pfn_valid		pfn_valid
>>>    
>>> -#ifdef CONFIG_FLATMEM
>>> +#else /* CONFIG_HIGHMEM */
>>> +
>>> +#define ARCH_PFN_OFFSET		virt_to_pfn(CONFIG_LINUX_RAM_BASE)
>>>    #define pfn_valid(pfn)		(((pfn) - ARCH_PFN_OFFSET) < max_mapnr)
>>> -#endif
>>> +
>>> +#endif /* CONFIG_HIGHMEM */
>>>    
>>>    /*
>>>     * __pa, __va, virt_to_page (ALERT: deprecated, don't use them)
>>> diff --git a/arch/arc/mm/init.c b/arch/arc/mm/init.c
>>> index 3a35b82a718e..ce07e697916c 100644
>>> --- a/arch/arc/mm/init.c
>>> +++ b/arch/arc/mm/init.c
>>> @@ -28,6 +28,8 @@ static unsigned long low_mem_sz;
>>>    static unsigned long min_high_pfn, max_high_pfn;
>>>    static phys_addr_t high_mem_start;
>>>    static phys_addr_t high_mem_sz;
>>> +unsigned long arch_pfn_offset;
>>> +EXPORT_SYMBOL(arch_pfn_offset);
>>>    #endif
>>>    
>>>    #ifdef CONFIG_DISCONTIGMEM
>>> @@ -98,16 +100,11 @@ void __init setup_arch_memory(void)
>>>    	init_mm.brk = (unsigned long)_end;
>>>    
>>>    	/* first page of system - kernel .vector starts here */
>>> -	min_low_pfn = ARCH_PFN_OFFSET;
>>> +	min_low_pfn = virt_to_pfn(CONFIG_LINUX_RAM_BASE);
>>>    
>>>    	/* Last usable page of low mem */
>>>    	max_low_pfn = max_pfn = PFN_DOWN(low_mem_start + low_mem_sz);
>>>    
>>> -#ifdef CONFIG_FLATMEM
>>> -	/* pfn_valid() uses this */
>>> -	max_mapnr = max_low_pfn - min_low_pfn;
>>> -#endif
>>> -
>>>    	/*------------- bootmem allocator setup -----------------------*/
>>>    
>>>    	/*
>>> @@ -153,7 +150,9 @@ void __init setup_arch_memory(void)
>>>    	 * DISCONTIGMEM in turns requires multiple nodes. node 0 above is
>>>    	 * populated with normal memory zone while node 1 only has highmem
>>>    	 */
>>> +#ifdef CONFIG_DISCONTIGMEM
>>>    	node_set_online(1);
>>> +#endif
>>>    
>>>    	min_high_pfn = PFN_DOWN(high_mem_start);
>>>    	max_high_pfn = PFN_DOWN(high_mem_start + high_mem_sz);
>>> @@ -161,8 +160,15 @@ void __init setup_arch_memory(void)
>>>    	max_zone_pfn[ZONE_HIGHMEM] = min_low_pfn;
>>>    
>>>    	high_memory = (void *)(min_high_pfn << PAGE_SHIFT);
>>> +
>>> +	arch_pfn_offset = min(min_low_pfn, min_high_pfn);
>>>    	kmap_init();
>>> -#endif
>>> +
>>> +#else /* CONFIG_HIGHMEM */
>>> +	/* pfn_valid() uses this when FLATMEM=y and HIGHMEM=n */
>>> +	max_mapnr = max_low_pfn - min_low_pfn;
>>> +
>>> +#endif /* CONFIG_HIGHMEM */
>>>    
>>>    	free_area_init(max_zone_pfn);
>>>    }
>>> @@ -190,3 +196,12 @@ void __init mem_init(void)
>>>    	highmem_init();
>>>    	mem_init_print_info(NULL);
>>>    }
>>> +
>>> +#ifdef CONFIG_HIGHMEM
>>> +int pfn_valid(unsigned long pfn)
>>> +{
>>> +	return (pfn >= min_high_pfn && pfn <= max_high_pfn) ||
>>> +		(pfn >= min_low_pfn && pfn <= max_low_pfn);
>>> +}
>>> +EXPORT_SYMBOL(pfn_valid);
>>> +#endif
>>
> 


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
