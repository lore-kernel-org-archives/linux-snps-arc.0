Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36FC3C6FD1F
	for <linux-snps-arc@archiver.kernel.org>; Wed, 22 Mar 2023 23:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1pNap5LAWnMymvH6RIYfxNfOEWL0pz1YXOi8V/uJ+EM=; b=2OiaokJt48Ywq+
	SaIUbYVhJDeBPLyPL7iHfh5cbBzmFGUkwfIBB4nkGniwJ0vv2uINiBSNazooBZiFhxlzsRR0/emfs
	6yP1K8fl4ciUsIQG1s7e53qSO7cCCTs5g6o4W8nkZ2w/8UwbFMk2DWGM/6rAsqSDNr0d8UpzzM+Ib
	szRxvybTzgtxcj5DzssKGSjdfkSzTW0tXeHSfrQ5Bly1jvm4Z8BmkragbwMa36gOFZuejPMZowxC3
	dpoXn0W97FOgg4Nk3P2KQ5kTXwi3dj1Hx+IstX7JzcIjeL/nIPtQ9gyR9C4xPqpFSZ2t1AML+VizC
	ZYH5SpyIB4mzG4GG4B0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pf7fI-0005YJ-2k;
	Wed, 22 Mar 2023 23:14:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pf7fF-0005XK-1g;
	Wed, 22 Mar 2023 23:14:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=hKMA4pE4ZC1WEjwlMS0oahB5WbuLzi761bi+OVXv/X8=; b=k4/hIANBdxC2Z8c++HmkBPk16F
	hq1n4vi1aFY7d/izKMGpm0/zkTd++0c77IZs+Q5bV257Gjkiy34yMSDd8L7TKq46+CV0zDSHb27H+
	4KSIRSylcgYZ2OMei78Bb1gC7STjWled8MJkcwhhG29tpOAa6HtPIFWPyA9seeGrRiJr3vWUYPsTp
	3Vu3FPyPpiLcCMVxhaxuIGSboSf1mmZy7nxDek09nDmg/P6bBJA5M4EMw//9ErW/pvBC1TxeGCDAY
	4DGmD2DpR96GbtKoxaTV3TYyxFMIuFbNKoIU/LaGvb2xuytoT+Rk3V4s2DX53haN44indyDWk1fXo
	N1G/mBcw==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1pf7f5-004hB6-38;
	Wed, 22 Mar 2023 23:14:32 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 9046D30035F;
	Thu, 23 Mar 2023 00:14:28 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 73D47202F7F60; Thu, 23 Mar 2023 00:14:28 +0100 (CET)
Date: Thu, 23 Mar 2023 00:14:28 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Valentin Schneider <vschneid@redhat.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	openrisc@lists.librecores.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-xtensa@linux-xtensa.org,
	x86@kernel.org, "Paul E. McKenney" <paulmck@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Juri Lelli <juri.lelli@redhat.com>,
	Daniel Bristot de Oliveira <bristot@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Marc Zyngier <maz@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Russell King <linux@armlinux.org.uk>,
	Nicholas Piggin <npiggin@gmail.com>, Guo Ren <guoren@kernel.org>,
	"David S. Miller" <davem@davemloft.net>
Subject: Re: [PATCH v5 7/7] sched, smp: Trace smp callback causing an IPI
Message-ID: <20230322231428.GV2017917@hirez.programming.kicks-ass.net>
References: <20230307143558.294354-1-vschneid@redhat.com>
 <20230307143558.294354-8-vschneid@redhat.com>
 <20230322095329.GS2017917@hirez.programming.kicks-ass.net>
 <xhsmhmt45c703.mognet@vschneid.remote.csb>
 <20230322140434.GC2357380@hirez.programming.kicks-ass.net>
 <xhsmhjzz8d8km.mognet@vschneid.remote.csb>
 <20230322172242.GH2357380@hirez.programming.kicks-ass.net>
 <xhsmhh6ucd4t7.mognet@vschneid.remote.csb>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <xhsmhh6ucd4t7.mognet@vschneid.remote.csb>
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

On Wed, Mar 22, 2023 at 06:22:28PM +0000, Valentin Schneider wrote:
> On 22/03/23 18:22, Peter Zijlstra wrote:

> >>        hackbench-157   [001]    10.894320: ipi_send_cpu:         cpu=3 callsite=check_preempt_curr+0x37 callback=0x0
> >
> > Arguably we should be setting callback to scheduler_ipi(), except
> > ofcourse, that's not an actual function...
> >
> > Maybe we can do "extern inline" for the actual users and provide a dummy
> > function for the symbol when tracing.
> >
> 
> Huh, I wasn't aware that was an option, I'll look into that. I did scribble
> down a comment next to smp_send_reschedule(), but having a decodable
> function name would be better!

So clang-15 builds the below (and generates the expected code), but
gcc-12 vomits nonsense about a non-static inline calling a static inline
or somesuch bollocks :-/

--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -1991,7 +1991,7 @@ extern char *__get_task_comm(char *to, s
 })
 
 #ifdef CONFIG_SMP
-static __always_inline void scheduler_ipi(void)
+extern __always_inline void scheduler_ipi(void)
 {
 	/*
 	 * Fold TIF_NEED_RESCHED into the preempt_count; anybody setting
--- a/include/linux/smp.h
+++ b/include/linux/smp.h
@@ -130,9 +130,9 @@ extern void arch_smp_send_reschedule(int
  * scheduler_ipi() is inline so can't be passed as callback reason, but the
  * callsite IP should be sufficient for root-causing IPIs sent from here.
  */
-#define smp_send_reschedule(cpu) ({		  \
-	trace_ipi_send_cpu(cpu, _RET_IP_, NULL);  \
-	arch_smp_send_reschedule(cpu);		  \
+#define smp_send_reschedule(cpu) ({				\
+	trace_ipi_send_cpu(cpu, _RET_IP_, &scheduler_ipi);	\
+	arch_smp_send_reschedule(cpu);				\
 })
 
 /*
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -3790,6 +3790,15 @@ static int ttwu_runnable(struct task_str
 }
 
 #ifdef CONFIG_SMP
+void scheduler_ipi(void)
+{
+	/*
+	 * Actual users should end up using the extern inline, this is only
+	 * here for the symbol.
+	 */
+	BUG();
+}
+
 void sched_ttwu_pending(void *arg)
 {
 	struct llist_node *llist = arg;

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
