Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAFF6C04FDF
	for <linux-snps-arc@archiver.kernel.org>; Fri, 11 Aug 2023 11:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FZlXmK/lyvKAwbEjG5zTgehUkwXKx6MdM36pqj9qDqQ=; b=zDBy0UeLYWIJgP
	LCPDJ1zz2PWOm5ORaTR/E92GP84CuA1bijtPwEJhYopG0o1xWmS5dtPvjMSawkFkN2eJlhEY7AHzj
	I7QQBbhrLPRNelMDGWZL2K+N7sF6rv5eSDSSGSPLaPApLtmgSIBzm5OArQ0g52nMaP95BkQuO5qDR
	i4v0ikcA5x41p7IuEGBYbKErq/0wkcK+zGYYhXqQqdytFQhNsebWU7eb3EmU+vxIHqb7iaQC3pbUC
	E2/UbjO0Ck8wlbd+1UjMNGPSMbCB18aY9NxaC9zyhv/X13zU+d1IG+yWSWkrg86nrTV/lSB4VBwL7
	CweTprBmtetxSduYqvMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUQb6-00AUoR-22;
	Fri, 11 Aug 2023 11:46:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUQb2-00AUmh-1i;
	Fri, 11 Aug 2023 11:46:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7BE0667056;
	Fri, 11 Aug 2023 11:46:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 534FAC433C8;
	Fri, 11 Aug 2023 11:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691754382;
	bh=nTH5cx3CuThfdvc7Jgj5ef5MX658KJ12EMD425UvHt8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=RSZKGBIx7O0baF8FzU08zN6BbDk6YyZwPVmCxL+wjL15fNlHQseYA8HmJH72lP12y
	 L1VPhNDRuN8cju6D7WcvZrrs2yopjaY/gqk1C9uZ0qoLMw7dtt9XUdHVZHU/5DuYEt
	 9PpEToYZArnWOveIXWIhJsahLeRgA2VLED/duRTAiE2ZDjg4F1yYPjbLkguvSDOXDN
	 SXDGoKe/3gocO00Jmfwu0ZfcPWS0s1JG0Yo5P3D5zD4WnVI8ZK6DBstB+1nyl1Z/7q
	 qeRlOiJgBkdHqgkKFwAvbvUnCL+Th8xrzp5JppTBfmWHrtrlPQFHqm5wB3F/N6df2o
	 JTHnY8hoHU4FQ==
Date: Fri, 11 Aug 2023 20:46:11 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Anil S Keshavamurthy
 <anil.s.keshavamurthy@intel.com>, Arnd Bergmann <arnd@arndb.de>, Vineet
 Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>, Michael Ellerman
 <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Heiko Carstens <hca@linux.ibm.com>, Vasily
 Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle
 <svens@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Rich
 Felker <dalias@libc.org>, John Paul Adrian Glaubitz
 <glaubitz@physik.fu-berlin.de>, "David S. Miller" <davem@davemloft.net>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Gaosheng Cui
 <cuigaosheng1@huawei.com>, "Steven Rostedt (Google)" <rostedt@goodmis.org>,
 Yang Jihong <yangjihong1@huawei.com>, Jiri Olsa <jolsa@kernel.org>, Alexei
 Starovoitov <ast@kernel.org>, linux-snps-arc@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH 14/17] kprobes: unify kprobes_exceptions_nofify()
 prototypes
Message-Id: <20230811204611.8498b64177e809580e9e4034@kernel.org>
In-Reply-To: <20230810141947.1236730-15-arnd@kernel.org>
References: <20230810141947.1236730-1-arnd@kernel.org>
	<20230810141947.1236730-15-arnd@kernel.org>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230811_044624_792668_A6C60D03 
X-CRM114-Status: GOOD (  22.84  )
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

On Thu, 10 Aug 2023 16:19:32 +0200
Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
> 
> Most architectures that support kprobes declare this function in their
> own asm/kprobes.h header and provide an override, but some are missing
> the prototype, which causes a warning for the __weak stub implementation:
> 
> kernel/kprobes.c:1865:12: error: no previous prototype for 'kprobe_exceptions_notify' [-Werror=missing-prototypes]
>  1865 | int __weak kprobe_exceptions_notify(struct notifier_block *self,
> 
> Move the prototype into linux/kprobes.h so it is visible to all
> the definitions.

Good catch! and it seems x86 has no implementation, so this is more resonable.

Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>

Thank you,

> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arc/include/asm/kprobes.h     | 3 ---
>  arch/arm/include/asm/kprobes.h     | 2 --
>  arch/arm64/include/asm/kprobes.h   | 2 --
>  arch/ia64/include/asm/kprobes.h    | 2 --
>  arch/mips/include/asm/kprobes.h    | 2 --
>  arch/powerpc/include/asm/kprobes.h | 2 --
>  arch/s390/include/asm/kprobes.h    | 2 --
>  arch/sh/include/asm/kprobes.h      | 2 --
>  arch/sparc/include/asm/kprobes.h   | 2 --
>  arch/x86/include/asm/kprobes.h     | 2 --
>  include/linux/kprobes.h            | 4 ++++
>  11 files changed, 4 insertions(+), 21 deletions(-)
> 
> diff --git a/arch/arc/include/asm/kprobes.h b/arch/arc/include/asm/kprobes.h
> index de1566e32cb89..68e8301c0df2c 100644
> --- a/arch/arc/include/asm/kprobes.h
> +++ b/arch/arc/include/asm/kprobes.h
> @@ -32,9 +32,6 @@ struct kprobe;
>  
>  void arch_remove_kprobe(struct kprobe *p);
>  
> -int kprobe_exceptions_notify(struct notifier_block *self,
> -			     unsigned long val, void *data);
> -
>  struct prev_kprobe {
>  	struct kprobe *kp;
>  	unsigned long status;
> diff --git a/arch/arm/include/asm/kprobes.h b/arch/arm/include/asm/kprobes.h
> index e26a278d301ab..5b8dbf1b0be49 100644
> --- a/arch/arm/include/asm/kprobes.h
> +++ b/arch/arm/include/asm/kprobes.h
> @@ -40,8 +40,6 @@ struct kprobe_ctlblk {
>  
>  void arch_remove_kprobe(struct kprobe *);
>  int kprobe_fault_handler(struct pt_regs *regs, unsigned int fsr);
> -int kprobe_exceptions_notify(struct notifier_block *self,
> -			     unsigned long val, void *data);
>  
>  /* optinsn template addresses */
>  extern __visible kprobe_opcode_t optprobe_template_entry[];
> diff --git a/arch/arm64/include/asm/kprobes.h b/arch/arm64/include/asm/kprobes.h
> index 05cd82eeca136..be7a3680dadff 100644
> --- a/arch/arm64/include/asm/kprobes.h
> +++ b/arch/arm64/include/asm/kprobes.h
> @@ -37,8 +37,6 @@ struct kprobe_ctlblk {
>  
>  void arch_remove_kprobe(struct kprobe *);
>  int kprobe_fault_handler(struct pt_regs *regs, unsigned int fsr);
> -int kprobe_exceptions_notify(struct notifier_block *self,
> -			     unsigned long val, void *data);
>  void __kretprobe_trampoline(void);
>  void __kprobes *trampoline_probe_handler(struct pt_regs *regs);
>  
> diff --git a/arch/ia64/include/asm/kprobes.h b/arch/ia64/include/asm/kprobes.h
> index 9e956768946cc..56004f97df6d2 100644
> --- a/arch/ia64/include/asm/kprobes.h
> +++ b/arch/ia64/include/asm/kprobes.h
> @@ -107,8 +107,6 @@ struct arch_specific_insn {
>  };
>  
>  extern int kprobe_fault_handler(struct pt_regs *regs, int trapnr);
> -extern int kprobe_exceptions_notify(struct notifier_block *self,
> -				    unsigned long val, void *data);
>  
>  extern void arch_remove_kprobe(struct kprobe *p);
>  
> diff --git a/arch/mips/include/asm/kprobes.h b/arch/mips/include/asm/kprobes.h
> index 68b1e5d458cfb..bc27d99c94363 100644
> --- a/arch/mips/include/asm/kprobes.h
> +++ b/arch/mips/include/asm/kprobes.h
> @@ -71,8 +71,6 @@ struct kprobe_ctlblk {
>  	struct prev_kprobe prev_kprobe;
>  };
>  
> -extern int kprobe_exceptions_notify(struct notifier_block *self,
> -				    unsigned long val, void *data);
>  
>  #endif /* CONFIG_KPROBES */
>  #endif /* _ASM_KPROBES_H */
> diff --git a/arch/powerpc/include/asm/kprobes.h b/arch/powerpc/include/asm/kprobes.h
> index c8e4b4fd4e330..4525a9c68260d 100644
> --- a/arch/powerpc/include/asm/kprobes.h
> +++ b/arch/powerpc/include/asm/kprobes.h
> @@ -84,8 +84,6 @@ struct arch_optimized_insn {
>  	kprobe_opcode_t *insn;
>  };
>  
> -extern int kprobe_exceptions_notify(struct notifier_block *self,
> -					unsigned long val, void *data);
>  extern int kprobe_fault_handler(struct pt_regs *regs, int trapnr);
>  extern int kprobe_handler(struct pt_regs *regs);
>  extern int kprobe_post_handler(struct pt_regs *regs);
> diff --git a/arch/s390/include/asm/kprobes.h b/arch/s390/include/asm/kprobes.h
> index 83f732ca3af4d..3f87125dd9b0d 100644
> --- a/arch/s390/include/asm/kprobes.h
> +++ b/arch/s390/include/asm/kprobes.h
> @@ -72,8 +72,6 @@ struct kprobe_ctlblk {
>  void arch_remove_kprobe(struct kprobe *p);
>  
>  int kprobe_fault_handler(struct pt_regs *regs, int trapnr);
> -int kprobe_exceptions_notify(struct notifier_block *self,
> -	unsigned long val, void *data);
>  
>  #define flush_insn_slot(p)	do { } while (0)
>  
> diff --git a/arch/sh/include/asm/kprobes.h b/arch/sh/include/asm/kprobes.h
> index eeba83e0a7d29..65d4c3316a5bd 100644
> --- a/arch/sh/include/asm/kprobes.h
> +++ b/arch/sh/include/asm/kprobes.h
> @@ -46,8 +46,6 @@ struct kprobe_ctlblk {
>  };
>  
>  extern int kprobe_fault_handler(struct pt_regs *regs, int trapnr);
> -extern int kprobe_exceptions_notify(struct notifier_block *self,
> -				    unsigned long val, void *data);
>  extern int kprobe_handle_illslot(unsigned long pc);
>  #else
>  
> diff --git a/arch/sparc/include/asm/kprobes.h b/arch/sparc/include/asm/kprobes.h
> index 06c2bc767ef75..aec742cd898f2 100644
> --- a/arch/sparc/include/asm/kprobes.h
> +++ b/arch/sparc/include/asm/kprobes.h
> @@ -47,8 +47,6 @@ struct kprobe_ctlblk {
>  	struct prev_kprobe prev_kprobe;
>  };
>  
> -int kprobe_exceptions_notify(struct notifier_block *self,
> -			     unsigned long val, void *data);
>  int kprobe_fault_handler(struct pt_regs *regs, int trapnr);
>  asmlinkage void __kprobes kprobe_trap(unsigned long trap_level,
>  				      struct pt_regs *regs);
> diff --git a/arch/x86/include/asm/kprobes.h b/arch/x86/include/asm/kprobes.h
> index a2e9317aad495..5939694dfb28d 100644
> --- a/arch/x86/include/asm/kprobes.h
> +++ b/arch/x86/include/asm/kprobes.h
> @@ -113,8 +113,6 @@ struct kprobe_ctlblk {
>  };
>  
>  extern int kprobe_fault_handler(struct pt_regs *regs, int trapnr);
> -extern int kprobe_exceptions_notify(struct notifier_block *self,
> -				    unsigned long val, void *data);
>  extern int kprobe_int3_handler(struct pt_regs *regs);
>  
>  #else
> diff --git a/include/linux/kprobes.h b/include/linux/kprobes.h
> index 85a64cb95d755..987911cdc90a2 100644
> --- a/include/linux/kprobes.h
> +++ b/include/linux/kprobes.h
> @@ -450,6 +450,10 @@ int kprobe_get_kallsym(unsigned int symnum, unsigned long *value, char *type,
>  
>  int arch_kprobe_get_kallsym(unsigned int *symnum, unsigned long *value,
>  			    char *type, char *sym);
> +
> +int kprobe_exceptions_notify(struct notifier_block *self,
> +			     unsigned long val, void *data);
> +
>  #else /* !CONFIG_KPROBES: */
>  
>  static inline int kprobe_fault_handler(struct pt_regs *regs, int trapnr)
> -- 
> 2.39.2
> 


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
