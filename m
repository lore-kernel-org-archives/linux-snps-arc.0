Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB194C433EF
	for <linux-snps-arc@archiver.kernel.org>; Wed,  8 Jun 2022 15:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Subject:Cc:To:
	From:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=twXJnrkYQgEjUYgdF/Hr0gGBUUJoKFAFaABJT64ZN6U=; b=gRE+4/QqR3dpeb
	EDMrZSWCsvnxEql4nVtiJ94IY8eB5LfB1igTgTFFs6uWdrPSpBG7xYE/2qYtdhN/6bHit9VOiOg2j
	xmLcPV0ibiqCq/Dxfzgz0RvT1cXurb4137OBGAcbb7ZpiicuO9nIkz54OTd2RY8TWS3fxx18G0JYF
	gVsSvoRVWdMCY4Y36d95K5iuvyFJBdvf1LJedzHMLlybMVO5ksilTpVb5snkLWGSYAOYm2vJ6S9T0
	oo+TSH1t6J3GHt7+R8wXQLudIRLXweYsR9bMB3JNA1zTkmcJwP67AKAnS56TdBRmc7OJuHQYWlAiR
	7jhe2t+dBtNCMUehy42w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyxFa-00Dtn5-6d; Wed, 08 Jun 2022 15:05:38 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyxEs-00DtBr-21; Wed, 08 Jun 2022 15:04:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=YOWU43M4IjsvcmJXQwOIFJh+WuCbnSytdcIdnv65DkY=; b=XCDVN9tj9Nd6cCt5yPaK9O3amI
	ci7YUUM2v+28cn8J99wm4KhjbAdAoCxm0ZkgOdpCkJChjzfZ+C735h+hlVrx0OpQ7Sz06hLL2cROZ
	Bv8WVo508YV6l6eZBA29iCGnbSDF9FtDcrv+aceuzuJTig8MZggSg4i4uwwpFk8A3wQMqX47uf/mT
	8zfnGc1VxoVB+WmWEDtxTYLuSF41PTkkxW16U+FTxE7204ryh1jVbHwBdUZ4quIaNuIHjqbsN+C7n
	+Iep3h1zsyXP0xbxfqaVi9r1Yzcival+fbwxlxbx1qrowfPg2m7YfJQdX7yj+Cn50NoW7JIOu6shq
	BsRPsiUA==;
Received: from dhcp-077-249-017-003.chello.nl ([77.249.17.3] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nywww-00ChVp-CO; Wed, 08 Jun 2022 14:46:22 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 5CD17300779;
	Wed,  8 Jun 2022 16:46:18 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 0)
	id 36D1B20C0F9A1; Wed,  8 Jun 2022 16:46:18 +0200 (CEST)
Message-ID: <20220608144515.984413284@infradead.org>
User-Agent: quilt/0.66
Date: Wed, 08 Jun 2022 16:27:24 +0200
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
Subject: [PATCH 01/36] x86/perf/amd: Remove tracing from perf_lopwr_cb()
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

The perf_lopwr_cb() is called from the idle routines; there is no RCU
there, we must not enter tracing.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 arch/x86/events/amd/brs.c         |   13 +++++--------
 arch/x86/include/asm/perf_event.h |    2 +-
 2 files changed, 6 insertions(+), 9 deletions(-)

--- a/arch/x86/events/amd/brs.c
+++ b/arch/x86/events/amd/brs.c
@@ -41,18 +41,15 @@ static inline unsigned int brs_to(int id
 	return MSR_AMD_SAMP_BR_FROM + 2 * idx + 1;
 }
 
-static inline void set_debug_extn_cfg(u64 val)
+static __always_inline void set_debug_extn_cfg(u64 val)
 {
 	/* bits[4:3] must always be set to 11b */
-	wrmsrl(MSR_AMD_DBG_EXTN_CFG, val | 3ULL << 3);
+	__wrmsr(MSR_AMD_DBG_EXTN_CFG, val | 3ULL << 3, val >> 32);
 }
 
-static inline u64 get_debug_extn_cfg(void)
+static __always_inline u64 get_debug_extn_cfg(void)
 {
-	u64 val;
-
-	rdmsrl(MSR_AMD_DBG_EXTN_CFG, val);
-	return val;
+	return __rdmsr(MSR_AMD_DBG_EXTN_CFG);
 }
 
 static bool __init amd_brs_detect(void)
@@ -338,7 +335,7 @@ void amd_pmu_brs_sched_task(struct perf_
  * called from ACPI processor_idle.c or acpi_pad.c
  * with interrupts disabled
  */
-void perf_amd_brs_lopwr_cb(bool lopwr_in)
+void noinstr perf_amd_brs_lopwr_cb(bool lopwr_in)
 {
 	struct cpu_hw_events *cpuc = this_cpu_ptr(&cpu_hw_events);
 	union amd_debug_extn_cfg cfg;
--- a/arch/x86/include/asm/perf_event.h
+++ b/arch/x86/include/asm/perf_event.h
@@ -554,7 +554,7 @@ extern void perf_amd_brs_lopwr_cb(bool l
 
 DECLARE_STATIC_CALL(perf_lopwr_cb, perf_amd_brs_lopwr_cb);
 
-static inline void perf_lopwr_cb(bool lopwr_in)
+static __always_inline void perf_lopwr_cb(bool lopwr_in)
 {
 	static_call_mod(perf_lopwr_cb)(lopwr_in);
 }



_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
