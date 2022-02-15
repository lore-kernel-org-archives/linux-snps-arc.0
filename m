Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17332C433EF
	for <linux-snps-arc@archiver.kernel.org>; Tue, 15 Feb 2022 10:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yG9v9VsfQhsLJuENd6fLXXBZ4tY5rpEdroAs2FNiPIo=; b=FavBEKb9HLu+w3
	7FjkvTNFbPdq9Lif/LgyTQmG5/7Rt4SytSJxHtWFErPBsr4btsn72wo19iB4jdGFiOgm99aIIlcz9
	chaYNV75YEgsHF6zOIhlZRbz2ZIz4xUfUyYJIDdAXcsse+s0G4FNhT/79XgvySgJi+yQ63dRLwn8n
	sCRWqSjDMYTuTLykaiYy3e2la0FVJ3qgODYy0DeCQGoz/Dx4IrTIoOp96KCHEdLLBFMPWFR04YCWR
	PhuykT5jutQU1EQeqoIwNAM+eoqvh69zhb4+gJFFNBbYMnhKrKPklbmArPd3s3rWwrq3O1EUPZbe8
	UchjEkM0Z2HAWBhAyMTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJuhR-002DXZ-Cm; Tue, 15 Feb 2022 10:04:45 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJufQ-002CRw-3U; Tue, 15 Feb 2022 10:02:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 83A00612AC;
 Tue, 15 Feb 2022 10:02:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59491C36AE7;
 Tue, 15 Feb 2022 10:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644919359;
 bh=6OaJO5k8UStns9fCBustiYnW4Ue2uRRTBF363T6I8Z8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=uvEmspgqpxTxsLVTla+f0SMmX15oCQNrms2B9i0V9ia6kENfVsiE5Bzh7iEU5KPnw
 q9gpvWdnz7Ekg1lzBDLgsrNBP3KQiT85+nX2ztDJVrZIG/Ujb9BpDyYeBvTJqYuFFy
 UXxanyBNOo8MHsY34ccoxfMGLS2ZnrQfcuAKTi+R29nIBU60+3+8nE+aoXmDCfLSlj
 gLzEYCibUm4llc2wyWYPuInOJmc4XldnCXU+p9O2WXaNiWoHF4eSAsm49banFdwhfI
 qZ3iYDoP+YlMRMdIdv1rAxGAF/9VZx8l+SDbw/WEUswwJYP90PuoNP8rnqj493/bDf
 pKaaRvX+q+uBA==
Received: by mail-wm1-f51.google.com with SMTP id
 q198-20020a1ca7cf000000b0037bb52545c6so1084543wme.1; 
 Tue, 15 Feb 2022 02:02:39 -0800 (PST)
X-Gm-Message-State: AOAM533Fk4ibngYeh4jV8izOXB0HGA80w39Xh39uVoE7zqqMd2QYoP3W
 9y3K58zxGw5dfVgx3jbqkPvTARnhHnzGYMcbgxU=
X-Google-Smtp-Source: ABdhPJxXhF5oN8HK5+/UBfeNSuYxeBNAH3pN7Z2cMEK019oVoVAxn2dH7YUg+eieAXhNWJaJdsC0aGcEXS3C4UXMT34=
X-Received: by 2002:a05:600c:2108:b0:34e:870:966e with SMTP id
 u8-20020a05600c210800b0034e0870966emr2332972wml.173.1644919346591; Tue, 15
 Feb 2022 02:02:26 -0800 (PST)
MIME-Version: 1.0
References: <20220214163452.1568807-1-arnd@kernel.org>
 <20220214163452.1568807-10-arnd@kernel.org>
 <Ygr11RGjj3C9uAUg@zeniv-ca.linux.org.uk> <20220215062942.GA12551@lst.de>
 <YgtSpk0boDjsyjFK@zeniv-ca.linux.org.uk>
In-Reply-To: <YgtSpk0boDjsyjFK@zeniv-ca.linux.org.uk>
From: Arnd Bergmann <arnd@kernel.org>
Date: Tue, 15 Feb 2022 11:02:10 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0t-dnJXvXH0Mx5L-AeVQe1mYzRi0sQjYxzMQw-mVPv0Q@mail.gmail.com>
Message-ID: <CAK8P3a0t-dnJXvXH0Mx5L-AeVQe1mYzRi0sQjYxzMQw-mVPv0Q@mail.gmail.com>
Subject: Re: [PATCH 09/14] m68k: drop custom __access_ok()
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Christoph Hellwig <hch@lst.de>,
 Linus Torvalds <torvalds@linux-foundation.org>, 
 linux-arch <linux-arch@vger.kernel.org>, Linux-MM <linux-mm@kvack.org>, 
 Linux API <linux-api@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
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
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-csky@vger.kernel.org, 
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
X-CRM114-CacheID: sfid-20220215_020240_245428_C23ECD30 
X-CRM114-Status: GOOD (  26.00  )
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

On Tue, Feb 15, 2022 at 8:13 AM Al Viro <viro@zeniv.linux.org.uk> wrote:
> On Tue, Feb 15, 2022 at 07:29:42AM +0100, Christoph Hellwig wrote:
> > On Tue, Feb 15, 2022 at 12:37:41AM +0000, Al Viro wrote:
> > > Perhaps simply wrap that sucker into #ifdef CONFIG_CPU_HAS_ADDRESS_SPACES
> > > (and trim the comment down to "coldfire and 68000 will pick generic
> > > variant")?
> >
> > I wonder if we should invert CONFIG_ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE,
> > select the separate address space config for s390, sparc64, non-coldfire
> > m68k and mips with EVA and then just have one single access_ok for
> > overlapping address space (as added by Arnd) and non-overlapping ones
> > (always return true).
>
> parisc is also such...  How about
>
>         select ALTERNATE_SPACE_USERLAND
>
> for that bunch?

Either of those works for me. My current version has this keyed off
TASK_SIZE_MAX==ULONG_MAX, but a CONFIG_ symbol does
look more descriptive.

>  While we are at it, how many unusual access_ok() instances are
> left after this series?  arm64, itanic, um, anything else?

x86 adds a WARN_ON_IN_IRQ() check in there. This could be
made generic, but it's not obvious what exactly the exceptions are
that other architectures need. The arm64 tagged pointers could
probably also get integrated into the generic version.

> FWIW, sparc32 has a slightly unusual instance (see uaccess_32.h there); it's
> obviously cheaper than generic and I wonder if the trick is legitimate (and
> applicable elsewhere, perhaps)...

Right, a few others have the same, but I wasn't convinced that this
is actually safe for call possible cases: it's trivial to construct a caller
that works on other architectures but not this one, if you pass a large
enough size value and don't access the contents in sequence.

Also, like the ((addr | (addr + size)) & MASK) check on some other
architectures, it is less portable because it makes assumptions about
the actual layout beyond a fixed address limit.

        Arnd

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
