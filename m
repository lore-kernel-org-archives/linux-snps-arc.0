Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04380CA5FED
	for <linux-snps-arc@archiver.kernel.org>; Tue,  6 Oct 2026 15:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DET/1Sdii/Rr9LT1A/663McaV2XxlD4p0pDg4C2x8ew=; b=tyewQOYQXH7iy9
	StOw1wZnGD7vxfU6tmZF139sp2FkXP6INGDdnQ1b6CigIuguT9ByzpAY+0J5HxF/PvuCR1UPjwWl0
	a9Mpjslxgo9KL9hdfYHxVl0f28B5Z9b6g6SKQdIXvpCVTnGLE5i06HJlqT5nScq6SsUBiyZzgV0is
	l2G6jqCp18pSUIphOW4iLQI0mmRoY3rVFoah7Z/Z+mUD9uOKPhrFGnA59GSjSHxD7n4Ld1WJIYSFe
	+VoAHk6FhkkK+jD9DFlPBkpeqmwBtsoWD/yBJ7STCrOR9l2gChRuI6VEy7dUgtgDyCEKkcoOfPSd3
	q6l/yI+gvjCJLiiCTe8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE7Ky-000000013hB-1Npn;
	Tue, 06 Oct 2026 15:44:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE7Kw-000000013h1-3X07
	for linux-snps-arc@lists.infradead.org;
	Tue, 06 Oct 2026 15:44:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 46C7143B5C;
	Tue,  6 Oct 2026 15:44:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 282771F0089B;
	Tue,  6 Oct 2026 15:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791301454;
	bh=mUrWQujljsMH/p/9Y5XMz/o7VHMyGKrumRnHLYhjLPQ=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=d1o9LzMZti0vMOfKz36Pg22wT2Jf6eXrxj6erZQKijnoy7IjyPP6zDnSOpXv91H0/
	 mI6nE6c/oDZXsfLA622qmVLRIASS2a0U85wOoHPBJ7tYP3x/Gy+uwkAurHy5JzYkce
	 4B1+Tr3zAA0wRUEOmPlOb7Fu7Q3s2TebB0tBmbIwHN0jXHBpOOZ0o8brmWfv93S2kQ
	 4vWpoKZIA+Lepa7w6ufuuy62yuwtRtWwUUAks9gbPWmtp6GjV3xlSe3aFPboP0UseB
	 8EdH88XHIs6hj4h5hg9a+j6FjlNQtnni2v/do3b44edYczxieNGMZj/TRabVuJv9Ch
	 OB48m0wsb9qHw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id C9F51CE0ACB; Tue,  6 Oct 2026 08:44:13 -0700 (PDT)
Date: Tue, 6 Oct 2026 08:44:13 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: Bradley Morgan <brads@mainlining.org>, akpm@linux-foundation.org,
	vgupta@kernel.org, guoren@kernel.org, chris@zankel.net,
	jcmvbkbc@gmail.com, oe-kbuild-all@lists.linux.dev, arnd@arndb.de,
	david.laight.linux@gmail.com, glaubitz@physik.fu-berlin.de,
	ysato@users.sourceforge.jp, dalias@libc.org,
	linux-snps-arc@lists.infradead.org, linux-csky@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/3] xtensa: Emulate two-byte cmpxchg
Message-ID: <82aad69a-603c-41cd-876d-09772a1a7e6a@paulmck-laptop>
References: <20261005120700.383058-4-brads@mainlining.org>
 <202610061704.rvbolgPy-lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202610061704.rvbolgPy-lkp@intel.com>
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

On Tue, Oct 06, 2026 at 05:54:53PM +0800, kernel test robot wrote:
> Hi Bradley,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on akpm-mm/mm-everything]
> [also build test ERROR on vgupta-arc/for-curr jcmvbkbc-xtensa/xtensa-for-next linus/master v7.3-rc6 next-20261005]
> [cannot apply to vgupta-arc/for-next]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Bradley-Morgan/ARC-Emulate-two-byte-cmpxchg/20261005-120658
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> patch link:    https://lore.kernel.org/r/20261005120700.383058-4-brads%40mainlining.org
> patch subject: [PATCH v5 3/3] xtensa: Emulate two-byte cmpxchg
> config: xtensa-allyesconfig (https://download.01.org/0day-ci/archive/20261006/202610061704.rvbolgPy-lkp@intel.com/config)
> compiler: xtensa-linux-gcc (GCC) 16.1.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261006/202610061704.rvbolgPy-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202610061704.rvbolgPy-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):

These patches need to be applied on top of my -rcu tree's "dev" branch,
which supplies cmpxchg_emu_u16().

Nevertheless, thank you for your testing efforts!

							Thanx, Paul

>    In file included from arch/xtensa/include/asm/atomic.h:19,
>                     from include/linux/atomic.h:7,
>                     from include/asm-generic/bitops/atomic.h:5,
>                     from arch/xtensa/include/asm/bitops.h:192,
>                     from include/linux/bitops.h:67,
>                     from include/linux/log2.h:12,
>                     from kernel/bounds.c:14:
>    arch/xtensa/include/asm/cmpxchg.h: In function '__cmpxchg':
> >> arch/xtensa/include/asm/cmpxchg.h:79:25: error: implicit declaration of function 'cmpxchg_emu_u16'; did you mean 'cmpxchg_emu_u8'? [-Wimplicit-function-declaration]
>       79 |         case 2:  return cmpxchg_emu_u16(ptr, old, new);
>          |                         ^~~~~~~~~~~~~~~
>          |                         cmpxchg_emu_u8
>    make[3]: *** [scripts/Makefile.build:185: kernel/bounds.s] Error 1
>    make[3]: Target 'prepare' not remade because of errors.
>    make[2]: *** [Makefile:1405: prepare0] Error 2
>    make[2]: Target 'prepare' not remade because of errors.
>    make[1]: *** [Makefile:248: __sub-make] Error 2
>    make[1]: Target 'prepare' not remade because of errors.
>    make: *** [Makefile:248: __sub-make] Error 2
>    make: Target 'prepare' not remade because of errors.
> 
> 
> vim +79 arch/xtensa/include/asm/cmpxchg.h
> 
>     73	
>     74	static __inline__ unsigned long
>     75	__cmpxchg(volatile void *ptr, unsigned long old, unsigned long new, int size)
>     76	{
>     77		switch (size) {
>     78		case 1:  return cmpxchg_emu_u8(ptr, old, new);
>   > 79		case 2:  return cmpxchg_emu_u16(ptr, old, new);
>     80		case 4:  return __cmpxchg_u32(ptr, old, new);
>     81		default: __cmpxchg_called_with_bad_pointer();
>     82			 return old;
>     83		}
>     84	}
>     85	
> 
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
