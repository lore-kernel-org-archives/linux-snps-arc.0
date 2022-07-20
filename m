Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99AB1C433EF
	for <linux-snps-arc@archiver.kernel.org>; Wed, 20 Jul 2022 17:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uy9Clb7sl9iWivGCRg4GVscP6yYXIubzif8v+dmctkc=; b=bcvYoGnnH3ECi4
	6Hh0/xy9CyAqSNTN5KKBKmCVfBAG1YdAM1QyS+P4ibUN+ZjirokX2GfhNQMrZ0u/m1aPVXbrdlOJo
	AYN7D3/fOxTaJ2i5W3n9sih2mSvq4tFBYbp7OJUN/DGYn+P9cfC7oEAhW13/wByU7JwcHoqJeB8zZ
	/j01d8IYgAlfrZWu5RiwPP8xR5RTWF3bD//j0C3ngcdnN1rifAn0xpiizivR2EkPbF8VJLjiAv5Tf
	lIA840nGvbZMEsu8kVXdkuG/mharfN3HfJV59yZIOSn0dublL98MlIcFW8lvd3r77YGTr0h1lo3sB
	sGfqLMvOrNkGl7fHPRJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEDgh-008l6g-Fb; Wed, 20 Jul 2022 17:40:43 +0000
Received: from mail-qt1-f180.google.com ([209.85.160.180])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEDgf-008l3R-Go; Wed, 20 Jul 2022 17:40:42 +0000
Received: by mail-qt1-f180.google.com with SMTP id g24so11173012qtu.2;
        Wed, 20 Jul 2022 10:40:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PmcZJKXW5L1h76Y7jDvbkfD3n85Nfb/cTZUz3jaZfpo=;
        b=zuDTdlOfrxqZcz5qtoW5JKdTessxURFiUN7Wshz0pPYLhHyd9IXKpdS7rTfRS+N9H3
         4bhkg89Roy2S7oYd6dHijZbCWkfkn238eJZdLxto0upJLoXH/rp5GRj8tT/3UBlL2/H6
         LnaRymOi1Ngz46J9/o5t+FDHvAopraUs3ZW6RrnZPmDCjG20Y009T4NZS89JPHjqy8a1
         jG8Q4V5Fw3U7/C0mzsLRZkFxKeh0+U5cPvvQVgVdFtFFREw9hmNVtDYUwhBpQASK3jcJ
         spyO/j9akQapM0noOiabgU7lPJR1Kb8banyrquVlCq0Wbww1xIjzHF2xHDQSfj8TDPij
         Q7IA==
X-Gm-Message-State: AJIora9XlgPPxH9ZrR+cS/m5wAuYwhwnQynWQtU3b47Wr8w2fBhOOT3s
	7EynYRa3/LG+0rytzD6mb4N5fAhCcyVD5+Xw
X-Google-Smtp-Source: AGRyM1uykxZkkxRGFX+bWyLa65XUW94jvtw3xfi8WLz+cHmpu3l9+nG69ZJC2dnIL5QGdPy34S5pdQ==
X-Received: by 2002:ac8:57c4:0:b0:31f:100:fc59 with SMTP id w4-20020ac857c4000000b0031f0100fc59mr6949831qta.395.1658338839193;
        Wed, 20 Jul 2022 10:40:39 -0700 (PDT)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com. [209.85.219.179])
        by smtp.gmail.com with ESMTPSA id j13-20020ac806cd000000b00304efba3d84sm12616663qth.25.2022.07.20.10.40.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Jul 2022 10:40:38 -0700 (PDT)
Received: by mail-yb1-f179.google.com with SMTP id r3so33334836ybr.6;
        Wed, 20 Jul 2022 10:40:38 -0700 (PDT)
X-Received: by 2002:a5b:6c1:0:b0:669:a7c3:4c33 with SMTP id
 r1-20020a5b06c1000000b00669a7c34c33mr36151263ybq.543.1658338827759; Wed, 20
 Jul 2022 10:40:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220720131934.373932-1-shorne@gmail.com> <20220720131934.373932-3-shorne@gmail.com>
In-Reply-To: <20220720131934.373932-3-shorne@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 20 Jul 2022 19:40:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX7_CSQd14tGPfL7R7V0h6AwNi7bVDCWhcdNoZV_md4bw@mail.gmail.com>
Message-ID: <CAMuHMdX7_CSQd14tGPfL7R7V0h6AwNi7bVDCWhcdNoZV_md4bw@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] PCI: Move isa_dma_bridge_buggy out of dma.h
To: Stafford Horne <shorne@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Christoph Hellwig <hch@infradead.org>, Richard Henderson <rth@twiddle.net>, 
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, 
	Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
	Paul Mackerras <paulus@samba.org>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, "David S. Miller" <davem@davemloft.net>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "the arch/x86 maintainers" <x86@kernel.org>, 
	"H. Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, 
	Ian Abbott <abbotti@mev.co.uk>, H Hartley Sweeten <hsweeten@visionengravers.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Greg Ungerer <gerg@linux-m68k.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, alpha <linux-alpha@vger.kernel.org>, 
	arcml <linux-snps-arc@lists.infradead.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	"linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, 
	"open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, Parisc List <linux-parisc@vger.kernel.org>, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-s390 <linux-s390@vger.kernel.org>, 
	Linux-sh list <linux-sh@vger.kernel.org>, sparclinux <sparclinux@vger.kernel.org>, 
	"open list:TENSILICA XTENSA PORT (xtensa)" <linux-xtensa@linux-xtensa.org>, linux-pci <linux-pci@vger.kernel.org>, 
	ALSA Development Mailing List <alsa-devel@alsa-project.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220720_104041_573798_E2B67BF1 
X-CRM114-Status: GOOD (  22.64  )
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

On Wed, Jul 20, 2022 at 3:20 PM Stafford Horne <shorne@gmail.com> wrote:
> During recent PCI cleanups we noticed that the isa_dma_bridge_buggy
> symbol supported by all architectures is actually only used for x86_32.
>
> This patch moves the symbol out of all architectures limiting usage to
> only x86_32.  This is possible because only x86_32 platforms or quirks
> existing in PCI devices supported on x86_32 ever set this.  A new global
> header linux/isa-dma.h is added to provide a common place to maintain
> the definition.
>
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Suggested-by: Christoph Hellwig <hch@infradead.org>
> Signed-off-by: Stafford Horne <shorne@gmail.com>
> ---
> Since v3:
>  - New patch.

>  arch/m68k/include/asm/dma.h            |  6 ------

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

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
