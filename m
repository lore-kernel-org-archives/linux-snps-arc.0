Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4897C4332F
	for <linux-snps-arc@archiver.kernel.org>; Wed, 16 Feb 2022 18:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xrsHm5AOhrCkz3p2hgLb6GYTQ/Hb4iDSGh1LSQGLY/4=; b=cx86UwWU+fqqn0
	kdle4i9iAYLcYfoKbp0sGcgjU5wlUCINnrL42/FpFdWXGrEoOeZeyhKMAhl67hNToh7VmdmKavXbO
	Q6pSh7MPW8giGTujtNSA0nIkEsBh22A5Bc8D1N8K4dH/cJexop5CXLPmLtBLdGkp5iFZCLBvh0nXk
	vepWfr/mENpd4911j/Iqk6KmMsbBmX2prfzw3KxqM6AWI6TIzsb0jTPFUqcNGTGBBG3EasncpwvR7
	ypjgTWyQP5lH+8CI53hLrP5zQwzZIoLVcTGG+dkQi6ar1SXM54MDsU20nMi4sCVgIJye9em9cPvcc
	HfHDCUuOE2xwkwXCOtVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKPHw-0089Ap-5k; Wed, 16 Feb 2022 18:44:28 +0000
Received: from mx1.smtp.larsendata.com ([91.221.196.215])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKPHo-008985-NL
 for linux-snps-arc@lists.infradead.org; Wed, 16 Feb 2022 18:44:24 +0000
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 7cf017e4-8f58-11ec-baa1-0050568c148b;
 Wed, 16 Feb 2022 18:44:35 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 3B79C194B3E;
 Wed, 16 Feb 2022 19:44:17 +0100 (CET)
Date: Wed, 16 Feb 2022 19:44:13 +0100
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>, linux-arch@vger.kernel.org,
 linux-mm@kvack.org, linux-api@vger.kernel.org, arnd@arndb.de,
 linux-kernel@vger.kernel.org, viro@zeniv.linux.org.uk,
 linux@armlinux.org.uk, will@kernel.org, guoren@kernel.org,
 bcain@codeaurora.org, geert@linux-m68k.org, monstr@monstr.eu,
 tsbogend@alpha.franken.de, nickhu@andestech.com, green.hu@gmail.com,
 dinguyen@kernel.org, shorne@gmail.com, deller@gmx.de,
 mpe@ellerman.id.au, peterz@infradead.org, mingo@redhat.com,
 mark.rutland@arm.com, hca@linux.ibm.com, dalias@libc.org,
 davem@davemloft.net, richard@nod.at, x86@kernel.org,
 jcmvbkbc@gmail.com, ebiederm@xmission.com,
 akpm@linux-foundation.org, ardb@kernel.org,
 linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org
Subject: Re: [PATCH v2 18/18] uaccess: drop maining CONFIG_SET_FS users
Message-ID: <Yg1F/VT4vRX4aHEt@ravnborg.org>
References: <20220216131332.1489939-1-arnd@kernel.org>
 <20220216131332.1489939-19-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220216131332.1489939-19-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220216_104423_170890_1AE866B0 
X-CRM114-Status: GOOD (  16.12  )
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

Hi Arnd,

Fix spelling in $subject...

sparc/Kconfig b/arch/sparc/Kconfig
> index 9f6f9bce5292..9276f321b3e3 100644
> --- a/arch/sparc/Kconfig
> +++ b/arch/sparc/Kconfig
> @@ -46,7 +46,6 @@ config SPARC
>  	select LOCKDEP_SMALL if LOCKDEP
>  	select NEED_DMA_MAP_STATE
>  	select NEED_SG_DMA_LENGTH
> -	select SET_FS
>  	select TRACE_IRQFLAGS_SUPPORT
>  
>  config SPARC32
> @@ -101,6 +100,7 @@ config SPARC64
>  	select HAVE_SETUP_PER_CPU_AREA
>  	select NEED_PER_CPU_EMBED_FIRST_CHUNK
>  	select NEED_PER_CPU_PAGE_FIRST_CHUNK
> +	select SET_FS
This looks wrong - looks like some merge went wrong here.

>  
>  config ARCH_PROC_KCORE_TEXT
>  	def_bool y
> diff --git a/arch/sparc/include/asm/processor_32.h b/arch/sparc/include/asm/processor_32.h
> index 647bf0ac7beb..b26c35336b51 100644
> --- a/arch/sparc/include/asm/processor_32.h
> +++ b/arch/sparc/include/asm/processor_32.h
> @@ -32,10 +32,6 @@ struct fpq {
>  };
>  #endif
>  
> -typedef struct {
> -	int seg;
> -} mm_segment_t;
> -
>  /* The Sparc processor specific thread struct. */
>  struct thread_struct {
>  	struct pt_regs *kregs;
> @@ -50,11 +46,9 @@ struct thread_struct {
>  	unsigned long   fsr;
>  	unsigned long   fpqdepth;
>  	struct fpq	fpqueue[16];
> -	mm_segment_t current_ds;
>  };
>  
>  #define INIT_THREAD  { \
> -	.current_ds = KERNEL_DS, \
>  	.kregs = (struct pt_regs *)(init_stack+THREAD_SIZE)-1 \
>  }
>  
> diff --git a/arch/sparc/include/asm/uaccess_32.h b/arch/sparc/include/asm/uaccess_32.h
> index 367747116260..9fd6c53644b6 100644
> --- a/arch/sparc/include/asm/uaccess_32.h
> +++ b/arch/sparc/include/asm/uaccess_32.h
> @@ -12,19 +12,6 @@
>  #include <linux/string.h>
>  
>  #include <asm/processor.h>
> -
> -/* Sparc is not segmented, however we need to be able to fool access_ok()
> - * when doing system calls from kernel mode legitimately.
> - *
> - * "For historical reasons, these macros are grossly misnamed." -Linus
> - */
> -
> -#define KERNEL_DS   ((mm_segment_t) { 0 })
> -#define USER_DS     ((mm_segment_t) { -1 })
> -
> -#define get_fs()	(current->thread.current_ds)
> -#define set_fs(val)	((current->thread.current_ds) = (val))
> -
>  #include <asm-generic/access_ok.h>
>  
>  /* Uh, these should become the main single-value transfer routines..
> diff --git a/arch/sparc/kernel/process_32.c b/arch/sparc/kernel/process_32.c
> index 2dc0bf9fe62e..88c0c14aaff0 100644
> --- a/arch/sparc/kernel/process_32.c
> +++ b/arch/sparc/kernel/process_32.c
> @@ -300,7 +300,6 @@ int copy_thread(unsigned long clone_flags, unsigned long sp, unsigned long arg,
>  		extern int nwindows;
>  		unsigned long psr;
>  		memset(new_stack, 0, STACKFRAME_SZ + TRACEREG_SZ);
> -		p->thread.current_ds = KERNEL_DS;
>  		ti->kpc = (((unsigned long) ret_from_kernel_thread) - 0x8);
>  		childregs->u_regs[UREG_G1] = sp; /* function */
>  		childregs->u_regs[UREG_G2] = arg;
> @@ -311,7 +310,6 @@ int copy_thread(unsigned long clone_flags, unsigned long sp, unsigned long arg,
>  	}
>  	memcpy(new_stack, (char *)regs - STACKFRAME_SZ, STACKFRAME_SZ + TRACEREG_SZ);
>  	childregs->u_regs[UREG_FP] = sp;
> -	p->thread.current_ds = USER_DS;
>  	ti->kpc = (((unsigned long) ret_from_fork) - 0x8);
>  	ti->kpsr = current->thread.fork_kpsr | PSR_PIL;
>  	ti->kwim = current->thread.fork_kwim;

Other than the above the sparc32 changes looks fine, and with the Kconf
stuff fixed:
Acked-by: Sam Ravnborg <sam@ravnborg.org> # for sparc32 changes

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
