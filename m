Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83948C433EF
	for <linux-snps-arc@archiver.kernel.org>; Thu,  9 Jun 2022 09:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cckceo+SS//5WzNZ4mIHeYJBgoDjnHpiB6jbw1fOCz4=; b=hQ6RuBlr7M3so/
	ydMt4amgVrSgs5d3HEYjNWIq0Qe9WEFpI7Z5DpL/kEo5ekXamVFiR7MeaCS+9uPmYShms+EGVROnO
	0jJLhKa9SEabNQKdaTkNxcczSwH5zssuVDmrJFrdx5O820OiHc3nsYRR8t27pjXLeJywS5Bua8+lY
	2q2JhEiHU41R6N6Z1vvE/IUDeQXVxQAU6UK3ak5acrLNZyEcm7fygYW2rBa3/Bc2KZ62ttNgjEVg2
	4DBggOcluKfMTMyRGa3VS+bzIjTVq8yPxoaly3gsW2+pak5cO6390Q++iRnxex7qakyV/UmrWoU+7
	VZx8GExfzArqBBP2us6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzEf6-000jA7-LF; Thu, 09 Jun 2022 09:41:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzEf4-000j8M-7r; Thu, 09 Jun 2022 09:41:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=jxhFyRA7gcpqWtRQyvyD3abswc2PbVc4FSoswUV5Ukc=; b=eTVis02Li1gUMyvYNvhtQOfPjM
	7jPK+tlnMQu8YlONdKYuGGzg5f4OtA6n+DLuvaVtWLmmwBKEcjK3gJJFZyuUsx9s+WrgcdXDtEGo5
	n/0BitYa/9Tv9a5PHDy4FBaJ0usEOIIGYMMcR/SAKx38GPSteGLT2qjJKdgzgVt9Wb+/EeSMk/GCj
	o7MIldwwpKDLAKlNGDE/FUzTM2RKPEJfDUWHFxb549VYWV718uWBpBWrwfwVc4Y51nI2XmOQdPNke
	dbtUv13RdN1xprVJqbJ/lLZKhjUqu4j3NGqJXLsSZjtm/Jap7nXVhvEByTNVwWiNq35HcNs4n5id9
	tqC7XoNQ==;
Received: from dhcp-077-249-017-003.chello.nl ([77.249.17.3] helo=worktop.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzEen-006Kx5-AX; Thu, 09 Jun 2022 09:40:49 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
	id B092F981287; Thu,  9 Jun 2022 11:40:46 +0200 (CEST)
Date: Thu, 9 Jun 2022 11:40:46 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Richard Henderson <rth@twiddle.net>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>,
	Russell King - ARM Linux <linux@armlinux.org.uk>,
	Hans Ulli Kroll <ulli.kroll@googlemail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sascha Hauer <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Tony Lindgren <tony@atomide.com>, Kevin Hilman <khilman@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
	bcain@quicinc.com, Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Sam Creasey <sammy@sammy.net>, Michal Simek <monstr@monstr.eu>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	Stafford Horne <shorne@gmail.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Paul Mackerras <paulus@samba.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>, David Miller <davem@davemloft.net>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	the arch/x86 maintainers <x86@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>,
	Juergen Gross <jgross@suse.com>, srivatsa@csail.mit.edu,
	amakhalov@vmware.com, Pv-drivers <pv-drivers@vmware.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>,
	Rafael Wysocki <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
	Pavel Machek <pavel@ucw.cz>, gregkh <gregkh@linuxfoundation.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>, lpieralisi@kernel.org,
	Sudeep Holla <sudeep.holla@arm.com>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Anup Patel <anup@brainfault.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	jacob.jun.pan@linux.intel.com, Yury Norov <yury.norov@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Steven Rostedt <rostedt@goodmis.org>,
	Petr Mladek <pmladek@suse.com>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	John Ogness <john.ogness@linutronix.de>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>, quic_neeraju@quicinc.com,
	Josh Triplett <josh@joshtriplett.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Joel Fernandes <joel@joelfernandes.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Daniel Bristot de Oliveira <bristot@redhat.com>,
	vschneid@redhat.com, jpoimboe@kernel.org,
	alpha <linux-alpha@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	"open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	linux-omap <linux-omap@vger.kernel.org>, linux-csky@vger.kernel.org,
	"open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
	"open list:IA64 (Itanium) PLATFORM" <linux-ia64@vger.kernel.org>,
	linux-m68k <linux-m68k@lists.linux-m68k.org>,
	"open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
	Openrisc <openrisc@lists.librecores.org>,
	Parisc List <linux-parisc@vger.kernel.org>,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
	linux-riscv <linux-riscv@lists.infradead.org>,
	linux-s390 <linux-s390@vger.kernel.org>,
	Linux-sh list <linux-sh@vger.kernel.org>,
	sparclinux <sparclinux@vger.kernel.org>,
	linux-um <linux-um@lists.infradead.org>,
	linux-perf-users@vger.kernel.org,
	"open list:DRM DRIVER FOR QEMU'S CIRRUS DEVICE" <virtualization@lists.linux-foundation.org>,
	xen-devel <xen-devel@lists.xenproject.org>,
	"open list:TENSILICA XTENSA PORT (xtensa)" <linux-xtensa@linux-xtensa.org>,
	ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
	Linux PM list <linux-pm@vger.kernel.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	linux-arm-msm <linux-arm-msm@vger.kernel.org>,
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
	linux-arch <linux-arch@vger.kernel.org>, rcu@vger.kernel.org
Subject: Re: [PATCH 33/36] cpuidle,omap3: Use WFI for omap3_pm_idle()
Message-ID: <YqHAHpGVe10I8O1z@worktop.programming.kicks-ass.net>
References: <20220608142723.103523089@infradead.org>
 <20220608144518.010587032@infradead.org>
 <CAK8P3a0g-fNu9=BUECSXcNeWT7XWHQMnSXZE-XYE+5eakHxKxA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a0g-fNu9=BUECSXcNeWT7XWHQMnSXZE-XYE+5eakHxKxA@mail.gmail.com>
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

On Wed, Jun 08, 2022 at 06:28:33PM +0200, Arnd Bergmann wrote:
> On Wed, Jun 8, 2022 at 4:27 PM Peter Zijlstra <peterz@infradead.org> wrote:
> >
> > arch_cpu_idle() is a very simple idle interface and exposes only a
> > single idle state and is expected to not require RCU and not do any
> > tracing/instrumentation.
> >
> > As such, omap_sram_idle() is not a valid implementation. Replace it
> > with the simple (shallow) omap3_do_wfi() call. Leaving the more
> > complicated idle states for the cpuidle driver.
> >
> > Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> 
> I see similar code in omap2:
> 
> omap2_pm_idle()
>  -> omap2_enter_full_retention()
>      -> omap2_sram_suspend()
> 
> Is that code path safe to use without RCU or does it need a similar change?

It needs a similar change, clearly I was running on fumes to not have
found that when grepping around the omap code :/

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
