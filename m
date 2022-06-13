Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC62BC43334
	for <linux-snps-arc@archiver.kernel.org>; Mon, 13 Jun 2022 18:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=O6dzWKCwEUtOcyXBqy0YJMmeE9LlcchggOmCQj0rpNo=; b=m7ws9m0OfmGByTH/UnU7i54bgd
	DZKLvopdYCUfO7Vbud/SOFmau/pZVQbhoE8FHQV7wlAidtRLSrBWE/gvDbgOuNr2MunBwMHJ7P96J
	EW9eiXyCV1hUitRj2eZI61ZGknfQ+oj2/aCa7tofzg4UepjlRPRJBdXesieKbUzZLYoHwT6DzVF77
	KJW2b0tR1Yp3B6wRSw/ZAaZhu3r9viQOwO1KEjLwqFDbqKhZeEGqHtecHy2UGT+9QCxPS6W9LyWTl
	0bxk7Znahfydx/bVXxhtl0Ys8PZ+UC+HNBrGh2AKP55FGMYBhxoq8xM9DEvi9Cz67TDzfW/XmJgL1
	3Ehd03aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0p8o-005DUb-H6; Mon, 13 Jun 2022 18:50:22 +0000
Received: from outgoing-stata.csail.mit.edu ([128.30.2.210])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0p8k-005DSg-Ur; Mon, 13 Jun 2022 18:50:20 +0000
Received: from [77.23.249.31] (helo=srivatsab-a02.vmware.com)
	by outgoing-stata.csail.mit.edu with esmtpsa (TLS1.2:RSA_AES_128_CBC_SHA1:128)
	(Exim 4.82)
	(envelope-from <srivatsa@csail.mit.edu>)
	id 1o0p7j-0002lx-0j; Mon, 13 Jun 2022 14:49:15 -0400
Subject: Re: [PATCH 29/36] cpuidle,xenpv: Make more PARAVIRT_XXL noinstr clean
To: Peter Zijlstra <peterz@infradead.org>
Cc: rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com,
 vgupta@kernel.org, linux@armlinux.org.uk, ulli.kroll@googlemail.com,
 linus.walleij@linaro.org, shawnguo@kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com, tony@atomide.com, khilman@kernel.org,
 catalin.marinas@arm.com, will@kernel.org, guoren@kernel.org,
 bcain@quicinc.com, chenhuacai@kernel.org, kernel@xen0n.name,
 geert@linux-m68k.org, sammy@sammy.net, monstr@monstr.eu,
 tsbogend@alpha.franken.de, dinguyen@kernel.org, jonas@southpole.se,
 stefan.kristiansson@saunalahti.fi, shorne@gmail.com,
 James.Bottomley@HansenPartnership.com, deller@gmx.de, mpe@ellerman.id.au,
 benh@kernel.crashing.org, paulus@samba.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, hca@linux.ibm.com,
 gor@linux.ibm.com, agordeev@linux.ibm.com, borntraeger@linux.ibm.com,
 svens@linux.ibm.com, ysato@users.sourceforge.jp, dalias@libc.org,
 davem@davemloft.net, richard@nod.at, anton.ivanov@cambridgegreys.com,
 johannes@sipsolutions.net, tglx@linutronix.de, mingo@redhat.com,
 bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
 acme@kernel.org, mark.rutland@arm.com, alexander.shishkin@linux.intel.com,
 jolsa@kernel.org, namhyung@kernel.org, jgross@suse.com,
 amakhalov@vmware.com, pv-drivers@vmware.com, boris.ostrovsky@oracle.com,
 chris@zankel.net, jcmvbkbc@gmail.com, rafael@kernel.org, lenb@kernel.org,
 pavel@ucw.cz, gregkh@linuxfoundation.org, mturquette@baylibre.com,
 sboyd@kernel.org, daniel.lezcano@linaro.org, lpieralisi@kernel.org,
 sudeep.holla@arm.com, agross@kernel.org, bjorn.andersson@linaro.org,
 anup@brainfault.org, thierry.reding@gmail.com, jonathanh@nvidia.com,
 jacob.jun.pan@linux.intel.com, Arnd Bergmann <arnd@arndb.de>,
 yury.norov@gmail.com, andriy.shevchenko@linux.intel.com,
 linux@rasmusvillemoes.dk, rostedt@goodmis.org, pmladek@suse.com,
 senozhatsky@chromium.org, john.ogness@linutronix.de, paulmck@kernel.org,
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
References: <20220608142723.103523089@infradead.org>
 <20220608144517.759631860@infradead.org>
From: "Srivatsa S. Bhat" <srivatsa@csail.mit.edu>
Message-ID: <510b9b68-7d53-7d4d-5a05-37fbd199eb4b@csail.mit.edu>
Date: Mon, 13 Jun 2022 20:48:49 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20220608144517.759631860@infradead.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220613_115019_116680_EBF84E40 
X-CRM114-Status: GOOD (  14.21  )
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

On 6/8/22 4:27 PM, Peter Zijlstra wrote:
> vmlinux.o: warning: objtool: acpi_idle_enter_s2idle+0xde: call to wbinvd() leaves .noinstr.text section
> vmlinux.o: warning: objtool: default_idle+0x4: call to arch_safe_halt() leaves .noinstr.text section
> vmlinux.o: warning: objtool: xen_safe_halt+0xa: call to HYPERVISOR_sched_op.constprop.0() leaves .noinstr.text section
> 
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>

Reviewed-by: Srivatsa S. Bhat (VMware) <srivatsa@csail.mit.edu>


Regards,
Srivatsa
VMware Photon OS

> ---
>  arch/x86/include/asm/paravirt.h      |    6 ++++--
>  arch/x86/include/asm/special_insns.h |    4 ++--
>  arch/x86/include/asm/xen/hypercall.h |    2 +-
>  arch/x86/kernel/paravirt.c           |   14 ++++++++++++--
>  arch/x86/xen/enlighten_pv.c          |    2 +-
>  arch/x86/xen/irq.c                   |    2 +-
>  6 files changed, 21 insertions(+), 9 deletions(-)
> 
> --- a/arch/x86/include/asm/paravirt.h
> +++ b/arch/x86/include/asm/paravirt.h
> @@ -168,7 +168,7 @@ static inline void __write_cr4(unsigned
>  	PVOP_VCALL1(cpu.write_cr4, x);
>  }
>  
> -static inline void arch_safe_halt(void)
> +static __always_inline void arch_safe_halt(void)
>  {
>  	PVOP_VCALL0(irq.safe_halt);
>  }
> @@ -178,7 +178,9 @@ static inline void halt(void)
>  	PVOP_VCALL0(irq.halt);
>  }
>  
> -static inline void wbinvd(void)
> +extern noinstr void pv_native_wbinvd(void);
> +
> +static __always_inline void wbinvd(void)
>  {
>  	PVOP_ALT_VCALL0(cpu.wbinvd, "wbinvd", ALT_NOT(X86_FEATURE_XENPV));
>  }
> --- a/arch/x86/include/asm/special_insns.h
> +++ b/arch/x86/include/asm/special_insns.h
> @@ -115,7 +115,7 @@ static inline void wrpkru(u32 pkru)
>  }
>  #endif
>  
> -static inline void native_wbinvd(void)
> +static __always_inline void native_wbinvd(void)
>  {
>  	asm volatile("wbinvd": : :"memory");
>  }
> @@ -179,7 +179,7 @@ static inline void __write_cr4(unsigned
>  	native_write_cr4(x);
>  }
>  
> -static inline void wbinvd(void)
> +static __always_inline void wbinvd(void)
>  {
>  	native_wbinvd();
>  }
> --- a/arch/x86/include/asm/xen/hypercall.h
> +++ b/arch/x86/include/asm/xen/hypercall.h
> @@ -382,7 +382,7 @@ MULTI_stack_switch(struct multicall_entr
>  }
>  #endif
>  
> -static inline int
> +static __always_inline int
>  HYPERVISOR_sched_op(int cmd, void *arg)
>  {
>  	return _hypercall2(int, sched_op, cmd, arg);
> --- a/arch/x86/kernel/paravirt.c
> +++ b/arch/x86/kernel/paravirt.c
> @@ -233,6 +233,11 @@ static noinstr void pv_native_set_debugr
>  	native_set_debugreg(regno, val);
>  }
>  
> +noinstr void pv_native_wbinvd(void)
> +{
> +	native_wbinvd();
> +}
> +
>  static noinstr void pv_native_irq_enable(void)
>  {
>  	native_irq_enable();
> @@ -242,6 +247,11 @@ static noinstr void pv_native_irq_disabl
>  {
>  	native_irq_disable();
>  }
> +
> +static noinstr void pv_native_safe_halt(void)
> +{
> +	native_safe_halt();
> +}
>  #endif
>  
>  enum paravirt_lazy_mode paravirt_get_lazy_mode(void)
> @@ -273,7 +283,7 @@ struct paravirt_patch_template pv_ops =
>  	.cpu.read_cr0		= native_read_cr0,
>  	.cpu.write_cr0		= native_write_cr0,
>  	.cpu.write_cr4		= native_write_cr4,
> -	.cpu.wbinvd		= native_wbinvd,
> +	.cpu.wbinvd		= pv_native_wbinvd,
>  	.cpu.read_msr		= native_read_msr,
>  	.cpu.write_msr		= native_write_msr,
>  	.cpu.read_msr_safe	= native_read_msr_safe,
> @@ -307,7 +317,7 @@ struct paravirt_patch_template pv_ops =
>  	.irq.save_fl		= __PV_IS_CALLEE_SAVE(native_save_fl),
>  	.irq.irq_disable	= __PV_IS_CALLEE_SAVE(pv_native_irq_disable),
>  	.irq.irq_enable		= __PV_IS_CALLEE_SAVE(pv_native_irq_enable),
> -	.irq.safe_halt		= native_safe_halt,
> +	.irq.safe_halt		= pv_native_safe_halt,
>  	.irq.halt		= native_halt,
>  #endif /* CONFIG_PARAVIRT_XXL */
>  
> --- a/arch/x86/xen/enlighten_pv.c
> +++ b/arch/x86/xen/enlighten_pv.c
> @@ -1019,7 +1019,7 @@ static const typeof(pv_ops) xen_cpu_ops
>  
>  		.write_cr4 = xen_write_cr4,
>  
> -		.wbinvd = native_wbinvd,
> +		.wbinvd = pv_native_wbinvd,
>  
>  		.read_msr = xen_read_msr,
>  		.write_msr = xen_write_msr,
> --- a/arch/x86/xen/irq.c
> +++ b/arch/x86/xen/irq.c
> @@ -24,7 +24,7 @@ noinstr void xen_force_evtchn_callback(v
>  	(void)HYPERVISOR_xen_version(0, NULL);
>  }
>  
> -static void xen_safe_halt(void)
> +static noinstr void xen_safe_halt(void)
>  {
>  	/* Blocking includes an implicit local_irq_enable(). */
>  	if (HYPERVISOR_sched_op(SCHEDOP_block, NULL) != 0)
> 
> 

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
