Return-Path: <SRS0=M/q7=6H=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7B3DC2BA19
	for <linux-snps-arc@archiver.kernel.org>; Thu, 23 Apr 2020 05:50:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B530208E4
	for <linux-snps-arc@archiver.kernel.org>; Thu, 23 Apr 2020 05:50:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QkAhOJo7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="LMVthoZA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B530208E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bJa+5hAnpXdzbmt2SBIvamz7X6HRxSsEbduBjlTvHGQ=; b=QkAhOJo7gUwDGJ
	7F66j+aijoBe0u8jVkXTGFEylOz7rY8/yRY+ER7jzNUEf4d/Al3GoSbqnE9hgHFDVfE0Bxruhlsri
	TknnR27u/h1fZk3rHJi/oeruAJ75nnzqooRLdT9KEzymtEU1j9+auRb7B7UIDPAgR1V+xl3A6Lm5p
	XH7CW/jQlX2tLRgGTTpMgIrFR9rpFsB3Ww+1/xLGVvT47OiS4J0ioOHdO4XEbeY+AbJ10oNRbWiw+
	ZhFEnztOQHbJ2ehOpjWpR1f/LbgbVQKAfXZ0LG/w9JnVXLAPLCN0UjpgNUmDIQ8tZ0HfRtl2WTkDw
	oHPoexoi8MJkhZR+aEgQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jRUl6-0006Kl-CL; Thu, 23 Apr 2020 05:50:48 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jRUl0-0006Hm-KV; Thu, 23 Apr 2020 05:50:44 +0000
Received: from kernel.org (unknown [77.127.79.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 316B72075A;
 Thu, 23 Apr 2020 05:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587621040;
 bh=eyVZp9j3F/Xq/nb8E7flj/7Td5RXEkEohgXGHGzzyBg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LMVthoZAtv0rZAA611yWF87SJbTuYjwkEzlivL15gwv1pTfmKz6qcSkPj9g6tdK3X
 3vKyJlA0AvQUGT1DCH7fpW3AEGHKGhgMYeM3USLfon8nQe86zcU1QzD9IFXYoeaLr8
 3uHfGYSWfNKi0n+hHvp4Yj3/WIVE9+1jq2UW/40o=
Date: Thu, 23 Apr 2020 08:50:22 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Baoquan He <bhe@redhat.com>
Subject: Re: [PATCH 16/21] mm: remove early_pfn_in_nid() and
 CONFIG_NODES_SPAN_OTHER_NODES
Message-ID: <20200423055022.GE14260@kernel.org>
References: <20200412194859.12663-1-rppt@kernel.org>
 <20200412194859.12663-17-rppt@kernel.org>
 <20200423011312.GY4247@MiWiFi-R3L-srv>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200423011312.GY4247@MiWiFi-R3L-srv>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200422_225042_716633_ED98B82F 
X-CRM114-Status: GOOD (  23.46  )
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org,
 linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Michal Hocko <mhocko@kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>,
 linux-csky@vger.kernel.org, linux-parisc@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-riscv@lists.infradead.org, Greg Ungerer <gerg@linux-m68k.org>,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-c6x-dev@linux-c6x.org,
 Brian Cain <bcain@codeaurora.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-sh@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 Helge Deller <deller@gmx.de>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, Ley Foon Tan <ley.foon.tan@intel.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-arm-kernel@lists.infradead.org, Mark Salter <msalter@redhat.com>,
 Matt Turner <mattst88@gmail.com>, linux-mips@vger.kernel.org,
 uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 linux-alpha@vger.kernel.org, linux-um@lists.infradead.org,
 linux-m68k@lists.linux-m68k.org, Tony Luck <tony.luck@intel.com>,
 Greentime Hu <green.hu@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Stafford Horne <shorne@gmail.com>, Guan Xuetao <gxt@pku.edu.cn>,
 Hoan Tran <Hoan@os.amperecomputing.com>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Nick Hu <nickhu@andestech.com>,
 linux-mm@kvack.org, Vineet Gupta <vgupta@synopsys.com>,
 linux-kernel@vger.kernel.org, openrisc@lists.librecores.org,
 Richard Weinberger <richard@nod.at>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Thu, Apr 23, 2020 at 09:13:12AM +0800, Baoquan He wrote:
> On 04/12/20 at 10:48pm, Mike Rapoport wrote:
> > From: Mike Rapoport <rppt@linux.ibm.com>
> > 
> > The commit f47ac088c406 ("mm: memmap_init: iterate over memblock regions
> 
> This commit id should be a temporary one, will be changed when merged
> into maintainer's tree and linus's tree. Only saying last patch plus the
> patch subject is OK?

Right, the commit id here is not stable. I'll update the changelog.
 
> > rather that check each PFN") made early_pfn_in_nid() obsolete and since
> > CONFIG_NODES_SPAN_OTHER_NODES is only used to pick a stub or a real
> > implementation of early_pfn_in_nid() it is also not needed anymore.
> > 
> > Remove both early_pfn_in_nid() and the CONFIG_NODES_SPAN_OTHER_NODES.
> > 
> > Co-developed-by: Hoan Tran <Hoan@os.amperecomputing.com>
> > Signed-off-by: Hoan Tran <Hoan@os.amperecomputing.com>
> > Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> > ---
> >  arch/powerpc/Kconfig |  9 ---------
> >  arch/sparc/Kconfig   |  9 ---------
> >  arch/x86/Kconfig     |  9 ---------
> >  mm/page_alloc.c      | 20 --------------------
> >  4 files changed, 47 deletions(-)
> > 
> > diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> > index 5f86b22b7d2c..74f316deeae1 100644
> > --- a/arch/powerpc/Kconfig
> > +++ b/arch/powerpc/Kconfig
> > @@ -685,15 +685,6 @@ config ARCH_MEMORY_PROBE
> >  	def_bool y
> >  	depends on MEMORY_HOTPLUG
> >  
> > -# Some NUMA nodes have memory ranges that span
> > -# other nodes.  Even though a pfn is valid and
> > -# between a node's start and end pfns, it may not
> > -# reside on that node.  See memmap_init_zone()
> > -# for details.
> > -config NODES_SPAN_OTHER_NODES
> > -	def_bool y
> > -	depends on NEED_MULTIPLE_NODES
> > -
> >  config STDBINUTILS
> >  	bool "Using standard binutils settings"
> >  	depends on 44x
> > diff --git a/arch/sparc/Kconfig b/arch/sparc/Kconfig
> > index 795206b7b552..0e4f3891b904 100644
> > --- a/arch/sparc/Kconfig
> > +++ b/arch/sparc/Kconfig
> > @@ -286,15 +286,6 @@ config NODES_SHIFT
> >  	  Specify the maximum number of NUMA Nodes available on the target
> >  	  system.  Increases memory reserved to accommodate various tables.
> >  
> > -# Some NUMA nodes have memory ranges that span
> > -# other nodes.  Even though a pfn is valid and
> > -# between a node's start and end pfns, it may not
> > -# reside on that node.  See memmap_init_zone()
> > -# for details.
> > -config NODES_SPAN_OTHER_NODES
> > -	def_bool y
> > -	depends on NEED_MULTIPLE_NODES
> > -
> >  config ARCH_SPARSEMEM_ENABLE
> >  	def_bool y if SPARC64
> >  	select SPARSEMEM_VMEMMAP_ENABLE
> > diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> > index 9d3e95b4fb85..37dac095659e 100644
> > --- a/arch/x86/Kconfig
> > +++ b/arch/x86/Kconfig
> > @@ -1581,15 +1581,6 @@ config X86_64_ACPI_NUMA
> >  	---help---
> >  	  Enable ACPI SRAT based node topology detection.
> >  
> > -# Some NUMA nodes have memory ranges that span
> > -# other nodes.  Even though a pfn is valid and
> > -# between a node's start and end pfns, it may not
> > -# reside on that node.  See memmap_init_zone()
> > -# for details.
> > -config NODES_SPAN_OTHER_NODES
> > -	def_bool y
> > -	depends on X86_64_ACPI_NUMA
> > -
> >  config NUMA_EMU
> >  	bool "NUMA emulation"
> >  	depends on NUMA
> > diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> > index c43ce8709457..343d87b8697d 100644
> > --- a/mm/page_alloc.c
> > +++ b/mm/page_alloc.c
> > @@ -1541,26 +1541,6 @@ int __meminit early_pfn_to_nid(unsigned long pfn)
> >  }
> >  #endif /* CONFIG_NEED_MULTIPLE_NODES */
> >  
> > -#ifdef CONFIG_NODES_SPAN_OTHER_NODES
> > -/* Only safe to use early in boot when initialisation is single-threaded */
> > -static inline bool __meminit early_pfn_in_nid(unsigned long pfn, int node)
> > -{
> > -	int nid;
> > -
> > -	nid = __early_pfn_to_nid(pfn, &early_pfnnid_cache);
> > -	if (nid >= 0 && nid != node)
> > -		return false;
> > -	return true;
> > -}
> > -
> > -#else
> > -static inline bool __meminit early_pfn_in_nid(unsigned long pfn, int node)
> > -{
> > -	return true;
> > -}
> > -#endif
> 
> And macro early_pfn_valid() is not needed either, we may need remove it
> too. 

Ok.

> Otherwise, removing NODES_SPAN_OTHER_NODES in this patch looks good.
> 
> Reviewed-by: Baoquan He <bhe@redhat.com>
> 
> > -
> > -
> >  void __init memblock_free_pages(struct page *page, unsigned long pfn,
> >  							unsigned int order)
> >  {
> > -- 
> > 2.25.1
> > 
> 

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
