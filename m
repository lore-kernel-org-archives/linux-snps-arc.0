Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9BF4C6FA94
	for <linux-snps-arc@archiver.kernel.org>; Thu, 22 Sep 2022 00:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UtKlOv9hW4AKTH7LKem0dw8BLoWSVe/9hE1reP0n9bA=; b=0oOvkLzy+Z4pYE
	w0UJyvMOETUQge0yaPi8uc+z5HMQW1FKAZhrfbmWRsKMV4tErVLwT5Ut2l3+iy0X4g7Mkgf/Fb+SA
	vwMHXvhDu8Wmp3CfklRxZI838IyJEyBB9N/TD3KXplcp0RWXeTdXmC6pC3cSjd2dDibdW13ZvHsN9
	NoY0efIrs+GfeHch0K+Ddrru2CBUtiUQU4/0x8q8wxFLgDQAcB8DtN/bLk/5VLr0fhndtnmkl+WAt
	S0fmQ6BATQ1hSIEGN+3dFFiCzrhoh56VkSkDxbQWUVMzIlJWjMt9oq0JvITy4UL+epcLTnlaYWUHd
	DHb3k2EXHa1CHWI4T9Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obALx-00D1qV-9e; Thu, 22 Sep 2022 00:46:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obALu-00D1pv-Kb; Thu, 22 Sep 2022 00:46:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 868BB632DE;
	Thu, 22 Sep 2022 00:46:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2EA7C43160;
	Thu, 22 Sep 2022 00:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663807562;
	bh=2bH5aOcexI7rmLPjoykcAnkew/OWwytHkYzPwWB/jQU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qaUYBCa8ZYQI7GFr3vNdl7b4/PNzeOP9Pl2wTB/4OC6mUC/FIDhddHDVnhJyCLZDw
	 YQge6B5Td0P7VO9PjXCnxo31fcUlfOUeOzuNgueaOnxtVyoeE+Kw885ZbDXxjh+Kxz
	 nG8xhYs4MfH8znO0LxccUTvFyIcklL8qxJgHgHzEwD28BpML95SM926I5BVMpBRfGy
	 EClfn8JhrAFiO2xWjdeYnkuQSHDKC+N7GbQ87Gnwaucrl4yjzE6eDQWXlwcBRoA5Iv
	 jLegSRu7TSsZLQytF1F6DuVm9kAdHW2MlxTQNgWpbKQ1zMRvmGVdyaWmNwNcIB2j62
	 KBXRDapx3EsAg==
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-1225219ee46so11684564fac.2;
        Wed, 21 Sep 2022 17:46:02 -0700 (PDT)
X-Gm-Message-State: ACrzQf2Dl3tzA7GyKFyctpvXLnuXEJFJ9dKB+VMc2w9t5kjOtQtDs0Mg
	xO4HFCUv+jBSDygmrYsyeIXglhEz9pp259tcMA8=
X-Google-Smtp-Source: AMsMyM5wVf/J3OOqRLb4f8q+r+SKS9nQRSK3lKOefa1IGuaM19Jt2C1f8Xzw1tF39UCQAq/htt5QaEfcl4EevNt8Lqo=
X-Received: by 2002:a05:6870:a78e:b0:12b:542b:e5b2 with SMTP id
 x14-20020a056870a78e00b0012b542be5b2mr6779719oao.112.1663807550798; Wed, 21
 Sep 2022 17:45:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220919095939.761690562@infradead.org> <20220919101520.802976773@infradead.org>
In-Reply-To: <20220919101520.802976773@infradead.org>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 22 Sep 2022 08:45:37 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQxxRQZLV+uJThCZSByUQ0oSoASgwsUggbsR3wHTqrqzg@mail.gmail.com>
Message-ID: <CAJF2gTQxxRQZLV+uJThCZSByUQ0oSoASgwsUggbsR3wHTqrqzg@mail.gmail.com>
Subject: Re: [PATCH v2 07/44] cpuidle,psci: Push RCU-idle into driver
To: Peter Zijlstra <peterz@infradead.org>
Cc: richard.henderson@linaro.org, ink@jurassic.park.msu.ru, mattst88@gmail.com, 
	vgupta@kernel.org, linux@armlinux.org.uk, ulli.kroll@googlemail.com, 
	linus.walleij@linaro.org, shawnguo@kernel.org, 
	Sascha Hauer <s.hauer@pengutronix.de>, kernel@pengutronix.de, festevam@gmail.com, 
	linux-imx@nxp.com, tony@atomide.com, khilman@kernel.org, 
	catalin.marinas@arm.com, will@kernel.org, bcain@quicinc.com, 
	chenhuacai@kernel.org, kernel@xen0n.name, geert@linux-m68k.org, 
	sammy@sammy.net, monstr@monstr.eu, tsbogend@alpha.franken.de, 
	dinguyen@kernel.org, jonas@southpole.se, stefan.kristiansson@saunalahti.fi, 
	shorne@gmail.com, James.Bottomley@hansenpartnership.com, deller@gmx.de, 
	mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com, 
	borntraeger@linux.ibm.com, svens@linux.ibm.com, ysato@users.sourceforge.jp, 
	dalias@libc.org, davem@davemloft.net, richard@nod.at, 
	anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, acme@kernel.org, 
	mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@kernel.org, 
	namhyung@kernel.org, jgross@suse.com, srivatsa@csail.mit.edu, 
	amakhalov@vmware.com, pv-drivers@vmware.com, boris.ostrovsky@oracle.com, 
	chris@zankel.net, jcmvbkbc@gmail.com, rafael@kernel.org, lenb@kernel.org, 
	pavel@ucw.cz, gregkh@linuxfoundation.org, mturquette@baylibre.com, 
	sboyd@kernel.org, daniel.lezcano@linaro.org, lpieralisi@kernel.org, 
	sudeep.holla@arm.com, agross@kernel.org, bjorn.andersson@linaro.org, 
	konrad.dybcio@somainline.org, anup@brainfault.org, thierry.reding@gmail.com, 
	jonathanh@nvidia.com, jacob.jun.pan@linux.intel.com, atishp@atishpatra.org, 
	Arnd Bergmann <arnd@arndb.de>, yury.norov@gmail.com, andriy.shevchenko@linux.intel.com, 
	linux@rasmusvillemoes.dk, dennis@kernel.org, tj@kernel.org, cl@linux.com, 
	rostedt@goodmis.org, pmladek@suse.com, senozhatsky@chromium.org, 
	john.ogness@linutronix.de, juri.lelli@redhat.com, vincent.guittot@linaro.org, 
	dietmar.eggemann@arm.com, bsegall@google.com, mgorman@suse.de, 
	bristot@redhat.com, vschneid@redhat.com, fweisbec@gmail.com, 
	ryabinin.a.a@gmail.com, glider@google.com, andreyknvl@gmail.com, 
	dvyukov@google.com, vincenzo.frascino@arm.com, 
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
	linux-perf-users@vger.kernel.org, virtualization@lists.linux-foundation.org, 
	linux-xtensa@linux-xtensa.org, linux-acpi@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-arch@vger.kernel.org, kasan-dev@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_174606_759954_8C31EA95 
X-CRM114-Status: GOOD (  16.36  )
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

Reviewed-by: Guo Ren <guoren@kernel.org>

On Mon, Sep 19, 2022 at 6:17 PM Peter Zijlstra <peterz@infradead.org> wrote:
>
> Doing RCU-idle outside the driver, only to then temporarily enable it
> again, at least twice, before going idle is daft.
>
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> ---
>  drivers/cpuidle/cpuidle-psci.c |    9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> --- a/drivers/cpuidle/cpuidle-psci.c
> +++ b/drivers/cpuidle/cpuidle-psci.c
> @@ -69,12 +69,12 @@ static int __psci_enter_domain_idle_stat
>                 return -1;
>
>         /* Do runtime PM to manage a hierarchical CPU toplogy. */
> -       ct_irq_enter_irqson();
>         if (s2idle)
>                 dev_pm_genpd_suspend(pd_dev);
>         else
>                 pm_runtime_put_sync_suspend(pd_dev);
> -       ct_irq_exit_irqson();
> +
> +       ct_idle_enter();
>
>         state = psci_get_domain_state();
>         if (!state)
> @@ -82,12 +82,12 @@ static int __psci_enter_domain_idle_stat
>
>         ret = psci_cpu_suspend_enter(state) ? -1 : idx;
>
> -       ct_irq_enter_irqson();
> +       ct_idle_exit();
> +
>         if (s2idle)
>                 dev_pm_genpd_resume(pd_dev);
>         else
>                 pm_runtime_get_sync(pd_dev);
> -       ct_irq_exit_irqson();
>
>         cpu_pm_exit();
>
> @@ -240,6 +240,7 @@ static int psci_dt_cpu_init_topology(str
>          * of a shared state for the domain, assumes the domain states are all
>          * deeper states.
>          */
> +       drv->states[state_count - 1].flags |= CPUIDLE_FLAG_RCU_IDLE;
>         drv->states[state_count - 1].enter = psci_enter_domain_idle_state;
>         drv->states[state_count - 1].enter_s2idle = psci_enter_s2idle_domain_idle_state;
>         psci_cpuidle_use_cpuhp = true;
>
>


-- 
Best Regards
 Guo Ren

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
