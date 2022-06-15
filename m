Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FB02C433EF
	for <linux-snps-arc@archiver.kernel.org>; Wed, 15 Jun 2022 05:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2xL/saH7DAz9AYgK344ak/ZRU8tRCYnQ/Ez2YtwaObE=; b=poDJf3877rzqgA
	3P6h5EVqLghwfZsHWH5IBgcuKcmJfPGCkvUnpJ7v1BSNAewjCBH2Frtom9/hUttgEw9++Guf2inqt
	554jKPfedgNdc7v/nCWRX+jMlpNe+8GPQjPCcecY75RJR/gGn1VXJsMx3Swv+D+lPX3AzZZLWYp8X
	OAJFM0PTTJcTI3sYxwZoHbZHLs/s3pEGmC5k8adwc/55QZz9TRhAhHLMjg/2BmbDe28zx2RNXdaF8
	OZlXJfj8X7JyYGVQoQl6TJPU6vq8BS7HepB1+mTh2jzBHJ4qVw34I4ltvJnG6ro34S3wtZgQpH7s6
	fy/u98wLb433ClTd1dFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1Lgz-00Cfny-Mr; Wed, 15 Jun 2022 05:35:49 +0000
Received: from muru.com ([72.249.23.125])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1Lgu-00Cfln-I2; Wed, 15 Jun 2022 05:35:47 +0000
Received: from localhost (localhost [127.0.0.1])
	by muru.com (Postfix) with ESMTPS id 6EE2B80AE;
	Wed, 15 Jun 2022 05:30:54 +0000 (UTC)
Date: Wed, 15 Jun 2022 08:35:38 +0300
From: Tony Lindgren <tony@atomide.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com,
	vgupta@kernel.org, linux@armlinux.org.uk, ulli.kroll@googlemail.com,
	linus.walleij@linaro.org, shawnguo@kernel.org,
	Sascha Hauer <s.hauer@pengutronix.de>, kernel@pengutronix.de,
	festevam@gmail.com, linux-imx@nxp.com, khilman@kernel.org,
	catalin.marinas@arm.com, will@kernel.org, guoren@kernel.org,
	bcain@quicinc.com, chenhuacai@kernel.org, kernel@xen0n.name,
	geert@linux-m68k.org, sammy@sammy.net, monstr@monstr.eu,
	tsbogend@alpha.franken.de, dinguyen@kernel.org, jonas@southpole.se,
	stefan.kristiansson@saunalahti.fi, shorne@gmail.com,
	James.Bottomley@hansenpartnership.com, deller@gmx.de,
	mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com,
	borntraeger@linux.ibm.com, svens@linux.ibm.com,
	ysato@users.sourceforge.jp, dalias@libc.org, davem@davemloft.net,
	richard@nod.at, anton.ivanov@cambridgegreys.com,
	johannes@sipsolutions.net, tglx@linutronix.de, mingo@redhat.com,
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
	hpa@zytor.com, acme@kernel.org, mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com, jolsa@kernel.org,
	namhyung@kernel.org, jgross@suse.com, srivatsa@csail.mit.edu,
	amakhalov@vmware.com, pv-drivers@vmware.com,
	boris.ostrovsky@oracle.com, chris@zankel.net, jcmvbkbc@gmail.com,
	rafael@kernel.org, lenb@kernel.org, pavel@ucw.cz,
	gregkh@linuxfoundation.org, mturquette@baylibre.com,
	sboyd@kernel.org, daniel.lezcano@linaro.org, lpieralisi@kernel.org,
	sudeep.holla@arm.com, agross@kernel.org, bjorn.andersson@linaro.org,
	anup@brainfault.org, thierry.reding@gmail.com, jonathanh@nvidia.com,
	jacob.jun.pan@linux.intel.com, Arnd Bergmann <arnd@arndb.de>,
	yury.norov@gmail.com, andriy.shevchenko@linux.intel.com,
	linux@rasmusvillemoes.dk, rostedt@goodmis.org, pmladek@suse.com,
	senozhatsky@chromium.org, john.ogness@linutronix.de,
	paulmck@kernel.org, frederic@kernel.org, quic_neeraju@quicinc.com,
	josh@joshtriplett.org, mathieu.desnoyers@efficios.com,
	jiangshanlai@gmail.com, joel@joelfernandes.org,
	juri.lelli@redhat.com, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, bsegall@google.com, mgorman@suse.de,
	bristot@redhat.com, vschneid@redhat.com, jpoimboe@kernel.org,
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
	linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
	linux-um@lists.infradead.org, linux-perf-users@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	xen-devel@lists.xenproject.org, linux-xtensa@linux-xtensa.org,
	linux-acpi@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-arch@vger.kernel.org,
	rcu@vger.kernel.org, Peter Vasil <petervasil@gmail.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>
Subject: Re: [PATCH 34.5/36] cpuidle,omap4: Push RCU-idle into
 omap4_enter_lowpower()
Message-ID: <YqlvqhdlFsNvUBeG@atomide.com>
References: <20220608142723.103523089@infradead.org>
 <20220608144518.073801916@infradead.org>
 <Yqcv6crSNKuSWoTu@atomide.com>
 <YqkHto+zgAPs4kQI@worktop.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YqkHto+zgAPs4kQI@worktop.programming.kicks-ass.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220614_223544_682396_77DEF8C4 
X-CRM114-Status: GOOD (  30.10  )
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

Hi,

Adding Aaro Koskinen and Peter Vasil for pm24xx for n800 and n810 related
idle.

* Peter Zijlstra <peterz@infradead.org> [220614 22:07]:
> On Mon, Jun 13, 2022 at 03:39:05PM +0300, Tony Lindgren wrote:
> > OMAP4 uses full SoC suspend modes as idle states, as such it needs the
> > whole power-domain and clock-domain code from the idle path.
> > 
> > All that code is not suitable to run with RCU disabled, as such push
> > RCU-idle deeper still.
> > 
> > Signed-off-by: Tony Lindgren <tony@atomide.com>
> > ---
> > 
> > Peter here's one more for your series, looks like this is needed to avoid
> > warnings similar to what you did for omap3.
> 
> Thanks Tony!
> 
> I've had a brief look at omap2_pm_idle() and do I understand it right
> that something like the below patch would reduce it to a simple 'WFI'?

Yes that should do for omap2_do_wfi().

> What do I do with the rest of that code, because I don't think this
> thing has a cpuidle driver to take over, effectively turning it into
> dead code.

As we are establishing a policy where deeper idle states must be
handled by cpuidle, and for most part that has been the case for at least
10 years, I'd just drop the unused functions with an explanation in the
patch why we're doing it. Or the functions could be tagged with
__maybe_unused if folks prefer that.

In the pm24xx case we are not really causing a regression for users as
there are still pending patches to make n800 and n810 truly usable with
the mainline kernel. At least the PMIC and LCD related patches need some
work [0]. The deeper idle states can be added back later using cpuidle
as needed so we have a clear path.

Aaro & Peter V, do you have any better suggestions here as this will
mostly affect you guys currently?

Regards,

Tony

[0] https://lore.kernel.org/linux-omap/20211224214512.1583430-1-peter.vasil@gmail.com/


> --- a/arch/arm/mach-omap2/pm24xx.c
> +++ b/arch/arm/mach-omap2/pm24xx.c
> @@ -126,10 +126,20 @@ static int omap2_allow_mpu_retention(voi
>  	return 1;
>  }
>  
> -static void omap2_enter_mpu_retention(void)
> +static void omap2_do_wfi(void)
>  {
>  	const int zero = 0;
>  
> +	/* WFI */
> +	asm("mcr p15, 0, %0, c7, c0, 4" : : "r" (zero) : "memory", "cc");
> +}
> +
> +#if 0
> +/*
> + * possible cpuidle implementation between WFI and full_retention above
> + */
> +static void omap2_enter_mpu_retention(void)
> +{
>  	/* The peripherals seem not to be able to wake up the MPU when
>  	 * it is in retention mode. */
>  	if (omap2_allow_mpu_retention()) {
> @@ -146,8 +157,7 @@ static void omap2_enter_mpu_retention(vo
>  		pwrdm_set_next_pwrst(mpu_pwrdm, PWRDM_POWER_ON);
>  	}
>  
> -	/* WFI */
> -	asm("mcr p15, 0, %0, c7, c0, 4" : : "r" (zero) : "memory", "cc");
> +	omap2_do_wfi();
>  
>  	pwrdm_set_next_pwrst(mpu_pwrdm, PWRDM_POWER_ON);
>  }
> @@ -161,6 +171,7 @@ static int omap2_can_sleep(void)
>  
>  	return 1;
>  }
> +#endif
>  
>  static void omap2_pm_idle(void)
>  {
> @@ -169,6 +180,7 @@ static void omap2_pm_idle(void)
>  	if (omap_irq_pending())
>  		return;
>  
> +#if 0
>  	error = cpu_cluster_pm_enter();
>  	if (error || !omap2_can_sleep()) {
>  		omap2_enter_mpu_retention();
> @@ -179,6 +191,9 @@ static void omap2_pm_idle(void)
>  
>  out_cpu_cluster_pm:
>  	cpu_cluster_pm_exit();
> +#else
> +	omap2_do_wfi();
> +#endif
>  }
>  
>  static void __init prcm_setup_regs(void)

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
