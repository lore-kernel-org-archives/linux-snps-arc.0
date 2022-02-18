Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 438C3C433F5
	for <linux-snps-arc@archiver.kernel.org>; Fri, 18 Feb 2022 07:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bln7dmE7pDmq6E4/rwvt7JlkrYnSZoagy5mFC4WLvw4=; b=FSPJwlKja+hcXz
	IvDR9E2cc+DHwb3sWH3L2YwnYWRjG3P9hq8BgoT4hv/Hi6FRzpAhil3NnwF+6NNC6RoEji7DLJU9D
	DMHSKuzwWfgHxA7v4F/VFY7vxa3NA+MwzUh8kqRmV4hhbodyw4++RRjLp86KdqrQeJ/pQeqmeGYzs
	/kaqnlfsnVdewAA3VX4cU8v6hWoneU5/nZXzNoS/zP3GqB3StVsmVwyUuarGRUAvTrPYB6DcW6knn
	lC2c1+LAvommffXbLeoxf7rPvPF7ObYn7Zp4KYhaUDw6QFg51wTgic2qSCCH0jPFkNiQT0jsXgpW6
	7peNIfvjz9mRo5zObugA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKxVW-00DAvk-FG; Fri, 18 Feb 2022 07:16:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKxVR-00DAtN-20; Fri, 18 Feb 2022 07:16:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9256E61ED1;
 Fri, 18 Feb 2022 07:16:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB628C340F8;
 Fri, 18 Feb 2022 07:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645168599;
 bh=q+jKWrJ4jJZ2v7I08P11+5fwNrVng4vZR8KgCaGgNp8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=uRNZZy2+CPWOJuv92dOyd1rHvNKhBILuz7HojVOaF7lOL/BoFj24u43pDTtSwcO2B
 kS7Pw80lZTXEPfCTL3Z7vghTrC4SlGVuhJo+OTP7MCTgX2G37yx65ofo19RQjnL/RA
 X1RHeHskgmZa1dqz/hywb50yEcB9u+SOk/d9BB2OqS8LnUJf/8wGrCrwZ7NdDCfC1d
 WKze8Im+ewzQ4s1dw54fZcQSR5KpeItLpAf4+TQihtipY9ZngwMB0KyPQdQnz8zfKi
 SziJH9s7tyIY2mWzArtdycjGo1CV8W1cYp0Oo2w7ym11uKexowxQSNg8OfalrjO5tJ
 GBzjZlGpGhjvA==
Received: by mail-ej1-f54.google.com with SMTP id lw4so12823132ejb.12;
 Thu, 17 Feb 2022 23:16:39 -0800 (PST)
X-Gm-Message-State: AOAM533t1dZZWviwewFnr69by0Kczb6L3JAW3iLjH1G66AUu5d3DNx+C
 ABmak8PcVa2bhMiT276+hDYehpcLiWOELbyjpPk=
X-Google-Smtp-Source: ABdhPJzrsD9ZegAYWxopB2Dqyhs5CbptDH37N4ZCxM0ghQnmxjYRVare/kFAwMrZOPIITOhmBYHifd3MXTFISbjy0gQ=
X-Received: by 2002:adf:c406:0:b0:1e4:a5ae:34a3 with SMTP id
 v6-20020adfc406000000b001e4a5ae34a3mr5120080wrf.407.1645168587142; Thu, 17
 Feb 2022 23:16:27 -0800 (PST)
MIME-Version: 1.0
References: <20220216131332.1489939-1-arnd@kernel.org>
 <20220216131332.1489939-14-arnd@kernel.org>
 <CALCETrVOvYPN4_6hS8wpm2v9bGZupZ5x4=vZAseG57OUgvLGfw@mail.gmail.com>
In-Reply-To: <CALCETrVOvYPN4_6hS8wpm2v9bGZupZ5x4=vZAseG57OUgvLGfw@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 18 Feb 2022 08:16:11 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2r3zB2G7CjCdXB6cDx1Q7jdOnA8YcCHM+3Q3CybnZ=hQ@mail.gmail.com>
Message-ID: <CAK8P3a2r3zB2G7CjCdXB6cDx1Q7jdOnA8YcCHM+3Q3CybnZ=hQ@mail.gmail.com>
Subject: Re: [PATCH v2 13/18] uaccess: generalize access_ok()
To: Andy Lutomirski <luto@amacapital.net>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>, 
 linux-arch <linux-arch@vger.kernel.org>, Linux-MM <linux-mm@kvack.org>, 
 Linux API <linux-api@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Al Viro <viro@zeniv.linux.org.uk>, 
 Russell King - ARM Linux <linux@armlinux.org.uk>, Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>, 
 Brian Cain <bcain@codeaurora.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Nick Hu <nickhu@andestech.com>, Greentime Hu <green.hu@gmail.com>, 
 Dinh Nguyen <dinguyen@kernel.org>, Stafford Horne <shorne@gmail.com>,
 Helge Deller <deller@gmx.de>, 
 Michael Ellerman <mpe@ellerman.id.au>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Mark Rutland <mark.rutland@arm.com>, 
 Heiko Carstens <hca@linux.ibm.com>, Rich Felker <dalias@libc.org>,
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
X-CRM114-CacheID: sfid-20220217_231641_188170_8ED8E5A5 
X-CRM114-Status: GOOD (  36.17  )
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

On Thu, Feb 17, 2022 at 8:15 PM Andy Lutomirski <luto@amacapital.net> wrote:
>
> On Wed, Feb 16, 2022 at 5:19 AM Arnd Bergmann <arnd@kernel.org> wrote:
> >
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > There are many different ways that access_ok() is defined across
> > architectures, but in the end, they all just compare against the
> > user_addr_max() value or they accept anything.
> >
> > Provide one definition that works for most architectures, checking
> > against TASK_SIZE_MAX for user processes or skipping the check inside
> > of uaccess_kernel() sections.
> >
> > For architectures without CONFIG_SET_FS(), this should be the fastest
> > check, as it comes down to a single comparison of a pointer against a
> > compile-time constant, while the architecture specific versions tend to
> > do something more complex for historic reasons or get something wrong.
>
> This isn't actually optimal.  On x86, TASK_SIZE_MAX is a bizarre
> constant that has a very specific value to work around a bug^Wdesign
> error^Wfeature of Intel CPUs.  TASK_SIZE_MAX is the maximum address at
> which userspace is permitted to allocate memory, but there is a huge
> gap between user and kernel addresses, and any value in the gap would
> be adequate for the comparison.  If we wanted to optimize this, simply
> checking the high bit (which x86 can do without any immediate
> constants at all) would be sufficient and, for an access known to fit
> in 32 bits, one could get even fancier and completely ignore the size
> of the access.  (For accesses not known to fit in 32 bits, I suspect
> some creativity could still come up with a construction that's
> substantially faster than the one in your patch.)
>
> So there's plenty of room for optimization here.
>
> (This is not in any respect a NAK -- it's just an observation that
> this could be even better.)

Thank you for taking a look!

As you can see in the patch that changes the algorithm on x86 [1],
it was already using TASK_SIZE_MAX as the limit, only the order
in which the comparison is done, hopefully leading to better code
already. I have looked at trivial examples on x86 that showed an
improvement for constant sizes, but only looked at arm64 in detail
for the overall result.

It may be worth checking if using LONG_MAX as the limit produces
better code, but it's probably best to do the optimization in the
common code in a portable way to keep it from diverging again.

       Arnd

[1] https://lore.kernel.org/lkml/20220216131332.1489939-7-arnd@kernel.org/

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
