Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB410C43334
	for <linux-snps-arc@archiver.kernel.org>; Wed,  6 Jul 2022 10:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ze2y6PTJUtQvTOnE5N2z4o8MI4Ct/MjSVNWpvMkdb98=; b=l6qX1H4bo6Awu5
	zk4CRtIuvu+3721N3WI0O1NhF/6FQCqXoga4EAzX0Ex5HXxEAKlHVp3uG+Qll0g/Eo5tEHJmCVcsZ
	Ln2kMp46K9q4lqJVLPDK4UPMy6r0ARdWiVjAL/8oPyhC6geEVLXxiLRiP3puUmJXNYZLmueN24RIP
	d80DH+d7L5KZ6iF8PylHfEfTFu8E5qUMEl4iPSbxmzUDRPOpkdRaxMzhKWfvdaN9Hrbw/6C0JMHsL
	E3rfyuQJve0LTapuCWfoIElVavQciGL3u3swea7TBjJ4eVODk4A6E5N1k2P7rIwGsqhdpEQnjZJOE
	FZ5Us6W6KkcC4DXclvNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o91u3-0087zI-9f; Wed, 06 Jul 2022 10:05:03 +0000
Received: from mail-oa1-f47.google.com ([209.85.160.47])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o91cP-007udn-Vt; Wed, 06 Jul 2022 09:46:51 +0000
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-10bf634bc50so11664095fac.3;
        Wed, 06 Jul 2022 02:46:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o8jOPstF035V3JBIGTjyEra8xnCZ4RAIho4NrHeIzoU=;
        b=yidhsGsEBbDkyElgL9qOwbT7oXl8wQMr8JBiaOONqYvnVzbPlv+5p8pgO04S1z7Hjy
         coSh4ZW4BkaxVT1g8Ecwf7vdXdIbfIrbi5YmNbQv4zXSy35Ix/Buzo7kJztN5SKCIeWl
         VpcKsho84OpikVrHh1R22iIr7gU5gLjGyLOcctBjtnGHw5pxBGZv44VGVRdajX4k1JtS
         SikxsS6Ug6cIPtoe/Ru8gS7rIL1fi3swvSUUR0qYo0PtLyMJFjjJFaQ5wX1S6PJUrGUp
         tJ8D4rrQEjxc+xxJKdiV7pCqsnd5KPb+n2qlQCoIMJHX5k6NAfW8zKqL/zZNLVvc2lm9
         BIOQ==
X-Gm-Message-State: AJIora+uSbBouTG7eFKyg9mFv6tSzfoEQJp2RWIHx6gKLDSga+wywRjn
	oV5Q4dNK5o4TgDnKMFfg1Ijs7cT6b501QTBQ
X-Google-Smtp-Source: AGRyM1uQ4xn9Ws2tAz7RTLQtlyP4tYL4z3GZk717sV8/lp4mH9/86M7wtBNzOHFBZn8FcrAUJ92H/g==
X-Received: by 2002:a05:6871:783:b0:101:3d98:ba86 with SMTP id o3-20020a056871078300b001013d98ba86mr25012844oap.132.1657100808256;
        Wed, 06 Jul 2022 02:46:48 -0700 (PDT)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com. [209.85.210.46])
        by smtp.gmail.com with ESMTPSA id n20-20020a056870035400b0010c2c3fa9b4sm94498oaf.50.2022.07.06.02.46.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Jul 2022 02:46:47 -0700 (PDT)
Received: by mail-ot1-f46.google.com with SMTP id 73-20020a9d084f000000b00616b04c7656so11485518oty.3;
        Wed, 06 Jul 2022 02:46:47 -0700 (PDT)
X-Received: by 2002:a05:6902:50e:b0:66e:7f55:7a66 with SMTP id
 x14-20020a056902050e00b0066e7f557a66mr6648581ybs.365.1657100796735; Wed, 06
 Jul 2022 02:46:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220608142723.103523089@infradead.org> <20220608144517.124597382@infradead.org>
In-Reply-To: <20220608144517.124597382@infradead.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 Jul 2022 11:46:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW4pT+YQfLzLTegFu1M3v9-9vaFDFAama7mc82=x6R__w@mail.gmail.com>
Message-ID: <CAMuHMdW4pT+YQfLzLTegFu1M3v9-9vaFDFAama7mc82=x6R__w@mail.gmail.com>
Subject: Re: [PATCH 19/36] objtool/idle: Validate __cpuidle code as noinstr
To: Peter Zijlstra <peterz@infradead.org>
Cc: Richard Henderson <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, 
	Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Sascha Hauer <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, tony@atomide.com, 
	khilman@kernel.org, catalin.marinas@arm.com, will@kernel.org, 
	guoren@kernel.org, bcain@quicinc.com, chenhuacai@kernel.org, 
	kernel@xen0n.name, sammy@sammy.net, monstr@monstr.eu, 
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
	rostedt@goodmis.org, pmladek@suse.com, senozhatsky@chromium.org, 
	john.ogness@linutronix.de, paulmck@kernel.org, frederic@kernel.org, 
	quic_neeraju@quicinc.com, josh@joshtriplett.org, 
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
X-CRM114-CacheID: sfid-20220706_024650_084203_1EFBB498 
X-CRM114-Status: GOOD (  16.69  )
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

On Wed, Jun 8, 2022 at 4:46 PM Peter Zijlstra <peterz@infradead.org> wrote:
> Idle code is very like entry code in that RCU isn't available. As
> such, add a little validation.
>
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>

>  arch/m68k/kernel/vmlinux-nommu.lds   |    1 -
>  arch/m68k/kernel/vmlinux-std.lds     |    1 -
>  arch/m68k/kernel/vmlinux-sun3.lds    |    1 -

FWIW
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
