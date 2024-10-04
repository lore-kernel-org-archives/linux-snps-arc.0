Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07ABFCF8840
	for <linux-snps-arc@archiver.kernel.org>; Fri,  4 Oct 2024 17:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZN0YmCJ8mWzrZBlVLwiaPClO7cUZIHBErpFycPXqL2A=; b=3yAju2TGAg/WmL
	m5ZzNGQecnKLEmutSel7KJxNBWhJXJiiD7uy7EKFc7K8LS/2PDvS3bVU4Cl8uD7lUpopdOeMiL0/8
	iLXcnDBhcmGlOuUAqMbjW7qfQxbLD8Xrx1uALqK4s8lFPm9v1BdMipgGObOXKzXIjRudTajnQozFK
	JZulvpReOZ52VE7kXPQpvKZwFK9fFxO7EdfFQlZXygwVPKnUr0Lp7rRCkKL6RAxXXlAzpfDoZsQSl
	EkRNvoMtlW/HiKDVVb/N2zIg4mEpcIradsqWDd+Pj1Ykypv39T20IpOa7FOk5LT8tMdifgZJCmLGA
	BDpnNMDB15NUCbK8ZvGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swlpA-0000000DQsW-3DfR;
	Fri, 04 Oct 2024 17:10:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swkQp-0000000D3aU-2R1Z
	for linux-snps-arc@lists.infradead.org;
	Fri, 04 Oct 2024 15:41:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C82995C5E9B;
	Fri,  4 Oct 2024 15:41:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8ADBC4CEC6;
	Fri,  4 Oct 2024 15:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728056486;
	bh=wWIqaWFb9hczSFyfBOrlAdAaRIwnd6rA02tbEjm3/Hw=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=OcIjcXhJL6RvMjskKV2gco+Uaa/9U9nZ9azzuXuQkJepVHmz60SCWHFFNRmETlEaD
	 5pmOdUplQAuB0q1GhHLSOLJH7utcGfkPlKMbrUQHEfci0MDPOn7O8P6V9m2gJ4/UtA
	 a+lNf4lC1AsoR/qOucYlAmAE5G0yIElR6coz44xZPrl/k/X0tlUtSjNfEM0azDMMiS
	 gOwSJZUWDK90c1/7nUmRiS4HdanyuUxKTgvGRWjtGofbLs7XorYpsSHFwl9TyLek1P
	 /dnLIcQLTlEvrzpr0g0IZp6GXBLG/RHKwwiIpRdRvE4cpBTc4HXjObAKxS6OgpKoax
	 JZRh95qCYEntw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 44B5DCE0D71; Fri,  4 Oct 2024 08:41:26 -0700 (PDT)
Date: Fri, 4 Oct 2024 08:41:26 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org
Subject: Re: arch/arc/kernel/smp.c:267:18: sparse: sparse: cast removes
 address space '__percpu' of expression
Message-ID: <5ada7b12-f3c4-4ae8-b396-a3e474f4f852@paulmck-laptop>
References: <202409251336.ToC0TvWB-lkp@intel.com>
 <e8f6137d-ad2c-4b06-8eb2-cd200fbb1af2@paulmck-laptop>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e8f6137d-ad2c-4b06-8eb2-cd200fbb1af2@paulmck-laptop>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241004_084127_729252_452FAA63 
X-CRM114-Status: GOOD (  18.50  )
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

On Mon, Sep 30, 2024 at 09:10:27AM -0700, Paul E. McKenney wrote:
> On Wed, Sep 25, 2024 at 01:40:45PM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   684a64bf32b6e488004e0ad7f0d7e922798f65b6
> > commit: f2519d4d4fc4d36f2b58c5614357de9f5b4032fc ARC: Emulate one-byte cmpxchg
> > date:   12 days ago
> > config: arc-randconfig-r123-20240925 (https://download.01.org/0day-ci/archive/20240925/202409251336.ToC0TvWB-lkp@intel.com/config)
> > compiler: arc-elf-gcc (GCC) 13.2.0
> > reproduce: (https://download.01.org/0day-ci/archive/20240925/202409251336.ToC0TvWB-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202409251336.ToC0TvWB-lkp@intel.com/
> > 
> > sparse warnings: (new ones prefixed by >>)
> >    arch/arc/kernel/smp.c:252:48: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected unsigned long [noderef] __percpu *ipi_data_ptr @@     got unsigned long * @@
> >    arch/arc/kernel/smp.c:252:48: sparse:     expected unsigned long [noderef] __percpu *ipi_data_ptr
> >    arch/arc/kernel/smp.c:252:48: sparse:     got unsigned long *
> >    arch/arc/kernel/smp.c:267:18: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile *v @@     got unsigned long [noderef] __percpu *__ai_ptr @@
> >    arch/arc/kernel/smp.c:267:18: sparse:     expected void const volatile *v
> >    arch/arc/kernel/smp.c:267:18: sparse:     got unsigned long [noderef] __percpu *__ai_ptr
> > >> arch/arc/kernel/smp.c:267:18: sparse: sparse: cast removes address space '__percpu' of expression
> > >> arch/arc/kernel/smp.c:267:18: sparse: sparse: cast removes address space '__percpu' of expression
> 
> I could "fix" this using __force.  Is that a reasonable approach?
> 
> If I don't hear otherwise, I will take that approach.

Having not heard otherwise, does the following fix this issue for you?

							Thanx, Paul

------------------------------------------------------------------------

diff --git a/arch/arc/include/asm/cmpxchg.h b/arch/arc/include/asm/cmpxchg.h
index 58045c8983404..76f43db0890fc 100644
--- a/arch/arc/include/asm/cmpxchg.h
+++ b/arch/arc/include/asm/cmpxchg.h
@@ -48,7 +48,7 @@
 									\
 	switch(sizeof((_p_))) {						\
 	case 1:								\
-		_prev_ = (__typeof__(*(ptr)))cmpxchg_emu_u8((volatile u8 *)_p_, (uintptr_t)_o_, (uintptr_t)_n_);	\
+		_prev_ = (__typeof__(*(ptr)))cmpxchg_emu_u8((volatile u8 *__force)_p_, (uintptr_t)_o_, (uintptr_t)_n_);	\
 		break;							\
 	case 4:								\
 		_prev_ = __cmpxchg(_p_, _o_, _n_);			\

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
