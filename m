Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FF7CC43458
	for <linux-snps-arc@archiver.kernel.org>; Thu,  9 Jul 2026 18:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aTimFX2Eha9Tf7XBfSkZAeqLrVcfKnrDziNIHWdOroU=; b=byp2I9wovOc6zD
	PoAa1HqV9Kv1qqxt/xvapedrIEqgKq2Y3p+Q1PEQU+pDsK6SRpJSSb9o6Hj2cjD+FIiWoCCvVxwGx
	2mKUgnaheNrw6j90GvuYqthDh10WNJCYmL1gKm4rBrN+efSZjGwxS0US67NBGN7KvIhUpmytkqi5O
	A7QtxXajbqG/sz+v/9Oh2YWk8+pD+Nx4QlzrECsaYsQWeFORvtW53ea2mNDhl0BClp7MF7ZQcjLhw
	LrXby1OU3RcppFTJa19Ym4vSt83S+wyBdJJKLL2+xyB/k23IgrFlFyWd/iqvjxb6wiVoVALdU+eOM
	m7QkkLqYwlpaevwwtADQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whta9-00000003ELn-4BSM;
	Thu, 09 Jul 2026 18:34:45 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whta6-00000003EJf-00Fj
	for linux-snps-arc@lists.infradead.org;
	Thu, 09 Jul 2026 18:34:44 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-380cda7f00cso245907a91.0
        for <linux-snps-arc@lists.infradead.org>; Thu, 09 Jul 2026 11:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783622081; x=1784226881; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yghYN6q10g6FdWlsVt4/TtDo8QYt/j/TS6a9b2++LOM=;
        b=pNEVjQZ6RAMv6XHtR22T+oX3hwvxlHEpKcDTeF6Oj0VrYICFKteR3OCeo9yqVMvQ01
         wsjOni2cRpwfdZWGngVQ3ymiX+QIFmbGtR5C7lofDBeY9khs40+t/de+E8k2/GSnosWq
         jyLZ4pphXSW9nzEgSY8uR8WSQzGoFnYSHKy6GZ3pcmu+JwihystTZLR3oX0HhfiBMiKQ
         kzGwWMUDuysx8YF27mqs3gDEqkoNJ54norBulQ53EVem3dvQYAciuO81E8ldjJ4QHC0G
         YuU7NqcaPANxRZGgHMv79CMKT7Zf7RzfdJNe/B1J3oNClmxB01wx43+lTHhj9Furnkfd
         avMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783622081; x=1784226881;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yghYN6q10g6FdWlsVt4/TtDo8QYt/j/TS6a9b2++LOM=;
        b=h/KPMZHMsoBEwTtBRhf7OvRZnmLQbX9DO1r4qE9b5N40ytk32zG3opjQQE+oTWI9rR
         GCfoDwETEp3kAYvpolJF3mf1quYziGNdIvh1qFoTBZBdB0W4PfI6oKcga5q/OzFPfEO7
         eyV72+MxzWZLhL4Syg1iBtgt6cDGIzg5pT7hL2F0KDh21A568cxlmzKdFYfSWKNej1Xy
         TidqxCIB1DV3ovil+FAXpP+WbKl53ezUh+YWVkhnR3vuOjRl9dAtb7Ou8y/9AGD+1mlQ
         jfbrxcVOw1YTVAN267rSKeb/MtJSytWNHgJc8lrwQ/2a/S9GHZ1X1mvLtznSovCalkAs
         dnEA==
X-Forwarded-Encrypted: i=1; AHgh+RpFZaavZVt1pW66dg+Af65FuQqlbRFK7KroQeubNt6TiGFekU8LOnq3rvmx7U5bjJ9CK/zUyG0Iy384Hyiqwg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwG39/Jj7OVdZanIg0L+lasmurdB0vTDHpQ0bWvN+3fvjW48jEL
	wEiSNh3Obn7s2K3ahZaDmwYJ/ot0BYSP/+iN8IKMf7WEuppCJtucU2U+
X-Gm-Gg: AfdE7ckdH5FXXxLcHu0kEwux5RG0r8pQgfyxsJyzzep6+PBoHjeM6YPyGjbAdIPfhRz
	xvdHXE6a04VS481p9wYq4ZwHpStcDixyZKX8yFkvrYP6Yc+XSKA4FZAJfrqHxFiXxwSXwuhhOJK
	9hHRzYMlDjZVgwlHvHy18c2dDp+gjLutnuyNHQvycd9CDBnzD9Ds/wQxPqty0Ntrdzk9tev2oTG
	22oMmXtlfc/QROL6UuBKlEDm3zdYBp4VOhwL0Ni6Uxr999wbdB+0BUs6ENn4clc2gDqxBCXN++E
	/SkzQxe/EYHsOvQfjuNe6LNBT3l8yu9kc2J36t0Aw2p2sPx45kEeoqCkzUsl57a8A0vFf/z11tn
	nVzic9/luBpO4dmhmL83At3XJ4imR6lnsbMitnyjTnTbN3k7apSgWiePHWMwGtnBDx8lyPZDeMp
	c6SAVxIRA6jvvRppVMpFqODHYSHdBNbutjKPSpd5+SRYA+J+0reaUOQrfoaiLG
X-Received: by 2002:a17:90b:2752:b0:37e:10d1:c05b with SMTP id 98e67ed59e1d1-389417e4858mr8140301a91.22.1783622081049;
        Thu, 09 Jul 2026 11:34:41 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.160.236])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311a6115e61sm11123455eec.22.2026.07.09.11.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 11:34:40 -0700 (PDT)
Date: Fri, 10 Jul 2026 00:04:21 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Kees Cook <kees@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Shrikanth Hegde <sshegde@linux.ibm.com>, 
	linuxppc-dev@lists.ozlabs.org, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	linux-riscv@lists.infradead.org, Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org, 
	x86@kernel.org, Mark Rutland <mark.rutland@arm.com>, 
	Jinjie Ruan <ruanjinjie@huawei.com>, Andy Lutomirski <luto@kernel.org>, 
	Oleg Nesterov <oleg@redhat.com>, Richard Henderson <richard.henderson@linaro.org>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Guo Ren <guoren@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Helge Deller <deller@gmx.de>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Richard Weinberger <richard@nod.at>, 
	Chris Zankel <chris@zankel.net>, linux-arm-kernel@lists.infradead.org, 
	linux-alpha@vger.kernel.org, linux-csky@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-um@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, Vineet Gupta <vgupta@kernel.org>, 
	Will Deacon <will@kernel.org>, Brian Cain <bcain@kernel.org>, Michal Simek <monstr@monstr.eu>, 
	Dinh Nguyen <dinguyen@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Andreas Larsson <andreas@gaisler.com>, linux-snps-arc@lists.infradead.org, 
	linux-hexagon@vger.kernel.org, linux-openrisc@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-arch@vger.kernel.org, Michal =?utf-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>, 
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [patch 02/18] randomize_kstack: Provide
 add_random_kstack_offset_irqsoff()
Message-ID: <ak_piRRvfiMc9m7N@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260707181957.433213175@kernel.org>
 <20260707190253.768842729@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260707190253.768842729@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_113442_101270_9ADC7408 
X-CRM114-Status: GOOD (  19.46  )
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

On Tue, Jul 07, 2026 at 09:06:02PM +0200, Thomas Gleixner wrote:
> add_random_kstack_offset() uses get/put_cpu_var() which is pointless
> overhead when it is invoked from low level entry code with interrupts
> disabled.
> 
> Provide a irqsoff() variant, which avoids that.
> 
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> Cc: Kees Cook <kees@kernel.org>
> ---
>  include/linux/randomize_kstack.h |   19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> --- a/include/linux/randomize_kstack.h
> +++ b/include/linux/randomize_kstack.h
> @@ -77,8 +77,27 @@ static __always_inline u32 get_kstack_of
>  	}								\
>  } while (0)
>  
> +/**
> + * add_random_kstack_offset_irqsoff - Increase stack utilization by a random offset.
> + *
> + * This should be used in the syscall entry path after user registers have been
> + * stored to the stack. Interrupts must be still disabled.
> + */
> +#define add_random_kstack_offset_irqsoff()					\
> +do {										\
> +	lockdep_assert_irqs_disabled();						\
> +	if (static_branch_maybe(CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT,		\
> +				&randomize_kstack_offset)) {			\
> +		u32 offset = prandom_u32_state(raw_cpu_ptr(&kstack_rnd_state));	\
> +		u8 *ptr = __kstack_alloca(KSTACK_OFFSET_MAX(offset));		\
> +		/* Keep allocation even after "ptr" loses scope. */		\
> +		asm volatile("" :: "r"(ptr) : "memory");			\
> +	}									\
> +} while (0)
> +
>  #else /* CONFIG_RANDOMIZE_KSTACK_OFFSET */
>  #define add_random_kstack_offset()		do { } while (0)
> +#define add_random_kstack_offset_irqsoff()	do { } while (0)
>  #endif /* CONFIG_RANDOMIZE_KSTACK_OFFSET */
>  
>  #endif
> 
LGTM.

Reviewed-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
> 
> _______________________________________________
> linux-snps-arc mailing list
> linux-snps-arc@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-snps-arc

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
