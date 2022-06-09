Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14873CCA482
	for <linux-snps-arc@archiver.kernel.org>; Thu,  9 Jun 2022 13:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gQcZnMyGFcB4RiINSM5B3xqTd4tOvoT8wS+wzGS1Mg8=; b=q9vK2kfS20LjFM
	vqvihv125quAnsOr4/5nQTCZ3oo0mKEywxcZch2HREcYng52ULaTgOFSuJREtllcqmm70j5QCqgEb
	l0Ew01HbVfmPvhaQDUGgT4oCc7L5RDTRriryJY4bfJua4Bc/rqyHSkG6o8PkRIgo33b0aOhWdLc1X
	O0/XIXCnFlvS3MwlTtA5pFG8NPcRTtby1Bt8zwKlWt/+VfcLC3hiDiDEV5IgYD3PryXwdGHqrcnRZ
	Khkh1KGIXwdksEzcBI6fs6B273woqNogxFtcc2hz7qBXgII8A/pevmo+uekXfNUArdrcRtf8a+OJo
	GZgCSYIAQytGYWB+Efxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzHo3-001xne-3k; Thu, 09 Jun 2022 13:02:35 +0000
Received: from smtp-out1.suse.de ([195.135.220.28])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzHny-001xkj-S0; Thu, 09 Jun 2022 13:02:32 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id A55BE21F03;
	Thu,  9 Jun 2022 13:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1654779746; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WNgY7GyrprNl76LhtyM4yyAr1//LVOR4uCT8xLqGCE8=;
	b=ojtY10eQLedQ1p8W7bkgtPGLkS2AZjpFLq6Jm7M5r6QmnKTONMm4DEE4c/QdWiGdnShevp
	eIN6ALkkVVj/WhUF02Ld8MHz00y8tRrFQ0iNR/EUdLO4UR9+Vq8VAuuJcSid16nMNGAGa3
	XvOmhnJPAVDKUKq8/PtY3J2tLln4dQU=
Received: from suse.cz (unknown [10.100.208.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id 6EA862C141;
	Thu,  9 Jun 2022 13:02:21 +0000 (UTC)
Date: Thu, 9 Jun 2022 15:02:20 +0200
From: Petr Mladek <pmladek@suse.com>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Peter Zijlstra <peterz@infradead.org>, ink@jurassic.park.msu.ru,
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
	linux@rasmusvillemoes.dk, rostedt@goodmis.org,
	john.ogness@linutronix.de, paulmck@kernel.org, frederic@kernel.org,
	quic_neeraju@quicinc.com, josh@joshtriplett.org,
	mathieu.desnoyers@efficios.com, jiangshanlai@gmail.com,
	joel@joelfernandes.org, juri.lelli@redhat.com,
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
	bsegall@google.com, mgorman@suse.de, bristot@redhat.com,
	vschneid@redhat.com, jpoimboe@kernel.org,
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
Subject: Re: [PATCH 24/36] printk: Remove trace_.*_rcuidle() usage
Message-ID: <YqHvXFdIJfvUDI6e@alley>
References: <20220608142723.103523089@infradead.org>
 <20220608144517.444659212@infradead.org>
 <YqG6URbihTNCk9YR@alley>
 <YqHFHB6qqv5wiR8t@worktop.programming.kicks-ass.net>
 <CA+_sPaoJGrXhNPCs2dKf2J7u07y1xYrRFZBUtkKwzK9GqcHSuQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+_sPaoJGrXhNPCs2dKf2J7u07y1xYrRFZBUtkKwzK9GqcHSuQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_060231_077754_7F7B413A 
X-CRM114-Status: GOOD (  12.14  )
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

On Thu 2022-06-09 20:30:58, Sergey Senozhatsky wrote:
> My emails are getting rejected... Let me try web-interface

Bad day for mail sending. I have problems as well ;-)

> Kudos to Petr for the questions and thanks to PeterZ for the answers.
> 
> On Thu, Jun 9, 2022 at 7:02 PM Peter Zijlstra <peterz@infradead.org> wrote:
> > This is the tracepoint used to spool all of printk into ftrace, I
> > suspect there's users, but I haven't used it myself.
> 
> I'm somewhat curious whether we can actually remove that trace event.

Good question.

Well, I think that it might be useful. It allows to see trace and
printk messages together.

It was ugly when it was in the console code. The new location
in vprintk_store() allows to have it even "correctly" sorted
(timestamp) against other tracing messages.

Best Regards,
Petr

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
