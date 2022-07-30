Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 859A4C19F28
	for <linux-snps-arc@archiver.kernel.org>; Sat, 30 Jul 2022 23:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3FUBsOE81xh2fDpqvaL7pvyhhahMzCF0IHXNhppwGPE=; b=pm8JluPf1hQKDi
	NEI9XB9FCN2JH+vxNP2vnkCXpIAlV1BjyZGASf5rq5aYNmNKXLM3RtMVigs34ExoQx5ZjvroaStrn
	GnQGmtJQJZGi3NNGy7dmN/g8pNfBZ+W/LrMUEcYurWlr/NqNyKHpwPr0caCJq48B5CIuJjblaj03g
	DGy3chC24JGW754FR4J1U9o996pGT2Yorf7lyoq2tgQ83X7surcUuBvc/ym/feJZHR/qQLJXdeTfq
	9g3qregYBxBC/ZTD1wXzxOgudTpLlLGGrACxPrUffDT2UnUOx+7O0omsviiCnqC+O71ZDgNBjObE+
	XGRJznC1ZO3toKRQjQZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHw9S-005gVx-DN; Sat, 30 Jul 2022 23:45:46 +0000
Received: from server.lespinasse.org ([63.205.204.226])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHw9O-005gNc-Dd; Sat, 30 Jul 2022 23:45:43 +0000
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=lespinasse.org; i=@lespinasse.org; q=dns/txt; s=srv-79-ed;
 t=1659224730; h=date : from : to : cc : subject : message-id :
 references : mime-version : content-type : in-reply-to : from;
 bh=nAVqtDkPyoGTnjQOsobKhENqaeU5rNiWFfP8mKVev5k=;
 b=HFFhCK7R4iKO9dp7xadnNvlJ3TFgnIFCD+mWF8YiQOWKhEk/dwPTWNRYWGC9XfN1WRDf2
 g306xaRkvMw+dqoAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lespinasse.org;
 i=@lespinasse.org; q=dns/txt; s=srv-79-rsa; t=1659224730; h=date :
 from : to : cc : subject : message-id : references : mime-version :
 content-type : in-reply-to : from;
 bh=nAVqtDkPyoGTnjQOsobKhENqaeU5rNiWFfP8mKVev5k=;
 b=xEm4vrS+nhrfg16KlTSOz6xKHVgl2anxivbQOaQ8iyITrSIXx3k7S+7DNm3/9PE3/hP5/
 weBfs5WCmns8PrJOUh5+LyucC170rSw2K/NgNrAjDpputAJGflo+dG36LsXYxD+GZSSZKbP
 Pj/N5DYITgz/J3aBedmEOjvEEcNa6ityOyI32KA+gNj6htWosOb+QOsIsRx/2q9SXnXOMQE
 CoO7nRU+J2kcBx1HiMTnfjr/eN+QixQZGT0tRp8own4vN9hl237pUBRGLyuycFtncUUh4v4
 MsO6ge1ke2qwlIabxdvLZxjhahuiQC5BaBfCoCYkudJkUo4tS5HM55MrUsVw==
Received: by server.lespinasse.org (Postfix, from userid 1000)
	id F117B160977; Sat, 30 Jul 2022 16:45:29 -0700 (PDT)
Date: Sat, 30 Jul 2022 16:45:29 -0700
From: Michel Lespinasse <michel@lespinasse.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Michel Lespinasse <michel@lespinasse.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Richard Henderson <rth@twiddle.net>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Matt Turner <mattst88@gmail.com>, vgupta@kernel.org,
	Russell King - ARM Linux <linux@armlinux.org.uk>,
	ulli.kroll@googlemail.com, Linus Walleij <linus.walleij@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sascha Hauer <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	dl-linux-imx <linux-imx@nxp.com>, Tony Lindgren <tony@atomide.com>,
	Kevin Hilman <khilman@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
	bcain@quicinc.com, Huacai Chen <chenhuacai@kernel.org>,
	kernel@xen0n.name, Geert Uytterhoeven <geert@linux-m68k.org>,
	sammy@sammy.net, Michal Simek <monstr@monstr.eu>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	dinguyen@kernel.org, jonas@southpole.se,
	stefan.kristiansson@saunalahti.fi,
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
	anton.ivanov@cambridgegreys.com,
	Johannes Berg <johannes@sipsolutions.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	the arch/x86 maintainers <x86@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>, acme@kernel.org,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	jolsa@kernel.org, namhyung@kernel.org,
	Juergen Gross <jgross@suse.com>, srivatsa@csail.mit.edu,
	amakhalov@vmware.com, pv-drivers@vmware.com,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>,
	Len Brown <lenb@kernel.org>, Pavel Machek <pavel@ucw.cz>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Anup Patel <anup@brainfault.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	Jacob Pan <jacob.jun.pan@linux.intel.com>,
	Arnd Bergmann <arnd@arndb.de>, Yury Norov <yury.norov@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Steven Rostedt <rostedt@goodmis.org>,
	Petr Mladek <pmladek@suse.com>, senozhatsky@chromium.org,
	John Ogness <john.ogness@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>, quic_neeraju@quicinc.com,
	Josh Triplett <josh@joshtriplett.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Joel Fernandes <joel@joelfernandes.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Benjamin Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Daniel Bristot de Oliveira <bristot@redhat.com>,
	vschneid@redhat.com, jpoimboe@kernel.org,
	linux-alpha@vger.kernel.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-snps-arc@lists.infradead.org,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	Linux OMAP Mailing List <linux-omap@vger.kernel.org>,
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
	linux-ia64@vger.kernel.org,
	linux-m68k <linux-m68k@lists.linux-m68k.org>,
	"open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
	openrisc@lists.librecores.org,
	Parisc List <linux-parisc@vger.kernel.org>,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
	linux-riscv <linux-riscv@lists.infradead.org>,
	linux-s390@vger.kernel.org,
	Linux-sh list <linux-sh@vger.kernel.org>,
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	xen-devel@lists.xenproject.org, linux-xtensa@linux-xtensa.org,
	ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
	Linux PM <linux-pm@vger.kernel.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	linux-arm-msm <linux-arm-msm@vger.kernel.org>,
	linux-tegra <linux-tegra@vger.kernel.org>,
	linux-arch <linux-arch@vger.kernel.org>, rcu@vger.kernel.org,
	rh0@fb.com
Subject: Re: [PATCH 04/36] cpuidle,intel_idle: Fix CPUIDLE_FLAG_IRQ_ENABLE
Message-ID: <20220730234529.GC1587@lespinasse.org>
References: <20220608142723.103523089@infradead.org>
 <20220608144516.172460444@infradead.org>
 <20220725194306.GA14746@lespinasse.org>
 <20220728172053.GA3607379@paulmck-ThinkPad-P17-Gen-1>
 <20220729102458.GA1695@lespinasse.org>
 <CAJZ5v0gyPtX=ksCibo2ZN_BztCqUn9KRtRu+gsJ5KetB_1MwEQ@mail.gmail.com>
 <20220730094800.GB1587@lespinasse.org>
 <CAJZ5v0hXVjsWab=qYZfXBTqcjkpWV0CFT9_oQBKQ28rFG3_VLw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJZ5v0hXVjsWab=qYZfXBTqcjkpWV0CFT9_oQBKQ28rFG3_VLw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220730_164542_489530_B1EE36D3 
X-CRM114-Status: GOOD (  23.64  )
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

On Sat, Jul 30, 2022 at 09:52:34PM +0200, Rafael J. Wysocki wrote:
> On Sat, Jul 30, 2022 at 11:48 AM Michel Lespinasse
> <michel@lespinasse.org> wrote:
> > I'm not sure if that was the patch you meant to send though, as it
> > seems it's only adding a tracepoint so shouldn't make any difference
> > if I'm not actually using the tracepoint ?
> 
> You are right, it looks like I pasted a link to a different patch by
> mistake.  Sorry about that.
> 
> I meant this one:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git/commit/?h=pm&id=d295ad34f236c3518634fb6403d4c0160456e470
> 
> which will appear in the final 5.19.

Thanks. I can confirm that this patch fixes the boot time debug
warnings for me. And I see that linus already merged it, nice!

--
Michel "walken" Lespinasse.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
