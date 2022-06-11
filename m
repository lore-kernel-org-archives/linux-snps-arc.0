Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADF20C43334
	for <linux-snps-arc@archiver.kernel.org>; Sat, 11 Jun 2022 02:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AuyHUWG29LUfTqaWdLuWZM3nxvItlnf5IxdK75gHqkc=; b=1Yi6QgXUZBk3BS
	l6Kgtqy9NS+kJ5q6w9xTQOsI472FEjamVFQ7K7aFkgPIvCZEdFG62mmWF+LK6MZye4M8th++g7FmN
	XE7iiIJTI4Z6hLT+JFcTkyOdrRyQtRFcmpqks5xhYLJyI4h7Q/npaCpwyGZ0ZFkolMZYJTzuo+6dP
	3NMVlWnMGY2pCYqRK2lueHggAukIUW7kFc5TP5g4siTkYmR8f36Rx6oNimfZgpV3+Bp/lEkRFzdiM
	cS0+UcsmDce05FKHG0oyBfjwzv7ylCTJY5TY8N9TigmIIaK1rD6sUx3Nd+BvFaYYyWUKX8yKo6Zo4
	h176BNwWhzQBiMowY+7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzqwE-00B1eg-Ax; Sat, 11 Jun 2022 02:33:22 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzqwA-00B1bK-Qw
	for linux-snps-arc@lists.infradead.org; Sat, 11 Jun 2022 02:33:20 +0000
Received: by mail-ed1-x531.google.com with SMTP id c2so1018878edf.5
        for <linux-snps-arc@lists.infradead.org>; Fri, 10 Jun 2022 19:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rgKkPquDB/3ylB22sdoq44O3nuMRqOGPmfYPJEM3DpI=;
        b=JsXVqmPM/FghNi+FuyecZKJimRfQRZRaZMN7LbU4AElduixKN8TVkmhpZTWnrsGkbZ
         5LwE/p8/n+cIXvQ1YTcLTi0yyURcD/DMLBUnB+eqSpwlWIAygkMHM4b3P17Zp5erCg7D
         knTgcyr8j5ARmG7z3CGlckVUGoumxDAZyb+n8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rgKkPquDB/3ylB22sdoq44O3nuMRqOGPmfYPJEM3DpI=;
        b=5KhFEt1S19PQU0rFkR5QuKFkwRFCGj9m/Ee99WNkCZnwuVmu1QOOrblqRHBBJ5rqKu
         HOHdc+VyVYA9frplbzOPjthnocZMxJ2YaGwiV9Lhtp6A7Aare2C8Yn3mlVdsGYdr0unT
         2m2A5O+9rvW+8a2Oin/54RO737uoqTf7HkYaFv7rB1LCrFJPUcQ4QSpSpiUPnjCgl8Uj
         76lNPu/tWhugo+/ZjwWoEd0PN0HzlyIg5D54At9VIxKbYn45R4YRC5Lm+AlaHX/V87Vt
         dsbNa0V2oI423+CI9gqr+XfppNtGUFqah15j0e84OYO/EfDa75+oJeWbhwj00wn31UhK
         nl+g==
X-Gm-Message-State: AOAM531isXCdplA+p6WT3Za+k/HwyZo5UjXEIrAFY9PpIl36HziCaIxP
	32QvgPU202zkoGGr/KYG/LxIkY/KgrLTXGFDIZMXmQ==
X-Google-Smtp-Source: ABdhPJzFbgEeXrjhdaEFlL5CPKYiFgrRM2XGTpISMDDKOxh3YJg+nd70yb1Qcu1fnLsZwhWAweXqTRUn04uTYMjQVNU=
X-Received: by 2002:aa7:c604:0:b0:42d:cffb:f4dc with SMTP id
 h4-20020aa7c604000000b0042dcffbf4dcmr55022482edq.270.1654914796079; Fri, 10
 Jun 2022 19:33:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220608142723.103523089@infradead.org> <20220608144517.444659212@infradead.org>
 <YqG6URbihTNCk9YR@alley> <YqHFHB6qqv5wiR8t@worktop.programming.kicks-ass.net>
 <CA+_sPaoJGrXhNPCs2dKf2J7u07y1xYrRFZBUtkKwzK9GqcHSuQ@mail.gmail.com> <YqHvXFdIJfvUDI6e@alley>
In-Reply-To: <YqHvXFdIJfvUDI6e@alley>
From: Sergey Senozhatsky <senozhatsky@chromium.org>
Date: Sat, 11 Jun 2022 11:33:05 +0900
Message-ID: <CA+_sPaq1ez7jah0bibAdeA__Yp92K_VA7E-NZ9knoUmOW9itJg@mail.gmail.com>
Subject: Re: [PATCH 24/36] printk: Remove trace_.*_rcuidle() usage
To: Petr Mladek <pmladek@suse.com>
Cc: Peter Zijlstra <peterz@infradead.org>, ink@jurassic.park.msu.ru, mattst88@gmail.com, 
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
X-CRM114-CacheID: sfid-20220610_193318_944743_53D962D4 
X-CRM114-Status: GOOD (  11.23  )
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

On Thu, Jun 9, 2022 at 10:02 PM Petr Mladek <pmladek@suse.com> wrote:
>
> On Thu 2022-06-09 20:30:58, Sergey Senozhatsky wrote:
> > My emails are getting rejected... Let me try web-interface
>
> Bad day for mail sending. I have problems as well ;-)

For me the problem is still there and apparently it's an "too many
recipients" error.

> > I'm somewhat curious whether we can actually remove that trace event.
>
> Good question.
>
> Well, I think that it might be useful. It allows to see trace and
> printk messages together.

Fair enough. Seems that back in 2011 people were pretty happy with it
https://lore.kernel.org/all/1322161388.5366.54.camel@jlt3.sipsolutions.net/T/#m7bf6416f469119372191f22a6ecf653c5f7331d2

but... reportedly, one of the folks who Ack-ed it (*cough cough*
PeterZ) has never used it.

> It was ugly when it was in the console code. The new location
> in vprintk_store() allows to have it even "correctly" sorted
> (timestamp) against other tracing messages.

That's true.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
