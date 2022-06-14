Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A4C1C433EF
	for <linux-snps-arc@archiver.kernel.org>; Tue, 14 Jun 2022 16:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=31DZ191qX9xpaIAW0bGMl9W/MXY4K/ls9j8dF7am/UE=; b=U6zHZ53faFJWb7
	6q4j1on1vPDCJ8+FqlMZGYY1MzcIee9rFOR2buJT6Y6ORT+eHpqASQurIbNUGcEAGAtlnSHR4qxCf
	oZJ0QjESlYpfPrdmf4/wijuQMr+mXCuW2D3qSxNgiHhl38uhdSZhONxeFWwQKFRAnrq+Zdi3Y+Thl
	1MtuJkc6WpQmH+9wi0DkWxjsqLrMubvaNob8935xKP7qFo9stqD6qCT10lNXrFKFNF0ZfeQx0JVxb
	HmpzWwVwQpXcemj2AgwpOwT0mToGvNooWsO20HnhZDNsTJPjjRptgIptQ6Xxg7l0g/bdw270bEFdD
	ymixA57w5DmCe/zDaVuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o19B0-00AHp7-Dl; Tue, 14 Jun 2022 16:13:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o19Am-00AHiI-2p; Tue, 14 Jun 2022 16:13:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0D6151684;
	Tue, 14 Jun 2022 09:13:38 -0700 (PDT)
Received: from FVFF77S0Q05N (unknown [10.57.41.154])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4946B3F66F;
	Tue, 14 Jun 2022 09:13:20 -0700 (PDT)
Date: Tue, 14 Jun 2022 17:13:16 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com,
	vgupta@kernel.org, linux@armlinux.org.uk, ulli.kroll@googlemail.com,
	linus.walleij@linaro.org, shawnguo@kernel.org,
	Sascha Hauer <s.hauer@pengutronix.de>, kernel@pengutronix.de,
	festevam@gmail.com, linux-imx@nxp.com, tony@atomide.com,
	khilman@kernel.org, catalin.marinas@arm.com, will@kernel.org,
	guoren@kernel.org, bcain@quicinc.com, chenhuacai@kernel.org,
	kernel@xen0n.name, geert@linux-m68k.org, sammy@sammy.net,
	monstr@monstr.eu, tsbogend@alpha.franken.de, dinguyen@kernel.org,
	jonas@southpole.se, stefan.kristiansson@saunalahti.fi,
	shorne@gmail.com, James.Bottomley@HansenPartnership.com,
	deller@gmx.de, mpe@ellerman.id.au, benh@kernel.crashing.org,
	paulus@samba.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, hca@linux.ibm.com, gor@linux.ibm.com,
	agordeev@linux.ibm.com, borntraeger@linux.ibm.com,
	svens@linux.ibm.com, ysato@users.sourceforge.jp, dalias@libc.org,
	davem@davemloft.net, richard@nod.at,
	anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net,
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
	acme@kernel.org, alexander.shishkin@linux.intel.com,
	jolsa@kernel.org, namhyung@kernel.org, jgross@suse.com,
	srivatsa@csail.mit.edu, amakhalov@vmware.com, pv-drivers@vmware.com,
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
	rcu@vger.kernel.org
Subject: Re: [PATCH 15/36] cpuidle,cpu_pm: Remove RCU fiddling from
 cpu_pm_{enter,exit}()
Message-ID: <YqiznJL7qB9uSQ9c@FVFF77S0Q05N>
References: <20220608142723.103523089@infradead.org>
 <20220608144516.871305980@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220608144516.871305980@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220614_091344_318787_D2F8161B 
X-CRM114-Status: GOOD (  13.32  )
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

On Wed, Jun 08, 2022 at 04:27:38PM +0200, Peter Zijlstra wrote:
> All callers should still have RCU enabled.

IIUC with that true we should be able to drop the RCU_NONIDLE() from
drivers/perf/arm_pmu.c, as we only needed that for an invocation via a pm
notifier.

I should be able to give that a spin on some hardware.

> 
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> ---
>  kernel/cpu_pm.c |    9 ---------
>  1 file changed, 9 deletions(-)
> 
> --- a/kernel/cpu_pm.c
> +++ b/kernel/cpu_pm.c
> @@ -30,16 +30,9 @@ static int cpu_pm_notify(enum cpu_pm_eve
>  {
>  	int ret;
>  
> -	/*
> -	 * This introduces a RCU read critical section, which could be
> -	 * disfunctional in cpu idle. Copy RCU_NONIDLE code to let RCU know
> -	 * this.
> -	 */
> -	rcu_irq_enter_irqson();
>  	rcu_read_lock();
>  	ret = raw_notifier_call_chain(&cpu_pm_notifier.chain, event, NULL);
>  	rcu_read_unlock();
> -	rcu_irq_exit_irqson();

To make this easier to debug, is it worth adding an assertion that RCU is
watching here? e.g.

	RCU_LOCKDEP_WARN(!rcu_is_watching(),
			 "cpu_pm_notify() used illegally from EQS");

>  
>  	return notifier_to_errno(ret);
>  }
> @@ -49,11 +42,9 @@ static int cpu_pm_notify_robust(enum cpu
>  	unsigned long flags;
>  	int ret;
>  
> -	rcu_irq_enter_irqson();
>  	raw_spin_lock_irqsave(&cpu_pm_notifier.lock, flags);
>  	ret = raw_notifier_call_chain_robust(&cpu_pm_notifier.chain, event_up, event_down, NULL);
>  	raw_spin_unlock_irqrestore(&cpu_pm_notifier.lock, flags);
> -	rcu_irq_exit_irqson();


... and likewise here?

Thanks,
Mark.

>  
>  	return notifier_to_errno(ret);
>  }
> 
> 

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
