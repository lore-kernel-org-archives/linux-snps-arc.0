Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80335C433F5
	for <linux-snps-arc@archiver.kernel.org>; Fri, 18 Feb 2022 07:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yot4IOG13k9IOfpJfc+srTMj+BHyaZ+tIy9j2GTnu1o=; b=X3pkFSWQSpgZc6
	RtdYeRVakbubVh4DZRTmsuVdSr0vMurJxRX/nAv4uoL6buaERXPEvWpYOIx+eMYBRbiiq8fWKBCiU
	AsFgxxM8XDn1X8Ft/foMHo2umPpdU85uY6N2eVqEWgaJfoUCgUYmu2BNo7RG3RTCL33PcPuI8Mshp
	W5rI+15oNg/tYkxc2rdrIsWIpaMmmsDu4pHeX5kVuiFwDQAKDVCmdPV9LBMS1HGX6OHolUD8rbBzt
	yVlrKyIVY6CpxPqvmOYS1DVVHudneOfQrT62TcRuFOg1pCqqp2g+PHOYbjNOjSmhFZkO4Bf62NAT/
	QYXLBPK6gGPMK31RWG8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKxV2-00DAiF-7D; Fri, 18 Feb 2022 07:16:16 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKxUx-00DAgf-Ld; Fri, 18 Feb 2022 07:16:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3305261ECF;
 Fri, 18 Feb 2022 07:16:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0367C340EB;
 Fri, 18 Feb 2022 07:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645168570;
 bh=vgWt8lxnjYZUPlvwCFWcIBvafVy+fWmkyAOoKRaWgHQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=brykg3orAWhzT1eShDnIqWiuvTtbNc2QCFkxAh1K7YK/kRc+swoGKo5s8Fy8YLbGr
 hc4KU9yCkTtPzsEFTjEMsUOlO7S4blCchs5ff0ZUeSF1M1MwsdTpKXs8Q722IoumV5
 wWZ/Ud2NirMkJK5Z1ZlptDLHluY0qTABwQmvq83LF0HQ/hLeRKtb2S91h930mt7IMN
 +IVk8tTFexO7cBruFMAUkGnp4XxSmx2qWufMJpXKrZd+rszraON5XmdxGDBB/rBEjq
 qWnAPIR/pKwix5/alY1YcrHjRud91MIX/ezTnOif5FrydE9krKYz++XLye87rDdKA5
 AVW3j7aGhb5Pg==
Received: by mail-ej1-f41.google.com with SMTP id hw13so12813472ejc.9;
 Thu, 17 Feb 2022 23:16:10 -0800 (PST)
X-Gm-Message-State: AOAM5313zcFkMhPPqfXxad1Yz09xGxBZOvWv8ftkBnCr5j+lDdhpmhQc
 t5AvQJGg/ajilnh5gN0gRTy2UtzeYrd0XVeJGa0=
X-Google-Smtp-Source: ABdhPJyN/H83BSKKeXJGtgECPVgYv1w4NoilhoSCj+92CRqaoOjPXRtnkFYRBhAzB91QtgFwdj4YRtpnThbImHSlPPw=
X-Received: by 2002:adf:90c1:0:b0:1e4:ad27:22b9 with SMTP id
 i59-20020adf90c1000000b001e4ad2722b9mr4972052wri.219.1645168558306; Thu, 17
 Feb 2022 23:15:58 -0800 (PST)
MIME-Version: 1.0
References: <20220216131332.1489939-1-arnd@kernel.org>
 <20220216131332.1489939-15-arnd@kernel.org>
 <20220218063549.GJ22576@lst.de>
In-Reply-To: <20220218063549.GJ22576@lst.de>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 18 Feb 2022 08:15:42 +0100
X-Gmail-Original-Message-ID: <CAK8P3a31_zG7npZbPHGixOYL0p28dGzs3f9ku_RB4p1tiEY0Tw@mail.gmail.com>
Message-ID: <CAK8P3a31_zG7npZbPHGixOYL0p28dGzs3f9ku_RB4p1tiEY0Tw@mail.gmail.com>
Subject: Re: [PATCH v2 14/18] lib/test_lockup: fix kernel pointer check for
 separate address spaces
To: Christoph Hellwig <hch@lst.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-arch <linux-arch@vger.kernel.org>, 
 Linux-MM <linux-mm@kvack.org>, Linux API <linux-api@vger.kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Al Viro <viro@zeniv.linux.org.uk>,
 Russell King - ARM Linux <linux@armlinux.org.uk>, 
 Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
 Brian Cain <bcain@codeaurora.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Nick Hu <nickhu@andestech.com>,
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
X-CRM114-CacheID: sfid-20220217_231611_800364_14152510 
X-CRM114-Status: GOOD (  24.56  )
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

On Fri, Feb 18, 2022 at 7:35 AM Christoph Hellwig <hch@lst.de> wrote:
>
> On Wed, Feb 16, 2022 at 02:13:28PM +0100, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > test_kernel_ptr() uses access_ok() to figure out if a given address
> > points to user space instead of kernel space. However on architectures
> > that set CONFIG_ALTERNATE_USER_ADDRESS_SPACE, a pointer can be valid
> > for both, and the check always fails because access_ok() returns true.
> >
> > Make the check for user space pointers conditional on the type of
> > address space layout.
>
> What is this code even trying to do?  It looks extremly broken.

As I understand it, this is only meant for debugging, and the module contains
intentionally broken lock usage to test whether the watchdog and lockup
detection in the kernel is able to find them.

I did not try that hard to understand how it works though.

      Arnd

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
