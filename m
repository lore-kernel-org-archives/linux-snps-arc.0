Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 835CBCCA487
	for <linux-snps-arc@archiver.kernel.org>; Wed,  8 Jun 2022 14:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Subject:Cc:To:
	From:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=w3212IFMOYk7Y62j86iSCh91NgULGoQcvjkYCWqmPtM=; b=FJWD5EcTKllRAa
	ZM3LhvURO8ICWGn4immCUJIDDMfzru5Jc1D8CD7BWhmUEHibp9u+Tgm/WUc//I6VKXbGVwayBVMWE
	gFjYLsTXT4tpt2xbD0YbuuYF/5/C4wvN0TKk6+PkfubOmVhVzP2zQRQEbjOy1vyhkmS6A0z0W+maO
	le0J2xp8XZWr2LqXhaS7GZK7hYpd2K/czLGL5YldYT23dBJdIEagp1Zv8AQWeNLgAv8gHsJkHhP5m
	4E5n7XiZJ7SE7ZbQetPHHhtq3kjIZZgGKWaGOpbu65YaFLWhLJY7opV0gFZ1T9TM7SKQuGTIIZiTB
	1VJPz9l5KKVOjDH4rvlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nywyy-00DlQ0-S9; Wed, 08 Jun 2022 14:48:28 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nywx9-00Dk6s-9R; Wed, 08 Jun 2022 14:46:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=+nBTmu8be4dn87X4h4i4v5hXqWi/FDQJ2e0V2G49JnI=; b=c0sBpB4EJtpUlMJmM1BtzQg1jI
	4PcdDgJzYOowDoMnmKAFYhNbpvRYzsV7kRFyLJf62+ZuPqPEFAxeBvm38jC9EIzinrmdPRpzRnIth
	ZjcGrFN3FC2OLDiPw1MQ9GiO/ueu64sxGeUIVMfNNGZ1I6IAzUSGlYS50yZYH/qpVkumUW9sz9ylw
	NiQ4O2XB8H8Hk/RXSmU/7i/042dpY1RsaqJxDbzJ3hgd+h+vW2daHvNujHxeLDb2O3c/EAvt6fmpH
	/CT3Hd5fJEQuF8uryywQG23Lx98/8viggcr1njgwvu2L7IHYIVv/w/rdZa7aTRE+XIf9ro7DYS6a3
	okJs1Mxg==;
Received: from dhcp-077-249-017-003.chello.nl ([77.249.17.3] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nywx3-00ChYC-JV; Wed, 08 Jun 2022 14:46:29 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id A3BE9302EEA;
	Wed,  8 Jun 2022 16:46:23 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 0)
	id 9DB8020C10EDE; Wed,  8 Jun 2022 16:46:18 +0200 (CEST)
Message-ID: <20220608144517.507286638@infradead.org>
User-Agent: quilt/0.66
Date: Wed, 08 Jun 2022 16:27:48 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: peterz@infradead.org
Cc: rth@twiddle.net,
 ink@jurassic.park.msu.ru,
 mattst88@gmail.com,
 vgupta@kernel.org,
 linux@armlinux.org.uk,
 ulli.kroll@googlemail.com,
 linus.walleij@linaro.org,
 shawnguo@kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>,
 kernel@pengutronix.de,
 festevam@gmail.com,
 linux-imx@nxp.com,
 tony@atomide.com,
 khilman@kernel.org,
 catalin.marinas@arm.com,
 will@kernel.org,
 guoren@kernel.org,
 bcain@quicinc.com,
 chenhuacai@kernel.org,
 kernel@xen0n.name,
 geert@linux-m68k.org,
 sammy@sammy.net,
 monstr@monstr.eu,
 tsbogend@alpha.franken.de,
 dinguyen@kernel.org,
 jonas@southpole.se,
 stefan.kristiansson@saunalahti.fi,
 shorne@gmail.com,
 James.Bottomley@HansenPartnership.com,
 deller@gmx.de,
 mpe@ellerman.id.au,
 benh@kernel.crashing.org,
 paulus@samba.org,
 paul.walmsley@sifive.com,
 palmer@dabbelt.com,
 aou@eecs.berkeley.edu,
 hca@linux.ibm.com,
 gor@linux.ibm.com,
 agordeev@linux.ibm.com,
 borntraeger@linux.ibm.com,
 svens@linux.ibm.com,
 ysato@users.sourceforge.jp,
 dalias@libc.org,
 davem@davemloft.net,
 richard@nod.at,
 anton.ivanov@cambridgegreys.com,
 johannes@sipsolutions.net,
 tglx@linutronix.de,
 mingo@redhat.com,
 bp@alien8.de,
 dave.hansen@linux.intel.com,
 x86@kernel.org,
 hpa@zytor.com,
 acme@kernel.org,
 mark.rutland@arm.com,
 alexander.shishkin@linux.intel.com,
 jolsa@kernel.org,
 namhyung@kernel.org,
 jgross@suse.com,
 srivatsa@csail.mit.edu,
 amakhalov@vmware.com,
 pv-drivers@vmware.com,
 boris.ostrovsky@oracle.com,
 chris@zankel.net,
 jcmvbkbc@gmail.com,
 rafael@kernel.org,
 lenb@kernel.org,
 pavel@ucw.cz,
 gregkh@linuxfoundation.org,
 mturquette@baylibre.com,
 sboyd@kernel.org,
 daniel.lezcano@linaro.org,
 lpieralisi@kernel.org,
 sudeep.holla@arm.com,
 agross@kernel.org,
 bjorn.andersson@linaro.org,
 anup@brainfault.org,
 thierry.reding@gmail.com,
 jonathanh@nvidia.com,
 jacob.jun.pan@linux.intel.com,
 Arnd Bergmann <arnd@arndb.de>,
 yury.norov@gmail.com,
 andriy.shevchenko@linux.intel.com,
 linux@rasmusvillemoes.dk,
 rostedt@goodmis.org,
 pmladek@suse.com,
 senozhatsky@chromium.org,
 john.ogness@linutronix.de,
 paulmck@kernel.org,
 frederic@kernel.org,
 quic_neeraju@quicinc.com,
 josh@joshtriplett.org,
 mathieu.desnoyers@efficios.com,
 jiangshanlai@gmail.com,
 joel@joelfernandes.org,
 juri.lelli@redhat.com,
 vincent.guittot@linaro.org,
 dietmar.eggemann@arm.com,
 bsegall@google.com,
 mgorman@suse.de,
 bristot@redhat.com,
 vschneid@redhat.com,
 jpoimboe@kernel.org,
 linux-alpha@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-snps-arc@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 linux-omap@vger.kernel.org,
 linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org,
 linux-ia64@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org,
 openrisc@lists.librecores.org,
 linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org,
 linux-um@lists.infradead.org,
 linux-perf-users@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 xen-devel@lists.xenproject.org,
 linux-xtensa@linux-xtensa.org,
 linux-acpi@vger.kernel.org,
 linux-pm@vger.kernel.org,
 linux-clk@vger.kernel.org,
 linux-arm-msm@vger.kernel.org,
 linux-tegra@vger.kernel.org,
 linux-arch@vger.kernel.org,
 rcu@vger.kernel.org
Subject: [PATCH 25/36] time/tick-broadcast: Remove RCU_NONIDLE usage
References: <20220608142723.103523089@infradead.org>
MIME-Version: 1.0
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

No callers left that have already disabled RCU.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 kernel/time/tick-broadcast-hrtimer.c |   29 ++++++++++++-----------------
 1 file changed, 12 insertions(+), 17 deletions(-)

--- a/kernel/time/tick-broadcast-hrtimer.c
+++ b/kernel/time/tick-broadcast-hrtimer.c
@@ -56,25 +56,20 @@ static int bc_set_next(ktime_t expires,
 	 * hrtimer callback function is currently running, then
 	 * hrtimer_start() cannot move it and the timer stays on the CPU on
 	 * which it is assigned at the moment.
+	 */
+	hrtimer_start(&bctimer, expires, HRTIMER_MODE_ABS_PINNED_HARD);
+	/*
+	 * The core tick broadcast mode expects bc->bound_on to be set
+	 * correctly to prevent a CPU which has the broadcast hrtimer
+	 * armed from going deep idle.
 	 *
-	 * As this can be called from idle code, the hrtimer_start()
-	 * invocation has to be wrapped with RCU_NONIDLE() as
-	 * hrtimer_start() can call into tracing.
+	 * As tick_broadcast_lock is held, nothing can change the cpu
+	 * base which was just established in hrtimer_start() above. So
+	 * the below access is safe even without holding the hrtimer
+	 * base lock.
 	 */
-	RCU_NONIDLE( {
-		hrtimer_start(&bctimer, expires, HRTIMER_MODE_ABS_PINNED_HARD);
-		/*
-		 * The core tick broadcast mode expects bc->bound_on to be set
-		 * correctly to prevent a CPU which has the broadcast hrtimer
-		 * armed from going deep idle.
-		 *
-		 * As tick_broadcast_lock is held, nothing can change the cpu
-		 * base which was just established in hrtimer_start() above. So
-		 * the below access is safe even without holding the hrtimer
-		 * base lock.
-		 */
-		bc->bound_on = bctimer.base->cpu_base->cpu;
-	} );
+	bc->bound_on = bctimer.base->cpu_base->cpu;
+
 	return 0;
 }
 



_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
