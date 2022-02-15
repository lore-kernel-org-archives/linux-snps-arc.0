Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0CF6C433F5
	for <linux-snps-arc@archiver.kernel.org>; Tue, 15 Feb 2022 10:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6lQ8FrgQp7cy0DE3E0ElFoUJFRkeoO8LGSv9EnFhFs0=; b=u4QcgZsrNMLg4y
	pspvtchez4vfE1lgcEqFoYFOhQIkKX+e+8deGYp9487UjeJYYrygEl+cy7OUdUXxiNcTeB8KYAyqi
	nEaPtGCPyMo8X/VceI4yxqXrNps69MS/HGfmWCePJtmnO+rK1Q0W4Yno8xn9aseRWlsd7TLWdRRAQ
	8kppIkdovK1J612Qq1638Iuz1YP0QGBIVt8HL3Wu4M3T4QnkkKPs6gbKw7tHWFlj1NE6eP997TgHM
	b3UhrxbJAaKF9XrviPz1nzQWmo2j2G22L02MlpPxJi7SU+IV61QMnzUvnCYbyg67zWe7HdbMlx/lp
	cE+Y0hL++o3/1erhKZGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJvDE-002KbJ-2s; Tue, 15 Feb 2022 10:37:36 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJvD8-002KYV-Jk; Tue, 15 Feb 2022 10:37:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 31BC21063;
 Tue, 15 Feb 2022 02:37:29 -0800 (PST)
Received: from FVFF77S0Q05N (unknown [10.57.89.144])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3CBA53F66F;
 Tue, 15 Feb 2022 02:37:22 -0800 (PST)
Date: Tue, 15 Feb 2022 10:37:15 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>, linux-arch <linux-arch@vger.kernel.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Linux API <linux-api@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Russell King <linux@armlinux.org.uk>, Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>, Brian Cain <bcain@codeaurora.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>, Greentime Hu <green.hu@gmail.com>,
 Dinh Nguyen <dinguyen@kernel.org>,
 Stafford Horne <shorne@gmail.com>, Helge Deller <deller@gmx.de>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Heiko Carstens <hca@linux.ibm.com>,
 Rich Felker <dalias@libc.org>, "David S. Miller" <davem@davemloft.net>,
 Richard Weinberger <richard@nod.at>, X86 ML <x86@kernel.org>,
 Max Filippov <jcmvbkbc@gmail.com>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 alpha <linux-alpha@vger.kernel.org>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-csky@vger.kernel.org,
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
 linux-ia64@vger.kernel.org, linux-m68k <linux-m68k@lists.linux-m68k.org>,
 "open list:MIPS" <linux-mips@vger.kernel.org>,
 Openrisc <openrisc@lists.librecores.org>,
 "open list:PARISC ARCHITECTURE" <linux-parisc@vger.kernel.org>,
 "open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)"
 <linuxppc-dev@lists.ozlabs.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 "open list:S390" <linux-s390@vger.kernel.org>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 "open list:SPARC + UltraSPARC (sparc/sparc64)" <sparclinux@vger.kernel.org>,
 linux-um <linux-um@lists.infradead.org>,
 "open list:TENSILICA XTENSA PORT (xtensa)" <linux-xtensa@linux-xtensa.org>,
 Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 08/14] arm64: simplify access_ok()
Message-ID: <YguB5BeLoRc4dL7P@FVFF77S0Q05N>
References: <20220214163452.1568807-1-arnd@kernel.org>
 <20220214163452.1568807-9-arnd@kernel.org>
 <CAMj1kXHixUFjV=4m3tzfGz7AiRWc-VczymbKuZq7dyZZNuLKxQ@mail.gmail.com>
 <CAK8P3a2VfvDkueaJNTA9SiB+PFsi_Q17AX+aL46ueooW2ahmQw@mail.gmail.com>
 <CAMj1kXGkG0KMD2rnKAJc3V7X9LP1grbcHTNYMnj_q4GiYfG2pQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMj1kXGkG0KMD2rnKAJc3V7X9LP1grbcHTNYMnj_q4GiYfG2pQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_023730_747163_72011D9C 
X-CRM114-Status: GOOD (  28.23  )
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

On Tue, Feb 15, 2022 at 10:21:16AM +0100, Ard Biesheuvel wrote:
> On Tue, 15 Feb 2022 at 10:13, Arnd Bergmann <arnd@kernel.org> wrote:
> >
> > On Tue, Feb 15, 2022 at 9:17 AM Ard Biesheuvel <ardb@kernel.org> wrote:
> > > On Mon, 14 Feb 2022 at 17:37, Arnd Bergmann <arnd@kernel.org> wrote:
> > > > From: Arnd Bergmann <arnd@arndb.de>
> > > >
> > >
> > > With set_fs() out of the picture, wouldn't it be sufficient to check
> > > that bit #55 is clear? (the bit that selects between TTBR0 and TTBR1)
> > > That would also remove the need to strip the tag from the address.
> > >
> > > Something like
> > >
> > >     asm goto("tbnz  %0, #55, %2     \n"
> > >              "tbnz  %1, #55, %2     \n"
> > >              :: "r"(addr), "r"(addr + size - 1) :: notok);
> > >     return 1;
> > > notok:
> > >     return 0;
> > >
> > > with an additional sanity check on the size which the compiler could
> > > eliminate for compile-time constant values.
> >
> > That should work, but I don't see it as a clear enough advantage to
> > have a custom implementation. For the constant-size case, it probably
> > isn't better than a compiler-scheduled comparison against a
> > constant limit, but it does hurt maintainability when the next person
> > wants to change the behavior of access_ok() globally.
> >
> 
> arm64 also has this leading up to the range check, and I think we'd no
> longer need it:
> 
>     if (IS_ENABLED(CONFIG_ARM64_TAGGED_ADDR_ABI) &&
>         (current->flags & PF_KTHREAD || test_thread_flag(TIF_TAGGED_ADDR)))
>             addr = untagged_addr(addr);
> 

ABI-wise, we aim to *reject* tagged pointers unless the task is using the
tagged addr ABI, so we need to retain both the untagging logic and the full
pointer check (to actually check the tag bits) unless we relax that ABI
decision generally (or go context-switch the TCR_EL1.TBI* bits).

Since that has subtle ABI implications, I don't think we should change that
within this series.

If we *did* relax things, we could just check bit 55 here, and unconditionally
clear that in uaccess_mask_ptr(), since LDTR/STTR should fault on kernel memory.
On parts with meltdown those might not fault until committed, and so we need
masking to avoid speculative access to a kernel pointer, and that requires the
prior explciit check.

Thanks,
Mark.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
