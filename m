Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0370C433FE
	for <linux-snps-arc@archiver.kernel.org>; Mon, 21 Feb 2022 15:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jIAbYcGq1YynKmPUU8G7P+BY1vS/0+AHMH9H/mbqb7E=; b=DhHbWkCMM8kzQ7
	wdEu2Uuz9EERFnvfs4TaL6+ktZnNL1QiBy7ndLXvVdqcVxvYXxxb1ewd3rIBRrOGo5NJgvqJNfjzV
	qXjXJOz9DUKqEIzNDFgyj8EhziN1IvQ1PNiSt04yLM5GN7j16cFX4+yG8NlQ2VW70ljIex2Rv9W8C
	pnXKTs6P8wz6edrSKihQqa4QqGqYv0ou5RaXJNhtK6ioDW+spKHbYEnf8OysTHoWhX+qlj9lvM0j4
	o6LqTvOuj3H8ujxoR6MESaK1dE33ZXMpObiVOaDUH2k8A9VS78fbEO8RlP2AqNpriYQkc2wgoCldP
	Uv4mEPlZJEoOgw0xD9Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMAWv-006MwW-2M; Mon, 21 Feb 2022 15:23:13 +0000
Received: from elvis.franken.de ([193.175.24.41])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMAWr-006MvD-Gh; Mon, 21 Feb 2022 15:23:11 +0000
Received: from uucp (helo=alpha)
 by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
 id 1nMAWk-00025w-00; Mon, 21 Feb 2022 16:23:02 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
 id 22D4EC25F8; Mon, 21 Feb 2022 16:21:30 +0100 (CET)
Date: Mon, 21 Feb 2022 16:21:30 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>, linux-arch <linux-arch@vger.kernel.org>,
 Linux-MM <linux-mm@kvack.org>, Linux API <linux-api@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Al Viro <viro@zeniv.linux.org.uk>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
 Brian Cain <bcain@codeaurora.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Michal Simek <monstr@monstr.eu>, Nick Hu <nickhu@andestech.com>,
 Greentime Hu <green.hu@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>,
 Stafford Horne <shorne@gmail.com>, Helge Deller <deller@gmx.de>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Mark Rutland <mark.rutland@arm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Rich Felker <dalias@libc.org>,
 David Miller <davem@davemloft.net>, Richard Weinberger <richard@nod.at>,
 the arch/x86 maintainers <x86@kernel.org>,
 Max Filippov <jcmvbkbc@gmail.com>,
 "Eric W . Biederman" <ebiederm@xmission.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Ard Biesheuvel <ardb@kernel.org>, alpha <linux-alpha@vger.kernel.org>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 linux-csky@vger.kernel.org,
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
 linux-ia64@vger.kernel.org, linux-m68k <linux-m68k@lists.linux-m68k.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Openrisc <openrisc@lists.librecores.org>,
 Parisc List <linux-parisc@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-s390 <linux-s390@vger.kernel.org>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>,
 linux-um <linux-um@lists.infradead.org>,
 "open list:TENSILICA XTENSA PORT (xtensa)" <linux-xtensa@linux-xtensa.org>
Subject: Re: [PATCH v2 09/18] mips: use simpler access_ok()
Message-ID: <20220221152130.GA17373@alpha.franken.de>
References: <20220216131332.1489939-1-arnd@kernel.org>
 <20220216131332.1489939-10-arnd@kernel.org>
 <20220221132456.GA7139@alpha.franken.de>
 <CAK8P3a2usZWPDDDUcscwS0aVKsY6aLXFGFPqYNkm4hcDERim9w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a2usZWPDDDUcscwS0aVKsY6aLXFGFPqYNkm4hcDERim9w@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_072309_921190_633F79A6 
X-CRM114-Status: GOOD (  32.63  )
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

On Mon, Feb 21, 2022 at 03:31:23PM +0100, Arnd Bergmann wrote:
> On Mon, Feb 21, 2022 at 2:24 PM Thomas Bogendoerfer
> <tsbogend@alpha.franken.de> wrote:
> > On Wed, Feb 16, 2022 at 02:13:23PM +0100, Arnd Bergmann wrote:
> > >
> > > diff --git a/arch/mips/include/asm/uaccess.h b/arch/mips/include/asm/uaccess.h
> > > index db9a8e002b62..d7c89dc3426c 100644
> >
> > this doesn't work. For every access above maximum implemented virtual address
> > space of the CPU an address error will be issued, but not a TLB miss.
> > And address error isn't able to handle this situation.
> 
> Ah, so the __ex_table entry only catches TLB misses?

no, but there is no __ex_table handling in address error hanlder (yet).

> Does this mean it also traps for kernel memory accesses, or do those
> work again?

it will trap for every access.


> If the addresses on mips64 are separate like on
> sparc64 or s390, the entire access_ok() step could be replaced
> by a fixup code in the exception handler. I suppose this depends on
> CONFIG_EVA and you still need a limit check at least when EVA is
> disabled.

only EVA has seperate address spaces for kernel/user.

> > Is there a reason to not also #define TASK_SIZE_MAX   __UA_LIMIT like
> > for the 32bit case ?
> >
> 
> For 32-bit, the __UA_LIMIT is a compile-time constant, so the check
> ends up being trivial. On all other architectures, the same thing can
> be done after the set_fs removal, so I was hoping it would work here
> as well.

ic

> I suspect doing the generic (size <= limit) && (addr <= (limit - size))
> check on mips64 with the runtime limit ends up slightly slower
> than the current code that checks a bit mask instead. If you like,
> I'll update it this way, otherwise I'd need help in form of a patch
> that changes the exception handling so __get_user/__put_user
> also return -EFAULT for an address error.

that's what the patch does. For aligned accesses the patch should
do the right thing, but it breaks unaligned get_user/put_user.
Checking if the trapping vaddr is between end of CPU VM space and
TASK_MAX_SIZE before exception handling should do the trick. I'll
send a patch, if this works.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
