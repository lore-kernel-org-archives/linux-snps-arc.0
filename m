Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB202C05027
	for <linux-snps-arc@archiver.kernel.org>; Tue, 14 Feb 2023 08:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fT0L00qsQThqz9wLkG6i8ktyqxcHZkNR9D2VrDyjVoo=; b=skl1JsQD+Eh/yU
	0vySu7H9233EQhxxVlkIPqOC6ctHcJt+fQYNMkLNPKbwn1ROoUlL4j5gq3w19E71r4dJjy753IiZM
	7Cn7Mv/yBEA1tjmqDoYQuF3PkrbEE+aF3CVycJmNxgxroQlXtLpaUVhKpqxPedcUU8rK6gLv5NTUn
	yMFoGv/7cp1HZJ9RfDyDA+2Ej3pw3T4LvUHwnuLQ/0NDaCxkfYScVfrarQXHxVrScxGhKsAzqggz/
	rJkQAf/REbJm+0UMc5jiyQZlQiJ3uR4p1duRzXFPC9YIVkbLwLyapHNrPsJk4dUcmP6ov7Sj7c5bX
	kpkopoqqPXIz6hhV9H7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRr9K-000brt-Bo; Tue, 14 Feb 2023 08:58:54 +0000
Received: from mail-ej1-f54.google.com ([209.85.218.54])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRr9I-000bqc-8t; Tue, 14 Feb 2023 08:58:53 +0000
Received: by mail-ej1-f54.google.com with SMTP id sa10so38274824ejc.9;
        Tue, 14 Feb 2023 00:58:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UXpQWLOfRB0cj7wBmiF/GaVLxY5OIU6uD4JxDn3mdPQ=;
        b=UosulJjftrAPoRbtteYWEIIDsXWqUKsmduBEbzrkzP3MDZAIKEmLU7azUOWW1b9PLA
         5k4k7DoPD1umCWR5IkOkqghqreBl89RLp63Rww0gTMDs9iY/InBVDyMbf2qc+KBRHUBN
         6xJCuDsWbRtSka4yXPUs/CrRMvyyL3XGMemAne/m2ch5MwTidx7h0ldoeE1iWMSxqHsZ
         XoCNEFF9rW4dtAn9hsrziXu8c6zX5AEJvrqeN4inIEKoHrX/sbac/WZ1+x0D+k8topBV
         eeIJHItDzn5jozULs6dfTtRVZl+VEewcVqWVyYOpNMZ1IxvmBITVVQ8QWGKzhgypdZ7y
         IFCg==
X-Gm-Message-State: AO0yUKXewhqLex2oF7iOBWjpS/dTLPK3/Nfq2TtS+k0EZlxmPGBp8w2A
	LMsSPlpX8FvgoNhGyuLG5R50q6y+ixm5M2uR
X-Google-Smtp-Source: AK7set/hkO7CFtInHRUhV0y6CCZqw/9xoTDBppCJBf95DDKiigBElcBa2ZJCTSfx9gC/hEL0noWffw==
X-Received: by 2002:a17:906:bc9:b0:88c:3a48:715b with SMTP id y9-20020a1709060bc900b0088c3a48715bmr1939827ejg.30.1676365128701;
        Tue, 14 Feb 2023 00:58:48 -0800 (PST)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id m2-20020a1709061ec200b0087848a5daf5sm7932638ejj.225.2023.02.14.00.58.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Feb 2023 00:58:45 -0800 (PST)
Received: by mail-ed1-f53.google.com with SMTP id cq19so13572327edb.5;
        Tue, 14 Feb 2023 00:58:43 -0800 (PST)
X-Received: by 2002:a05:651c:4ca:b0:28e:54f:b187 with SMTP id
 e10-20020a05651c04ca00b0028e054fb187mr203743lji.5.1676365112291; Tue, 14 Feb
 2023 00:58:32 -0800 (PST)
MIME-Version: 1.0
References: <20230214074925.228106-1-alexghiti@rivosinc.com> <Y+tIl07KOOrGZ2Et@osiris>
In-Reply-To: <Y+tIl07KOOrGZ2Et@osiris>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 14 Feb 2023 09:58:17 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVG4=UmKDa17dys9e3iGM75u4+13nQVyjMHK--aD6WKfw@mail.gmail.com>
Message-ID: <CAMuHMdVG4=UmKDa17dys9e3iGM75u4+13nQVyjMHK--aD6WKfw@mail.gmail.com>
Subject: Re: [PATCH v3 00/24] Remove COMMAND_LINE_SIZE from uapi
To: Heiko Carstens <hca@linux.ibm.com>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>, Jonathan Corbet <corbet@lwn.net>, 
	Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, 
	Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	"David S . Miller" <davem@davemloft.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-xtensa@linux-xtensa.org, 
	linux-arch@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_005852_321861_84F2DF87 
X-CRM114-Status: GOOD (  32.98  )
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

Hi Heiko,

On Tue, Feb 14, 2023 at 9:39 AM Heiko Carstens <hca@linux.ibm.com> wrote:
> On Tue, Feb 14, 2023 at 08:49:01AM +0100, Alexandre Ghiti wrote:
> > This all came up in the context of increasing COMMAND_LINE_SIZE in the
> > RISC-V port.  In theory that's a UABI break, as COMMAND_LINE_SIZE is the
> > maximum length of /proc/cmdline and userspace could staticly rely on
> > that to be correct.
> >
> > Usually I wouldn't mess around with changing this sort of thing, but
> > PowerPC increased it with a5980d064fe2 ("powerpc: Bump COMMAND_LINE_SIZE
> > to 2048").  There are also a handful of examples of COMMAND_LINE_SIZE
> > increasing, but they're from before the UAPI split so I'm not quite sure
> > what that means: e5a6a1c90948 ("powerpc: derive COMMAND_LINE_SIZE from
> > asm-generic"), 684d2fd48e71 ("[S390] kernel: Append scpdata to kernel
> > boot command line"), 22242681cff5 ("MIPS: Extend COMMAND_LINE_SIZE"),
> > and 2b74b85693c7 ("sh: Derive COMMAND_LINE_SIZE from
> > asm-generic/setup.h.").
> >
> > It seems to me like COMMAND_LINE_SIZE really just shouldn't have been
> > part of the uapi to begin with, and userspace should be able to handle
> > /proc/cmdline of whatever length it turns out to be.  I don't see any
> > references to COMMAND_LINE_SIZE anywhere but Linux via a quick Google
> > search, but that's not really enough to consider it unused on my end.
> >
> > The feedback on the v1 seemed to indicate that COMMAND_LINE_SIZE really
> > shouldn't be part of uapi, so this now touches all the ports.  I've
> > tried to split this all out and leave it bisectable, but I haven't
> > tested it all that aggressively.
>
> Just to confirm this assumption a bit more: that's actually the same
> conclusion that we ended up with when commit 3da0243f906a ("s390: make
> command line configurable") went upstream.

Commit 622021cd6c560ce7 ("s390: make command line configurable"),
I assume?

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
