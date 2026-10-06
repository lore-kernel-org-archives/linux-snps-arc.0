Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0EDBCA5FFC
	for <linux-snps-arc@archiver.kernel.org>; Tue,  6 Oct 2026 15:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L3TZq7p2RNCw6UBXWtAC4h+0xu5tTb3/dhcG8ufhAZc=; b=gdfuh1H3K78g4X
	+jeumwCbJ4al5H042w83O4mgELyTzsjjXSR1+5ZdfewNFmu+AbwrtQbf+zYcJTbr1L9FdnwSKCFrx
	vRgIOjzGCJsC7pX0uvY21dWL0uZvegB+z1GUo7OA4idUaVNgLxshY/hSFmWu5OZ9m8eiWkwc1SDhX
	TEWh4J4SBBG+Mxjjr7N8n4w3BQLPi4V2W9ocu2kGmJm1evBnrEC9Hl4pwnibFzDickbj9tRT9syMh
	yv4wV1ou9U91ZEuWsuyBuhOYPc3m4XkcWnnXDqpqwx40FRMbajPVrD2j0RlwZwYR3RW8rJpS+gl9e
	GQspIkcjCIW2lkKk0UbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE7PV-0000000141Z-14Cm;
	Tue, 06 Oct 2026 15:48:57 +0000
Received: from mail.mainlining.org ([5.75.144.95])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE7PS-0000000140u-17Gp
	for linux-snps-arc@lists.infradead.org;
	Tue, 06 Oct 2026 15:48:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1791301582; bh=JAVdKFCaHPbBSmZ2pl4nQ5a
	or1mbLWg9H51fpwaBb7I=; b=XyWR8xH4KT9yvSdG7borQ3El2wVgztohhfVBUkxcWAGCiIIJt3
	FRw40CzJtbK2w+kJ/mUZncJLt0ioygIaytNd0khM9KmnNc/TYUk+QnRpuKAMcxsz/GaI1fKS/mU
	nM3aCcnEDXlRjhdMaLqvb8W/VGSGppc6RSezXcA8zOBjqz0FA202Zhd2V5RufEut8kiSgy6tmQ0
	t58G/+fS0a9QLWevlVukyvs0eXKiFAv9/vTQ1MCyiiCNCLrw8hiAxH81der2YWAV6Z8X5aIiUTM
	efQjNE3KF7MoeRKEWD/j6ofZBZPbhh6cLSXwEAk7m/b2x+SN8T071XMLZmN+tGyR7vQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1791301582; bh=JAVdKFCaHPbBSmZ2pl4nQ5a
	or1mbLWg9H51fpwaBb7I=; b=nHTaRmHNgZ0xesqAQG7xtQNO3X/nZRxjTb+3p4VrzbDEpPHMZO
	GEvBflEQgmLJQ6Tut4lnF1/Xs22fYVPO6+Dw==;
Date: Tue, 06 Oct 2026 16:46:22 +0100
From: Bradley Morgan <brads@mainlining.org>
To: paulmck@kernel.org, "Paul E. McKenney" <paulmck@kernel.org>,
 kernel test robot <lkp@intel.com>
CC: akpm@linux-foundation.org, vgupta@kernel.org, guoren@kernel.org,
 chris@zankel.net, jcmvbkbc@gmail.com, oe-kbuild-all@lists.linux.dev,
 arnd@arndb.de, david.laight.linux@gmail.com, glaubitz@physik.fu-berlin.de,
 ysato@users.sourceforge.jp, dalias@libc.org,
 linux-snps-arc@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/3] xtensa: Emulate two-byte cmpxchg
In-Reply-To: <82aad69a-603c-41cd-876d-09772a1a7e6a@paulmck-laptop>
References: <20261005120700.383058-4-brads@mainlining.org> <202610061704.rvbolgPy-lkp@intel.com> <82aad69a-603c-41cd-876d-09772a1a7e6a@paulmck-laptop>
Message-ID: <543B9D97-52F8-4D12-8118-9698F6908668@mainlining.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_084854_453965_9FDF9944 
X-CRM114-Status: GOOD (  14.54  )
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

On 6 October 2026 16:44:13 BST, "Paul E. McKenney" <paulmck@kernel.org>
wrote:
>On Tue, Oct 06, 2026 at 05:54:53PM +0800, kernel test robot wrote:
>> Hi Bradley,
>> 
>> kernel test robot noticed the following build errors:
>> 
>> [auto build test ERROR on akpm-mm/mm-everything]
>> [also build test ERROR on vgupta-arc/for-curr
>jcmvbkbc-xtensa/xtensa-for-next linus/master v7.3-rc6 next-20261005]
>> [cannot apply to vgupta-arc/for-next]
>> [If your patch is applied to the wrong git tree, kindly drop us a note.
>> And when submitting patch, we suggest to use '--base' as documented in
>> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>> 
>> url:   
>https://github.com/intel-lab-lkp/linux/commits/Bradley-Morgan/ARC-Emulate-two-byte-cmpxchg/20261005-120658
>> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git
>mm-everything
>> patch link:   
>https://lore.kernel.org/r/20261005120700.383058-4-brads%40mainlining.org
>> patch subject: [PATCH v5 3/3] xtensa: Emulate two-byte cmpxchg
>> config: xtensa-allyesconfig
>(https://download.01.org/0day-ci/archive/20261006/202610061704.rvbolgPy-lkp@intel.com/config)
>> compiler: xtensa-linux-gcc (GCC) 16.1.0
>> reproduce (this is a W=1 build):
>(https://download.01.org/0day-ci/archive/20261006/202610061704.rvbolgPy-lkp@intel.com/reproduce)
>> 
>> If you fix the issue in a separate patch/commit (i.e. not just a new
>version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes:
>https://lore.kernel.org/oe-kbuild-all/202610061704.rvbolgPy-lkp@intel.com/
>> 
>> All errors (new ones prefixed by >>):
>
>These patches need to be applied on top of my -rcu tree's "dev" branch,
>which supplies cmpxchg_emu_u16().
>
>Nevertheless, thank you for your testing efforts!

Do you reckon they are fine to you? The patches?

Arch maintainers may be busy unfortunately :(, I've done testing on all
the arches, 

>
>							Thanx, Paul
>
>>    In file included from arch/xtensa/include/asm/atomic.h:19,
>>                     from include/linux/atomic.h:7,
>>                     from include/asm-generic/bitops/atomic.h:5,
>>                     from arch/xtensa/include/asm/bitops.h:192,
>>                     from include/linux/bitops.h:67,
>>                     from include/linux/log2.h:12,
>>                     from kernel/bounds.c:14:
>>    arch/xtensa/include/asm/cmpxchg.h: In function '__cmpxchg':
>> >> arch/xtensa/include/asm/cmpxchg.h:79:25: error: implicit declaration
>of function 'cmpxchg_emu_u16'; did you mean 'cmpxchg_emu_u8'?
>[-Wimplicit-function-declaration]
>>       79 |         case 2:  return cmpxchg_emu_u16(ptr, old, new);
>>          |                         ^~~~~~~~~~~~~~~
>>          |                         cmpxchg_emu_u8
>>    make[3]: *** [scripts/Makefile.build:185: kernel/bounds.s] Error 1
>>    make[3]: Target 'prepare' not remade because of errors.
>>    make[2]: *** [Makefile:1405: prepare0] Error 2
>>    make[2]: Target 'prepare' not remade because of errors.
>>    make[1]: *** [Makefile:248: __sub-make] Error 2
>>    make[1]: Target 'prepare' not remade because of errors.
>>    make: *** [Makefile:248: __sub-make] Error 2
>>    make: Target 'prepare' not remade because of errors.
>> 
>> 
>> vim +79 arch/xtensa/include/asm/cmpxchg.h
>> 
>>     73	
>>     74	static __inline__ unsigned long
>>     75	__cmpxchg(volatile void *ptr, unsigned long old, unsigned long new, int size)
>>     76	{
>>     77		switch (size) {
>>     78		case 1:  return cmpxchg_emu_u8(ptr, old, new);
>>   > 79		case 2:  return cmpxchg_emu_u16(ptr, old, new);
>>     80		case 4:  return __cmpxchg_u32(ptr, old, new);
>>     81		default: __cmpxchg_called_with_bad_pointer();
>>     82			 return old;
>>     83		}
>>     84	}
>>     85	
>> 
>> --
>> 0-DAY CI Kernel Test Service
>> https://github.com/intel/lkp-tests/wiki

--- Thanks!
"I'm not a very positive person" - Linus torvalds

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
