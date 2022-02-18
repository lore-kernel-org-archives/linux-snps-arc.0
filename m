Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8814C433F5
	for <linux-snps-arc@archiver.kernel.org>; Fri, 18 Feb 2022 09:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=piz8b5/cSAFIjvLHBuQiUdMAaJSHYaYq6GoXpY1dJ5s=; b=hGXXK36IWh2jVj
	biFUK1LoOKBmEZcK0nf8dcZQabcnq00eLHhN7JtrOa/VQYSPn5v50luJD9y3K8qM6We4uWulCxxWa
	aHMEg5jg03U1/Iwxa0QCs+1n+QYhk08HFeBQJD+wLh8oErF9vd8yg+xWDBiUDLkyX5FERAMAiGuFA
	eU68cdVpHLj3ex8l70wqnzt93E1zGFnJQlCC77uImYrYD41nEZeV0kiLsN6NVHBj0jKu2HFN0csqA
	t5nTzOFS8R12lS868GgbxGi3rCfVFYahH4E/YXz8mZ8ZpS4CGoA7e8DXf2DEXdX7k5M6L+UMn3TYq
	wAnHuSGY7As09XiUDDEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKzCV-00DPM2-Hd; Fri, 18 Feb 2022 09:05:15 +0000
Received: from mail-qk1-f169.google.com ([209.85.222.169])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKzCS-00DPKk-Sx; Fri, 18 Feb 2022 09:05:14 +0000
Received: by mail-qk1-f169.google.com with SMTP id q4so5936932qki.11;
 Fri, 18 Feb 2022 01:05:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PuyWdNt7E53vPgI1lZLvKTUut2bNACfNkxpc83Dke5E=;
 b=e7bVzjJgogu+ozzgCA7ZtxfincrTNj8gMOZa56LOqJCi4ivyjrfqxcUcS6d8aHHe/a
 2wOu+zVrCzgT2rNP+XCgygVn+OIGHFDVwSjfjj2Ev5cZZNMHxaphQ/yiNmWrQdgavowl
 g5eutScifjMZjhsuqCACz9vyu0tsSJVb7D0IAHtpc1cK+VYLdLkkv/NPZyL89yNnzfnv
 2a8VYV7bqauZBGS7aH+tLCVHyWfxHsl3w/IbgiO5aUU6QpsqR4GiZ4r4jp/3kJ0HjPhP
 sxWw69UI21yBf0GeOrkg7exa+7/3whBQCK5AtlrXH0HutZor4QT+kJsLd4E0/k5Rvu+P
 kMYQ==
X-Gm-Message-State: AOAM533OrEbs7ui1t+dURvdy9EFJ2KMict2AFtgORetd7EWk0rB4d3Qb
 VuDpRAYfESwPQTzvqWuNHuuodzVHzedj1w==
X-Google-Smtp-Source: ABdhPJz2KKiSTkl3rgCYZ9/OLfD2tyG8fHToHoZ3JFBGQ8qyWiYGB6GDQB8s5dcqDW/aXnFv67VzZg==
X-Received: by 2002:a37:5302:0:b0:507:db0f:cd52 with SMTP id
 h2-20020a375302000000b00507db0fcd52mr3791002qkb.515.1645175111708; 
 Fri, 18 Feb 2022 01:05:11 -0800 (PST)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com.
 [209.85.219.46])
 by smtp.gmail.com with ESMTPSA id g24sm21603230qkk.1.2022.02.18.01.05.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Feb 2022 01:05:11 -0800 (PST)
Received: by mail-qv1-f46.google.com with SMTP id h9so13549656qvm.0;
 Fri, 18 Feb 2022 01:05:11 -0800 (PST)
X-Received: by 2002:a67:b00e:0:b0:30d:dc98:6024 with SMTP id
 z14-20020a67b00e000000b0030ddc986024mr3285076vse.57.1645175099822; Fri, 18
 Feb 2022 01:04:59 -0800 (PST)
MIME-Version: 1.0
References: <20220216131332.1489939-1-arnd@kernel.org>
 <20220216131332.1489939-14-arnd@kernel.org>
In-Reply-To: <20220216131332.1489939-14-arnd@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 18 Feb 2022 10:04:48 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVfiuYEMQhtscwt4xCm1Dfw0M_qEmQ4pof59eB4jZFOPg@mail.gmail.com>
Message-ID: <CAMuHMdVfiuYEMQhtscwt4xCm1Dfw0M_qEmQ4pof59eB4jZFOPg@mail.gmail.com>
Subject: Re: [PATCH v2 13/18] uaccess: generalize access_ok()
To: Arnd Bergmann <arnd@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>, 
 Linux-Arch <linux-arch@vger.kernel.org>, Linux MM <linux-mm@kvack.org>, 
 Linux API <linux-api@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Al Viro <viro@zeniv.linux.org.uk>, 
 Russell King <linux@armlinux.org.uk>, Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>, 
 Brian Cain <bcain@codeaurora.org>, Michal Simek <monstr@monstr.eu>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Nick Hu <nickhu@andestech.com>,
 Greentime Hu <green.hu@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>, 
 Stafford Horne <shorne@gmail.com>, Helge Deller <deller@gmx.de>,
 Michael Ellerman <mpe@ellerman.id.au>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Mark Rutland <mark.rutland@arm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Rich Felker <dalias@libc.org>, 
 "David S. Miller" <davem@davemloft.net>, Richard Weinberger <richard@nod.at>, 
 "the arch/x86 maintainers" <x86@kernel.org>, Max Filippov <jcmvbkbc@gmail.com>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Andrew Morton <akpm@linux-foundation.org>, 
 Ard Biesheuvel <ardb@kernel.org>, alpha <linux-alpha@vger.kernel.org>, 
 arcml <linux-snps-arc@lists.infradead.org>, linux-csky@vger.kernel.org, 
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>, 
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>, 
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
X-CRM114-CacheID: sfid-20220218_010512_949733_4A2142AF 
X-CRM114-Status: GOOD (  29.78  )
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

On Wed, Feb 16, 2022 at 2:17 PM Arnd Bergmann <arnd@kernel.org> wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> There are many different ways that access_ok() is defined across
> architectures, but in the end, they all just compare against the
> user_addr_max() value or they accept anything.
>
> Provide one definition that works for most architectures, checking
> against TASK_SIZE_MAX for user processes or skipping the check inside
> of uaccess_kernel() sections.
>
> For architectures without CONFIG_SET_FS(), this should be the fastest
> check, as it comes down to a single comparison of a pointer against a
> compile-time constant, while the architecture specific versions tend to
> do something more complex for historic reasons or get something wrong.
>
> Type checking for __user annotations is handled inconsistently across
> architectures, but this is easily simplified as well by using an inline
> function that takes a 'const void __user *' argument. A handful of
> callers need an extra __user annotation for this.
>
> Some architectures had trick to use 33-bit or 65-bit arithmetic on the
> addresses to calculate the overflow, however this simpler version uses
> fewer registers, which means it can produce better object code in the
> end despite needing a second (statically predicted) branch.
>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Acked-by: Mark Rutland <mark.rutland@arm.com> [arm64, asm-generic]
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

>  arch/m68k/Kconfig.cpu                 |  1 +
>  arch/m68k/include/asm/uaccess.h       | 19 +--------

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
