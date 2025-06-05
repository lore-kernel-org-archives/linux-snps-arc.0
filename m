Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F984C5B543
	for <linux-snps-arc@archiver.kernel.org>; Thu,  5 Jun 2025 19:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NXA7Xx9qU034u5WxV88jFUbf+JoDcjgyYfM1bGUlDmI=; b=F0ofIwp6Qi8PKp
	oxMlpMckrOFZ2zQdRGsRLtZjvFhNbuqVoxG+jP3cThynfhSuS3PMlyM6EvOz3dIMgmuNC8jlYbOVb
	PkRjv8mN/7uI5Z/AijskVbqHTK4aTYkRN055htxxre35OkiIj2olSkxZ3L01ioqtcz2EYlpDCQG1k
	42JxWrnccOlw5kY9enL3Fs5qHYTdbDxiha6kLFrFid+9O0hlj88KuMIXs3NXoO66jgrD8JRZGq7ts
	lB+ES23qByB3ejwbdlPNmxHKfux/jm6hn1ldNmnRLiGE+SzeuT2yPIXw80jMmW4jz4497xWTXSw23
	1Ny/XN4OzGGtPxqDXAHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNGGe-0000000GUST-2inz;
	Thu, 05 Jun 2025 19:28:48 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNFFS-0000000GEr2-20A8
	for linux-snps-arc@lists.infradead.org;
	Thu, 05 Jun 2025 18:23:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749147782;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=bcP79oYf77KKr3Aq1OEuNmrx2ZuMab64gWgZ14BsWgI=;
	b=IDalKIygfA97pB7BuZt8SgOmM2eDV0HOqb/A0nAs5NIPwz+PtgbbLvT+6/Wa6+EqhyV17v
	m8UAKf2MT2dwh0GrKuu2/aISACryp2+Mm/hEZBHHbUyyPEUOAnN7W6kFRxyzDeHy+4aQd6
	CIfXDxI6JT4m2nGcW+cjDWlB1ujdINw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-587-nGlptMrZNkekV_Re36Ni2w-1; Thu, 05 Jun 2025 14:21:26 -0400
X-MC-Unique: nGlptMrZNkekV_Re36Ni2w-1
X-Mimecast-MFC-AGG-ID: nGlptMrZNkekV_Re36Ni2w_1749147685
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-451ac1b43c4so7716715e9.0
        for <linux-snps-arc@lists.infradead.org>; Thu, 05 Jun 2025 11:21:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749147685; x=1749752485;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bcP79oYf77KKr3Aq1OEuNmrx2ZuMab64gWgZ14BsWgI=;
        b=BDQThh0FDXicSyQB3y+eRkRrFgFRPLdl+vqykBPep1tHDO0ZpeRCkCcDDUw1/8V+Cf
         jjlJ8SD6bMgC9aB+W68lcte60kTw4MkwgoDGynzGkV8k0eQeU4QdohkObt/r2uLWba2h
         LktBhUtTHWr3tOGxdSHyH5aZi0v0M1GnsEWSIbaprZyMzfEDj/J51oFNb0+QBHKo5gaa
         fCkcoqrtW7nCzDBGTwWsN19b05FTP74oBVSA0MEJr+l83iVG15ahR2qmelusPEtycE9a
         5FQk38uMSpPyL+G9CtGpWf8Qrw50s+a9FSBasI62HlbS7dVP8nE6Gh20N4iJC0Z0sA/Q
         N+LQ==
X-Gm-Message-State: AOJu0Yzj0ADoXtufRTEZHCjEbfC3gKVnFY68h34vfdMthoq75O4odlBt
	2PsPWils3/WJFtDxVp+G15Z6rNo6HwpyqE/bF8nriYmdX8L6m3RcTwnCCDksh+wl+QCeWp+o6Mk
	JY3SFBIJyQrkTAtWiF/aufkZ8CXZJjnUwwpDDZX8F5XXN0TzAdm/OjxcK+m3IAeePG5xOFfBrig
	==
X-Gm-Gg: ASbGnct5uczi+KZirSyo0m1GhXkjY4peUPFAZDbTtkUanKJesZJ/guH8ZPQbcYW5Cuc
	gnXTCk+gqodU5W1BioftgXuln1eySUsYHMcVR5YgAjDegldXbR/zB/ojDXvQRp+fdXPBIybZMsj
	XJoPKsWmU6ZSX//nb4dWngQ/qAL41oBY1pm0BQFisbZgg4aXYACQzksH/G2K0MJAvMhfJnJaVCE
	ajq6wX4+ixbA2sl5z9X7KXJFLjW/HhJM66JY6CgvII1aMpxSYn/SV7kEMod8C9TJd/LTCN0eCWJ
	K+wotdFEH2jRmVbqgO9e+tG7enczv5ZSKr1Trdj5SgEBpHB4NLCSXQ==
X-Received: by 2002:a05:600c:3583:b0:43c:fd27:a216 with SMTP id 5b1f17b1804b1-45201497a70mr2978835e9.23.1749147684609;
        Thu, 05 Jun 2025 11:21:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF195EHVKYyBbX/zwBATA2GVrlYQdseiivqa1oMP9N5MckZNSTbdPupBMDpNawtdb1p6XIt0g==
X-Received: by 2002:a05:600c:3583:b0:43c:fd27:a216 with SMTP id 5b1f17b1804b1-45201497a70mr2978525e9.23.1749147684019;
        Thu, 05 Jun 2025 11:21:24 -0700 (PDT)
Received: from [192.168.0.4] (ip-109-42-50-214.web.vodafone.de. [109.42.50.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-452137281b0sm672075e9.29.2025.06.05.11.21.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 11:21:22 -0700 (PDT)
Message-ID: <1aae3659-2b5d-4293-891d-1e19ad4800c0@redhat.com>
Date: Thu, 5 Jun 2025 20:21:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/41] arc: Replace __ASSEMBLY__ with __ASSEMBLER__ in the
 non-uapi headers
To: Vineet Gupta <vgupta@kernel.org>
Cc: linux-snps-arc@lists.infradead.org
References: <20250314071013.1575167-1-thuth@redhat.com>
 <20250314071013.1575167-6-thuth@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250314071013.1575167-6-thuth@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: aXQR7gfdruaCtzbVH9fmUUgw50MK1-9ykYpaxwd8WQ8_1749147685
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_112330_678061_F9C37EA2 
X-CRM114-Status: GOOD (  19.94  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 14/03/2025 08.09, Thomas Huth wrote:
> While the GCC and Clang compilers already define __ASSEMBLER__
> automatically when compiling assembly code, __ASSEMBLY__ is a
> macro that only gets defined by the Makefiles in the kernel.
> This can be very confusing when switching between userspace
> and kernelspace coding, or when dealing with uapi headers that
> rather should use __ASSEMBLER__ instead. So let's standardize on
> the __ASSEMBLER__ macro that is provided by the compilers now.
> 
> This is a completely mechanical patch (done with a simple "sed -i"
> statement).
> 
> Cc: Vineet Gupta <vgupta@kernel.org>
> Cc: linux-snps-arc@lists.infradead.org
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   arch/arc/include/asm/arcregs.h            | 2 +-
>   arch/arc/include/asm/atomic.h             | 4 ++--
>   arch/arc/include/asm/bitops.h             | 4 ++--
>   arch/arc/include/asm/bug.h                | 4 ++--
>   arch/arc/include/asm/cache.h              | 4 ++--
>   arch/arc/include/asm/current.h            | 4 ++--
>   arch/arc/include/asm/dsp-impl.h           | 2 +-
>   arch/arc/include/asm/dsp.h                | 4 ++--
>   arch/arc/include/asm/dwarf.h              | 4 ++--
>   arch/arc/include/asm/entry.h              | 4 ++--
>   arch/arc/include/asm/irqflags-arcv2.h     | 4 ++--
>   arch/arc/include/asm/irqflags-compact.h   | 4 ++--
>   arch/arc/include/asm/jump_label.h         | 4 ++--
>   arch/arc/include/asm/linkage.h            | 6 +++---
>   arch/arc/include/asm/mmu-arcv2.h          | 4 ++--
>   arch/arc/include/asm/mmu.h                | 2 +-
>   arch/arc/include/asm/page.h               | 4 ++--
>   arch/arc/include/asm/pgtable-bits-arcv2.h | 4 ++--
>   arch/arc/include/asm/pgtable-levels.h     | 4 ++--
>   arch/arc/include/asm/pgtable.h            | 4 ++--
>   arch/arc/include/asm/processor.h          | 4 ++--
>   arch/arc/include/asm/ptrace.h             | 4 ++--
>   arch/arc/include/asm/switch_to.h          | 2 +-
>   arch/arc/include/asm/thread_info.h        | 4 ++--
>   24 files changed, 45 insertions(+), 45 deletions(-)
> 
> diff --git a/arch/arc/include/asm/arcregs.h b/arch/arc/include/asm/arcregs.h
> index 005d9e4d187a0..a31bbf5c8bbc8 100644
> --- a/arch/arc/include/asm/arcregs.h
> +++ b/arch/arc/include/asm/arcregs.h
> @@ -144,7 +144,7 @@
>   #define ARC_AUX_AGU_MOD2	0x5E2
>   #define ARC_AUX_AGU_MOD3	0x5E3
>   
> -#ifndef __ASSEMBLY__
> +#ifndef __ASSEMBLER__
>   
>   #include <soc/arc/arc_aux.h>
>   
> diff --git a/arch/arc/include/asm/atomic.h b/arch/arc/include/asm/atomic.h
> index 592d7fffc223c..e615c42b93bab 100644
> --- a/arch/arc/include/asm/atomic.h
> +++ b/arch/arc/include/asm/atomic.h
> @@ -6,7 +6,7 @@
>   #ifndef _ASM_ARC_ATOMIC_H
>   #define _ASM_ARC_ATOMIC_H
>   
> -#ifndef __ASSEMBLY__
> +#ifndef __ASSEMBLER__
>   
>   #include <linux/types.h>
>   #include <linux/compiler.h>
> @@ -31,6 +31,6 @@
>   #include <asm/atomic64-arcv2.h>
>   #endif
>   
> -#endif	/* !__ASSEMBLY__ */
> +#endif	/* !__ASSEMBLER__ */
>   
>   #endif
> diff --git a/arch/arc/include/asm/bitops.h b/arch/arc/include/asm/bitops.h
> index f5a936496f060..5340c28713927 100644
> --- a/arch/arc/include/asm/bitops.h
> +++ b/arch/arc/include/asm/bitops.h
> @@ -10,7 +10,7 @@
>   #error only <linux/bitops.h> can be included directly
>   #endif
>   
> -#ifndef __ASSEMBLY__
> +#ifndef __ASSEMBLER__
>   
>   #include <linux/types.h>
>   #include <linux/compiler.h>
> @@ -192,6 +192,6 @@ static inline __attribute__ ((const)) unsigned long __ffs(unsigned long x)
>   #include <asm-generic/bitops/le.h>
>   #include <asm-generic/bitops/ext2-atomic-setbit.h>
>   
> -#endif /* !__ASSEMBLY__ */
> +#endif /* !__ASSEMBLER__ */
>   
>   #endif
> diff --git a/arch/arc/include/asm/bug.h b/arch/arc/include/asm/bug.h
> index 4c453ba96c519..171c16021f709 100644
> --- a/arch/arc/include/asm/bug.h
> +++ b/arch/arc/include/asm/bug.h
> @@ -6,7 +6,7 @@
>   #ifndef _ASM_ARC_BUG_H
>   #define _ASM_ARC_BUG_H
>   
> -#ifndef __ASSEMBLY__
> +#ifndef __ASSEMBLER__
>   
>   #include <asm/ptrace.h>
>   
> @@ -29,6 +29,6 @@ void die(const char *str, struct pt_regs *regs, unsigned long address);
>   
>   #include <asm-generic/bug.h>
>   
> -#endif	/* !__ASSEMBLY__ */
> +#endif	/* !__ASSEMBLER__ */
>   
>   #endif
> diff --git a/arch/arc/include/asm/cache.h b/arch/arc/include/asm/cache.h
> index f0f1fc5d62b66..040a97f4dd829 100644
> --- a/arch/arc/include/asm/cache.h
> +++ b/arch/arc/include/asm/cache.h
> @@ -23,7 +23,7 @@
>    */
>   #define ARC_UNCACHED_ADDR_SPACE	0xc0000000
>   
> -#ifndef __ASSEMBLY__
> +#ifndef __ASSEMBLER__
>   
>   #include <linux/build_bug.h>
>   
> @@ -65,7 +65,7 @@
>   extern int ioc_enable;
>   extern unsigned long perip_base, perip_end;
>   
> -#endif	/* !__ASSEMBLY__ */
> +#endif	/* !__ASSEMBLER__ */
>   
>   /* Instruction cache related Auxiliary registers */
>   #define ARC_REG_IC_BCR		0x77	/* Build Config reg */
> diff --git a/arch/arc/include/asm/current.h b/arch/arc/include/asm/current.h
> index 06be89f6f2f05..03ffd005f3fa6 100644
> --- a/arch/arc/include/asm/current.h
> +++ b/arch/arc/include/asm/current.h
> @@ -9,7 +9,7 @@
>   #ifndef _ASM_ARC_CURRENT_H
>   #define _ASM_ARC_CURRENT_H
>   
> -#ifndef __ASSEMBLY__
> +#ifndef __ASSEMBLER__
>   
>   #ifdef CONFIG_ARC_CURR_IN_REG
>   
> @@ -20,6 +20,6 @@ register struct task_struct *curr_arc asm("gp");
>   #include <asm-generic/current.h>
>   #endif /* ! CONFIG_ARC_CURR_IN_REG */
>   
> -#endif /* ! __ASSEMBLY__ */
> +#endif /* ! __ASSEMBLER__ */
>   
>   #endif /* _ASM_ARC_CURRENT_H */
> diff --git a/arch/arc/include/asm/dsp-impl.h b/arch/arc/include/asm/dsp-impl.h
> index cd5636dfeb6f4..fd5fdaad90c16 100644
> --- a/arch/arc/include/asm/dsp-impl.h
> +++ b/arch/arc/include/asm/dsp-impl.h
> @@ -11,7 +11,7 @@
>   
>   #define DSP_CTRL_DISABLED_ALL		0
>   
> -#ifdef __ASSEMBLY__
> +#ifdef __ASSEMBLER__
>   
>   /* clobbers r5 register */
>   .macro DSP_EARLY_INIT
> diff --git a/arch/arc/include/asm/dsp.h b/arch/arc/include/asm/dsp.h
> index f496dbc4640b2..eeaaf4e4eabd3 100644
> --- a/arch/arc/include/asm/dsp.h
> +++ b/arch/arc/include/asm/dsp.h
> @@ -7,7 +7,7 @@
>   #ifndef __ASM_ARC_DSP_H
>   #define __ASM_ARC_DSP_H
>   
> -#ifndef __ASSEMBLY__
> +#ifndef __ASSEMBLER__
>   
>   /*
>    * DSP-related saved registers - need to be saved only when you are
> @@ -24,6 +24,6 @@ struct dsp_callee_regs {
>   #endif
>   };
>   
> -#endif /* !__ASSEMBLY__ */
> +#endif /* !__ASSEMBLER__ */
>   
>   #endif /* __ASM_ARC_DSP_H */
> diff --git a/arch/arc/include/asm/dwarf.h b/arch/arc/include/asm/dwarf.h
> index a0d5ebe1bc3f5..1524c5cf8b59e 100644
> --- a/arch/arc/include/asm/dwarf.h
> +++ b/arch/arc/include/asm/dwarf.h
> @@ -6,7 +6,7 @@
>   #ifndef _ASM_ARC_DWARF_H
>   #define _ASM_ARC_DWARF_H
>   
> -#ifdef __ASSEMBLY__
> +#ifdef __ASSEMBLER__
>   
>   #ifdef ARC_DW2_UNWIND_AS_CFI
>   
> @@ -38,6 +38,6 @@
>   
>   #endif	/* !ARC_DW2_UNWIND_AS_CFI */
>   
> -#endif	/* __ASSEMBLY__ */
> +#endif	/* __ASSEMBLER__ */
>   
>   #endif	/* _ASM_ARC_DWARF_H */
> diff --git a/arch/arc/include/asm/entry.h b/arch/arc/include/asm/entry.h
> index 38c35722cebf0..f453af251a1a1 100644
> --- a/arch/arc/include/asm/entry.h
> +++ b/arch/arc/include/asm/entry.h
> @@ -13,7 +13,7 @@
>   #include <asm/processor.h>	/* For VMALLOC_START */
>   #include <asm/mmu.h>
>   
> -#ifdef __ASSEMBLY__
> +#ifdef __ASSEMBLER__
>   
>   #ifdef CONFIG_ISA_ARCOMPACT
>   #include <asm/entry-compact.h>	/* ISA specific bits */
> @@ -146,7 +146,7 @@
>   
>   #endif	/* CONFIG_ARC_CURR_IN_REG */
>   
> -#else	/* !__ASSEMBLY__ */
> +#else	/* !__ASSEMBLER__ */
>   
>   extern void do_signal(struct pt_regs *);
>   extern void do_notify_resume(struct pt_regs *);
> diff --git a/arch/arc/include/asm/irqflags-arcv2.h b/arch/arc/include/asm/irqflags-arcv2.h
> index fb3c21f1a2383..30aea562f8aa6 100644
> --- a/arch/arc/include/asm/irqflags-arcv2.h
> +++ b/arch/arc/include/asm/irqflags-arcv2.h
> @@ -50,7 +50,7 @@
>   #define ISA_INIT_STATUS_BITS	(STATUS_IE_MASK | __AD_ENB | \
>   					(ARCV2_IRQ_DEF_PRIO << 1))
>   
> -#ifndef __ASSEMBLY__
> +#ifndef __ASSEMBLER__
>   
>   /*
>    * Save IRQ state and disable IRQs
> @@ -170,6 +170,6 @@ static inline void arc_softirq_clear(int irq)
>   	seti
>   .endm
>   
> -#endif	/* __ASSEMBLY__ */
> +#endif	/* __ASSEMBLER__ */
>   
>   #endif
> diff --git a/arch/arc/include/asm/irqflags-compact.h b/arch/arc/include/asm/irqflags-compact.h
> index 936a2f21f315e..85c2f6bcde0c1 100644
> --- a/arch/arc/include/asm/irqflags-compact.h
> +++ b/arch/arc/include/asm/irqflags-compact.h
> @@ -40,7 +40,7 @@
>   
>   #define ISA_INIT_STATUS_BITS	STATUS_IE_MASK
>   
> -#ifndef __ASSEMBLY__
> +#ifndef __ASSEMBLER__
>   
>   /******************************************************************
>    * IRQ Control Macros
> @@ -196,6 +196,6 @@ static inline int arch_irqs_disabled(void)
>   	flag	\scratch
>   .endm
>   
> -#endif	/* __ASSEMBLY__ */
> +#endif	/* __ASSEMBLER__ */
>   
>   #endif
> diff --git a/arch/arc/include/asm/jump_label.h b/arch/arc/include/asm/jump_label.h
> index a339223d9e052..66ead75784d97 100644
> --- a/arch/arc/include/asm/jump_label.h
> +++ b/arch/arc/include/asm/jump_label.h
> @@ -2,7 +2,7 @@
>   #ifndef _ASM_ARC_JUMP_LABEL_H
>   #define _ASM_ARC_JUMP_LABEL_H
>   
> -#ifndef __ASSEMBLY__
> +#ifndef __ASSEMBLER__
>   
>   #include <linux/stringify.h>
>   #include <linux/types.h>
> @@ -68,5 +68,5 @@ struct jump_entry {
>   	jump_label_t key;
>   };
>   
> -#endif  /* __ASSEMBLY__ */
> +#endif  /* __ASSEMBLER__ */
>   #endif
> diff --git a/arch/arc/include/asm/linkage.h b/arch/arc/include/asm/linkage.h
> index 8a3fb71e9cfad..ba3cb65b5eaa4 100644
> --- a/arch/arc/include/asm/linkage.h
> +++ b/arch/arc/include/asm/linkage.h
> @@ -12,7 +12,7 @@
>   #define __ALIGN		.align 4
>   #define __ALIGN_STR	__stringify(__ALIGN)
>   
> -#ifdef __ASSEMBLY__
> +#ifdef __ASSEMBLER__
>   
>   .macro ST2 e, o, off
>   #ifdef CONFIG_ARC_HAS_LL64
> @@ -61,7 +61,7 @@
>   	CFI_ENDPROC ASM_NL	\
>   	.size name, .-name
>   
> -#else	/* !__ASSEMBLY__ */
> +#else	/* !__ASSEMBLER__ */
>   
>   #ifdef CONFIG_ARC_HAS_ICCM
>   #define __arcfp_code __section(".text.arcfp")
> @@ -75,6 +75,6 @@
>   #define __arcfp_data __section(".data")
>   #endif
>   
> -#endif /* __ASSEMBLY__ */
> +#endif /* __ASSEMBLER__ */
>   
>   #endif
> diff --git a/arch/arc/include/asm/mmu-arcv2.h b/arch/arc/include/asm/mmu-arcv2.h
> index 41412642f2796..5e5482026ac90 100644
> --- a/arch/arc/include/asm/mmu-arcv2.h
> +++ b/arch/arc/include/asm/mmu-arcv2.h
> @@ -69,7 +69,7 @@
>   
>   #define PTE_BITS_NON_RWX_IN_PD1	(PAGE_MASK_PHYS | _PAGE_CACHEABLE)
>   
> -#ifndef __ASSEMBLY__
> +#ifndef __ASSEMBLER__
>   
>   struct mm_struct;
>   extern int pae40_exist_but_not_enab(void);
> @@ -100,6 +100,6 @@ static inline void mmu_setup_pgd(struct mm_struct *mm, void *pgd)
>   	sr \reg, [ARC_REG_PID]
>   .endm
>   
> -#endif /* !__ASSEMBLY__ */
> +#endif /* !__ASSEMBLER__ */
>   
>   #endif
> diff --git a/arch/arc/include/asm/mmu.h b/arch/arc/include/asm/mmu.h
> index 4ae2db59d494c..e3b35ceab582b 100644
> --- a/arch/arc/include/asm/mmu.h
> +++ b/arch/arc/include/asm/mmu.h
> @@ -6,7 +6,7 @@
>   #ifndef _ASM_ARC_MMU_H
>   #define _ASM_ARC_MMU_H
>   
> -#ifndef __ASSEMBLY__
> +#ifndef __ASSEMBLER__
>   
>   #include <linux/threads.h>	/* NR_CPUS */
>   
> diff --git a/arch/arc/include/asm/page.h b/arch/arc/include/asm/page.h
> index def0dfb95b436..9720fe6b2c245 100644
> --- a/arch/arc/include/asm/page.h
> +++ b/arch/arc/include/asm/page.h
> @@ -19,7 +19,7 @@
>   
>   #endif /* CONFIG_ARC_HAS_PAE40 */
>   
> -#ifndef __ASSEMBLY__
> +#ifndef __ASSEMBLER__
>   
>   #define clear_page(paddr)		memset((paddr), 0, PAGE_SIZE)
>   #define copy_user_page(to, from, vaddr, pg)	copy_page(to, from)
> @@ -136,6 +136,6 @@ static inline unsigned long virt_to_pfn(const void *kaddr)
>   #include <asm-generic/memory_model.h>   /* page_to_pfn, pfn_to_page */
>   #include <asm-generic/getorder.h>
>   
> -#endif /* !__ASSEMBLY__ */
> +#endif /* !__ASSEMBLER__ */
>   
>   #endif
> diff --git a/arch/arc/include/asm/pgtable-bits-arcv2.h b/arch/arc/include/asm/pgtable-bits-arcv2.h
> index 8ebec1b21d246..a8fdb4fe1fbd6 100644
> --- a/arch/arc/include/asm/pgtable-bits-arcv2.h
> +++ b/arch/arc/include/asm/pgtable-bits-arcv2.h
> @@ -75,7 +75,7 @@
>    *     This is to enable COW mechanism
>    */
>   	/* xwr */
> -#ifndef __ASSEMBLY__
> +#ifndef __ASSEMBLER__
>   
>   #define pte_write(pte)		(pte_val(pte) & _PAGE_WRITE)
>   #define pte_dirty(pte)		(pte_val(pte) & _PAGE_DIRTY)
> @@ -142,6 +142,6 @@ PTE_BIT_FUNC(swp_clear_exclusive, &= ~(_PAGE_SWP_EXCLUSIVE));
>   #include <asm/hugepage.h>
>   #endif
>   
> -#endif /* __ASSEMBLY__ */
> +#endif /* __ASSEMBLER__ */
>   
>   #endif
> diff --git a/arch/arc/include/asm/pgtable-levels.h b/arch/arc/include/asm/pgtable-levels.h
> index 86e1482264630..e7680b74e2c68 100644
> --- a/arch/arc/include/asm/pgtable-levels.h
> +++ b/arch/arc/include/asm/pgtable-levels.h
> @@ -85,7 +85,7 @@
>   
>   #define PTRS_PER_PTE		BIT(PMD_SHIFT - PAGE_SHIFT)
>   
> -#ifndef __ASSEMBLY__
> +#ifndef __ASSEMBLER__
>   
>   #if CONFIG_PGTABLE_LEVELS > 3
>   #include <asm-generic/pgtable-nop4d.h>
> @@ -183,6 +183,6 @@
>   #define pmd_leaf(x)		(pmd_val(x) & _PAGE_HW_SZ)
>   #endif
>   
> -#endif	/* !__ASSEMBLY__ */
> +#endif	/* !__ASSEMBLER__ */
>   
>   #endif
> diff --git a/arch/arc/include/asm/pgtable.h b/arch/arc/include/asm/pgtable.h
> index 4cf45a99fd792..bd580e2b62d7c 100644
> --- a/arch/arc/include/asm/pgtable.h
> +++ b/arch/arc/include/asm/pgtable.h
> @@ -19,7 +19,7 @@
>    */
>   #define	USER_PTRS_PER_PGD	(TASK_SIZE / PGDIR_SIZE)
>   
> -#ifndef __ASSEMBLY__
> +#ifndef __ASSEMBLER__
>   
>   extern char empty_zero_page[PAGE_SIZE];
>   #define ZERO_PAGE(vaddr)	(virt_to_page(empty_zero_page))
> @@ -29,6 +29,6 @@ extern pgd_t swapper_pg_dir[] __aligned(PAGE_SIZE);
>   /* to cope with aliasing VIPT cache */
>   #define HAVE_ARCH_UNMAPPED_AREA
>   
> -#endif /* __ASSEMBLY__ */
> +#endif /* __ASSEMBLER__ */
>   
>   #endif
> diff --git a/arch/arc/include/asm/processor.h b/arch/arc/include/asm/processor.h
> index d606658e2fe73..7f7901ac6643c 100644
> --- a/arch/arc/include/asm/processor.h
> +++ b/arch/arc/include/asm/processor.h
> @@ -11,7 +11,7 @@
>   #ifndef __ASM_ARC_PROCESSOR_H
>   #define __ASM_ARC_PROCESSOR_H
>   
> -#ifndef __ASSEMBLY__
> +#ifndef __ASSEMBLER__
>   
>   #include <asm/ptrace.h>
>   #include <asm/dsp.h>
> @@ -66,7 +66,7 @@ extern void start_thread(struct pt_regs * regs, unsigned long pc,
>   
>   extern unsigned int __get_wchan(struct task_struct *p);
>   
> -#endif /* !__ASSEMBLY__ */
> +#endif /* !__ASSEMBLER__ */
>   
>   /*
>    * Default System Memory Map on ARC
> diff --git a/arch/arc/include/asm/ptrace.h b/arch/arc/include/asm/ptrace.h
> index cf79df0b25705..f6c052af8f4d3 100644
> --- a/arch/arc/include/asm/ptrace.h
> +++ b/arch/arc/include/asm/ptrace.h
> @@ -10,7 +10,7 @@
>   #include <uapi/asm/ptrace.h>
>   #include <linux/compiler.h>
>   
> -#ifndef __ASSEMBLY__
> +#ifndef __ASSEMBLER__
>   
>   typedef union {
>   	struct {
> @@ -172,6 +172,6 @@ static inline unsigned long regs_get_register(struct pt_regs *regs,
>   extern int syscall_trace_enter(struct pt_regs *);
>   extern void syscall_trace_exit(struct pt_regs *);
>   
> -#endif /* !__ASSEMBLY__ */
> +#endif /* !__ASSEMBLER__ */
>   
>   #endif /* __ASM_PTRACE_H */
> diff --git a/arch/arc/include/asm/switch_to.h b/arch/arc/include/asm/switch_to.h
> index 1f85de8288b17..5806106a65f90 100644
> --- a/arch/arc/include/asm/switch_to.h
> +++ b/arch/arc/include/asm/switch_to.h
> @@ -6,7 +6,7 @@
>   #ifndef _ASM_ARC_SWITCH_TO_H
>   #define _ASM_ARC_SWITCH_TO_H
>   
> -#ifndef __ASSEMBLY__
> +#ifndef __ASSEMBLER__
>   
>   #include <linux/sched.h>
>   #include <asm/dsp-impl.h>
> diff --git a/arch/arc/include/asm/thread_info.h b/arch/arc/include/asm/thread_info.h
> index 12daaf3a61eaf..255d2c7742190 100644
> --- a/arch/arc/include/asm/thread_info.h
> +++ b/arch/arc/include/asm/thread_info.h
> @@ -24,7 +24,7 @@
>   #define THREAD_SIZE     (PAGE_SIZE << THREAD_SIZE_ORDER)
>   #define THREAD_SHIFT	(PAGE_SHIFT << THREAD_SIZE_ORDER)
>   
> -#ifndef __ASSEMBLY__
> +#ifndef __ASSEMBLER__
>   
>   #include <linux/thread_info.h>
>   
> @@ -62,7 +62,7 @@ static inline __attribute_const__ struct thread_info *current_thread_info(void)
>   	return (struct thread_info *)(sp & ~(THREAD_SIZE - 1));
>   }
>   
> -#endif /* !__ASSEMBLY__ */
> +#endif /* !__ASSEMBLER__ */
>   
>   /*
>    * thread information flags

Friendly ping!

Vineet, could you maybe pick this (and the previous patch) up via your arc 
tree? (x86 and parisc already got merge via their respective architecture 
trees, so I guess the same should happen for this patch here, too).

  Thanks,
   Thomas


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
