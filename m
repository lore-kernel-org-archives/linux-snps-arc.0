Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D0F5C4332F
	for <linux-snps-arc@archiver.kernel.org>; Tue,  4 Oct 2022 11:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gKHf8WlNbrXAR7v0pWD9E9uwMPxuf5Ph57Nc0JN46yQ=; b=OA4WOSElZF54lX
	G3cCJuec+nIjOm4ATUiTHIRarSuM+Kz6rHTR4zl5lvnCT5W2XVnLnu54scGwr9qvFb+5MMmJxDars
	VE++62opZMavSqCrMxos6P+4ZsrhOZoLFJe5Ktu3XzeWK1r5hqI7tCFO98Mx3EHHjJcju1cjhOz6w
	sNvwYStD/wwQGMxSzkIuGCYAvFzY0N/sWypRKe/xjbFLp8komOz24yFr0eELIEvZlEmF1r9NIpA23
	6MBGVsbc/BijNGYuUeRsBv3pUYwyHsxtUwFuLE3qyOKBPgqNJuzhavx1bKzaDNOghmeVOm/oL7afi
	k7gZXlUOg8ttJd41froA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1offoJ-009Sj1-Ph; Tue, 04 Oct 2022 11:10:03 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1offoG-009Sgw-E0
	for linux-snps-arc@lists.infradead.org; Tue, 04 Oct 2022 11:10:02 +0000
Received: by mail-pg1-x52e.google.com with SMTP id j71so6285881pge.2
        for <linux-snps-arc@lists.infradead.org>; Tue, 04 Oct 2022 04:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=Z7fvRiwPcYU72K21mcsEeWsle1VHrp2FoZLK7rnaPdE=;
        b=OhrgekEJA2e8cdAwMtySnzVGP1IXX7u0VkwcrOOu54GZ2JxdWY9lEfVkhASIMdH6iJ
         3CS7i3bHpSnDattX7vdcbOy/0Ru61hlzqZKw12qszXyQ8c8k8+VbmoP3khJqXB2u34OK
         r0R6w3Chhty48bs5fIPiEqpNsjqgSOd25DYZPmh/eJumMJEGGWz83W+3fdR0JwF+vFO5
         mEEbHpfpQY24Mu19zAFZi2TsiyCRpZk9s0G1O2wNLxMVY3JMpx0s8hV3tsChMbk0eh7y
         zwRqOOW8NupYp/v5bTpNygY4XFLMrr9CtK+i2O/hqSFWvl5B0S5XIVxlEXDh/AnokWSK
         1UeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=Z7fvRiwPcYU72K21mcsEeWsle1VHrp2FoZLK7rnaPdE=;
        b=ouADZU9nxA0/StRIfGp6PC1eu4wbXYUDy90AxPiYnV6hZo/bqNv2dzUNm1GPUPBrAg
         zSYzIliNd1ukz5gbmBmRdjArX85ZNUh5uX9G+H6c/+470rKnhZg8wAmMnNqPqhPaVkUH
         cnW6jRVq/xBuTbdeVHrEJjbZfrh/gL8FxxXmZxFAOewVVOgDulzb8Abk5KYzJDR+/QF9
         RMbkjJ7ofoOGaKVJ0VvAIabea9kfJck4AoD1h1Xt4BItvbAoigZ1xFSrWKpVaqzA2FAg
         M9GORTcNjmrc24vXgrtmp/M6Zft70bl/XhWL6oacXm4ogKE2ad0FPtZeQfH6bqG9cAeM
         1Q5A==
X-Gm-Message-State: ACrzQf10V4ccPeuyY3sZl+/X6lOd6fwp+edQdWaKQFLgOlpSqauyUpUw
	2Ds2mEwqwKU3nOYjj605CFLomKYvBJBHiQs6hISuSw==
X-Google-Smtp-Source: AMsMyM7VbOFlVrwp8sat5c2fOoVrC6O5AG2BNs0Q/N/ssPahKqJyAog1GJURpNPkzC/i2wh0dKpKol7XCM05LlISp3k=
X-Received: by 2002:a63:464d:0:b0:441:5968:cd0e with SMTP id
 v13-20020a63464d000000b004415968cd0emr18985801pgk.595.1664881798027; Tue, 04
 Oct 2022 04:09:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220919095939.761690562@infradead.org> <20220919101522.975285117@infradead.org>
In-Reply-To: <20220919101522.975285117@infradead.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 4 Oct 2022 13:09:21 +0200
Message-ID: <CAPDyKFqoBJPgehVODY0DGuUcnqJE5rpZjRPfdMCzOP0=JrvKNw@mail.gmail.com>
Subject: Re: [PATCH v2 39/44] cpuidle,clk: Remove trace_.*_rcuidle()
To: Peter Zijlstra <peterz@infradead.org>
Cc: juri.lelli@redhat.com, rafael@kernel.org, catalin.marinas@arm.com, 
	linus.walleij@linaro.org, bsegall@google.com, guoren@kernel.org, pavel@ucw.cz, 
	agordeev@linux.ibm.com, linux-arch@vger.kernel.org, 
	vincent.guittot@linaro.org, mpe@ellerman.id.au, chenhuacai@kernel.org, 
	christophe.leroy@csgroup.eu, linux-acpi@vger.kernel.org, agross@kernel.org, 
	geert@linux-m68k.org, linux-imx@nxp.com, vgupta@kernel.org, 
	mattst88@gmail.com, mturquette@baylibre.com, sammy@sammy.net, 
	pmladek@suse.com, linux-pm@vger.kernel.org, 
	Sascha Hauer <s.hauer@pengutronix.de>, linux-um@lists.infradead.org, npiggin@gmail.com, 
	tglx@linutronix.de, linux-omap@vger.kernel.org, dietmar.eggemann@arm.com, 
	andreyknvl@gmail.com, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	senozhatsky@chromium.org, svens@linux.ibm.com, jolsa@kernel.org, 
	tj@kernel.org, Andrew Morton <akpm@linux-foundation.org>, mark.rutland@arm.com, 
	linux-ia64@vger.kernel.org, dave.hansen@linux.intel.com, 
	virtualization@lists.linux-foundation.org, 
	James.Bottomley@hansenpartnership.com, jcmvbkbc@gmail.com, 
	thierry.reding@gmail.com, kernel@xen0n.name, cl@linux.com, 
	linux-s390@vger.kernel.org, vschneid@redhat.com, john.ogness@linutronix.de, 
	ysato@users.sourceforge.jp, linux-sh@vger.kernel.org, festevam@gmail.com, 
	deller@gmx.de, daniel.lezcano@linaro.org, jonathanh@nvidia.com, 
	dennis@kernel.org, lenb@kernel.org, linux-xtensa@linux-xtensa.org, 
	kernel@pengutronix.de, gor@linux.ibm.com, linux-arm-msm@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	loongarch@lists.linux.dev, shorne@gmail.com, chris@zankel.net, 
	sboyd@kernel.org, dinguyen@kernel.org, bristot@redhat.com, 
	alexander.shishkin@linux.intel.com, fweisbec@gmail.com, lpieralisi@kernel.org, 
	atishp@atishpatra.org, linux@rasmusvillemoes.dk, kasan-dev@googlegroups.com, 
	will@kernel.org, boris.ostrovsky@oracle.com, khilman@kernel.org, 
	linux-csky@vger.kernel.org, pv-drivers@vmware.com, 
	linux-snps-arc@lists.infradead.org, mgorman@suse.de, 
	jacob.jun.pan@linux.intel.com, Arnd Bergmann <arnd@arndb.de>, ulli.kroll@googlemail.com, 
	linux-clk@vger.kernel.org, rostedt@goodmis.org, ink@jurassic.park.msu.ru, 
	bcain@quicinc.com, tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org, 
	ryabinin.a.a@gmail.com, sudeep.holla@arm.com, shawnguo@kernel.org, 
	davem@davemloft.net, dalias@libc.org, tony@atomide.com, amakhalov@vmware.com, 
	konrad.dybcio@somainline.org, bjorn.andersson@linaro.org, glider@google.com, 
	hpa@zytor.com, sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	linux-riscv@lists.infradead.org, vincenzo.frascino@arm.com, 
	anton.ivanov@cambridgegreys.com, jonas@southpole.se, yury.norov@gmail.com, 
	richard@nod.at, x86@kernel.org, linux@armlinux.org.uk, mingo@redhat.com, 
	aou@eecs.berkeley.edu, hca@linux.ibm.com, richard.henderson@linaro.org, 
	stefan.kristiansson@saunalahti.fi, openrisc@lists.librecores.org, 
	acme@kernel.org, paul.walmsley@sifive.com, linux-tegra@vger.kernel.org, 
	namhyung@kernel.org, andriy.shevchenko@linux.intel.com, jpoimboe@kernel.org, 
	dvyukov@google.com, jgross@suse.com, monstr@monstr.eu, 
	linux-mips@vger.kernel.org, palmer@dabbelt.com, anup@brainfault.org, 
	bp@alien8.de, johannes@sipsolutions.net, linuxppc-dev@lists.ozlabs.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221004_041000_481003_C20EE3E0 
X-CRM114-Status: GOOD (  14.31  )
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

On Mon, 19 Sept 2022 at 12:17, Peter Zijlstra <peterz@infradead.org> wrote:
>
> OMAP was the one and only user.

OMAP? :-)

>
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe

> ---
>  drivers/clk/clk.c |    8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -978,12 +978,12 @@ static void clk_core_disable(struct clk_
>         if (--core->enable_count > 0)
>                 return;
>
> -       trace_clk_disable_rcuidle(core);
> +       trace_clk_disable(core);
>
>         if (core->ops->disable)
>                 core->ops->disable(core->hw);
>
> -       trace_clk_disable_complete_rcuidle(core);
> +       trace_clk_disable_complete(core);
>
>         clk_core_disable(core->parent);
>  }
> @@ -1037,12 +1037,12 @@ static int clk_core_enable(struct clk_co
>                 if (ret)
>                         return ret;
>
> -               trace_clk_enable_rcuidle(core);
> +               trace_clk_enable(core);
>
>                 if (core->ops->enable)
>                         ret = core->ops->enable(core->hw);
>
> -               trace_clk_enable_complete_rcuidle(core);
> +               trace_clk_enable_complete(core);
>
>                 if (ret) {
>                         clk_core_disable(core->parent);
>
>
> _______________________________________________
> Virtualization mailing list
> Virtualization@lists.linux-foundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/virtualization

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
