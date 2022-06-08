Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4722C43334
	for <linux-snps-arc@archiver.kernel.org>; Wed,  8 Jun 2022 17:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2/Qqc35CWVQ/Gb1pJOcmjrQT5gQXWFJryQi3mGJ2Apo=; b=qJ3T9z3MMG4EU9
	PFZmfIInRrdwmyqXnGjp7l4eMW9j26YyO8nPzgYYmYucHx2SojNS9tqO3fA3InOwXrI5vHh4lh8+p
	LJ5Y0XKDmJdWorfUeX/SZr9qSnTiPsRqbzsRanY3bh381dxKfW4AmQF6udA6f6c1ZNcDqk7f2c7i4
	3CEeTDKrV87ZDPIUp9R1HKRtJpNBzjMOzs2079l48VPcki2g/kPyjO8mqWEt9QRmLiDjw0EYjtOcw
	FKDTPbWTaMqkVRdtHc5ylELZ7Che56aIkBmZiMoDaCFJwAk/QjQJ1g0SrmvfpaCmVpHCZmRphdWaz
	pvqpj9pwTVFABmSg9KKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyzPX-00EUJJ-1X; Wed, 08 Jun 2022 17:24:03 +0000
Received: from mout.kundenserver.de ([212.227.17.10])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyzPS-00EUH7-Eq; Wed, 08 Jun 2022 17:24:00 +0000
Received: from mail-yb1-f177.google.com ([209.85.219.177]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1N3bb3-1nZF2u0m8p-010cG0; Wed, 08 Jun 2022 19:23:55 +0200
Received: by mail-yb1-f177.google.com with SMTP id x187so10092772ybe.2;
        Wed, 08 Jun 2022 10:23:54 -0700 (PDT)
X-Gm-Message-State: AOAM530fcH+GUg4RpdmfDm4fRjA+2D3RHyc/q+vk0Iam7C3Pe7fHaPjc
	nZERp2vRkkxD4/DpQwCzeNKjqwxHOFDRgmBCrrU=
X-Google-Smtp-Source: ABdhPJzNVjvOg+I4TKoqtI9Mj5r7eGnKl4yZEYVHLzTr22uimte8bgKc1nTgREfDsecVqzQDeuxH8v8jGezndj85u8s=
X-Received: by 2002:a25:e64b:0:b0:663:ffad:eac5 with SMTP id
 d72-20020a25e64b000000b00663ffadeac5mr3789690ybh.550.1654705730388; Wed, 08
 Jun 2022 09:28:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220608142723.103523089@infradead.org> <20220608144518.010587032@infradead.org>
In-Reply-To: <20220608144518.010587032@infradead.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 8 Jun 2022 18:28:33 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0g-fNu9=BUECSXcNeWT7XWHQMnSXZE-XYE+5eakHxKxA@mail.gmail.com>
Message-ID: <CAK8P3a0g-fNu9=BUECSXcNeWT7XWHQMnSXZE-XYE+5eakHxKxA@mail.gmail.com>
Subject: Re: [PATCH 33/36] cpuidle,omap3: Use WFI for omap3_pm_idle()
To: Peter Zijlstra <peterz@infradead.org>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, 
	Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>, 
	Russell King - ARM Linux <linux@armlinux.org.uk>, Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Sascha Hauer <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Tony Lindgren <tony@atomide.com>, 
	Kevin Hilman <khilman@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, bcain@quicinc.com, 
	Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang <kernel@xen0n.name>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Sam Creasey <sammy@sammy.net>, Michal Simek <monstr@monstr.eu>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Dinh Nguyen <dinguyen@kernel.org>, 
	Jonas Bonn <jonas@southpole.se>, 
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Stafford Horne <shorne@gmail.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
	Paul Mackerras <paulus@samba.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, David Miller <davem@davemloft.net>, 
	Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "the arch/x86 maintainers" <x86@kernel.org>, 
	"H. Peter Anvin" <hpa@zytor.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Juergen Gross <jgross@suse.com>, srivatsa@csail.mit.edu, 
	amakhalov@vmware.com, Pv-drivers <pv-drivers@vmware.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Chris Zankel <chris@zankel.net>, 
	Max Filippov <jcmvbkbc@gmail.com>, Rafael Wysocki <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	Pavel Machek <pavel@ucw.cz>, gregkh <gregkh@linuxfoundation.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, lpieralisi@kernel.org, 
	Sudeep Holla <sudeep.holla@arm.com>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <bjorn.andersson@linaro.org>, Anup Patel <anup@brainfault.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	jacob.jun.pan@linux.intel.com, Arnd Bergmann <arnd@arndb.de>, 
	Yury Norov <yury.norov@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Steven Rostedt <rostedt@goodmis.org>, 
	Petr Mladek <pmladek@suse.com>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	John Ogness <john.ogness@linutronix.de>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Frederic Weisbecker <frederic@kernel.org>, quic_neeraju@quicinc.com, 
	Josh Triplett <josh@joshtriplett.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Joel Fernandes <joel@joelfernandes.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Ben Segall <bsegall@google.com>, 
	Mel Gorman <mgorman@suse.de>, Daniel Bristot de Oliveira <bristot@redhat.com>, vschneid@redhat.com, 
	jpoimboe@kernel.org, alpha <linux-alpha@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	"open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	linux-omap <linux-omap@vger.kernel.org>, linux-csky@vger.kernel.org, 
	"open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>, 
	"open list:IA64 (Itanium) PLATFORM" <linux-ia64@vger.kernel.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, 
	"open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, Openrisc <openrisc@lists.librecores.org>, 
	Parisc List <linux-parisc@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, linux-s390 <linux-s390@vger.kernel.org>, 
	Linux-sh list <linux-sh@vger.kernel.org>, sparclinux <sparclinux@vger.kernel.org>, 
	linux-um <linux-um@lists.infradead.org>, linux-perf-users@vger.kernel.org, 
	"open list:DRM DRIVER FOR QEMU'S CIRRUS DEVICE" <virtualization@lists.linux-foundation.org>, 
	xen-devel <xen-devel@lists.xenproject.org>, 
	"open list:TENSILICA XTENSA PORT (xtensa)" <linux-xtensa@linux-xtensa.org>, 
	ACPI Devel Maling List <linux-acpi@vger.kernel.org>, Linux PM list <linux-pm@vger.kernel.org>, 
	linux-clk <linux-clk@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, 
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, linux-arch <linux-arch@vger.kernel.org>, 
	rcu@vger.kernel.org
X-Provags-ID: V03:K1:csB3aTxthwVnChGOYyjFH9CnMzsjh5xSra/CBkHJrbOKjamCKVt
 GPesOK+3RpQaFoFIL8+YF42LFfIpDMTn26n4dNiEu+2j1MYjkbbFJE74h9LBdzpwD89dKP1
 /+zDCKTRvIbDIMEcExJkUH5x3OW3U+k2BC7JzqeER23XsgvpC64UJoFJ9fsEGwVHPSwvf9/
 oEtJnZBvJq9VV1+sEAAQw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:rCbYnsW5E08=:x5DziFA2pvRS4z52or9R6+
 kNDOiKyPGSicyG7RY7x8sDKhAMQbVagkUvk42AhsdINPzCF1iHOtY5GSxZuiifCJdYkRh9/bX
 aG21nvo/LHW5eDa6HIXQlKrkygVfTte6G3nti0E2oPHIiTqoKVS4023up/LVcvsYaXS3sRmA+
 RSY5gb/2qF5Z+MaO97T8RSHMOf699wmLtEaliGL731xI4HUcDnZKQasBU45p0fW3rFtm3s2Xg
 i4u9Hi6uokJRiIRBh/loBO43d2iCxz0rCFn3kIM/C923fMA1411Lwz2npGRJlmetFNZkwI0vJ
 gdZSdVjA9wXQEAu8ULRJmfIVIf69R7aOuVADKUxRl/ed9CIMj5fx5ocuBrjQs2rQ4duoO/5PE
 viD1WMe7EPNiPWE6b88rcetTNKql9jX6XLAZotssXXJvy9U5g98woNyyvczivIuHKyiFbfzF4
 PbJrrd9LKmlgE8HW2IsfB66TFEagI06e9zPnVws5u9QzxrgT9R0vwIwsSoah27jTF3QQcx86P
 HYY0Kys5kZDVYuwfJvN/fMnoYPQIYLIxG9Pf1aexU9yaBO//0VLn102UaI2kLrE+EQSvhkfn/
 vgyMxlpSorKZx3oiDgsva9TZLkvCoHJ9vUd2LF2q3Dj03cSarUKoIk9shVyFCyMWemnzo0iHK
 4OVOOx+oKzD/+UwW399FkHBzDafsMILhsqlYlHUyZIAE9zW6Xaxg3oE9pXuPDy7zerA7yb4st
 T1Lhodp/soWcnyvF4N0VL90jaEo5Gt5YsRLmMJzFzcsNsd+amIjYZG+OF7R4ki+ZKGdtgvpZE
 GJMYyM4+xnLkNbwJrnz4l9TG/CFe/su+YJLfuDooLVVKvt10wq5J0mVIZZioHijxzNS8rIDHB
 ALBV4ijW4lrtEop7p/ZAtr+rbWkm96vKDSxRi2Pc8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220608_102358_826572_D7E36820 
X-CRM114-Status: GOOD (  18.75  )
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

On Wed, Jun 8, 2022 at 4:27 PM Peter Zijlstra <peterz@infradead.org> wrote:
>
> arch_cpu_idle() is a very simple idle interface and exposes only a
> single idle state and is expected to not require RCU and not do any
> tracing/instrumentation.
>
> As such, omap_sram_idle() is not a valid implementation. Replace it
> with the simple (shallow) omap3_do_wfi() call. Leaving the more
> complicated idle states for the cpuidle driver.
>
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>

I see similar code in omap2:

omap2_pm_idle()
 -> omap2_enter_full_retention()
     -> omap2_sram_suspend()

Is that code path safe to use without RCU or does it need a similar change?

        Arnd

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
