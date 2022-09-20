Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7498C54EE9
	for <linux-snps-arc@archiver.kernel.org>; Tue, 20 Sep 2022 10:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KalWNJAhTmaUEn2jA/yfB92FsQhpPkLZQ1Ko38II4ys=; b=u3HuN4LqWrObGk
	cj8MGHry4JdZYtUZBt2cAfwzAKsTrdgyNopqI3Vj0KFMUXJtRR8v2sR5n98Jp2cFkmX4rO9q5MNa2
	g+QBmhqn4YKFvkKqj/XM6uSNHJ/MoU0WC3SqRbRLDLOolNy+iLoPYCjvr7sQ/c+a4aKJjr6KWSBom
	s+ixN3fHUU2XO0vLfYliFkf5Y4y4728kXqYH3rTNNIW+LIndRILRgsen2nrd/siVtLSrWOp7EFDx1
	kLRwrta5ANQky8ki4Yo/G9MwNMF9Yn/Zvk26vao7xbkfQf5t/9zr9iuG/ggw7h7WNJ3OJ96OPumFW
	1WnriRSHpKBSuL11nx2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaaj7-00349E-7t; Tue, 20 Sep 2022 10:43:41 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaaiv-003450-Jm; Tue, 20 Sep 2022 10:43:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0BBD662224;
	Tue, 20 Sep 2022 10:43:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A744C433C1;
	Tue, 20 Sep 2022 10:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663670608;
	bh=6GsQ3yhKLr/MxdSlXebBHOnZZwkqV+Km5n+FdtLELFs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B5dAVjAuYVAf/ldcpMwVOIccr93eh+i/PPqe86bcTTpe9rquyYiwNXWsEYN6MEgtC
	 4dkSGP8Y6MjqZepb+9gQ6s3zfFi8AQZlWHaT9YE94OBgT652ETiHQ4+oyg1H9cMKe0
	 W4ejHxERjCdEHRyFhCMtozUTXVDZIa2H0g10CJTUgcjhZqBq48hlTCa71o1rmNMJUn
	 UuRNJ769Ea2tTmdOKpPB1SWcTi7Afm+dzY4ofsUzOPWyR3eaWqkGsJ5+yZC/8xtTFB
	 fdtVAvZE4UfiE+hEXckkBlXeuH+b1N2KqaqSOzsoRx2yLdTrKi9779585hh4U8ohjY
	 b1TN7NMPsPyxQ==
Date: Tue, 20 Sep 2022 12:43:25 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: richard.henderson@linaro.org, ink@jurassic.park.msu.ru,
	mattst88@gmail.com, vgupta@kernel.org, linux@armlinux.org.uk,
	ulli.kroll@googlemail.com, linus.walleij@linaro.org,
	shawnguo@kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
	kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
	tony@atomide.com, khilman@kernel.org, catalin.marinas@arm.com,
	will@kernel.org, guoren@kernel.org, bcain@quicinc.com,
	chenhuacai@kernel.org, kernel@xen0n.name, geert@linux-m68k.org,
	sammy@sammy.net, monstr@monstr.eu, tsbogend@alpha.franken.de,
	dinguyen@kernel.org, jonas@southpole.se,
	stefan.kristiansson@saunalahti.fi, shorne@gmail.com,
	James.Bottomley@hansenpartnership.com, deller@gmx.de,
	mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
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
	konrad.dybcio@somainline.org, anup@brainfault.org,
	thierry.reding@gmail.com, jonathanh@nvidia.com,
	jacob.jun.pan@linux.intel.com, atishp@atishpatra.org,
	Arnd Bergmann <arnd@arndb.de>, yury.norov@gmail.com,
	andriy.shevchenko@linux.intel.com, linux@rasmusvillemoes.dk,
	dennis@kernel.org, tj@kernel.org, cl@linux.com, rostedt@goodmis.org,
	pmladek@suse.com, senozhatsky@chromium.org,
	john.ogness@linutronix.de, juri.lelli@redhat.com,
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
	bsegall@google.com, mgorman@suse.de, bristot@redhat.com,
	vschneid@redhat.com, fweisbec@gmail.com, ryabinin.a.a@gmail.com,
	glider@google.com, andreyknvl@gmail.com, dvyukov@google.com,
	vincenzo.frascino@arm.com,
	Andrew Morton <akpm@linux-foundation.org>, jpoimboe@kernel.org,
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org, linux-omap@vger.kernel.org,
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
	linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
	openrisc@lists.librecores.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	linux-xtensa@linux-xtensa.org, linux-acpi@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-arch@vger.kernel.org, kasan-dev@googlegroups.com,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Subject: Re: [PATCH v2 03/44] cpuidle/poll: Ensure IRQ state is invariant
Message-ID: <20220920104325.GA72346@lothringen>
References: <20220919095939.761690562@infradead.org>
 <20220919101520.534233547@infradead.org>
 <20220919131927.GA58444@lothringen>
 <YymAXPkZkyFIEjXM@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YymAXPkZkyFIEjXM@hirez.programming.kicks-ass.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_034329_749097_2EE4DBCF 
X-CRM114-Status: GOOD (  17.82  )
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

On Tue, Sep 20, 2022 at 10:57:00AM +0200, Peter Zijlstra wrote:
> On Mon, Sep 19, 2022 at 03:19:27PM +0200, Frederic Weisbecker wrote:
> > On Mon, Sep 19, 2022 at 11:59:42AM +0200, Peter Zijlstra wrote:
> > > cpuidle_state::enter() methods should be IRQ invariant
> > 
> > Got a bit confused with the invariant thing since the first chunck I
> > see in this patch is a conversion to an non-traceable local_irq_enable().
> > 
> > Maybe just add a short mention about that and why?
> 
> Changelog now reads:
> 
> ---
> Subject: cpuidle/poll: Ensure IRQ state is invariant
> From: Peter Zijlstra <peterz@infradead.org>
> Date: Tue May 31 15:43:32 CEST 2022
> 
> cpuidle_state::enter() methods should be IRQ invariant.
> 
> Additionally make sure to use raw_local_irq_*() methods since this
> cpuidle callback will be called with RCU already disabled.
> 
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> Reviewed-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

Reviewed-by: Frederic Weisbecker <frederic@kernel.org>

Thanks!


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
