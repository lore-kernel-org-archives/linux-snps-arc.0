Return-Path: <SRS0=M/q7=6H=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBA41C55186
	for <linux-snps-arc@archiver.kernel.org>; Thu, 23 Apr 2020 01:13:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F4FA2074F
	for <linux-snps-arc@archiver.kernel.org>; Thu, 23 Apr 2020 01:13:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="i9qi2S1e";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Gg16U9fL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F4FA2074F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YdTctoMJwsxhQx7RipMLxv+Q6A3aWcBmoXeeVHBa9bw=; b=i9qi2S1esNbzEv
	hfj97IBxSJuRUmpS+eKUaqL+kwJEyMJhCgqBKzozjcCf8q6APFXk6F5gQRq3HQ+f3cSSGJPKQZiJc
	EVbrB6ivg5pBDsRMZAWUnEw/KEaDGEupcUNUFWoxO/TIQ7pt/yEzx+HYnfldRzFtS2i1LZW+BbsJM
	v45r9UuUG7+btmoZQnOiLFdpz4VnX2ka71gq5sH/AUabQqv0/MU3IrCeB24d0v2qYw91XOjEKa8bA
	zKr85UjUQTv/X/zwPRqRe2VH3A97418D9lhmI7m9TLmQ3zvM1xM3R6IVynJDljVrwhCNsFbUIiQXO
	frmTF4RKpNUtzaLHmlgA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jRQQt-0000bM-6c; Thu, 23 Apr 2020 01:13:39 +0000
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]
 helo=us-smtp-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jRQQo-0000XG-1f
 for linux-snps-arc@lists.infradead.org; Thu, 23 Apr 2020 01:13:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587604412;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2i5M2ycjs3rlosl36wEuRNmxANDiCG1t4SjA8z/n0gs=;
 b=Gg16U9fLasHhmJoL6KeuK4e4q6g42wtYlivz5JkoaM/yeHJDZF7UDcU1Xu9IRhRpeuzJ/g
 vuh5fZSUbhxwZwu7xfG075ekTmqpKfmAp22rTpL+cxqPA2XYgm8lkPvTdmHY6fQdFonrrD
 Z6BzFOgD6bluKHT/ozE11vjCa5pdOfw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-74-BEzLYa-fNc2wMeSdUgUC6Q-1; Wed, 22 Apr 2020 21:13:30 -0400
X-MC-Unique: BEzLYa-fNc2wMeSdUgUC6Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 55EDD8017F3;
 Thu, 23 Apr 2020 01:13:23 +0000 (UTC)
Received: from localhost (ovpn-12-37.pek2.redhat.com [10.72.12.37])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 820715D706;
 Thu, 23 Apr 2020 01:13:15 +0000 (UTC)
Date: Thu, 23 Apr 2020 09:13:12 +0800
From: Baoquan He <bhe@redhat.com>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH 16/21] mm: remove early_pfn_in_nid() and
 CONFIG_NODES_SPAN_OTHER_NODES
Message-ID: <20200423011312.GY4247@MiWiFi-R3L-srv>
References: <20200412194859.12663-1-rppt@kernel.org>
 <20200412194859.12663-17-rppt@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200412194859.12663-17-rppt@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200422_181334_159668_2E2D3B06 
X-CRM114-Status: GOOD (  20.02  )
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

On 04/12/20 at 10:48pm, Mike Rapoport wrote:
> From: Mike Rapoport <rppt@linux.ibm.com>
> 
> The commit f47ac088c406 ("mm: memmap_init: iterate over memblock regions

This commit id should be a temporary one, will be changed when merged
into maintainer's tree and linus's tree. Only saying last patch plus the
patch subject is OK?

> rather that check each PFN") made early_pfn_in_nid() obsolete and since
> CONFIG_NODES_SPAN_OTHER_NODES is only used to pick a stub or a real
> implementation of early_pfn_in_nid() it is also not needed anymore.
> 
> Remove both early_pfn_in_nid() and the CONFIG_NODES_SPAN_OTHER_NODES.
> 
> Co-developed-by: Hoan Tran <Hoan@os.amperecomputing.com>
> Signed-off-by: Hoan Tran <Hoan@os.amperecomputing.com>
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> ---
>  arch/powerpc/Kconfig |  9 ---------
>  arch/sparc/Kconfig   |  9 ---------
>  arch/x86/Kconfig     |  9 ---------
>  mm/page_alloc.c      | 20 --------------------
>  4 files changed, 47 deletions(-)
> 
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 5f86b22b7d2c..74f316deeae1 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -685,15 +685,6 @@ config ARCH_MEMORY_PROBE
>  	def_bool y
>  	depends on MEMORY_HOTPLUG
>  
> -# Some NUMA nodes have memory ranges that span
> -# other nodes.  Even though a pfn is valid and
> -# between a node's start and end pfns, it may not
> -# reside on that node.  See memmap_init_zone()
> -# for details.
> -config NODES_SPAN_OTHER_NODES
> -	def_bool y
> -	depends on NEED_MULTIPLE_NODES
> -
>  config STDBINUTILS
>  	bool "Using standard binutils settings"
>  	depends on 44x
> diff --git a/arch/sparc/Kconfig b/arch/sparc/Kconfig
> index 795206b7b552..0e4f3891b904 100644
> --- a/arch/sparc/Kconfig
> +++ b/arch/sparc/Kconfig
> @@ -286,15 +286,6 @@ config NODES_SHIFT
>  	  Specify the maximum number of NUMA Nodes available on the target
>  	  system.  Increases memory reserved to accommodate various tables.
>  
> -# Some NUMA nodes have memory ranges that span
> -# other nodes.  Even though a pfn is valid and
> -# between a node's start and end pfns, it may not
> -# reside on that node.  See memmap_init_zone()
> -# for details.
> -config NODES_SPAN_OTHER_NODES
> -	def_bool y
> -	depends on NEED_MULTIPLE_NODES
> -
>  config ARCH_SPARSEMEM_ENABLE
>  	def_bool y if SPARC64
>  	select SPARSEMEM_VMEMMAP_ENABLE
> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index 9d3e95b4fb85..37dac095659e 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -1581,15 +1581,6 @@ config X86_64_ACPI_NUMA
>  	---help---
>  	  Enable ACPI SRAT based node topology detection.
>  
> -# Some NUMA nodes have memory ranges that span
> -# other nodes.  Even though a pfn is valid and
> -# between a node's start and end pfns, it may not
> -# reside on that node.  See memmap_init_zone()
> -# for details.
> -config NODES_SPAN_OTHER_NODES
> -	def_bool y
> -	depends on X86_64_ACPI_NUMA
> -
>  config NUMA_EMU
>  	bool "NUMA emulation"
>  	depends on NUMA
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index c43ce8709457..343d87b8697d 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -1541,26 +1541,6 @@ int __meminit early_pfn_to_nid(unsigned long pfn)
>  }
>  #endif /* CONFIG_NEED_MULTIPLE_NODES */
>  
> -#ifdef CONFIG_NODES_SPAN_OTHER_NODES
> -/* Only safe to use early in boot when initialisation is single-threaded */
> -static inline bool __meminit early_pfn_in_nid(unsigned long pfn, int node)
> -{
> -	int nid;
> -
> -	nid = __early_pfn_to_nid(pfn, &early_pfnnid_cache);
> -	if (nid >= 0 && nid != node)
> -		return false;
> -	return true;
> -}
> -
> -#else
> -static inline bool __meminit early_pfn_in_nid(unsigned long pfn, int node)
> -{
> -	return true;
> -}
> -#endif

And macro early_pfn_valid() is not needed either, we may need remove it
too. 

Otherwise, removing NODES_SPAN_OTHER_NODES in this patch looks good.

Reviewed-by: Baoquan He <bhe@redhat.com>

> -
> -
>  void __init memblock_free_pages(struct page *page, unsigned long pfn,
>  							unsigned int order)
>  {
> -- 
> 2.25.1
> 


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
