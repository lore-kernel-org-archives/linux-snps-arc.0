Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00996C43217
	for <linux-snps-arc@archiver.kernel.org>; Tue,  4 Oct 2022 11:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=438OQMCHg/MmyhfFpgA1H0zJeFlIgTP2UerqKBYYzCE=; b=uLuBqqdG1bf5zH
	OLhUddqTkEbEW0CIqjsuq86neX6IHe0cJEewQDU34vPzM9Z+EB/xEe3nbWCcpqRV0lIvBs8x/wbd3
	v1L4sWOGSFOW70oZHnF8bcYsoMCyW1WHqLRGhXCxWs/VsMQQRCAcqo4htVj4u6zA95gbakeFne+EZ
	H7qHZbT5BmjmUu6Xclu/nPsO+RCI7tf7miYGM6lt3X7Z0a4K/NkatdhNjy1R62ZeAioGLzxD55nCK
	i5pBeBEo8r+oyNnFkOjLDFGAVKQpjNRo3ObFDdxlTvwdkNFdS231oJ6a+JZnR02OUqJHajM4JAo2q
	8TD9jVZRLYKL72Vk1qog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1offj6-009S5t-Iz; Tue, 04 Oct 2022 11:04:40 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1offj4-009S4d-CG
	for linux-snps-arc@lists.infradead.org; Tue, 04 Oct 2022 11:04:40 +0000
Received: by mail-pg1-x536.google.com with SMTP id b5so12413431pgb.6
        for <linux-snps-arc@lists.infradead.org>; Tue, 04 Oct 2022 04:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=+dGyZLAFgGMTjfv/XBtu0TYoOq7FF1Gy12H3Maj7VZQ=;
        b=J/vrmB9Kw/kUjuLA94+GiSaAb/ysKsHCJMt0q/b5C4hTvjWvpD/4gYcz8wiDYH+wDu
         VauelbAc6rvn6GfwX8AzvYum0016wmpfk7JfWsZRIuqW+7uz8x5trzhgQfsbK6Oez4C2
         oI3/xkCQmxaR27+SGOcFsxA52mzB06l623Nv5Xai/ZW6o0aFNiEoJd0NtydxpISZgCqY
         Huu19sneopcpPoTb7AatH5ql62Y6l79ODVmUp4xYd601QVsvCsOcL4Dye3nIrsebtAO/
         TFi2QIhE77HgLndavZo56yiYGlFlIpX3fKxDC/yQxRz8ukXbuLPZ751WaoRstUHwOqJr
         oOYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=+dGyZLAFgGMTjfv/XBtu0TYoOq7FF1Gy12H3Maj7VZQ=;
        b=KWGbx0GjZvXglAVlg1wLzrryLEzFibFDpJzSmJEW8i1Jhro2Sm644CNhaWPuDNTDG9
         3DDHR3ZsuZU4GVGYj3UemyNCl3dUDlBHJSPL5WYaVIkq6xjIxfwgfLngNxKJ07q2QGG9
         tIqVH4NyMem5pA5cnApXiglWtQ/q9/Vt1auiBIZBJSh9Lhoo4EJGWFtNGeRzdyeloJLP
         wPHvsLNNopN2QCNHSJ+zyi6nQAy4wcMYs9jiemQEeE6XFZWBoHW6tvxOf8rZEedf0Lm5
         rdN8/QrX83oCh8o++hJlleCpToiU0sGXK1sCbrv0SnHi5LgIVCwA8sSlwPaxLxTKjctA
         PSqQ==
X-Gm-Message-State: ACrzQf3soKg+fmxQUA0yVm4jH1CN9anq8bIffCbKNFYT3B/kFRkMtzBq
	0YaWeNBeQ1BWTlYDCtt7984RdapLZMYX3UiRJjZxTw==
X-Google-Smtp-Source: AMsMyM47WQGEEYS8ORE4jd8BkC5HxomBqw3qkNOIDDeZpMqnq0xrIZB9jUW0aBX+JhUuuIkJBe/Q8EmYOwJGbohmCJY=
X-Received: by 2002:a63:90c1:0:b0:450:75b5:29fe with SMTP id
 a184-20020a6390c1000000b0045075b529femr6949580pge.541.1664881475536; Tue, 04
 Oct 2022 04:04:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220919095939.761690562@infradead.org> <20220919101521.139727471@infradead.org>
In-Reply-To: <20220919101521.139727471@infradead.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 4 Oct 2022 13:03:57 +0200
Message-ID: <CAPDyKFqTWd4W5Ofk76CtC4X43dxBTNHtmY9YzN355-vpviLsPw@mail.gmail.com>
Subject: Re: [PATCH v2 12/44] cpuidle,dt: Push RCU-idle into driver
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
X-CRM114-CacheID: sfid-20221004_040438_455469_B0622C7C 
X-CRM114-Status: GOOD (  24.12  )
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

On Mon, 19 Sept 2022 at 12:18, Peter Zijlstra <peterz@infradead.org> wrote:
>
> Doing RCU-idle outside the driver, only to then temporarily enable it
> again before going idle is daft.
>
> Notably: this converts all dt_init_idle_driver() and
> __CPU_PM_CPU_IDLE_ENTER() users for they are inextrably intertwined.
>
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe

> ---
>  arch/arm/mach-omap2/cpuidle34xx.c    |    4 ++--
>  drivers/acpi/processor_idle.c        |    2 ++
>  drivers/cpuidle/cpuidle-arm.c        |    1 +
>  drivers/cpuidle/cpuidle-big_little.c |    8 ++++++--
>  drivers/cpuidle/cpuidle-psci.c       |    1 +
>  drivers/cpuidle/cpuidle-qcom-spm.c   |    1 +
>  drivers/cpuidle/cpuidle-riscv-sbi.c  |    1 +
>  drivers/cpuidle/dt_idle_states.c     |    2 +-
>  include/linux/cpuidle.h              |    4 ++++
>  9 files changed, 19 insertions(+), 5 deletions(-)
>
> --- a/drivers/acpi/processor_idle.c
> +++ b/drivers/acpi/processor_idle.c
> @@ -1200,6 +1200,8 @@ static int acpi_processor_setup_lpi_stat
>                 state->target_residency = lpi->min_residency;
>                 if (lpi->arch_flags)
>                         state->flags |= CPUIDLE_FLAG_TIMER_STOP;
> +               if (lpi->entry_method == ACPI_CSTATE_FFH)
> +                       state->flags |= CPUIDLE_FLAG_RCU_IDLE;

I assume the state index here will never be 0?

If not, it may lead to that acpi_processor_ffh_lpi_enter() may trigger
CPU_PM_CPU_IDLE_ENTER_PARAM() to call ct_cpuidle_enter|exit() for an
idle-state that doesn't have the CPUIDLE_FLAG_RCU_IDLE bit set.

>                 state->enter = acpi_idle_lpi_enter;
>                 drv->safe_state_index = i;
>         }
> --- a/drivers/cpuidle/cpuidle-arm.c
> +++ b/drivers/cpuidle/cpuidle-arm.c
> @@ -53,6 +53,7 @@ static struct cpuidle_driver arm_idle_dr
>          * handler for idle state index 0.
>          */
>         .states[0] = {
> +               .flags                  = CPUIDLE_FLAG_RCU_IDLE,

Comparing arm64 and arm32 idle-states/idle-drivers, the $subject
series ends up setting the CPUIDLE_FLAG_RCU_IDLE for the ARM WFI idle
state (state zero), but only for the arm64 and psci cases (mostly
arm64). For arm32 we would need to update the ARM_CPUIDLE_WFI_STATE
too, as that is what most arm32 idle-drivers are using. My point is,
the code becomes a bit inconsistent.

Perhaps it's easier to avoid setting the CPUIDLE_FLAG_RCU_IDLE bit for
all of the ARM WFI idle states, for both arm64 and arm32?

>                 .enter                  = arm_enter_idle_state,
>                 .exit_latency           = 1,
>                 .target_residency       = 1,
> --- a/drivers/cpuidle/cpuidle-big_little.c
> +++ b/drivers/cpuidle/cpuidle-big_little.c
> @@ -64,7 +64,8 @@ static struct cpuidle_driver bl_idle_lit
>                 .enter                  = bl_enter_powerdown,
>                 .exit_latency           = 700,
>                 .target_residency       = 2500,
> -               .flags                  = CPUIDLE_FLAG_TIMER_STOP,
> +               .flags                  = CPUIDLE_FLAG_TIMER_STOP |
> +                                         CPUIDLE_FLAG_RCU_IDLE,
>                 .name                   = "C1",
>                 .desc                   = "ARM little-cluster power down",
>         },
> @@ -85,7 +86,8 @@ static struct cpuidle_driver bl_idle_big
>                 .enter                  = bl_enter_powerdown,
>                 .exit_latency           = 500,
>                 .target_residency       = 2000,
> -               .flags                  = CPUIDLE_FLAG_TIMER_STOP,
> +               .flags                  = CPUIDLE_FLAG_TIMER_STOP |
> +                                         CPUIDLE_FLAG_RCU_IDLE,
>                 .name                   = "C1",
>                 .desc                   = "ARM big-cluster power down",
>         },
> @@ -124,11 +126,13 @@ static int bl_enter_powerdown(struct cpu
>                                 struct cpuidle_driver *drv, int idx)
>  {
>         cpu_pm_enter();
> +       ct_idle_enter();
>
>         cpu_suspend(0, bl_powerdown_finisher);
>
>         /* signals the MCPM core that CPU is out of low power state */
>         mcpm_cpu_powered_up();
> +       ct_idle_exit();
>
>         cpu_pm_exit();
>
> --- a/drivers/cpuidle/cpuidle-psci.c
> +++ b/drivers/cpuidle/cpuidle-psci.c
> @@ -357,6 +357,7 @@ static int psci_idle_init_cpu(struct dev
>          * PSCI idle states relies on architectural WFI to be represented as
>          * state index 0.
>          */
> +       drv->states[0].flags = CPUIDLE_FLAG_RCU_IDLE;
>         drv->states[0].enter = psci_enter_idle_state;
>         drv->states[0].exit_latency = 1;
>         drv->states[0].target_residency = 1;
> --- a/drivers/cpuidle/cpuidle-qcom-spm.c
> +++ b/drivers/cpuidle/cpuidle-qcom-spm.c
> @@ -72,6 +72,7 @@ static struct cpuidle_driver qcom_spm_id
>         .owner = THIS_MODULE,
>         .states[0] = {
>                 .enter                  = spm_enter_idle_state,
> +               .flags                  = CPUIDLE_FLAG_RCU_IDLE,
>                 .exit_latency           = 1,
>                 .target_residency       = 1,
>                 .power_usage            = UINT_MAX,
> --- a/drivers/cpuidle/cpuidle-riscv-sbi.c
> +++ b/drivers/cpuidle/cpuidle-riscv-sbi.c
> @@ -332,6 +332,7 @@ static int sbi_cpuidle_init_cpu(struct d
>         drv->cpumask = (struct cpumask *)cpumask_of(cpu);
>
>         /* RISC-V architectural WFI to be represented as state index 0. */
> +       drv->states[0].flags = CPUIDLE_FLAG_RCU_IDLE;
>         drv->states[0].enter = sbi_cpuidle_enter_state;
>         drv->states[0].exit_latency = 1;
>         drv->states[0].target_residency = 1;
> --- a/drivers/cpuidle/dt_idle_states.c
> +++ b/drivers/cpuidle/dt_idle_states.c
> @@ -77,7 +77,7 @@ static int init_state_node(struct cpuidl
>         if (err)
>                 desc = state_node->name;
>
> -       idle_state->flags = 0;
> +       idle_state->flags = CPUIDLE_FLAG_RCU_IDLE;
>         if (of_property_read_bool(state_node, "local-timer-stop"))
>                 idle_state->flags |= CPUIDLE_FLAG_TIMER_STOP;
>         /*
> --- a/include/linux/cpuidle.h
> +++ b/include/linux/cpuidle.h
> @@ -282,14 +282,18 @@ extern s64 cpuidle_governor_latency_req(
>         int __ret = 0;                                                  \
>                                                                         \
>         if (!idx) {                                                     \
> +               ct_idle_enter();                                        \

According to my comment above, we should then drop these calls to
ct_idle_enter and ct_idle_exit() here. Right?

>                 cpu_do_idle();                                          \
> +               ct_idle_exit();                                         \
>                 return idx;                                             \
>         }                                                               \
>                                                                         \
>         if (!is_retention)                                              \
>                 __ret =  cpu_pm_enter();                                \
>         if (!__ret) {                                                   \
> +               ct_idle_enter();                                        \
>                 __ret = low_level_idle_enter(state);                    \
> +               ct_idle_exit();                                         \
>                 if (!is_retention)                                      \
>                         cpu_pm_exit();                                  \
>         }                                                               \
>

Kind regards
Uffe

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
