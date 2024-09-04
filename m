Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21ED8CD37AE
	for <linux-snps-arc@archiver.kernel.org>; Wed,  4 Sep 2024 04:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UHcGotIWYewPlbJxkIk5kbh6+gJNWHPJp7f9Ww+qnNY=; b=0PL5fEQj0EswlL
	w/odp2xGTwpSN4P6KOp03xZqEMJQ8OWLiHbGIFdatndj8yjBC4E4k+dyarHAyZZi4roWCKaLcE6O3
	DX8sGUs83G76Z6WnXxNaZZzV46YrKTm39ZhvmMXgF1oKNyJrYVGimSMvS3BAPZVcMFSsewn35EnXH
	ofZTJVtcfr2hDIh3B4Mj69r/PetEPdEWROF9OrKvE9zO2wiv4Vx6/icoPfTQO+s0XrEX+EFdQw4lU
	geszxICnGkXjHodPtPGQhCreMjcoP+q+3rShikL9gOveY4hW6BbaX/L82UbjZ+PSgXcY4zXO6sJDZ
	HI7H6NlxnJmOeaeVmRLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slhP9-00000002lIs-26AE;
	Wed, 04 Sep 2024 04:14:03 +0000
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slhP6-00000002lID-0THg;
	Wed, 04 Sep 2024 04:14:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1725423237;
	bh=eMgOBDwTX8trwBbhMUy1qHUpMDhdRlVDIssPJb8Gsmo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Atgw5p+ous8ponaujRBR9zeHm87YGXlWFJw/APeKvwTJfN+vDA+MA/XCf729+PnVA
	 yIoWrvR8Tg01Q4kTrqjbf+6l9UmkC2+E2eKeM0lpnBzHzQLZr6WfUF+RwlGDv9na7Y
	 VJ6SDLZrN5hF4Pw9qE+168Zj3QWww8gocoC1nJ966vxltqaxwrFOfSbul6kyFfi2d0
	 JlXz4kSSwijD4hHUrXsf8IlpvudZE3CIHAEjc3DtzlAKa/tvrIdpfiNxgF0xas/YL4
	 mHLB2qUie8SKPjqF5MpzhdViqlVcFcXog5f66aL4m0C5o/rSTOnJ5fJzWnRTdDtt9J
	 XaxynAPBdZR7w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Wz8Hv4YYPz4wb7;
	Wed,  4 Sep 2024 14:13:47 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Mark Brown <broonie@kernel.org>, Richard Henderson
 <richard.henderson@linaro.org>, Ivan Kokshaysky
 <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Vineet Gupta
 <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, Guo Ren
 <guoren@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui
 <kernel@xen0n.name>, "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>,
 Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, Alexander
 Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer
 <gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker
 <dalias@libc.org>, John Paul Adrian Glaubitz
 <glaubitz@physik.fu-berlin.de>, "David S. Miller" <davem@davemloft.net>,
 Andreas Larsson <andreas@gaisler.com>, Thomas Gleixner
 <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
 <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>, Max
 Filippov <jcmvbkbc@gmail.com>, Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>, Deepak Gupta <debug@rivosinc.com>,
 linux-arm-kernel@lists.infradead.org, linux-alpha@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 loongarch@lists.linux.dev, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-mm@kvack.org,
 Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/3] mm: Pass vm_flags to generic_get_unmapped_area()
In-Reply-To: <20240902-mm-generic-shadow-stack-guard-v1-2-9acda38b3dd3@kernel.org>
References: <20240902-mm-generic-shadow-stack-guard-v1-0-9acda38b3dd3@kernel.org>
 <20240902-mm-generic-shadow-stack-guard-v1-2-9acda38b3dd3@kernel.org>
Date: Wed, 04 Sep 2024 14:13:47 +1000
Message-ID: <87plpk5a4k.fsf@mail.lhotse>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240903_211400_497958_D9BDDF05 
X-CRM114-Status: GOOD (  17.20  )
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

Mark Brown <broonie@kernel.org> writes:
> In preparation for using vm_flags to ensure guard pages for shadow stacks
> supply them as an argument to generic_get_unmapped_area(). The only user
> outside of the core code is the PowerPC book3s64 implementation which is
> trivially wrapping the generic implementation in the radix_enabled() case.
>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  arch/powerpc/mm/book3s64/slice.c |  4 ++--
>  include/linux/sched/mm.h         |  4 ++--
>  mm/mmap.c                        | 10 ++++++----
>  3 files changed, 10 insertions(+), 8 deletions(-)

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers

> diff --git a/arch/powerpc/mm/book3s64/slice.c b/arch/powerpc/mm/book3s64/slice.c
> index ada6bf896ef8..87307d0fc3b8 100644
> --- a/arch/powerpc/mm/book3s64/slice.c
> +++ b/arch/powerpc/mm/book3s64/slice.c
> @@ -641,7 +641,7 @@ unsigned long arch_get_unmapped_area(struct file *filp,
>  				     vm_flags_t vm_flags)
>  {
>  	if (radix_enabled())
> -		return generic_get_unmapped_area(filp, addr, len, pgoff, flags);
> +		return generic_get_unmapped_area(filp, addr, len, pgoff, flags, vm_flags);
>  
>  	return slice_get_unmapped_area(addr, len, flags,
>  				       mm_ctx_user_psize(&current->mm->context), 0);
> @@ -655,7 +655,7 @@ unsigned long arch_get_unmapped_area_topdown(struct file *filp,
>  					     vm_flags_t vm_flags)
>  {
>  	if (radix_enabled())
> -		return generic_get_unmapped_area_topdown(filp, addr0, len, pgoff, flags);
> +		return generic_get_unmapped_area_topdown(filp, addr0, len, pgoff, flags, vm_flags);
>  
>  	return slice_get_unmapped_area(addr0, len, flags,
>  				       mm_ctx_user_psize(&current->mm->context), 1);
> diff --git a/include/linux/sched/mm.h b/include/linux/sched/mm.h
> index c4d34abc45d4..07bb8d4181d7 100644
> --- a/include/linux/sched/mm.h
> +++ b/include/linux/sched/mm.h
> @@ -204,11 +204,11 @@ unsigned long mm_get_unmapped_area_vmflags(struct mm_struct *mm,
>  unsigned long
>  generic_get_unmapped_area(struct file *filp, unsigned long addr,
>  			  unsigned long len, unsigned long pgoff,
> -			  unsigned long flags);
> +			  unsigned long flags, vm_flags_t vm_flags);
>  unsigned long
>  generic_get_unmapped_area_topdown(struct file *filp, unsigned long addr,
>  				  unsigned long len, unsigned long pgoff,
> -				  unsigned long flags);
> +				  unsigned long flags, vm_flags_t vm_flags);
>  #else
>  static inline void arch_pick_mmap_layout(struct mm_struct *mm,
>  					 struct rlimit *rlim_stack) {}
> diff --git a/mm/mmap.c b/mm/mmap.c
> index 7528146f886f..b06ba847c96e 100644
> --- a/mm/mmap.c
> +++ b/mm/mmap.c
> @@ -1789,7 +1789,7 @@ unsigned long vm_unmapped_area(struct vm_unmapped_area_info *info)
>  unsigned long
>  generic_get_unmapped_area(struct file *filp, unsigned long addr,
>  			  unsigned long len, unsigned long pgoff,
> -			  unsigned long flags)
> +			  unsigned long flags, vm_flags_t vm_flags)
>  {
>  	struct mm_struct *mm = current->mm;
>  	struct vm_area_struct *vma, *prev;
> @@ -1823,7 +1823,8 @@ arch_get_unmapped_area(struct file *filp, unsigned long addr,
>  		       unsigned long len, unsigned long pgoff,
>  		       unsigned long flags, vm_flags_t vm_flags)
>  {
> -	return generic_get_unmapped_area(filp, addr, len, pgoff, flags);
> +	return generic_get_unmapped_area(filp, addr, len, pgoff, flags,
> +					 vm_flags);
>  }
>  #endif
>  
> @@ -1834,7 +1835,7 @@ arch_get_unmapped_area(struct file *filp, unsigned long addr,
>  unsigned long
>  generic_get_unmapped_area_topdown(struct file *filp, unsigned long addr,
>  				  unsigned long len, unsigned long pgoff,
> -				  unsigned long flags)
> +				  unsigned long flags, vm_flags_t vm_flags)
>  {
>  	struct vm_area_struct *vma, *prev;
>  	struct mm_struct *mm = current->mm;
> @@ -1887,7 +1888,8 @@ arch_get_unmapped_area_topdown(struct file *filp, unsigned long addr,
>  			       unsigned long len, unsigned long pgoff,
>  			       unsigned long flags, vm_flags_t vm_flags)
>  {
> -	return generic_get_unmapped_area_topdown(filp, addr, len, pgoff, flags);
> +	return generic_get_unmapped_area_topdown(filp, addr, len, pgoff, flags,
> +						 vm_flags);
>  }
>  #endif
>  
>
> -- 
> 2.39.2

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
