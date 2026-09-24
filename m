Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AED1C98304
	for <linux-snps-arc@archiver.kernel.org>; Thu, 24 Sep 2026 02:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SFabHQefmt0BIxHFuoHmpvJZy+rVkpNSKsl13kCoshg=; b=qkYsmrIQG9FkEL
	hVsCwN8G3mBx4zX8DhtvFHwAnyyFXBrinNaLL6nlZwzdXBI9f38VGHiu+C1qfbt1gHld72O67hl5+
	oBgkAXwU6cV2glgrTfHtS0xYy7eMTViLpzwmOHYAa/5VC3J1rfRNKCaIwl3YMOd3/bLGcrWpjg9S1
	xqMWPGEZZmbRQQHuIIM6x8V7k7t8GLsGGirSbAIp9ykp29iVTZhwLGDOEwc7QcGWCtD9qlrr3BEKr
	y7gEnw+clEGLaXoYffsXGII3nHuuQexVio1W/e9YlKv6wUir1O4Wyf22Ou1syQeY0PySskZ8lovER
	iiukF2Sk4dwYE5zK13Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9ZOz-00000009t7Y-4C5x;
	Thu, 24 Sep 2026 02:41:38 +0000
Received: from out-83.mta0.migadu.com ([2001:41d0:1004:224b::53] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9ZOw-00000009t5Z-22SO
	for linux-snps-arc@lists.infradead.org;
	Thu, 24 Sep 2026 02:41:36 +0000
X-Envelope-To: linux-snps-arc@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=4JyEcF/oNMZQFBpW+pWfHZaiat0WqM84Tbff9DsrqFA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790217689; v=1; x=1790822489;
 b=UZfw8DNCvzVWg99NPcR+Ebt/gMs9c2wbKlw9VF7xDnBODEnpn+5L/KTQ8WXUFmA/7/S3z6nK
 uOHQ/7PMLg78DwOZDksDiNr+2zlrYBU6LyvH534tTa4wCqRE3GujpnsHM+atPSdOawKRtGksWF9
 Z8XnWYcQsOI8qU0frPT9vz3w=
X-Envelope-To: linux-snps-arc@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 1489725b085043fe;
	Thu, 24 Sep 2026 02:41:26 +0000
X-Mizu-Trace-ID: 1489725b085043fe
X-Migadu-Flow: FLOW_OUT
From: Lance Yang <lance.yang@linux.dev>
To: ljs@kernel.org
Cc: akpm@linux-foundation.org,
	david@kernel.org,
	ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	liam@infradead.org,
	nico.pache@linux.dev,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	lance.yang@linux.dev,
	usama.arif@linux.dev,
	kas@kernel.org,
	guoren@kernel.org,
	bcain@kernel.org,
	geert@linux-m68k.org,
	dinguyen@kernel.org,
	schuster.simon@siemens-energy.com,
	jonas@southpole.se,
	stefan.kristiansson@saunalahti.fi,
	shorne@gmail.com,
	dalias@libc.org,
	glaubitz@physik.fu-berlin.de,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	linux@armlinux.org.uk,
	vgupta@kernel.org,
	monstr@monstr.eu,
	chris@zankel.net,
	jcmvbkbc@gmail.com,
	will@kernel.org,
	aneesh.kumar@kernel.org,
	npiggin@gmail.com,
	peterz@infradead.org,
	davem@davemloft.net,
	andreas@gaisler.com,
	richard.henderson@linaro.org,
	mattst88@gmail.com,
	linmag7@gmail.com,
	catalin.marinas@arm.com,
	mark.rutland@arm.com,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	tsbogend@alpha.franken.de,
	James.Bottomley@HansenPartnership.com,
	deller@gmx.de,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	chleroy@kernel.org,
	hca@linux.ibm.com,
	gor@linux.ibm.com,
	agordeev@linux.ibm.com,
	borntraeger@linux.ibm.com,
	svens@linux.ibm.com,
	richard@nod.at,
	anton.ivanov@cambridgegreys.com,
	johannes@sipsolutions.net,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	arnd@arndb.de,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	jgg@ziepe.ca,
	jhubbard@nvidia.com,
	peterx@redhat.com,
	ysato@users.sourceforge.jp,
	shakeel.butt@linux.dev,
	corbet@lwn.net,
	rdunlap@infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-openrisc@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-snps-arc@lists.infradead.org,
	linux-arch@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	linux-um@lists.infradead.org,
	hughd@google.com,
	qi.zheng@linux.dev,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 10/12] mm: enable MMU_GATHER_RCU_TABLE_FREE for sparc32
Date: Thu, 24 Sep 2026 10:41:20 +0800
Message-ID: <20260924024120.14225-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260922-rcu-pagetable-freeing-v4-10-fe1ad1f1e303@kernel.org>
References: <20260922-rcu-pagetable-freeing-v4-10-fe1ad1f1e303@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_194134_864789_FB687194 
X-CRM114-Status: UNSURE (   8.29  )
X-CRM114-Notice: Please train this message.
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


On Tue, Sep 22, 2026 at 04:35:41PM +0100, Lorenzo Stoakes (ARM) wrote:
>Careful handling is required for sparc32 which implements page tables as
>part of a shared backing page.
>
>To support this, a custom __tlb_remove_table() function is required, as
>specified by CONFIG_HAVE_ARCH_TLB_REMOVE_TABLE.
>
>This allows __pte_free_tlb() and __pmd_free_tlb() to specify which page
>table level is being freed, which is transmitted to __tlb_remove_table()
>through setting the lowest bit of the page table to 1 for a PMD and 0 for a
>PTE (the page tables are 256-byte aligned so this is safe to do).
>
>Next, since the page table freeing is done via RCU callback, and thus might
>be executed in softirq context, update the spin locks to IRQ save/restore.
>
>Then, in __tlb_remove_table(), figure out whether to free a PMD page table
>via free_pmd_fast() or a PTE via the newly introduced __pte_free()
>function, using the lower bit encoded in __pte_free_tlb() or
>__pmd_free_tlb() to determine which to call.
>
>As part of this change use this spin lock rather than mm->page_table_lock
>for all shared page table exclusion, as RCU freeing means that page tables
>can be freed from soft IRQ context so both don't have an mm and also
>mm->page_table_lock is not IRQ-safe.
>
>Note that the specification of CONFIG_HAVE_ARCH_TLB_REMOVE_TABLE disables
>CONFIG_PT_RECLAIM for sparc32, which mirrors sparc64.
>
>This forms part of an overall effort to switch every architecture to this
>mode, and with it complete, means every architecture now supports
>CONFIG_MMU_GATHER_RCU_TABLE_FREE.
>
>Acked-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
>Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
>---

Also ran page-table teardown stress on qemu-system-sparc (SS-20, sun4m,
CONFIG_SPARC32=y). All 24 rounds ran cleanly :)

Feel free to add:

Tested-by: Lance Yang <lance.yang@linux.dev>
Acked-by: Lance Yang <lance.yang@linux.dev>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
