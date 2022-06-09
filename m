Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 248E7C43334
	for <linux-snps-arc@archiver.kernel.org>; Thu,  9 Jun 2022 11:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BiFLwckdDqPxBxWyCt3jIgGfX4Mo7gSdDegtIPjVSLM=; b=KDe2I7EbkrLf6u
	DTUxvZionH3o/xMKr820sidQL+WBec0O6F2GR9urAUkooOLPVWQUjn6oIWzdEYwfA1bP41g6T1WTe
	0v8e8vqQHFB5aXObgn7Sk/UfsdvRjhYmGTqudTtKRYJFYSZQT0QX+wZDnCi6msTJ0h706FnwceneD
	f2hiILW8JJiBQdmS9h/v4ujgIRX6oDyEOq77To42ivVSo32JKyqxApiMBQPLBUVQ+US8vZkPWPiTK
	tYOzTJeclxUoMijz/30xj51zx5pUeh1+M3BbPhUNFR3HlZja72T+bRgVO0Xc6XlbfLhBXfiWs4ap4
	iNj148vyvebrbN1OoNQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzGQQ-001MRm-DO; Thu, 09 Jun 2022 11:34:06 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzGNc-001L4a-GW
	for linux-snps-arc@lists.infradead.org; Thu, 09 Jun 2022 11:31:14 +0000
Received: by mail-ej1-x62e.google.com with SMTP id g25so360677ejh.9
        for <linux-snps-arc@lists.infradead.org>; Thu, 09 Jun 2022 04:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+XewJc/p+7yp1re11t6BfmEtfp27WPbXPnywgusXXTc=;
        b=dD0Bz9eW32MHk+TeRLS+QqFpXQSyJG1PFuM0sFc2oIQiPmRbBKI4wiAjUnrY0TOPB3
         vmLpoVIxPESYT9ISrrirk39KtLhSpCgEKtG3yrDCpv/Gh6ZWSamp4kS8RJg23gIGNIEa
         lDd2yagv7BcuRvFzrWxMhthjwknH7br96szys=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+XewJc/p+7yp1re11t6BfmEtfp27WPbXPnywgusXXTc=;
        b=zoaMYaj1TWcdvDk5ZqmlhfCqFQephao/ikOzGw2klhOUhESgN/k7YjuR/6rfh7w6bG
         drkzG0qF0jXKyiH39/DAaIHWLMXOamr84VC8xpSCDe1DMKAwENeoHRO70M0ggnHvoZvl
         x+Rqt0xxnDCN92VxxriB91JTprkR7QXSMM4KPbbjyVZrf4XUKHE3nx3xZfJozTG8GGXX
         FWcw+AM9JmdEZm4tyrz8CgEcRQFDazRWXCejGwQpAY4F56fnVzQBDS/25oZqU64VgGwg
         u6aQDM0EarocM9a91NhZAzyrvANHjyepVfvz8r5HP8Ry5ZEyfCJiv3Qk7aUZ8Tzc3QWM
         RYFg==
X-Gm-Message-State: AOAM533O+ylsGy0CTPMsVV3/ECAmd38NefgbUlWWm/nU1T861SclCwxA
	fEh0QZzmH2XrLKZxRSSdDL/WuqXy6qoTD6yCO9Gi6Q==
X-Google-Smtp-Source: ABdhPJx9nV7wAxP/lyAtNedlGfDPIROj9YXpatcH7EqCac1uVlfTSKszMzYbWUxkatf8WgjTCZNOZTjPAlJBoltWDx4=
X-Received: by 2002:a17:907:c22:b0:711:dc95:3996 with SMTP id
 ga34-20020a1709070c2200b00711dc953996mr13928684ejc.62.1654774269713; Thu, 09
 Jun 2022 04:31:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220608142723.103523089@infradead.org> <20220608144517.444659212@infradead.org>
 <YqG6URbihTNCk9YR@alley> <YqHFHB6qqv5wiR8t@worktop.programming.kicks-ass.net>
In-Reply-To: <YqHFHB6qqv5wiR8t@worktop.programming.kicks-ass.net>
From: Sergey Senozhatsky <senozhatsky@chromium.org>
Date: Thu, 9 Jun 2022 20:30:58 +0900
Message-ID: <CA+_sPaoJGrXhNPCs2dKf2J7u07y1xYrRFZBUtkKwzK9GqcHSuQ@mail.gmail.com>
Subject: Re: [PATCH 24/36] printk: Remove trace_.*_rcuidle() usage
To: Peter Zijlstra <peterz@infradead.org>
Cc: Petr Mladek <pmladek@suse.com>, ink@jurassic.park.msu.ru, mattst88@gmail.com, 
	vgupta@kernel.org, linux@armlinux.org.uk, ulli.kroll@googlemail.com, 
	linus.walleij@linaro.org, shawnguo@kernel.org, 
	Sascha Hauer <s.hauer@pengutronix.de>, kernel@pengutronix.de, festevam@gmail.com, 
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
	johannes@sipsolutions.net, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, acme@kernel.org, 
	mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@kernel.org, 
	namhyung@kernel.org, jgross@suse.com, srivatsa@csail.mit.edu, 
	amakhalov@vmware.com, pv-drivers@vmware.com, boris.ostrovsky@oracle.com, 
	chris@zankel.net, jcmvbkbc@gmail.com, rafael@kernel.org, lenb@kernel.org, 
	pavel@ucw.cz, gregkh@linuxfoundation.org, mturquette@baylibre.com, 
	sboyd@kernel.org, daniel.lezcano@linaro.org, lpieralisi@kernel.org, 
	sudeep.holla@arm.com, agross@kernel.org, bjorn.andersson@linaro.org, 
	anup@brainfault.org, thierry.reding@gmail.com, jonathanh@nvidia.com, 
	jacob.jun.pan@linux.intel.com, Arnd Bergmann <arnd@arndb.de>, yury.norov@gmail.com, 
	andriy.shevchenko@linux.intel.com, linux@rasmusvillemoes.dk, 
	rostedt@goodmis.org, john.ogness@linutronix.de, paulmck@kernel.org, 
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
	linux-perf-users@vger.kernel.org, virtualization@lists.linux-foundation.org, 
	xen-devel@lists.xenproject.org, linux-xtensa@linux-xtensa.org, 
	linux-acpi@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-arch@vger.kernel.org, rcu@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_043112_599831_62684E54 
X-CRM114-Status: UNSURE (   7.24  )
X-CRM114-Notice: Please train this message.
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

My emails are getting rejected... Let me try web-interface

Kudos to Petr for the questions and thanks to PeterZ for the answers.

On Thu, Jun 9, 2022 at 7:02 PM Peter Zijlstra <peterz@infradead.org> wrote:
> This is the tracepoint used to spool all of printk into ftrace, I
> suspect there's users, but I haven't used it myself.

I'm somewhat curious whether we can actually remove that trace event.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
