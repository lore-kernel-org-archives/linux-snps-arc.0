Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92D1CCE8362
	for <linux-snps-arc@archiver.kernel.org>; Mon, 30 Sep 2024 16:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5++Q7aWUQOor5wTrJpJvfFVuxjipJb1EywaZOrgJgt0=; b=4lMRraPQZBw43O
	cq8r3qiB0/Gcx19ZAsHe5jVwaQ/zytTfRguegPTRHLuYl45HM5asT7/PbdWoJOMlb/Bb6ikgD3xBk
	E+qpX2jGmDwYx7K1XdmkOs3z+bTJaIUjkRQu2nbFwV2Xbil268QdMLgydtBrObO2OelJKg2VEc2z1
	i5GX/iBTcgqgH4pzbHp1B5nowr12yRvJra0dJzoS98Vux5zIgCImQApz3B1T7klq1PGknvHtrxzaN
	rS9rvwEU8RW2iirDZeoqzFi6dokfYrfddesD8sxOKRVOzsYDAUox6TttF12H/U0k8X0GyvgmIAbeb
	gp5IbQ4tKFpymBOqQsbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svIyl-00000000BMR-3sba;
	Mon, 30 Sep 2024 16:10:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svIyi-00000000BLk-3oVK
	for linux-snps-arc@lists.infradead.org;
	Mon, 30 Sep 2024 16:10:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 26B805C4C14;
	Mon, 30 Sep 2024 16:10:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD5DAC4CEC7;
	Mon, 30 Sep 2024 16:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727712627;
	bh=kGXqmstFcbWcGVvFNWj4UL7lFlWvJeeSSReWGtHrnuM=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=R31BemSgmkqLWZEZ5R2bNtTOeMT9rwWxAopCLrF7SZ/3vbe4evpxc6mlOGGFfoL9Y
	 kEGhZruhQyR/GzcMmwgVry0iTgMCN5I+UZ3TinoIqZLZ9+GiqqR4uj6bUDA3m50wE7
	 tsegxFUAmXkFQlqOvBJ2XWINdCJo8CcceHiWBDqWFb7QyuUAZ3HJ9f6ar9nEKASncG
	 fPg3LkvMVNCbYWfNWp7rMNNW9Xc+bYd1V0nYOO6zUtDS3HCMiN5n7CNCGMZ1JpN2Ja
	 OTIas2LOGo2c6IoSdhRcM/5sjlmO4BWGLRsdLOGJ1GvwxzZayBqtzK2eeUuJ1jRcJh
	 dx6ZQ20LWsT6g==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 6D8FDCE0E19; Mon, 30 Sep 2024 09:10:27 -0700 (PDT)
Date: Mon, 30 Sep 2024 09:10:27 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org
Subject: Re: arch/arc/kernel/smp.c:267:18: sparse: sparse: cast removes
 address space '__percpu' of expression
Message-ID: <e8f6137d-ad2c-4b06-8eb2-cd200fbb1af2@paulmck-laptop>
References: <202409251336.ToC0TvWB-lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202409251336.ToC0TvWB-lkp@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_091029_056909_94DEDD38 
X-CRM114-Status: GOOD (  20.10  )
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
Reply-To: paulmck@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Wed, Sep 25, 2024 at 01:40:45PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   684a64bf32b6e488004e0ad7f0d7e922798f65b6
> commit: f2519d4d4fc4d36f2b58c5614357de9f5b4032fc ARC: Emulate one-byte cmpxchg
> date:   12 days ago
> config: arc-randconfig-r123-20240925 (https://download.01.org/0day-ci/archive/20240925/202409251336.ToC0TvWB-lkp@intel.com/config)
> compiler: arc-elf-gcc (GCC) 13.2.0
> reproduce: (https://download.01.org/0day-ci/archive/20240925/202409251336.ToC0TvWB-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202409251336.ToC0TvWB-lkp@intel.com/
> 
> sparse warnings: (new ones prefixed by >>)
>    arch/arc/kernel/smp.c:252:48: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long [noderef] __percpu *ipi_data_ptr @@     got unsigned long * @@
>    arch/arc/kernel/smp.c:252:48: sparse:     expected unsigned long [noderef] __percpu *ipi_data_ptr
>    arch/arc/kernel/smp.c:252:48: sparse:     got unsigned long *
>    arch/arc/kernel/smp.c:267:18: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile *v @@     got unsigned long [noderef] __percpu *__ai_ptr @@
>    arch/arc/kernel/smp.c:267:18: sparse:     expected void const volatile *v
>    arch/arc/kernel/smp.c:267:18: sparse:     got unsigned long [noderef] __percpu *__ai_ptr
> >> arch/arc/kernel/smp.c:267:18: sparse: sparse: cast removes address space '__percpu' of expression
> >> arch/arc/kernel/smp.c:267:18: sparse: sparse: cast removes address space '__percpu' of expression

I could "fix" this using __force.  Is that a reasonable approach?

If I don't hear otherwise, I will take that approach.

							Thanx, Paul

>    arch/arc/kernel/smp.c:401:72: sparse: sparse: incorrect type in argument 4 (different address spaces) @@     expected void [noderef] __percpu *percpu_dev_id @@     got int *dev @@
>    arch/arc/kernel/smp.c:401:72: sparse:     expected void [noderef] __percpu *percpu_dev_id
>    arch/arc/kernel/smp.c:401:72: sparse:     got int *dev
>    arch/arc/kernel/smp.c:265:30: sparse: sparse: dereference of noderef expression
> 
> vim +/__percpu +267 arch/arc/kernel/smp.c
> 
> 41195d236e8445 Vineet Gupta    2013-01-18  249  
> ddf84433f411b6 Vineet Gupta    2013-11-25  250  static void ipi_send_msg_one(int cpu, enum ipi_msg_type msg)
> 41195d236e8445 Vineet Gupta    2013-01-18  251  {
> f2a4aa5646687f Vineet Gupta    2013-11-26  252  	unsigned long __percpu *ipi_data_ptr = per_cpu_ptr(&ipi_data, cpu);
> d8e8c7dda11f5d Vineet Gupta    2013-11-28  253  	unsigned long old, new;
> 41195d236e8445 Vineet Gupta    2013-01-18  254  	unsigned long flags;
> 41195d236e8445 Vineet Gupta    2013-01-18  255  
> f2a4aa5646687f Vineet Gupta    2013-11-26  256  	pr_debug("%d Sending msg [%d] to %d\n", smp_processor_id(), msg, cpu);
> f2a4aa5646687f Vineet Gupta    2013-11-26  257  
> 41195d236e8445 Vineet Gupta    2013-01-18  258  	local_irq_save(flags);
> 41195d236e8445 Vineet Gupta    2013-01-18  259  
> d8e8c7dda11f5d Vineet Gupta    2013-11-28  260  	/*
> d8e8c7dda11f5d Vineet Gupta    2013-11-28  261  	 * Atomically write new msg bit (in case others are writing too),
> d8e8c7dda11f5d Vineet Gupta    2013-11-28  262  	 * and read back old value
> d8e8c7dda11f5d Vineet Gupta    2013-11-28  263  	 */
> d8e8c7dda11f5d Vineet Gupta    2013-11-28  264  	do {
> c6ed4d84a2c49d Bang Li         2022-03-19  265  		new = old = *ipi_data_ptr;
> d8e8c7dda11f5d Vineet Gupta    2013-11-28  266  		new |= 1U << msg;
> d8e8c7dda11f5d Vineet Gupta    2013-11-28 @267  	} while (cmpxchg(ipi_data_ptr, old, new) != old);
> 41195d236e8445 Vineet Gupta    2013-01-18  268  
> d8e8c7dda11f5d Vineet Gupta    2013-11-28  269  	/*
> d8e8c7dda11f5d Vineet Gupta    2013-11-28  270  	 * Call the platform specific IPI kick function, but avoid if possible:
> d8e8c7dda11f5d Vineet Gupta    2013-11-28  271  	 * Only do so if there's no pending msg from other concurrent sender(s).
> 82a423053eb3cf Changcheng Deng 2021-08-14  272  	 * Otherwise, receiver will see this msg as well when it takes the
> d8e8c7dda11f5d Vineet Gupta    2013-11-28  273  	 * IPI corresponding to that msg. This is true, even if it is already in
> d8e8c7dda11f5d Vineet Gupta    2013-11-28  274  	 * IPI handler, because !@old means it has not yet dequeued the msg(s)
> d8e8c7dda11f5d Vineet Gupta    2013-11-28  275  	 * so @new msg can be a free-loader
> d8e8c7dda11f5d Vineet Gupta    2013-11-28  276  	 */
> d8e8c7dda11f5d Vineet Gupta    2013-11-28  277  	if (plat_smp_ops.ipi_send && !old)
> ddf84433f411b6 Vineet Gupta    2013-11-25  278  		plat_smp_ops.ipi_send(cpu);
> 41195d236e8445 Vineet Gupta    2013-01-18  279  
> 41195d236e8445 Vineet Gupta    2013-01-18  280  	local_irq_restore(flags);
> 41195d236e8445 Vineet Gupta    2013-01-18  281  }
> 41195d236e8445 Vineet Gupta    2013-01-18  282  
> 
> :::::: The code at line 267 was first introduced by commit
> :::::: d8e8c7dda11f5d5cf90495f2e89d917a83509bc0 ARC: [SMP] optimize IPI send and receive
> 
> :::::: TO: Vineet Gupta <vgupta@synopsys.com>
> :::::: CC: Vineet Gupta <vgupta@synopsys.com>
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
