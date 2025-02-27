Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA63FC021BE
	for <linux-snps-arc@archiver.kernel.org>; Thu, 27 Feb 2025 11:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aYdmGN/utfilTcGDdIt5jFZ/+Sb0DCg7tD+bMWYti84=; b=StN6N7HX7+4SKK
	PayczBjqi997PpSdkcm+5E80ZdXHbkLnXmAt4IrPkCJKlhHU/V4HA7PWMvS7xfoh9DlEUdKn5ZBPs
	rh96RIeobc9+6iVAqSg2TDvzOYTu60fO9iK7IhriBbV/NGsRtHLURhI39bHUoWcJXfbxK0R4AnbA/
	+a2tKsOUw4Wtc0KoQZc69/fPrj5ZlNI78WAt2E1wLsQlJHXDgOgRO1vpy77RCwY/c4FBnaN50+C7F
	ujixhdfoSeX+jgscaLybAtj7nuu857gqpwRX9X5fZjnsKcFIYLGzbPvzvVVbBqwjaKtceOgUULG+S
	WbfcXsY5RuTHD8czjDQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnc3e-00000007BID-24VN;
	Thu, 27 Feb 2025 11:28:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnbpm-000000077ee-1WOO;
	Thu, 27 Feb 2025 11:13:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B356E2C1C;
	Thu, 27 Feb 2025 03:13:56 -0800 (PST)
Received: from [10.57.85.134] (unknown [10.57.85.134])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6FF103F6A8;
	Thu, 27 Feb 2025 03:13:31 -0800 (PST)
Message-ID: <16863478-2195-435e-a899-559df097bc59@arm.com>
Date: Thu, 27 Feb 2025 11:13:29 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 7/8] execmem: add support for cache of large ROX pages
Content-Language: en-GB
To: Mike Rapoport <rppt@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, Luis Chamberlain <mcgrof@kernel.org>,
 Dev Jain <dev.jain@arm.com>
Cc: Andreas Larsson <andreas@gaisler.com>, Andy Lutomirski <luto@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@quicinc.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Christoph Hellwig <hch@infradead.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>, Dinh Nguyen
 <dinguyen@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Guo Ren <guoren@kernel.org>, Helge Deller <deller@gmx.de>,
 Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Kent Overstreet <kent.overstreet@linux.dev>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Mark Rutland <mark.rutland@arm.com>, Masami Hiramatsu <mhiramat@kernel.org>,
 Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Simek <monstr@monstr.eu>,
 Oleg Nesterov <oleg@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Peter Zijlstra <peterz@infradead.org>, Richard Weinberger <richard@nod.at>,
 Russell King <linux@armlinux.org.uk>, Song Liu <song@kernel.org>,
 Stafford Horne <shorne@gmail.com>, Steven Rostedt <rostedt@goodmis.org>,
 Suren Baghdasaryan <surenb@google.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Thomas Gleixner <tglx@linutronix.de>, Uladzislau Rezki <urezki@gmail.com>,
 Vineet Gupta <vgupta@kernel.org>, Will Deacon <will@kernel.org>,
 bpf@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org,
 linux-modules@vger.kernel.org, linux-openrisc@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-trace-kernel@vger.kernel.org, linux-um@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
 sparclinux@vger.kernel.org, x86@kernel.org
References: <20241023162711.2579610-1-rppt@kernel.org>
 <20241023162711.2579610-8-rppt@kernel.org>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20241023162711.2579610-8-rppt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_031342_495427_7DEEA47A 
X-CRM114-Status: GOOD (  21.62  )
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

Hi Mike,

Drive by review comments below...


On 23/10/2024 17:27, Mike Rapoport wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> Using large pages to map text areas reduces iTLB pressure and improves
> performance.
> 
> Extend execmem_alloc() with an ability to use huge pages with ROX
> permissions as a cache for smaller allocations.
> 
> To populate the cache, a writable large page is allocated from vmalloc with
> VM_ALLOW_HUGE_VMAP, filled with invalid instructions and then remapped as
> ROX.
> 
> The direct map alias of that large page is exculded from the direct map.
> 
> Portions of that large page are handed out to execmem_alloc() callers
> without any changes to the permissions.
> 
> When the memory is freed with execmem_free() it is invalidated again so
> that it won't contain stale instructions.
> 
> An architecture has to implement execmem_fill_trapping_insns() callback
> and select ARCH_HAS_EXECMEM_ROX configuration option to be able to use
> the ROX cache.
> 
> The cache is enabled on per-range basis when an architecture sets
> EXECMEM_ROX_CACHE flag in definition of an execmem_range.
> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Reviewed-by: Luis Chamberlain <mcgrof@kernel.org>
> Tested-by: kdevops <kdevops@lists.linux.dev>
> ---

[...]

> +
> +static int execmem_cache_populate(struct execmem_range *range, size_t size)
> +{
> +	unsigned long vm_flags = VM_ALLOW_HUGE_VMAP;
> +	unsigned long start, end;
> +	struct vm_struct *vm;
> +	size_t alloc_size;
> +	int err = -ENOMEM;
> +	void *p;
> +
> +	alloc_size = round_up(size, PMD_SIZE);
> +	p = execmem_vmalloc(range, alloc_size, PAGE_KERNEL, vm_flags);

Shouldn't this be passing PAGE_KERNEL_ROX? Otherwise I don't see how the
allocated memory is ROX? I don't see any call below where you change the permission.

Given the range has the pgprot in it, you could just drop passing the pgprot
explicitly here and have execmem_vmalloc() use range->pgprot directly?

Thanks,
Ryan

> +	if (!p)
> +		return err;
> +
> +	vm = find_vm_area(p);
> +	if (!vm)
> +		goto err_free_mem;
> +
> +	/* fill memory with instructions that will trap */
> +	execmem_fill_trapping_insns(p, alloc_size, /* writable = */ true);
> +
> +	start = (unsigned long)p;
> +	end = start + alloc_size;
> +
> +	vunmap_range(start, end);
> +
> +	err = execmem_set_direct_map_valid(vm, false);
> +	if (err)
> +		goto err_free_mem;
> +
> +	err = vmap_pages_range_noflush(start, end, range->pgprot, vm->pages,
> +				       PMD_SHIFT);
> +	if (err)
> +		goto err_free_mem;
> +
> +	err = execmem_cache_add(p, alloc_size);
> +	if (err)
> +		goto err_free_mem;
> +
> +	return 0;
> +
> +err_free_mem:
> +	vfree(p);
> +	return err;
> +}

[...]


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
