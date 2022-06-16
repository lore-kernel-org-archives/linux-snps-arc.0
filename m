Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB350CCA47A
	for <linux-snps-arc@archiver.kernel.org>; Thu, 16 Jun 2022 21:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8x2NkKGzMEh9t7XTufAPFx24NDP1WwQnhdtkKs9OeIE=; b=bHiH/1ZaC1YmMn
	RE85toe/lzR7gaBuQpqKFWvGrZd5RcP3zSNDAlBlazzkDXpmN9tkXuJ4Nr7TsyncMhfJkvhhjztvi
	mk9ycwwvAfU9EJ3kD8Q+Eyh/BUWE5HwKtiSPwbnWhTyNkZ3HZiKxzLHFDBiRHvd5bYYunx6IK8RtI
	CDKC/7S321yocfwXcyRSN3/tiVjNt8SfU5dHNcugjuzQx2y11ylKWaWp6jghmvxw86OgrwkeMC/b3
	RJcDCUvZmb3KDmI3Es+j8S8CEH/pegIWFP3tZjEKEKrOt5s04r8uUlAE+giwuP9tMBagyU1oRpPuS
	KejIwNYJzCx0VVu1K5qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1wx8-004QLH-7z; Thu, 16 Jun 2022 21:22:58 +0000
Received: from mga09.intel.com ([134.134.136.24])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1wx4-004QJs-Ug; Thu, 16 Jun 2022 21:22:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655414574; x=1686950574;
  h=date:from:to:cc:subject:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eIVB2Wcg0d4KNkOlM5BOJs0iOIDhUm5jxxQVobMAAIM=;
  b=BO4odpVxsFwd9mK3R1wMKxkty02aVQSLeG56c8Yf9u9qbSFZMhTgY9i8
   pMut38rRq/l91hLklKq9lPznZuVpss98WtaIyVUIJMTfuQJ9A6ShJ5C8g
   h+j94pPZycB4BwSPfLcSw8Ao5IAWqn9FI7nSo9IOKX/8IGQgdJDBeCEEJ
   dJMkQ6F6Il2SYq77W3ggP32MtLGzus0iYoVESy6hGtz2Y0loOygyGo6uw
   6Y5FPVGlwbfvjCbEljGfITBfgCHsrExf71qhwoGITHkBsTm5EEg5au1d2
   J1wJzr7ATowlhyr216YbDFsJdkYJ5hfWbpeRiyQ8ZjHl0m5BQCIT5qjPJ
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="280069487"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="280069487"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2022 14:22:51 -0700
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="560027674"
Received: from jacob-builder.jf.intel.com (HELO jacob-builder) ([10.7.198.157])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2022 14:22:51 -0700
Date: Thu, 16 Jun 2022 14:26:56 -0700
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com,
 vgupta@kernel.org, linux@armlinux.org.uk, ulli.kroll@googlemail.com,
 linus.walleij@linaro.org, shawnguo@kernel.org, Sascha Hauer
 <s.hauer@pengutronix.de>, kernel@pengutronix.de, festevam@gmail.com,
 linux-imx@nxp.com, tony@atomide.com, khilman@kernel.org,
 catalin.marinas@arm.com, will@kernel.org, guoren@kernel.org,
 bcain@quicinc.com, chenhuacai@kernel.org, kernel@xen0n.name,
 geert@linux-m68k.org, sammy@sammy.net, monstr@monstr.eu,
 tsbogend@alpha.franken.de, dinguyen@kernel.org, jonas@southpole.se,
 stefan.kristiansson@saunalahti.fi, shorne@gmail.com,
 James.Bottomley@hansenpartnership.com, deller@gmx.de, mpe@ellerman.id.au,
 benh@kernel.crashing.org, paulus@samba.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, hca@linux.ibm.com,
 gor@linux.ibm.com, agordeev@linux.ibm.com, borntraeger@linux.ibm.com,
 svens@linux.ibm.com, ysato@users.sourceforge.jp, dalias@libc.org,
 davem@davemloft.net, richard@nod.at, anton.ivanov@cambridgegreys.com,
 johannes@sipsolutions.net, tglx@linutronix.de, mingo@redhat.com,
 bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
 acme@kernel.org, mark.rutland@arm.com, alexander.shishkin@linux.intel.com,
 jolsa@kernel.org, namhyung@kernel.org, jgross@suse.com,
 srivatsa@csail.mit.edu, amakhalov@vmware.com, pv-drivers@vmware.com,
 boris.ostrovsky@oracle.com, chris@zankel.net, jcmvbkbc@gmail.com,
 rafael@kernel.org, lenb@kernel.org, pavel@ucw.cz,
 gregkh@linuxfoundation.org, mturquette@baylibre.com, sboyd@kernel.org,
 daniel.lezcano@linaro.org, lpieralisi@kernel.org, sudeep.holla@arm.com,
 agross@kernel.org, bjorn.andersson@linaro.org, anup@brainfault.org,
 thierry.reding@gmail.com, jonathanh@nvidia.com, Arnd Bergmann
 <arnd@arndb.de>, yury.norov@gmail.com, andriy.shevchenko@linux.intel.com,
 linux@rasmusvillemoes.dk, rostedt@goodmis.org, pmladek@suse.com,
 senozhatsky@chromium.org, john.ogness@linutronix.de, paulmck@kernel.org,
 frederic@kernel.org, quic_neeraju@quicinc.com, josh@joshtriplett.org,
 mathieu.desnoyers@efficios.com, jiangshanlai@gmail.com,
 joel@joelfernandes.org, juri.lelli@redhat.com, vincent.guittot@linaro.org,
 dietmar.eggemann@arm.com, bsegall@google.com, mgorman@suse.de,
 bristot@redhat.com, vschneid@redhat.com, jpoimboe@kernel.org,
 linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 openrisc@lists.librecores.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
 linux-perf-users@vger.kernel.org,
 virtualization@lists.linux-foundation.org, xen-devel@lists.xenproject.org,
 linux-xtensa@linux-xtensa.org, linux-acpi@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-arch@vger.kernel.org, rcu@vger.kernel.org,
 jacob.jun.pan@linux.intel.com
Subject: Re: [PATCH 04/36] cpuidle,intel_idle: Fix CPUIDLE_FLAG_IRQ_ENABLE
Message-ID: <20220616142656.4b1acc4a@jacob-builder>
In-Reply-To: <Yqb45vclY2KVL0wZ@hirez.programming.kicks-ass.net>
References: <20220608142723.103523089@infradead.org>
	<20220608144516.172460444@infradead.org>
	<20220609164921.5e61711d@jacob-builder>
	<Yqb45vclY2KVL0wZ@hirez.programming.kicks-ass.net>
Organization: OTC
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220616_142255_113472_64EABAB1 
X-CRM114-Status: GOOD (  20.04  )
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

Hi Peter,

On Mon, 13 Jun 2022 10:44:22 +0200, Peter Zijlstra <peterz@infradead.org>
wrote:

> On Thu, Jun 09, 2022 at 04:49:21PM -0700, Jacob Pan wrote:
> > Hi Peter,
> > 
> > On Wed, 08 Jun 2022 16:27:27 +0200, Peter Zijlstra
> > <peterz@infradead.org> wrote:
> >   
> > > Commit c227233ad64c ("intel_idle: enable interrupts before C1 on
> > > Xeons") wrecked intel_idle in two ways:
> > > 
> > >  - must not have tracing in idle functions
> > >  - must return with IRQs disabled
> > > 
> > > Additionally, it added a branch for no good reason.
> > > 
> > > Fixes: c227233ad64c ("intel_idle: enable interrupts before C1 on
> > > Xeons") Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> > > ---
> > >  drivers/idle/intel_idle.c |   48
> > > +++++++++++++++++++++++++++++++++++----------- 1 file changed, 37
> > > insertions(+), 11 deletions(-)
> > > 
> > > --- a/drivers/idle/intel_idle.c
> > > +++ b/drivers/idle/intel_idle.c
> > > @@ -129,21 +137,37 @@ static unsigned int mwait_substates __in
> > >   *
> > >   * Must be called under local_irq_disable().
> > >   */  
> > nit: this comment is no long true, right?  
> 
> It still is, all the idle routines are called with interrupts disabled,
> but must also exit with interrupts disabled.
> 
> If the idle method requires interrupts to be enabled, it must be sure to
> disable them again before returning. Given all the RCU/tracing concerns
> it must use raw_local_irq_*() for this though.
Makes sense, it is just little confusing when the immediate caller does
raw_local_irq_enable() which does not cancel out local_irq_disable().

Thanks,

Jacob

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
