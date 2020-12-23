Return-Path: <SRS0=tn7x=F3=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59DD9C433E0
	for <linux-snps-arc@archiver.kernel.org>; Wed, 23 Dec 2020 10:38:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 700A320825
	for <linux-snps-arc@archiver.kernel.org>; Wed, 23 Dec 2020 10:38:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 700A320825
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IBjM2j0T0ERs+jj9YncfkZjxc6WDQB9u6R4eq6zTA9I=; b=kXYi4zRzkH6bGYzSLdtsv7SmP
	e1lsjTpD08Pghn/L2dGxLEqmkH940KVhVAuEKwy+Vatn45kCbA6mznoUjce1IaYx3KLBpWbjxGbh9
	qrRy+8xcLKKBGsb3qIzo+nJmZ/VHbNIQO6FTTLT1di1MZQjbA3joLAs1DFGObSj7O4VsseulZkhvq
	+aMakdCOZsR5wGKCZf5y3FCwjW64ZItpR+bAvO3QXo4CCLY3vRTMCMdZCkkGJt4k4GD8783DxkvxX
	rBIXq/vnwZ335bPcGqzBV6dRPey31yse+3F8Ig3MRvmB5ThVbazaa3FJo1LxkdIdAapfcDGotXvTJ
	o22faEDDg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ks1X2-0006P9-5p; Wed, 23 Dec 2020 10:38:12 +0000
Received: from mail-oo1-f48.google.com ([209.85.161.48])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ks1X0-0006Og-J0; Wed, 23 Dec 2020 10:38:11 +0000
Received: by mail-oo1-f48.google.com with SMTP id q6so3593726ooo.8;
 Wed, 23 Dec 2020 02:38:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KihTF5JbxFD42cY1wA7aOsNP35ZO1n0Na3DWL4feoYk=;
 b=LaCkVUp+LTaJstNWLGzpZvG8b3goI7xBsP2uIYwFPjgz2EbzYDK8EKsehKetOhba0y
 +s+CfOBgYj3AnszLuLbUhHz9KyMWFd6/FeXhYzFPBDvrNt/0SDknvBaz6qbIYYpQo5ET
 x+Eg+KbQEut148uilC0V+WS4hK0DIUIWvH0ou1Fcnlaz88lKG2IU50PSiGNILsST4LMu
 TIERUCgnCmQvmG3zpu0sgFM/0uG2cKOiSWILk9Wj27TdCRzF2t37jH6GCqEg7Xf4UWZF
 7Yalzk9ucQQYRQz1HwwoxYUsuDtVLWG86qxU4spPICHR8u8U0wZZvZROXGJi/davBkV5
 N/nA==
X-Gm-Message-State: AOAM532s0fqyH6lIZXHBV+LXJ4L78dW7JPTtNx2gqWNq9pQ0SrQGN0zg
 OgzLQJeN/C6Njtvo5+59DaOVXUczm/b6Pn1YgUc=
X-Google-Smtp-Source: ABdhPJy9U98CPLOM9qWfCFZui6dO/PQYCRjI00tgXXUEHSfVAWiteZLCs+U7EpAO2soA/tWzSTNFmBBqnM2RmfJo+z4=
X-Received: by 2002:a4a:c191:: with SMTP id w17mr18070553oop.1.1608719888011; 
 Wed, 23 Dec 2020 02:38:08 -0800 (PST)
MIME-Version: 1.0
References: <20201222184510.19415-1-info@metux.net>
 <CAMuHMdVze3oaWmzvzn8ROjpP6h6Tsv2SFLiV7T1Cnej36X445g@mail.gmail.com>
 <2f1d53e9-0dbb-78ef-22d5-ab230438ddf0@metux.net>
In-Reply-To: <2f1d53e9-0dbb-78ef-22d5-ab230438ddf0@metux.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Dec 2020 11:37:56 +0100
Message-ID: <CAMuHMdXoHVPwqC_v6DL2MTi2j_tgnCqy9eiuLHvmZ9cB5scbQA@mail.gmail.com>
Subject: Re: [PATCH] arch: consolidate pm_power_off callback
To: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201223_053810_645523_292ACF41 
X-CRM114-Status: GOOD (  21.06  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Cc: Rich Felker <dalias@libc.org>,
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 James Bottomley <James.Bottomley@hansenpartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 linux-csky@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Jonas Bonn <jonas@southpole.se>,
 linux-s390 <linux-s390@vger.kernel.org>,
 Stefano Stabellini <sstabellini@kernel.org>, linux-c6x-dev@linux-c6x.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
 Helge Deller <deller@gmx.de>, the arch/x86 maintainers <x86@kernel.org>,
 Ley Foon Tan <ley.foon.tan@intel.com>, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 arcml <linux-snps-arc@lists.infradead.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 Linux PM list <linux-pm@vger.kernel.org>, Mark Salter <msalter@redhat.com>,
 Aurelien Jacquiot <jacquiot.aurelien@gmail.com>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Openrisc <openrisc@lists.librecores.org>, Borislav Petkov <bp@alien8.de>,
 Stafford Horne <shorne@gmail.com>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Christian Brauner <christian@brauner.io>, Chris Zankel <chris@zankel.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Parisc List <linux-parisc@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 alpha <linux-alpha@vger.kernel.org>, "Enrico Weigelt,
 metux IT consult" <info@metux.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi Enrico,

On Tue, Dec 22, 2020 at 9:15 PM Enrico Weigelt, metux IT consult
<lkml@metux.net> wrote:
> On 22.12.20 19:54, Geert Uytterhoeven wrote:
> > On Tue, Dec 22, 2020 at 7:46 PM Enrico Weigelt, metux IT consult
> > <info@metux.net> wrote:
> >> Move the pm_power_off callback into one global place and also add an
> >> function for conditionally calling it (when not NULL), in order to remove
> >> code duplication in all individual archs.
> >>
> >> Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
> >
> > Thanks for your patch!
> >
> >> --- a/arch/alpha/kernel/process.c
> >> +++ b/arch/alpha/kernel/process.c
> >> @@ -43,12 +43,6 @@
> >>  #include "proto.h"
> >>  #include "pci_impl.h"
> >>
> >> -/*
> >> - * Power off function, if any
> >> - */
> >> -void (*pm_power_off)(void) = machine_power_off;
> >
> > Assignments like these are lost in the conversion.
>
> Yes, but this doesn't seem to be ever called anyways. (in arch/alpha)
> And, BTW, letting it point to machine_power_off() doesn't make much
> sense, since it's the arch's machine_power_off() function, who're
> calling pm_power_off().
>
> Actually, we could remove pm_power_off completely from here, assuming
> nobody would *build* any drivers that register themselves into
> pm_power_off.
>
> If you feel better with it, I could post a patch that just removes
> pm_power_off from arch/alpha.

This is not limited to alpha, there are similar initializations on
m68k, openrisc,
and s390.
If none of these are called, they can be removed, but you should mention
that in the patch description.

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
