Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 643B1C433EF
	for <linux-snps-arc@archiver.kernel.org>; Mon, 21 Feb 2022 14:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f/0kaUEjDAfPoG6AULtBUDbRLmHZLmDm6Wwo7hAdLME=; b=loFubl8dcIxgyW
	8+tkJ3RpESaeRT3/1WcZ5MtreeJs5jWy36YDDNgqxXpB1VG82L+KK8WZEwDEINxRMvubBv4FPZ5JI
	zczPPb/M0Eo8mT82LtCibALRwQuQ32szaAbxKyaUcyVV0QeiKl6aCnzw8t/ZvI8Kwqr11yrdz+PHj
	Wd3i2+hoFJRqyhiY/UjxHCJkXvt+FCWBYhCkO0M6gnaCxMHBBII/Y7Up5YriyzU97igs6c0lb3QuJ
	90JQZ7Kat7bAcS1HNHl3vIrq1CUTiMV0hJ9KKaWnsZtZ7weTsIGgsBvbWw+wMPXnlht5WpY0LBqgJ
	Po10WyOKqxu2CCMClM2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nM9la-006ExK-6B; Mon, 21 Feb 2022 14:34:18 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM9jF-006DUa-BG; Mon, 21 Feb 2022 14:31:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CFFF161011;
 Mon, 21 Feb 2022 14:31:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2F9BC340F6;
 Mon, 21 Feb 2022 14:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645453911;
 bh=12Bbx9GqAhHL6qqDyToeCYzPAWe2m8+m6+gTGV+hFTw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=kzJ4oJ7uqkQlH8HKP59hga7BxTSd9yAv9G83J3PE9Vxo9wgwCF55WEif4JDuq66Es
 xJHgiAYKMSMrCA+rbeIjmKJKM3SV0fBLyOZsQa95vK8cdEppsgKEikoB+c9hrTgPD6
 N3/wnjEuF/+t+ByBpKQN3Dzq1OrIxHrSb4YNAPOcfEv6v4f/QcpswnD2hOYaY7e5ZR
 P2yzCaocscWCwjSY0LU/aagBUySQOBShLiiZAXM9rLdNx4Mpjcu34oGUvRfmZEBPw+
 VjJykXvvmkBWqCNmRXcJeDSqWyibRwN4/9udBAhduxi7qzsuFLGNxd5SxW6ohLqgwt
 B42/CscfKu6MA==
Received: by mail-ej1-f52.google.com with SMTP id d10so33727515eje.10;
 Mon, 21 Feb 2022 06:31:51 -0800 (PST)
X-Gm-Message-State: AOAM5309obQolhBT1O/AyZ7ty0qcADOLurENpo7zjbAisSwMUTmFS33+
 fJvVwl2g7BMd63gmKJaataJrAAtUsdJSBziLI/0=
X-Google-Smtp-Source: ABdhPJwkamQNFHYmlXBqgC6u1r1MKNMeB6x6hm57ILAz8yVFLOW/Qf4lv8t2aLUhrb2kSK2FAx/PKmoUpYjfFDbRcw0=
X-Received: by 2002:adf:90c1:0:b0:1e4:ad27:22b9 with SMTP id
 i59-20020adf90c1000000b001e4ad2722b9mr16170850wri.219.1645453899581; Mon, 21
 Feb 2022 06:31:39 -0800 (PST)
MIME-Version: 1.0
References: <20220216131332.1489939-1-arnd@kernel.org>
 <20220216131332.1489939-10-arnd@kernel.org>
 <20220221132456.GA7139@alpha.franken.de>
In-Reply-To: <20220221132456.GA7139@alpha.franken.de>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 21 Feb 2022 15:31:23 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2usZWPDDDUcscwS0aVKsY6aLXFGFPqYNkm4hcDERim9w@mail.gmail.com>
Message-ID: <CAK8P3a2usZWPDDDUcscwS0aVKsY6aLXFGFPqYNkm4hcDERim9w@mail.gmail.com>
Subject: Re: [PATCH v2 09/18] mips: use simpler access_ok()
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>, 
 linux-arch <linux-arch@vger.kernel.org>, Linux-MM <linux-mm@kvack.org>, 
 Linux API <linux-api@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Al Viro <viro@zeniv.linux.org.uk>, 
 Russell King - ARM Linux <linux@armlinux.org.uk>, Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>, 
 Brian Cain <bcain@codeaurora.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
 Michal Simek <monstr@monstr.eu>, Nick Hu <nickhu@andestech.com>, 
 Greentime Hu <green.hu@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>, 
 Stafford Horne <shorne@gmail.com>, Helge Deller <deller@gmx.de>,
 Michael Ellerman <mpe@ellerman.id.au>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Mark Rutland <mark.rutland@arm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Rich Felker <dalias@libc.org>, 
 David Miller <davem@davemloft.net>, Richard Weinberger <richard@nod.at>, 
 "the arch/x86 maintainers" <x86@kernel.org>, Max Filippov <jcmvbkbc@gmail.com>,
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_063153_502353_A9E29B2A 
X-CRM114-Status: GOOD (  33.01  )
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

On Mon, Feb 21, 2022 at 2:24 PM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
> On Wed, Feb 16, 2022 at 02:13:23PM +0100, Arnd Bergmann wrote:
> >
> > diff --git a/arch/mips/include/asm/uaccess.h b/arch/mips/include/asm/uaccess.h
> > index db9a8e002b62..d7c89dc3426c 100644
>
> this doesn't work. For every access above maximum implemented virtual address
> space of the CPU an address error will be issued, but not a TLB miss.
> And address error isn't able to handle this situation.

Ah, so the __ex_table entry only catches TLB misses?

Does this mean it also traps for kernel memory accesses, or do those
work again? If the addresses on mips64 are separate like on
sparc64 or s390, the entire access_ok() step could be replaced
by a fixup code in the exception handler. I suppose this depends on
CONFIG_EVA and you still need a limit check at least when EVA is
disabled.

> With this patch
>
> diff --git a/arch/mips/kernel/unaligned.c b/arch/mips/kernel/unaligned.c
> index df4b708c04a9..3911f1481f3d 100644
> --- a/arch/mips/kernel/unaligned.c
> +++ b/arch/mips/kernel/unaligned.c
> @@ -1480,6 +1480,13 @@ asmlinkage void do_ade(struct pt_regs *regs)
>         prev_state = exception_enter();
>         perf_sw_event(PERF_COUNT_SW_ALIGNMENT_FAULTS,
>                         1, regs, regs->cp0_badvaddr);
> +
> +       /* Are we prepared to handle this kernel fault?  */
> +       if (fixup_exception(regs)) {
> +               current->thread.cp0_baduaddr = regs->cp0_badvaddr;
> +               return;
> +       }
> +
>         /*
>          * Did we catch a fault trying to load an instruction?
>          */
>
> I at least get my simple test cases fixed, but I'm not sure this is
> correct.
>
> Is there a reason to not also #define TASK_SIZE_MAX   __UA_LIMIT like
> for the 32bit case ?
>

For 32-bit, the __UA_LIMIT is a compile-time constant, so the check
ends up being trivial. On all other architectures, the same thing can
be done after the set_fs removal, so I was hoping it would work here
as well.

I suspect doing the generic (size <= limit) && (addr <= (limit - size))
check on mips64 with the runtime limit ends up slightly slower
than the current code that checks a bit mask instead. If you like,
I'll update it this way, otherwise I'd need help in form of a patch
that changes the exception handling so __get_user/__put_user
also return -EFAULT for an address error.

       Arnd

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
