Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB3CEC43334
	for <linux-snps-arc@archiver.kernel.org>; Tue, 14 Jun 2022 22:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M/wHGPI3wZ5PvdjVE3tkffU8JTrCyuTbJzZXZWZUUqc=; b=uBwNrjAyqxZ/Na
	P57xGoSBE6y/kZlCx+dtj5zhgVx/ZApyZ50l2DQEpwuC8UznvDbEZjtF9cQM3uUMXg1P01dLHb7Ln
	sFzmxkKGWE4NKqewMoEs+3ZGe9q9E/ikWPAB+DEcRJnU27OKYdBIaZO4a0UqqLJdrg4KaxnDNAznr
	iB9xB+JataRr4u0u9/XAxikyl07DvC55Qt+7Sy3N9PKU+JsDh79jqJmvSkQ2jq46xI8cPz3mAHVDj
	zjnJQ6H4Jb8Nvj1KPT3ue/qFiMmFNr0S1uHCuEyrivGS9Dm8ksMB8Ym/hKbw4Veu86gFmyn0oFWmS
	8J1NoqirbLakokeK1ucg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1Els-00BZHX-Gp; Tue, 14 Jun 2022 22:12:24 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1Elr-00BZGq-6I; Tue, 14 Jun 2022 22:12:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ieYeEcrodnP9d8uMI6KazQ9YDccjAyjy/+PGF5Ov/Sc=; b=OliYmJSibamFQ0oRl2XkG2+oLG
	eUVxb3PF2WQS3d9O+63gY5P/Th5g3W0k/p07zjSFtfSstgpe5sY3UKPuYKK8U3d61xav16z47xA5h
	tkNVX1vBm9t+GM0XpJtkUArdAr+6C0D6QPwa3LyJL5W3wePUH4pa4u9UPo+aiZ0VxHDbCXoe4qfJ4
	E8Y2M6s9A8SopwISJUuliIWAcL2CXospZ4jCBSi0ba1Zs/HL4wyLHhGRHBuILPFIW3paG1eAzYhHw
	AXd8m8CPomKQfchnKb7uAGftq4wK1SsdTGzKQsjqacjeCk0RsPVRrEJUUy3okfnQk1gM5l81agP/h
	arzWLEHQ==;
Received: from dhcp-077-249-017-003.chello.nl ([77.249.17.3] helo=worktop.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1Elc-000Y9d-O5; Tue, 14 Jun 2022 22:12:08 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
	id ED8F2981518; Wed, 15 Jun 2022 00:12:06 +0200 (CEST)
Date: Wed, 15 Jun 2022 00:12:06 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Tony Lindgren <tony@atomide.com>
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
	rcu@vger.kernel.org
Subject: Re: [PATCH 34.5/36] cpuidle,omap4: Push RCU-idle into
 omap4_enter_lowpower()
Message-ID: <YqkHto+zgAPs4kQI@worktop.programming.kicks-ass.net>
References: <20220608142723.103523089@infradead.org>
 <20220608144518.073801916@infradead.org>
 <Yqcv6crSNKuSWoTu@atomide.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Yqcv6crSNKuSWoTu@atomide.com>
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

On Mon, Jun 13, 2022 at 03:39:05PM +0300, Tony Lindgren wrote:
> OMAP4 uses full SoC suspend modes as idle states, as such it needs the
> whole power-domain and clock-domain code from the idle path.
> 
> All that code is not suitable to run with RCU disabled, as such push
> RCU-idle deeper still.
> 
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
> 
> Peter here's one more for your series, looks like this is needed to avoid
> warnings similar to what you did for omap3.

Thanks Tony!

I've had a brief look at omap2_pm_idle() and do I understand it right
that something like the below patch would reduce it to a simple 'WFI'?

What do I do with the rest of that code, because I don't think this
thing has a cpuidle driver to take over, effectively turning it into
dead code.

--- a/arch/arm/mach-omap2/pm24xx.c
+++ b/arch/arm/mach-omap2/pm24xx.c
@@ -126,10 +126,20 @@ static int omap2_allow_mpu_retention(voi
 	return 1;
 }
 
-static void omap2_enter_mpu_retention(void)
+static void omap2_do_wfi(void)
 {
 	const int zero = 0;
 
+	/* WFI */
+	asm("mcr p15, 0, %0, c7, c0, 4" : : "r" (zero) : "memory", "cc");
+}
+
+#if 0
+/*
+ * possible cpuidle implementation between WFI and full_retention above
+ */
+static void omap2_enter_mpu_retention(void)
+{
 	/* The peripherals seem not to be able to wake up the MPU when
 	 * it is in retention mode. */
 	if (omap2_allow_mpu_retention()) {
@@ -146,8 +157,7 @@ static void omap2_enter_mpu_retention(vo
 		pwrdm_set_next_pwrst(mpu_pwrdm, PWRDM_POWER_ON);
 	}
 
-	/* WFI */
-	asm("mcr p15, 0, %0, c7, c0, 4" : : "r" (zero) : "memory", "cc");
+	omap2_do_wfi();
 
 	pwrdm_set_next_pwrst(mpu_pwrdm, PWRDM_POWER_ON);
 }
@@ -161,6 +171,7 @@ static int omap2_can_sleep(void)
 
 	return 1;
 }
+#endif
 
 static void omap2_pm_idle(void)
 {
@@ -169,6 +180,7 @@ static void omap2_pm_idle(void)
 	if (omap_irq_pending())
 		return;
 
+#if 0
 	error = cpu_cluster_pm_enter();
 	if (error || !omap2_can_sleep()) {
 		omap2_enter_mpu_retention();
@@ -179,6 +191,9 @@ static void omap2_pm_idle(void)
 
 out_cpu_cluster_pm:
 	cpu_cluster_pm_exit();
+#else
+	omap2_do_wfi();
+#endif
 }
 
 static void __init prcm_setup_regs(void)

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
