Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7126C433EF
	for <linux-snps-arc@archiver.kernel.org>; Tue, 15 Feb 2022 09:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U9GIajW/H0hSnxA/wwyU4IPqQY5TJJUDIvLMl7Eg3As=; b=KXL5QixnaU/X0S
	jSSLP+FZga4xwwQbecVtxFZFGtFWVIPQ0+Hc3MQUFYpMm9vg0L595h2v+rQZH1dD5lP3QMevBcTl4
	aTr6pcZnT5aor/3eOjrw8u1wdfS/qqy77kpy71DVtUae6Wkmo1hSKzM3UQkNwqGSNN5u5l/owkdVm
	lnpJqnOa2jsSfQ72pVLxjYZQg6OLOVPSThLytuWcAMHsArH42dgQ3fql4JOvrTrGT5Q8aj9W/xngL
	LhMZ1FZFY69ie7UC6fcl+uUTXYGHFc6Fsp6OERAKzqWYspuOcOHg4raOu8qxpLIYd71EEbVQD2dYe
	IZnEUrAvb3Y4IOYQ4VnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJu0B-00207Z-TX; Tue, 15 Feb 2022 09:20:03 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJtyl-001zT0-VT; Tue, 15 Feb 2022 09:18:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1AFD2B81807;
 Tue, 15 Feb 2022 09:18:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFDBDC340EB;
 Tue, 15 Feb 2022 09:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644916712;
 bh=auvbexz8OfCE17jezkrwExlxQUSMdLXG0OAD2bmLs8A=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=WkCGrtyaPGx2lCQmidRf50Nww49rtYKXGqhrb3/C0e99NEVq0x4+WE9foIS4kUwTy
 Mg2PS200LzaF04kA9XIMm+68B/HWgDxXUTEMDmtFuo/vuZCLa1nzhj77kQBMW/PnbX
 ukG7A6NTl1LhUebF+egxWGXBS1bclOmuETqe5/P7P8hYCPMJV01ML09i4Dj7Oc4eam
 qPGV0kiOvw/HrhOoUIvvr9kVOKBBLAKePRDoLhNMD5z9l8zC/MfMs684bQIAPICifC
 JNi2hHWCbvRfB0irmZRpMndHoBz4k0WZn3sUQdjIzkz5H4VhtCg1X21uy/aeXseCev
 i16v7OHaWl0OQ==
Received: by mail-wr1-f47.google.com with SMTP id w11so30959386wra.4;
 Tue, 15 Feb 2022 01:18:32 -0800 (PST)
X-Gm-Message-State: AOAM5331aKR1hPufDKxp24+XoHPsgUFvoCi9Ay06zDFQerk2hCxUSp5m
 dR9TBKJZccbMNfAikIYXubviUibTR9kVW4yfU9I=
X-Google-Smtp-Source: ABdhPJytLoTfipZUwnG73E442/QjIxHnERGjQ2aeR9o7LjnpbatwjsLI+Mk7641j6VpHXtVWtwvDTIufUdUsOw5At+o=
X-Received: by 2002:a5d:5446:: with SMTP id w6mr2390801wrv.12.1644916711299;
 Tue, 15 Feb 2022 01:18:31 -0800 (PST)
MIME-Version: 1.0
References: <20220214163452.1568807-1-arnd@kernel.org>
 <20220214163452.1568807-4-arnd@kernel.org>
 <YgqK1ihlJvRFHJ9h@infradead.org>
In-Reply-To: <YgqK1ihlJvRFHJ9h@infradead.org>
From: Arnd Bergmann <arnd@kernel.org>
Date: Tue, 15 Feb 2022 10:18:15 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1XkWNQcFEhJQ0+qWzih1YRQDS_N8xiosN7FHn3yoTJpQ@mail.gmail.com>
Message-ID: <CAK8P3a1XkWNQcFEhJQ0+qWzih1YRQDS_N8xiosN7FHn3yoTJpQ@mail.gmail.com>
Subject: Re: [PATCH 03/14] nds32: fix access_ok() checks in get/put_user
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
 "# 3.4.x" <stable@vger.kernel.org>, 
 Dinh Nguyen <dinguyen@kernel.org>, "Eric W . Biederman" <ebiederm@xmission.com>,
 Richard Weinberger <richard@nod.at>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 David Miller <davem@davemloft.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_011836_410070_5FB35CD8 
X-CRM114-Status: GOOD (  23.99  )
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

On Mon, Feb 14, 2022 at 6:01 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Mon, Feb 14, 2022 at 05:34:41PM +0100, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > The get_user()/put_user() functions are meant to check for
> > access_ok(), while the __get_user()/__put_user() functions
> > don't.
> >
> > This broke in 4.19 for nds32, when it gained an extraneous
> > check in __get_user(), but lost the check it needs in
> > __put_user().
>
> Can we follow the lead of MIPS (which this was originally copied
> from I think) and kill the pointless __get/put_user_check wrapper
> that just obsfucate the code?

I had another look, but I think that would be a bigger change than
I want to have in a fix for stable backports, as nds32 also uses
the _check versions in __{get,put}_user_error.

If we instead clean it up in a separate patch, it should be done for
all eight architectures that do the same thing, but at that point,
the time seems better spent at coming up with a new set of
calling conventions that work with asm-goto.

         Arnd

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
