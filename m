Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBCA6CCA473
	for <linux-snps-arc@archiver.kernel.org>; Wed,  6 Jul 2022 13:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fIDUiivcyRh+WzfSUgsOGB984qQx3pcGjHDLKQdJT48=; b=fTdqx7Fr9Nm0NF
	OP55KTudYwNyr8LFuFJlkYJXxEIfJMr+uLLOoBVyMkT382h/K2xkWugN8HEPA+r7IGpUuNgQMkBRK
	szuZmShGskaRbjQbNFNzQpTKDrhn3wzjA1ai8AKsci/txyhrE5w0ehZow8NrFWI3QMnRdkRv0rY2Q
	//Fy4crkxV/hzAoDZkuWuC2J+8rZAtGjjYlo1WWV/wuS7/ydeuScLQ6VaB6nckz4YfE8ajv2yTYhp
	IJKc+qOhoKUW1nfb7Ot09AQ/Hjfrjgi1rtYNR1In4k+MQy7JbxX5W44QcGtUSO8VfeHxzTsALELFw
	8ELOIVx/znAiywYP+fpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o95Z6-00AUhh-Il; Wed, 06 Jul 2022 13:59:40 +0000
Received: from mail-yw1-f177.google.com ([209.85.128.177])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o95Z0-00AUfP-7M; Wed, 06 Jul 2022 13:59:38 +0000
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-31c8bb90d09so87114057b3.8;
        Wed, 06 Jul 2022 06:59:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Onduqp6mjVbUTy8onn0jWt/mqpI9kGBQEYh+QUeZcBU=;
        b=lfrH6mcsjtLQMfI9KrAiqMNwVdfCNdSMyzm+au7ncUH/qYUZqCZgCmXiTyE/7gQoY/
         R9xAMWLsuRXL2n0kcGK+f34r3vCeGWlE07ndB/LruT4TuJoWFZHfvKloMM2EawgaPvbe
         N9mCrTvWas1oSGyPUZGD54wZ4S6v/G0ICV7yRHd3RzZo2ehDX9fTU6mqxRtooZvW6joS
         ZMisIyonsG22cs34qbiDQ6frcK7I8HBu8TdRaa8AOFqHN1HgZBFyWJAG73ShhS5cynr7
         NGRjtRuEnE8Q90ktlybx/FGz/0BV5rt1FyY4eU3qpzl1bgApSD3Ed2LazCi0h7YjCjdP
         /UFQ==
X-Gm-Message-State: AJIora8oK9vUYgsIcYygWIvSbUhQoQVPv+tZvpEgm/u8VSCr1aKuLkXS
	g9sYxN+tMRfmF6zmtRJDfx4UIaJ6bWQxHD7ukmI=
X-Google-Smtp-Source: AGRyM1tNbC/Hml4tsQcA7xFkjwPTBe4V9sculTi4g4WqVg8ltnNA+flCFfg0CHpb2ZdV5OvqewQ30xyxgoEo0qXCWHo=
X-Received: by 2002:a81:1b97:0:b0:2db:640f:49d8 with SMTP id
 b145-20020a811b97000000b002db640f49d8mr45117410ywb.326.1657115972382; Wed, 06
 Jul 2022 06:59:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220608142723.103523089@infradead.org> <20220608144516.998681585@infradead.org>
In-Reply-To: <20220608144516.998681585@infradead.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 6 Jul 2022 15:59:21 +0200
Message-ID: <CAJZ5v0jSfvUoReFHjA5A+brExnnEKidak-GnjTbY0CKoaWpGVQ@mail.gmail.com>
Subject: Re: [PATCH 17/36] acpi_idle: Remove tracing
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
	pv-drivers@vmware.com, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Chris Zankel <chris@zankel.net>, jcmvbkbc@gmail.com, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Pavel Machek <pavel@ucw.cz>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, 
	Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, 
	Anup Patel <anup@brainfault.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jon Hunter <jonathanh@nvidia.com>, Jacob Pan <jacob.jun.pan@linux.intel.com>, 
	Arnd Bergmann <arnd@arndb.de>, Yury Norov <yury.norov@gmail.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
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
X-CRM114-CacheID: sfid-20220706_065934_317613_AAFE47F3 
X-CRM114-Status: GOOD (  24.21  )
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
> All the idle routines are called with RCU disabled, as such there must
> not be any tracing inside.
>
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>

This actually does some additional code duplication cleanup which
would be good to mention in the changelog.  Or even move to a separate
patch for that matter.

Otherwise LGTM.

> ---
>  drivers/acpi/processor_idle.c |   24 +++++++++++++-----------
>  1 file changed, 13 insertions(+), 11 deletions(-)
>
> --- a/drivers/acpi/processor_idle.c
> +++ b/drivers/acpi/processor_idle.c
> @@ -108,8 +108,8 @@ static const struct dmi_system_id proces
>  static void __cpuidle acpi_safe_halt(void)
>  {
>         if (!tif_need_resched()) {
> -               safe_halt();
> -               local_irq_disable();
> +               raw_safe_halt();
> +               raw_local_irq_disable();
>         }
>  }
>
> @@ -524,16 +524,21 @@ static int acpi_idle_bm_check(void)
>         return bm_status;
>  }
>
> -static void wait_for_freeze(void)
> +static __cpuidle void io_idle(unsigned long addr)
>  {
> +       /* IO port based C-state */
> +       inb(addr);
> +
>  #ifdef CONFIG_X86
>         /* No delay is needed if we are in guest */
>         if (boot_cpu_has(X86_FEATURE_HYPERVISOR))
>                 return;
>  #endif
> -       /* Dummy wait op - must do something useless after P_LVL2 read
> -          because chipsets cannot guarantee that STPCLK# signal
> -          gets asserted in time to freeze execution properly. */
> +       /*
> +        * Dummy wait op - must do something useless after P_LVL2 read
> +        * because chipsets cannot guarantee that STPCLK# signal
> +        * gets asserted in time to freeze execution properly.
> +        */
>         inl(acpi_gbl_FADT.xpm_timer_block.address);
>  }
>
> @@ -553,9 +558,7 @@ static void __cpuidle acpi_idle_do_entry
>         } else if (cx->entry_method == ACPI_CSTATE_HALT) {
>                 acpi_safe_halt();
>         } else {
> -               /* IO port based C-state */
> -               inb(cx->address);
> -               wait_for_freeze();
> +               io_idle(cx->address);
>         }
>
>         perf_lopwr_cb(false);
> @@ -577,8 +580,7 @@ static int acpi_idle_play_dead(struct cp
>                 if (cx->entry_method == ACPI_CSTATE_HALT)
>                         safe_halt();
>                 else if (cx->entry_method == ACPI_CSTATE_SYSTEMIO) {
> -                       inb(cx->address);
> -                       wait_for_freeze();
> +                       io_idle(cx->address);
>                 } else
>                         return -ENODEV;
>
>
>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
