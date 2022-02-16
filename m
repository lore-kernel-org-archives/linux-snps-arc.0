Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 271ADC433EF
	for <linux-snps-arc@archiver.kernel.org>; Wed, 16 Feb 2022 13:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DAPkN+iIHSIzoF5lSV89pbqoitWYPT3RPb+jAFVx9DQ=; b=EHS6oRbSk+eZM6
	1M5T2bynPBd4e2g6/EcgKnMOOLDk5W8pFDeCM1FZYPg380bwD5J0MVg349tKq7SCGHcKBNQGnhoPw
	SVbgTTo/FQI3mxBbCwShTHxwydU0zflpfyule2WZTZDgNWCMxDlq8/lPPXsiuyabWrhupJSLFsfvl
	C2NN7Q0k+rfSbLxakM86sQkoogtqdJHSCndVKJoYD0ZoRa8P7TKWGEZJSqwEkdN63e0+Fp50tRQvi
	WvaDM/IwsdszHq3Vb8h1No9qxlZJCAppoz3YMymlU1btcCV6/m38tcCxLwnFGhBuQ5grjPQaFgb+i
	/24YpSEN8bT8aBtYspOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKK1N-0072xh-9E; Wed, 16 Feb 2022 13:07:01 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKK17-0072rp-Hm; Wed, 16 Feb 2022 13:06:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 02895616AF;
 Wed, 16 Feb 2022 13:06:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C36CEC34105;
 Wed, 16 Feb 2022 13:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645016803;
 bh=XpyXyO6XeLPMFwMT57AZNzNQgXnMBZ2Ni2r+dAXZ1s0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=m86IV6YQZzHRJuDux3taFbaRjn+w9RuI6vh4wtLv8qscNybLMG9S7+2rm1PNzrb20
 Dd5S6VsCYA0xUl1vOFFn3tNcP5kMF/3okjlp1F0h2o1Xvta1epkmZYCJUZnDs3yLoA
 VzYx4F/n1Ow3YwU1D9VL3p/ZapRwreq4wU2F2zdBEZVDPHlhJZ5UCirUITvqXKP03u
 mjPPXaT5ZCAExBhxPZs+6x/NgZOCXftC+3jOhCw6lYUHk202K2WWgJTp7zViNeOTI3
 d6qcX+NrilxdmbmnVfKB2lTecLHUYHmjxyqYH1gVkIK8Gk+2LbSYNZnzPmnsXhuwAQ
 I1fP9Rg2mGbLg==
Received: by mail-wm1-f41.google.com with SMTP id o34so1170147wms.1;
 Wed, 16 Feb 2022 05:06:43 -0800 (PST)
X-Gm-Message-State: AOAM533c6EZZB1nKjATl3F6s2tIWxh79Prr3HT/W4eTHb0wfiaSR6SfA
 p2XEE8p/X+3aC0RsPJNBomK8VyXvWhdLuXntmKk=
X-Google-Smtp-Source: ABdhPJz2fGQt4XBj3ZPZmmV0DF3C11Wmt7pFZ5Wv5cMpV0NQk32vVK4/Sp5p4cooe9t3m3i9Hn5C5g4DuBewCt15hb0=
X-Received: by 2002:a1c:21c5:0:b0:37d:40d0:94c7 with SMTP id
 h188-20020a1c21c5000000b0037d40d094c7mr1551416wmh.1.1645016801710; Wed, 16
 Feb 2022 05:06:41 -0800 (PST)
MIME-Version: 1.0
References: <20220214163452.1568807-1-arnd@kernel.org>
 <20220214163452.1568807-12-arnd@kernel.org>
 <YgqMLYJs0RMecMck@infradead.org>
In-Reply-To: <YgqMLYJs0RMecMck@infradead.org>
From: Arnd Bergmann <arnd@kernel.org>
Date: Wed, 16 Feb 2022 14:06:25 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0PwjB+KE+j3_sknZuiuY-kUe_J76nYac-mx82dccA3Rw@mail.gmail.com>
Message-ID: <CAK8P3a0PwjB+KE+j3_sknZuiuY-kUe_J76nYac-mx82dccA3Rw@mail.gmail.com>
Subject: Re: [PATCH 11/14] sparc64: remove CONFIG_SET_FS support
To: Christoph Hellwig <hch@infradead.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>, 
 linux-arch <linux-arch@vger.kernel.org>, Linux-MM <linux-mm@kvack.org>, 
 Linux API <linux-api@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, 
 Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, 
 Linux-sh list <linux-sh@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>, 
 sparclinux <sparclinux@vger.kernel.org>, 
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>, 
 Ard Biesheuvel <ardb@kernel.org>, linux-s390 <linux-s390@vger.kernel.org>, 
 Brian Cain <bcain@codeaurora.org>, Helge Deller <deller@gmx.de>, 
 "the arch/x86 maintainers" <x86@kernel.org>,
 Russell King - ARM Linux <linux@armlinux.org.uk>, linux-csky@vger.kernel.org, 
 Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>, 
 "open list:TENSILICA XTENSA PORT (xtensa)" <linux-xtensa@linux-xtensa.org>,
 Heiko Carstens <hca@linux.ibm.com>, 
 alpha <linux-alpha@vger.kernel.org>, linux-um <linux-um@lists.infradead.org>, 
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Openrisc <openrisc@lists.librecores.org>, 
 Greentime Hu <green.hu@gmail.com>, Stafford Horne <shorne@gmail.com>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Michal Simek <monstr@monstr.eu>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Parisc List <linux-parisc@vger.kernel.org>, 
 Nick Hu <nickhu@andestech.com>, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Dinh Nguyen <dinguyen@kernel.org>, 
 "Eric W . Biederman" <ebiederm@xmission.com>,
 Richard Weinberger <richard@nod.at>, 
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
 David Miller <davem@davemloft.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220216_050645_695760_8699EE0B 
X-CRM114-Status: GOOD (  17.44  )
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

On Mon, Feb 14, 2022 at 6:06 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> >  void prom_world(int enter)
> >  {
> > -     if (!enter)
> > -             set_fs(get_fs());
> > -
> >       __asm__ __volatile__("flushw");
> >  }
>
> The enter argument is now unused.

Right, good point. I'll add a comment, but I think I will leave that
as this seems
too hard to change the callers in assembly code for this. If any
sparc64 developer
wants to clean that up, I'm happy to integrate the cleanup patch in my series.

         Arnd

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
