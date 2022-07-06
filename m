Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2AACC433EF
	for <linux-snps-arc@archiver.kernel.org>; Wed,  6 Jul 2022 13:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hfgv68g1hxgcyaR6fBC8eViZfQhJgB6iZN5Y3ziIRjg=; b=N8p8ruVo4crr2D
	38Vca4pN1GYBQ9d8uD8rNovMbyKpMfI+nHn/InTbbRWEE/Jw5KDHckEuR1GJK9R1k/par+g9xtOPu
	XsnLykZcvZHCJ+e8Yd3H5eNRwEwWyMxklkVvLpDjQ8rDrPWlqQMdMI9syfoRPObOLgcMUAEq4bV/A
	8SRSbfONasKE5RrypqVdX1nkXJZISECIYLD63bFb85Y8Pe+/2lrvfs5tEDko96onOYfQelxl+dwF5
	aftLItWs5pPCt9/KVOWnQMJ7JLO8kcCXYH82DK1ODXs5L+yezGHX3N7FWDbpZCjYr/13nj6QaonLD
	yuKVxPrf+/8I61fYqX3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o95UO-00ASn7-3y; Wed, 06 Jul 2022 13:54:48 +0000
Received: from mail-yb1-f179.google.com ([209.85.219.179])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o95UL-00ASjs-Cf; Wed, 06 Jul 2022 13:54:46 +0000
Received: by mail-yb1-f179.google.com with SMTP id c143so18898097ybf.3;
        Wed, 06 Jul 2022 06:54:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nGlq0tAOl9peVDy+2hDU8oij0psSLrDezDLIhvJH3CU=;
        b=46U5ZKVUnG0Xtkvo6jYIayQm80DUNOT2vUIPMeDrft8dFQDaj//TPqiW4FsdE38D5S
         j+JNb5MLnl7p3ltOJwXGhWqpr+PaopdurNturfB8RKwlMLz58U2Gu1smUmJnIXzcjTmZ
         BwfCUHT/fB3DTncA1JvNxjJWbvQOJwT8Ox82/Zuks4/AL1DozOPA1Px8AwfdOBh5XcBV
         th6ysDKFuIsmDFqFhVPN9QbLe+7j74BtvqXbA46aSRsHPZ3xa7ekBMJ/nGMgodI/homl
         eIk2fbXt8c7JArVMQ5jljK9f3k+7y6HOCKrZHVyPg5Tc/KTxZ5ChUR2veUSZF1XpGCf3
         uJgg==
X-Gm-Message-State: AJIora/oNOlQJSHTUgXwH6wiAUO4ebTca7O7t6lQTuH6DZ6MBCPuSEg4
	O/vxr3r3QwP5DQzD5pg89nIlAC6IsQiOJXixtv4=
X-Google-Smtp-Source: AGRyM1tDetZqwrRScub6Y4Pn1s0tSkry0FvKlyTlHU1qOUr14WujFHx6NLxGPd7DkQtOavHEbmevSefDFcyAl6P8ZZY=
X-Received: by 2002:a25:fb02:0:b0:66e:3db9:5d49 with SMTP id
 j2-20020a25fb02000000b0066e3db95d49mr20145358ybe.137.1657115683016; Wed, 06
 Jul 2022 06:54:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220608142723.103523089@infradead.org> <20220608144516.235041924@infradead.org>
In-Reply-To: <20220608144516.235041924@infradead.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 6 Jul 2022 15:54:32 +0200
Message-ID: <CAJZ5v0g0fCNxsc1mg9aL+ieQ1uMVS+RWqesHKoZ_zeL7cx655A@mail.gmail.com>
Subject: Re: [PATCH 05/36] cpuidle: Move IRQ state validation
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
X-CRM114-CacheID: sfid-20220706_065445_477892_64A630D0 
X-CRM114-Status: GOOD (  20.92  )
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
> Make cpuidle_enter_state() consistent with the s2idle variant and
> verify ->enter() always returns with interrupts disabled.
>
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> ---
>  drivers/cpuidle/cpuidle.c |   10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> --- a/drivers/cpuidle/cpuidle.c
> +++ b/drivers/cpuidle/cpuidle.c
> @@ -234,7 +234,11 @@ int cpuidle_enter_state(struct cpuidle_d
>         stop_critical_timings();
>         if (!(target_state->flags & CPUIDLE_FLAG_RCU_IDLE))
>                 rcu_idle_enter();
> +
>         entered_state = target_state->enter(dev, drv, index);
> +       if (WARN_ONCE(!irqs_disabled(), "%ps leaked IRQ state", target_state->enter))

I'm not sure if dumping a call trace here is really useful and
WARN_ON() often gets converted to panic().

I would print an error message with pr_warn_once().

Otherwise LGTM.

> +               raw_local_irq_disable();
> +
>         if (!(target_state->flags & CPUIDLE_FLAG_RCU_IDLE))
>                 rcu_idle_exit();
>         start_critical_timings();
> @@ -246,12 +250,8 @@ int cpuidle_enter_state(struct cpuidle_d
>         /* The cpu is no longer idle or about to enter idle. */
>         sched_idle_set_state(NULL);
>
> -       if (broadcast) {
> -               if (WARN_ON_ONCE(!irqs_disabled()))
> -                       local_irq_disable();
> -
> +       if (broadcast)
>                 tick_broadcast_exit();
> -       }
>
>         if (!cpuidle_state_is_coupled(drv, index))
>                 local_irq_enable();
>
>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
