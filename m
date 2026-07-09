Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 257B5C44501
	for <linux-snps-arc@archiver.kernel.org>; Thu,  9 Jul 2026 20:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HDChR1ghMaKYOv3X78lX817qJyaAImmh5WALGnwLjiI=; b=NY6zhC3mEdMFyc
	QGykYL9lnV+5pfHrrDvkv7NG1jR/iqA5kZuymzdrlH0b7oHNRdr93VBQ+VPz7zDwAQGpbmO+ddz4x
	gHN3MnYy9AnGOs3prJt0qXN5PeAVLOGRuru0/AMhrR4RBnVoQHORR33PiT8CyDBAceXVVeMSIXwXV
	7X8dalCQYASeF0q0vraEa4cVfg2IAshtbsCReUaeA/cjwAhvw4kyUNV5cX4Xs2pUXGUr9YdzVpeR8
	Hsvg6SRAnmDV52BhnQ7zmn04ocSGR3qTUuUrGH5fZWKOnl9aIYMlFYLVVXBCuzGuhCEW+UiFIbQZc
	uYo0BM5vbhvw4hZp0gjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whvAl-00000003Yia-3JYC;
	Thu, 09 Jul 2026 20:16:39 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whvAj-00000003YhB-0CAH
	for linux-snps-arc@lists.infradead.org;
	Thu, 09 Jul 2026 20:16:38 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2cae1a3a744so1031345ad.3
        for <linux-snps-arc@lists.infradead.org>; Thu, 09 Jul 2026 13:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783628196; x=1784232996; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5lqgggpghOuMWXpzCLQ94POSykk42wtAfFSu9QYNYOQ=;
        b=pNxS+le+KmzpDMn+vGEZnj2x96cbf9RfAwJa06bwjPq2gIIO70MRL+ECGZtTwznmFD
         EKtM+eFUqneshwo/PtAtMOYw3iDFKxyrN1VlCwWnEqii6hclcINUsGHDeaoCrPz8RZA3
         aNLT7A9W7MUvYE0yGqcp3ojXOWRtbHrmW2l9zjh1688ssUWYv2EKwI8buvzespevH/t8
         XnwwV1trN8Vuib7P3K7lJ6AvuupSHPjwVWh0b2I5OB+KgxaEpaUTUp2U/9qTGV02DtzK
         NbGiCZXZuD4NeWOVNEy9Eefwi+o8AuoDNdz6BIS6TJ1Lqah188M191RJRQqqXIrfbVUR
         K0zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783628196; x=1784232996;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5lqgggpghOuMWXpzCLQ94POSykk42wtAfFSu9QYNYOQ=;
        b=N4S9nbjv9AyLczWzjToATK52gPsm2c3Y4rM4nTMClKg4jyRvtEzqlLFwfMlVp9rsjY
         mYTbEQWIg7zSs+D3VoSVQjan2UMPiDGESZBp0Fjjo+IvwxZnpjKenAnsR2HBqn08T5ss
         kAGU8ghIH1vo53hDqVZLmVhNL1WJj+bZ5aw3ETZM59xVWxxZT3xXyBeLLn4VavM1mKLd
         77VRiCKrAwYOjF98gz4wl8bOIvuBG7V4LBe1sroR6+e9hYQ0JpW1mkbWo+ILSRZWEJWw
         JKBpo8ZYcRKsB+dRUKLaDBUndFyRGmrhqyHnPdZ0tW20Jwkx/scfk1T+QDy+Y4gKjYfd
         sg1w==
X-Forwarded-Encrypted: i=1; AHgh+RqjCLmjG5XDaRUhI5qAPn8ptLFttqs7bbM6+Doyf2+7E2LN5Ea3Ytb+bgO+aWcF1f5jvVxr33etj7QtiiNs7g==@lists.infradead.org
X-Gm-Message-State: AOJu0YyQRCCUVv9EJpH38EL/DhVE/fZDScyVkDxIfZL5I/e2ctFfFwi2
	gJ9G8L5l2aSXtWxaWsCbWAZE500itKWZlaaLZykTAl8bmlgxKIuzhLTw
X-Gm-Gg: AfdE7cnsxrFNP136PXIjvSLVatkxspT6FsnoYxYYAUOVHlRF2agESy0UeN7gXRdO5rr
	JlcsL/WhcLG/VwH3vcplY5JmPz4IjajVdwftpAizarFPzBNkj5Dhw29oehkhjUvVFMOxQBD41Wh
	k8u6WIEcyM/XEix4IjGqHUW2NauaaDUeU1woDpF08YDnqP4N0BmkEUZUiZxSnaTVomm0iwg+af2
	PzgsD2PD9Qv8Vdsa1UQ4w3EIoRlRT9B2yIJkofVTk4FLH98blMHQOl/b6yprlzlhOpt+/Xh1am6
	OuPWraXSXvguXKxwMky7xuKQ9uoY+aS371jtepqzL//HdLITBgdnsVZNldDvm2mHrELCP7z6JZ4
	gSh/SzCdmj2Z74nIKD7FR0XEOsPfxq2BXl9o1Q/wq+ZnnN7QTsS48n2ZVothIhRRzzjlJW9JIsy
	ljT/fKlV7w0Z3z/6sP8RIAMokQOET6QnHox/mJ15//tSvX5qNIrPeeUv/JHrII
X-Received: by 2002:a05:6a20:12d0:b0:3b1:882a:607b with SMTP id adf61e73a8af0-3c0bc95630amr10563387637.22.1783628195005;
        Thu, 09 Jul 2026 13:16:35 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.160.236])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174a583bcsm38446663eec.19.2026.07.09.13.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 13:16:34 -0700 (PDT)
Date: Fri, 10 Jul 2026 01:46:15 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Shrikanth Hegde <sshegde@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Kees Cook <kees@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org, x86@kernel.org, 
	Mark Rutland <mark.rutland@arm.com>, Jinjie Ruan <ruanjinjie@huawei.com>, 
	Andy Lutomirski <luto@kernel.org>, Oleg Nesterov <oleg@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Guo Ren <guoren@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Helge Deller <deller@gmx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Richard Weinberger <richard@nod.at>, Chris Zankel <chris@zankel.net>, 
	linux-arm-kernel@lists.infradead.org, linux-alpha@vger.kernel.org, linux-csky@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-um@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, 
	Vineet Gupta <vgupta@kernel.org>, Will Deacon <will@kernel.org>, Brian Cain <bcain@kernel.org>, 
	Michal Simek <monstr@monstr.eu>, Dinh Nguyen <dinguyen@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	linux-snps-arc@lists.infradead.org, linux-hexagon@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-arch@vger.kernel.org, 
	Michal =?utf-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [patch 03/18] entry: Provide
 [syscall_]enter_from_user_mode_randomize_stack()
Message-ID: <alABgaW3OpGvH_Oc@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260707181957.433213175@kernel.org>
 <20260707190253.816918647@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260707190253.816918647@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_131637_085292_B1CA57E0 
X-CRM114-Status: GOOD (  26.81  )
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

On Tue, Jul 07, 2026 at 09:06:07PM +0200, Thomas Gleixner wrote:
> Randomizing the syscall stack can only happen after state is established
> via enter_from_user_mode() or syscall_enter_from_user_mode(). The earlier
> it happens the better.
> 
> Provide two new macros to consolidate that:
> 
>   - enter_from_user_mode_randomize_stack()
> 	enter_from_user_mode();
> 	add_random_kstack_offset_irqsoff();
> 
>   - syscall_enter_from_user_mode_randomize_stack()
> 	enter_from_user_mode_randomize_stack();
> 	syscall_enter_from_user_mode_work();
>     
> to reduce boiler plate code.
> 
> Those are macros and not inline functions as the latter would limit the
> stack randomization scope to the inline function itself.
> 
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> ---
>  include/linux/entry-common.h |   56 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 56 insertions(+)
> 
> --- a/include/linux/entry-common.h
> +++ b/include/linux/entry-common.h
> @@ -6,6 +6,7 @@
>  #include <linux/irq-entry-common.h>
>  #include <linux/livepatch.h>
>  #include <linux/ptrace.h>
> +#include <linux/randomize_kstack.h>
>  #include <linux/resume_user_mode.h>
>  #include <linux/seccomp.h>
>  #include <linux/sched.h>
> @@ -150,6 +151,61 @@ static __always_inline long syscall_ente
>  }
>  
>  /**
> + * enter_from_user_mode_randomize_stack - Establish state and add stack randomization
> + *					  before invoking syscall_enter_from_user_mode_work()
> + * @regs:	Pointer to currents pt_regs
> + *
> + * Invoked from architecture specific syscall entry code with interrupts
> + * disabled. The calling code has to be non-instrumentable. When the function
> + * returns all state is correct, interrupts are still disabled and the
> + * subsequent functions can be instrumented.
> + *
> + * Implemented as a macro so that the stack randomization is effective
> + * throughout the function in which it is invoked. An inline would only make it
> + * effective in the scope of the inline function.
> + */
> +#define enter_from_user_mode_randomize_stack(regs)			\
> +do {									\
> +	enter_from_user_mode(regs);					\
> +	instrumentation_begin();					\
> +	add_random_kstack_offset_irqsoff();				\
> +	instrumentation_end();						\
> +} while (0)
> +
> +/**
> + * syscall_enter_from_user_mode_randomize_stack - Establish state and check and handle work
> + *						  before invoking a syscall
> + * @regs:	Pointer to currents pt_regs
> + * @syscall:	The syscall number
> + *
> + * Invoked from architecture specific syscall entry code with interrupts
> + * disabled. The calling code has to be non-instrumentable. When the
> + * function returns all state is correct, interrupts are enabled and the
> + * subsequent functions can be instrumented.
> + *
> + * This is the combination of enter_from_user_mode_randomize_stack() and
> + * syscall_enter_from_user_mode_work() to be used when there is no
> + * architecture specific work to be done between the two.
> + *
> + * Returns: The original or a modified syscall number. See
> + * syscall_enter_from_user_mode_work() for further explanation.
> + *
> + * Implemented as a macro to make stack randomization effective in the calling
> + * scope.
> + */
> +#define syscall_enter_from_user_mode_randomize_stack(regs, syscall)	\
> +({									\
> +	enter_from_user_mode_randomize_stack(regs);			\
> +									\
> +	instrumentation_begin();					\
> +	local_irq_enable();						\
> +	long _ret = syscall_enter_from_user_mode_work(regs, syscall);	\
> +	instrumentation_end();						\
> +									\
> +	_ret;								\
> +})
> +
> +/**
>   * syscall_enter_from_user_mode - Establish state and check and handle work
>   *				  before invoking a syscall
>   * @regs:	Pointer to currents pt_regs
> 
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
