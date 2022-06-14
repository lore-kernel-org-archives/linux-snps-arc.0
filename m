Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B5F7C43334
	for <linux-snps-arc@archiver.kernel.org>; Tue, 14 Jun 2022 17:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8p4Ov0fWcXEOyITOz+lPpCfwOE02cN2KYMH7K5Xpttc=; b=htIJBcNh3jKioF
	dB4+Y/oR8JutTWS/GUgkPDweEe11YnlSlvUij5zNYxBkFzk/1tgZzSVUERJj2WRjHu8CC5wII3NiP
	uycr+HerqKAn4LrIOHF6r36nu5tryzvj/UeKfLFnoT/q8uw6vfP1vIcP6gisXj/LRkRtQ7S4Et0ZH
	otL098aPSwy1gA4BNbz6NcfEl2ePfqVeSHjrRizDTlQvlSiPOMPNhIOzdYl1Kv4Wogejl1PgiNjki
	CwGVx3almnrv1Q8hM31lxkp6y9Q7RjBLIsP3os6HF+iGkFGk62Y0sjhrAr/iOBiu5J14F76dRue/I
	ajto7gmvbhwF5qBnTpew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o19tm-00AUtX-40; Tue, 14 Jun 2022 17:00:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o19ti-00AUs3-CJ; Tue, 14 Jun 2022 17:00:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 11469175A;
	Tue, 14 Jun 2022 10:00:08 -0700 (PDT)
Received: from FVFF77S0Q05N (unknown [10.57.41.154])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4A1F03F66F;
	Tue, 14 Jun 2022 09:59:50 -0700 (PDT)
Date: Tue, 14 Jun 2022 17:59:46 +0100
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
	shorne@gmail.com, James.Bottomley@hansenpartnership.com,
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
Subject: Re: [PATCH 14/36] cpuidle: Fix rcu_idle_*() usage
Message-ID: <Yqi+gg+p0sv0F7Di@FVFF77S0Q05N>
References: <20220608142723.103523089@infradead.org>
 <20220608144516.808451191@infradead.org>
 <YqiB6YpVqq4wuDtO@FVFF77S0Q05N>
 <Yqi6Fd38ZCsDUnQG@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Yqi6Fd38ZCsDUnQG@hirez.programming.kicks-ass.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220614_100010_558519_F72FAC04 
X-CRM114-Status: GOOD (  17.63  )
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

On Tue, Jun 14, 2022 at 06:40:53PM +0200, Peter Zijlstra wrote:
> On Tue, Jun 14, 2022 at 01:41:13PM +0100, Mark Rutland wrote:
> > On Wed, Jun 08, 2022 at 04:27:37PM +0200, Peter Zijlstra wrote:
> > > --- a/kernel/time/tick-broadcast.c
> > > +++ b/kernel/time/tick-broadcast.c
> > > @@ -622,9 +622,13 @@ struct cpumask *tick_get_broadcast_onesh
> > >   * to avoid a deep idle transition as we are about to get the
> > >   * broadcast IPI right away.
> > >   */
> > > -int tick_check_broadcast_expired(void)
> > > +noinstr int tick_check_broadcast_expired(void)
> > >  {
> > > +#ifdef _ASM_GENERIC_BITOPS_INSTRUMENTED_NON_ATOMIC_H
> > > +	return arch_test_bit(smp_processor_id(), cpumask_bits(tick_broadcast_force_mask));
> > > +#else
> > >  	return cpumask_test_cpu(smp_processor_id(), tick_broadcast_force_mask);
> > > +#endif
> > >  }
> > 
> > This is somewhat not-ideal. :/
> 
> I'll say.
> 
> > Could we unconditionally do the arch_test_bit() variant, with a comment, or
> > does that not exist in some cases?
> 
> Loads of build errors ensued, which is how I ended up with this mess ...

Yaey :(

I see the same is true for the thread flag manipulation too.

I'll take a look and see if we can layer things so that we can use the arch_*()
helpers and wrap those consistently so that we don't have to check the CPP
guard.

Ideally we'd have a a better language that allows us to make some
context-senstive decisions, then we could hide all this gunk in the lower
levels with somethin like:

	if (!THIS_IS_A_NOINSTR_FUNCTION()) {
		explicit_instrumentation(...);
	}

... ho hum.

Mark.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
