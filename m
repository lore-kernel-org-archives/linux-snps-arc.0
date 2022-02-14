Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C467C433F5
	for <linux-snps-arc@archiver.kernel.org>; Mon, 14 Feb 2022 17:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rwqrX/EVNK1SheoQG03vfMNYXY0NW72jgNFXc7q3a4k=; b=ul/4LRUkdmNIWC
	qTnSbvm4uE3VrYadSJYGba5YdomQScVRZAcf74yRham3FkHRMhQwxbi8FWe2+APyNsEDvRo1UBE7B
	RgxHExx1Mc4eAHEGbPnw21QMyCNmhe4yo60DL8j7pg+IKcCKYTlTLfcG+F3YU7lADpSpn2P74DYk6
	hvEo+z4L2q2H4LoCOhMdGDxec/3E7L+gBCf2xpDwrTWG4PE4jtkEAwGUZD3iokf5SZ6OxldNC85n9
	lhLLsYZDa/waIbzshLSV8x6pXp+r7CwYUt9ghHPrSWLiGW1de9D+A8/aj4p/HG4g0zEiQmXFbZF2c
	rUT8XRXrWHUGO5d0kjzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJext-00GLFS-Pp; Mon, 14 Feb 2022 17:16:41 +0000
Received: from zeniv-ca.linux.org.uk ([2607:5300:60:148a::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJexr-00GLEh-7q; Mon, 14 Feb 2022 17:16:40 +0000
Received: from viro by zeniv-ca.linux.org.uk with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nJewf-001kzp-JJ; Mon, 14 Feb 2022 17:15:25 +0000
Date: Mon, 14 Feb 2022 17:15:25 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>, linux-arch@vger.kernel.org,
 linux-mm@kvack.org, linux-api@vger.kernel.org, arnd@arndb.de,
 linux-kernel@vger.kernel.org, linux@armlinux.org.uk,
 will@kernel.org, guoren@kernel.org, bcain@codeaurora.org,
 geert@linux-m68k.org, monstr@monstr.eu, tsbogend@alpha.franken.de,
 nickhu@andestech.com, green.hu@gmail.com, dinguyen@kernel.org,
 shorne@gmail.com, deller@gmx.de, mpe@ellerman.id.au,
 peterz@infradead.org, mingo@redhat.com, mark.rutland@arm.com,
 hca@linux.ibm.com, dalias@libc.org, davem@davemloft.net,
 richard@nod.at, x86@kernel.org, jcmvbkbc@gmail.com,
 ebiederm@xmission.com, akpm@linux-foundation.org, ardb@kernel.org,
 linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 openrisc@lists.librecores.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
 linux-xtensa@linux-xtensa.org
Subject: Re: [PATCH 07/14] uaccess: generalize access_ok()
Message-ID: <YgqOLZbFK7/B2HJT@zeniv-ca.linux.org.uk>
References: <20220214163452.1568807-1-arnd@kernel.org>
 <20220214163452.1568807-8-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220214163452.1568807-8-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_091639_293476_2DB0C6FC 
X-CRM114-Status: GOOD (  13.39  )
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

On Mon, Feb 14, 2022 at 05:34:45PM +0100, Arnd Bergmann wrote:

> diff --git a/arch/csky/kernel/signal.c b/arch/csky/kernel/signal.c
> index c7b763d2f526..8867ddf3e6c7 100644
> --- a/arch/csky/kernel/signal.c
> +++ b/arch/csky/kernel/signal.c
> @@ -136,7 +136,7 @@ static inline void __user *get_sigframe(struct ksignal *ksig,
>  static int
>  setup_rt_frame(struct ksignal *ksig, sigset_t *set, struct pt_regs *regs)
>  {
> -	struct rt_sigframe *frame;
> +	struct rt_sigframe __user *frame;
>  	int err = 0;
>  
>  	frame = get_sigframe(ksig, regs, sizeof(*frame));

Minor nit: might make sense to separate annotations (here, on nios2, etc.) from the rest...

This, OTOH,

> diff --git a/arch/sparc/include/asm/uaccess_64.h b/arch/sparc/include/asm/uaccess_64.h
> index 5c12fb46bc61..000bac67cf31 100644
> --- a/arch/sparc/include/asm/uaccess_64.h
> +++ b/arch/sparc/include/asm/uaccess_64.h
...
> -static inline bool __chk_range_not_ok(unsigned long addr, unsigned long size, unsigned long limit)
> -{
> -	if (__builtin_constant_p(size))
> -		return addr > limit - size;
> -
> -	addr += size;
> -	if (addr < size)
> -		return true;
> -
> -	return addr > limit;
> -}
> -
> -#define __range_not_ok(addr, size, limit)                               \
> -({                                                                      \
> -	__chk_user_ptr(addr);                                           \
> -	__chk_range_not_ok((unsigned long __force)(addr), size, limit); \
> -})
> -
> -static inline int __access_ok(const void __user * addr, unsigned long size)
> -{
> -	return 1;
> -}
> -
> -static inline int access_ok(const void __user * addr, unsigned long size)
> -{
> -	return 1;
> -}
> +#define __range_not_ok(addr, size, limit) (!__access_ok(addr, size))

is really wrong.  For sparc64, access_ok() should always be true.
This __range_not_ok() thing is used *only* for valid_user_frame() in
arch/sparc/kernel/perf_event.c - it's not a part of normal access_ok()
there.

sparc64 has separate address spaces for kernel and for userland; access_ok()
had never been useful there.  

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
