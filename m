Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55BF0C433EF
	for <linux-snps-arc@archiver.kernel.org>; Tue, 15 Feb 2022 02:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n3a/38dXu3QqcwFe5v/5P5W1NIP5GvUNfiknH3rA0qA=; b=v0quhsbJ7m7x52
	qVe7HI1dllNAUxbpcvYoPf78O2kOIYeka8l3U16O3D6RoYs36i8sxyHs5tA4AORyi3aDT6nY3DVQW
	8MT0v6/8SaYmg7DbPTnH1JO1XxaOy4+mBAXTj4sQFcOJ7X07VcRTnAm2HUV5DuycgryK3V7w8EYew
	FEA6TqybD+TRkqKqmFJdI5E5sXSygWfTxdpYuUxky6joFx0AEttV7Lhsxh8uaRaUV/vXU5AeCpm4c
	82O6xzD0YFjTZIvE/Fly3jYYlAl/ZjiPF039G/NEObaZjpUQS1zZ/z+uxlfqROBBAcFT55MttqoYJ
	lzGsKahybhiIUJOua25A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJnsC-0000Hg-LA; Tue, 15 Feb 2022 02:47:24 +0000
Received: from zeniv-ca.linux.org.uk ([2607:5300:60:148a::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJns8-0000GM-9B; Tue, 15 Feb 2022 02:47:21 +0000
Received: from viro by zeniv-ca.linux.org.uk with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nJnrt-001qwH-NG; Tue, 15 Feb 2022 02:47:05 +0000
Date: Tue, 15 Feb 2022 02:47:05 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Arnd Bergmann <arnd@kernel.org>, Christoph Hellwig <hch@infradead.org>,
 Christoph Hellwig <hch@lst.de>, linux-arch <linux-arch@vger.kernel.org>,
 Linux-MM <linux-mm@kvack.org>, Linux API <linux-api@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Rich Felker <dalias@libc.org>,
 linux-ia64@vger.kernel.org, Linux-sh list <linux-sh@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>,
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>,
 Brian Cain <bcain@codeaurora.org>, Helge Deller <deller@gmx.de>,
 the arch/x86 maintainers <x86@kernel.org>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 linux-csky@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 "open list:TENSILICA XTENSA PORT (xtensa)" <linux-xtensa@linux-xtensa.org>,
 Heiko Carstens <hca@linux.ibm.com>, alpha <linux-alpha@vger.kernel.org>,
 linux-um <linux-um@lists.infradead.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Openrisc <openrisc@lists.librecores.org>,
 Greentime Hu <green.hu@gmail.com>, Stafford Horne <shorne@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Parisc List <linux-parisc@vger.kernel.org>, Nick Hu <nickhu@andestech.com>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Dinh Nguyen <dinguyen@kernel.org>,
 "Eric W . Biederman" <ebiederm@xmission.com>,
 Richard Weinberger <richard@nod.at>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 David Miller <davem@davemloft.net>
Subject: Re: [PATCH 04/14] x86: use more conventional access_ok() definition
Message-ID: <YgsUKcXGR7r4nINj@zeniv-ca.linux.org.uk>
References: <20220214163452.1568807-1-arnd@kernel.org>
 <20220214163452.1568807-5-arnd@kernel.org>
 <YgqLFYqIqkIsNC92@infradead.org>
 <CAK8P3a1F3JaYaJPy9bSCG1+YV6EN05PE0DbwpD_GT1qRwFSJ-w@mail.gmail.com>
 <CAHk-=whq6_Nh3cB3FieP481VcRyCu69X3=wO1yLHGmcZEj69SA@mail.gmail.com>
 <Ygq4wy9fikDYmuHU@zeniv-ca.linux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Ygq4wy9fikDYmuHU@zeniv-ca.linux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_184720_332629_86A5D88B 
X-CRM114-Status: GOOD (  29.96  )
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

On Mon, Feb 14, 2022 at 08:17:07PM +0000, Al Viro wrote:
> On Mon, Feb 14, 2022 at 12:01:05PM -0800, Linus Torvalds wrote:
> > On Mon, Feb 14, 2022 at 11:46 AM Arnd Bergmann <arnd@kernel.org> wrote:
> > >
> > > As Al pointed out, they turned out to be necessary on sparc64, but the only
> > > definitions are on sparc64 and x86, so it's possible that they serve a similar
> > > purpose here, in which case changing the limit from TASK_SIZE to
> > > TASK_SIZE_MAX is probably wrong as well.
> > 
> > x86-64 has always(*) used TASK_SIZE_MAX for access_ok(), and the
> > get_user() assembler implementation does the same.
> > 
> > I think any __range_not_ok() users that use TASK_SIZE are entirely
> > historical, and should be just fixed.
> 
> IIRC, that was mostly userland stack trace collection in perf.
> I'll try to dig in archives and see what shows up - it's been
> a while ago...

After some digging:

	access_ok() needs only to make sure that MMU won't go anywhere near
the kernel page tables; address limit for 32bit threads is none of its
concern, so TASK_SIZE_MAX is right for it.

	valid_user_frame() in arch/x86/events/core.c: used while walking
the userland call chain.  The reason it's not access_ok() is only that
perf_callchain_user() might've been called from interrupt that came while
we'd been under KERNEL_DS.
	That had been back in 2015 and it had been obsoleted since 2017, commit
88b0193d9418 (perf/callchain: Force USER_DS when invoking perf_callchain_user()).
We had been guaranteed USER_DS ever since.
	IOW, it could've reverted to use of access_ok() at any point after that.
TASK_SIZE vs TASK_SIZE_MAX is pretty much an accident there - might've been
TASK_SIZE_MAX from the very beginning.

	copy_stack_frame() in arch/x86/kernel/stacktrace.c: similar story,
except the commit that made sure callers will have USER_DS - cac9b9a4b083
(stacktrace: Force USER_DS for stack_trace_save_user()) in this case.
Also could've been using access_ok() just fine.  Amusingly, access_ok()
used to be there, until it had been replaced with explicit check on
Jul 22 2019 - 4 days after that had been made useless by fix in the caller...

	copy_from_user_nmi().  That one is a bit more interesting.
We have a call chain from perf_output_sample_ustack() (covered by
force_uaccess_begin() these days, not that it mattered for x86 now),
there's something odd in dumpstack.c:copy_code() (with explicit check
for TASK_SIZE_MAX in the caller) and there's a couple of callers in
Intel PMU code.
	AFAICS, there's no reason whatsoever to use TASK_SIZE
in that one - the point is to prevent copyin from the kernel
memory, and in that respect TASK_SIZE_MAX isn't any worse.
The check in copy_code() probably should go.

	So all of those guys should be simply switched to access_ok().
Might be worth making that a preliminary patch - it's independent
from everything else and there's no point folding it into any of the
patches in the series.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
