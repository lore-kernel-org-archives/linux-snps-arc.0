Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2E6AC433EF
	for <linux-snps-arc@archiver.kernel.org>; Wed,  8 Jun 2022 18:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p1El/UemT0n1yLV9VNAJDkuNcBmYiQbXs68xVGvdamM=; b=T7he6tcPWZ6/V0
	7PHTwnfw0mvQSNcSXAvvwQFMUjPd+29JXKSALqvpYyYdLz990MugSrvjFGAB3tGKr6BXv9eEA7lYN
	lzL/sJUYCtuWddw/SKVGSLNQEiEbZNITH8uhnsbsXOWA5W/4vXgQXa9Ovm1qvms5tehq8sQgyCyeD
	ewmZ7oia09ssAnag+tnFIMiimaBImfdE3qc+5ifWCb+Y6aUrKhXafClc6EU7b/ZejS8VdGkJ4Z9aX
	WR+PvbuUPX30pS5AIAxZ3CJDkH9SVT4RyqZMYvZJQnIyC8VdNsefxGmbiSnRF6v+Pno4SCJRrZtDl
	DWT49t/DI7Bo+pyM8wEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nz0BK-00EeHy-Dh; Wed, 08 Jun 2022 18:13:26 +0000
Received: from mail-yb1-f171.google.com ([209.85.219.171])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nz0BG-00EeFF-92; Wed, 08 Jun 2022 18:13:24 +0000
Received: by mail-yb1-f171.google.com with SMTP id a30so19111012ybj.3;
        Wed, 08 Jun 2022 11:13:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZQePx5uIM1fUidMEiJVM5nuB6ZzPVeEu38qEpc1UrpE=;
        b=tg22o8Q/s+6stDEGR8EH0wckuEs22loupRsSsi+4UrJnJG8SpiAcYzGFmxUDsffltA
         r3wLIVe/kdv1LNcAIOyIrfK21ZUKTdJ+Jz5YqrFn4vTWnTqTEV5nJQgm4ruQYSQgAJtF
         VKYBkm1WV7+Sv5CYdLY2ieB8qv+LWY5KPK1GBv9xTBMolloUtlJh+oz/dNl3738BRZJM
         Ba2zfBJh6M+vPpiAYkSAbSOuVKkhjwcijitMsosCq+Nn0lF+1CSQMfq+xFjqncmqdmCt
         +dgTqem0qnK+nW5IZq+8k133+JdEXWD7PXdYB/IcjCw5AMGYf0CzEMtKuWbAEfDa7kZ1
         OB+w==
X-Gm-Message-State: AOAM532iGM6MSC+Mb5ORdQIyrQ5YoSoUnXzzpMgrOMvgcAfmuQdA9zla
	lBWmwjTauPFgEiwcH8UjI9iZbNyWe6zeIfpNzss=
X-Google-Smtp-Source: ABdhPJyd1CrHem+vVK3IGyX/t5xH0MretwaFF4fsfRB0Td7tNKI/Gb3F1VH58WOF1ULS3yEBVcV2AFovGma6uhuJi5U=
X-Received: by 2002:a5b:4a:0:b0:663:7c5b:a5ba with SMTP id e10-20020a5b004a000000b006637c5ba5bamr17352131ybp.81.1654711998678;
 Wed, 08 Jun 2022 11:13:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220608142723.103523089@infradead.org> <20220608144516.047149313@infradead.org>
In-Reply-To: <20220608144516.047149313@infradead.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 8 Jun 2022 20:13:07 +0200
Message-ID: <CAJZ5v0g=jcRkMhVoNkZzSaM0viK0C7WN6T5C1_3VQ5GGGQkSzQ@mail.gmail.com>
Subject: Re: [PATCH 02/36] x86/idle: Replace x86_idle with a static_call
To: Peter Zijlstra <peterz@infradead.org>
Cc: rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com, 
	vgupta@kernel.org, Russell King - ARM Linux <linux@armlinux.org.uk>, ulli.kroll@googlemail.com, 
	Linus Walleij <linus.walleij@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Sascha Hauer <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, dl-linux-imx <linux-imx@nxp.com>, Tony Lindgren <tony@atomide.com>, 
	Kevin Hilman <khilman@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, bcain@quicinc.com, 
	Huacai Chen <chenhuacai@kernel.org>, kernel@xen0n.name, 
	Geert Uytterhoeven <geert@linux-m68k.org>, sammy@sammy.net, Michal Simek <monstr@monstr.eu>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, dinguyen@kernel.org, jonas@southpole.se, 
	stefan.kristiansson@saunalahti.fi, Stafford Horne <shorne@gmail.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
	Paul Mackerras <paulus@samba.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, David Miller <davem@davemloft.net>, 
	Richard Weinberger <richard@nod.at>, anton.ivanov@cambridgegreys.com, 
	Johannes Berg <johannes@sipsolutions.net>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "the arch/x86 maintainers" <x86@kernel.org>, 
	"H. Peter Anvin" <hpa@zytor.com>, acme@kernel.org, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, jolsa@kernel.org, namhyung@kernel.org, 
	Juergen Gross <jgross@suse.com>, srivatsa@csail.mit.edu, amakhalov@vmware.com, 
	pv-drivers@vmware.com, Boris Ostrovsky <boris.ostrovsky@oracle.com>, chris@zankel.net, 
	jcmvbkbc@gmail.com, "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	Pavel Machek <pavel@ucw.cz>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, lpieralisi@kernel.org, 
	Sudeep Holla <sudeep.holla@arm.com>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <bjorn.andersson@linaro.org>, Anup Patel <anup@brainfault.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jon Hunter <jonathanh@nvidia.com>, 
	Jacob Pan <jacob.jun.pan@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>, 
	Yury Norov <yury.norov@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Steven Rostedt <rostedt@goodmis.org>, 
	Petr Mladek <pmladek@suse.com>, senozhatsky@chromium.org, 
	John Ogness <john.ogness@linutronix.de>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Frederic Weisbecker <frederic@kernel.org>, quic_neeraju@quicinc.com, 
	Josh Triplett <josh@joshtriplett.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Joel Fernandes <joel@joelfernandes.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Benjamin Segall <bsegall@google.com>, 
	Mel Gorman <mgorman@suse.de>, Daniel Bristot de Oliveira <bristot@redhat.com>, vschneid@redhat.com, 
	jpoimboe@kernel.org, linux-alpha@vger.kernel.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-snps-arc@lists.infradead.org, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux OMAP Mailing List <linux-omap@vger.kernel.org>, linux-csky@vger.kernel.org, 
	linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org, 
	linux-m68k <linux-m68k@lists.linux-m68k.org>, 
	"open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, openrisc@lists.librecores.org, 
	Parisc List <linux-parisc@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, linux-s390@vger.kernel.org, 
	Linux-sh list <linux-sh@vger.kernel.org>, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-perf-users@vger.kernel.org, 
	virtualization@lists.linux-foundation.org, xen-devel@lists.xenproject.org, 
	linux-xtensa@linux-xtensa.org, 
	ACPI Devel Maling List <linux-acpi@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>, 
	linux-clk <linux-clk@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, 
	linux-tegra <linux-tegra@vger.kernel.org>, linux-arch <linux-arch@vger.kernel.org>, 
	rcu@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220608_111322_374926_435BA7CB 
X-CRM114-Status: GOOD (  25.62  )
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

On Wed, Jun 8, 2022 at 4:47 PM Peter Zijlstra <peterz@infradead.org> wrote:
>
> Typical boot time setup; no need to suffer an indirect call for that.
>
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> Reviewed-by: Frederic Weisbecker <frederic@kernel.org>

Reviewed-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

> ---
>  arch/x86/kernel/process.c |   50 +++++++++++++++++++++++++---------------------
>  1 file changed, 28 insertions(+), 22 deletions(-)
>
> --- a/arch/x86/kernel/process.c
> +++ b/arch/x86/kernel/process.c
> @@ -24,6 +24,7 @@
>  #include <linux/cpuidle.h>
>  #include <linux/acpi.h>
>  #include <linux/elf-randomize.h>
> +#include <linux/static_call.h>
>  #include <trace/events/power.h>
>  #include <linux/hw_breakpoint.h>
>  #include <asm/cpu.h>
> @@ -692,7 +693,23 @@ void __switch_to_xtra(struct task_struct
>  unsigned long boot_option_idle_override = IDLE_NO_OVERRIDE;
>  EXPORT_SYMBOL(boot_option_idle_override);
>
> -static void (*x86_idle)(void);
> +/*
> + * We use this if we don't have any better idle routine..
> + */
> +void __cpuidle default_idle(void)
> +{
> +       raw_safe_halt();
> +}
> +#if defined(CONFIG_APM_MODULE) || defined(CONFIG_HALTPOLL_CPUIDLE_MODULE)
> +EXPORT_SYMBOL(default_idle);
> +#endif
> +
> +DEFINE_STATIC_CALL_NULL(x86_idle, default_idle);
> +
> +static bool x86_idle_set(void)
> +{
> +       return !!static_call_query(x86_idle);
> +}
>
>  #ifndef CONFIG_SMP
>  static inline void play_dead(void)
> @@ -715,28 +732,17 @@ void arch_cpu_idle_dead(void)
>  /*
>   * Called from the generic idle code.
>   */
> -void arch_cpu_idle(void)
> -{
> -       x86_idle();
> -}
> -
> -/*
> - * We use this if we don't have any better idle routine..
> - */
> -void __cpuidle default_idle(void)
> +void __cpuidle arch_cpu_idle(void)
>  {
> -       raw_safe_halt();
> +       static_call(x86_idle)();
>  }
> -#if defined(CONFIG_APM_MODULE) || defined(CONFIG_HALTPOLL_CPUIDLE_MODULE)
> -EXPORT_SYMBOL(default_idle);
> -#endif
>
>  #ifdef CONFIG_XEN
>  bool xen_set_default_idle(void)
>  {
> -       bool ret = !!x86_idle;
> +       bool ret = x86_idle_set();
>
> -       x86_idle = default_idle;
> +       static_call_update(x86_idle, default_idle);
>
>         return ret;
>  }
> @@ -859,20 +865,20 @@ void select_idle_routine(const struct cp
>         if (boot_option_idle_override == IDLE_POLL && smp_num_siblings > 1)
>                 pr_warn_once("WARNING: polling idle and HT enabled, performance may degrade\n");
>  #endif
> -       if (x86_idle || boot_option_idle_override == IDLE_POLL)
> +       if (x86_idle_set() || boot_option_idle_override == IDLE_POLL)
>                 return;
>
>         if (boot_cpu_has_bug(X86_BUG_AMD_E400)) {
>                 pr_info("using AMD E400 aware idle routine\n");
> -               x86_idle = amd_e400_idle;
> +               static_call_update(x86_idle, amd_e400_idle);
>         } else if (prefer_mwait_c1_over_halt(c)) {
>                 pr_info("using mwait in idle threads\n");
> -               x86_idle = mwait_idle;
> +               static_call_update(x86_idle, mwait_idle);
>         } else if (cpu_feature_enabled(X86_FEATURE_TDX_GUEST)) {
>                 pr_info("using TDX aware idle routine\n");
> -               x86_idle = tdx_safe_halt;
> +               static_call_update(x86_idle, tdx_safe_halt);
>         } else
> -               x86_idle = default_idle;
> +               static_call_update(x86_idle, default_idle);
>  }
>
>  void amd_e400_c1e_apic_setup(void)
> @@ -925,7 +931,7 @@ static int __init idle_setup(char *str)
>                  * To continue to load the CPU idle driver, don't touch
>                  * the boot_option_idle_override.
>                  */
> -               x86_idle = default_idle;
> +               static_call_update(x86_idle, default_idle);
>                 boot_option_idle_override = IDLE_HALT;
>         } else if (!strcmp(str, "nomwait")) {
>                 /*
>
>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
