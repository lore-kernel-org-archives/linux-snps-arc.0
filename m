Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9C2CC433F5
	for <linux-snps-arc@archiver.kernel.org>; Fri, 18 Feb 2022 08:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HWV/LtEByZERq+nTsKZzQa0FWFUhzX7SG704c/3oZCQ=; b=NaChSzrwrP2ijg
	OGJEvWdVfOUPhZHaQzFHcrTNjiKB9fvLbTX56EQdrr2heF2YS4CmSMhiZUMMk/DTAGfdLGra0OAJC
	gWNY5SA6ZB4GkK7ecJWEKkBXMb4mEi34o5RIXvMug8wG30oISKdacyWmUIih3nTrFHCpTJTvAGxYX
	254jer/tONT8Wyd5goKZe5iMG6CeQ9F2AMORBTgK2QxNan3hS/IaXvoykFr1BMlDfJkRKI9Yqkd/0
	OVcQ1S3hM59lw/5NQnMYrmG3gUA8c4spH2s53GmwlYsHtvbzDQB3pDar0ZWA4HqBZGD45lxB3Rvz0
	4J/7U7Az1Avd+DTsl6mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKz3q-00DNGm-Px; Fri, 18 Feb 2022 08:56:18 +0000
Received: from mail-ua1-f52.google.com ([209.85.222.52])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKz3k-00DNEi-Fw; Fri, 18 Feb 2022 08:56:17 +0000
Received: by mail-ua1-f52.google.com with SMTP id g15so3936126uap.11;
 Fri, 18 Feb 2022 00:56:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=acpcDWZvSxDwOAzGTb7O2RMIWdslBDMuoEt9Qz/Phu0=;
 b=AmaOhzoSmbz1agfA/EiZiJJmlf1dqTon7c8PWvdB93CT33GedEot2eZlGFO/sDSC9E
 JQhvFXDBs/CpbgBSIRWbjh+28qwkUAuNa1mE74/AcdmHz5zd/RKL8yhX3vZarYNJlXBX
 uGzgGZJ5tdUBrfPg10ENbPJ30nhY/K4WjjKZ7c9jCeTupZdodwyim4RNyrT4GZDa6yGX
 3MRhyVRrMV39Wb7qWqyCVZD4IPoL14A4Hpb+RalBz3Nr4TFJDlgi47qCyJ+irWb7ux2/
 IV9JgqdY5B9Ek/QYRLEW+Qe0LBLt2BNTn35v/yVCEGjv7O835MeDFgiZv05UW9FLwcP9
 M88A==
X-Gm-Message-State: AOAM531lq840hsUiSCAzDzQCE8qNvG5z+9G/coJYMOfPGZmkE6qQOtO3
 wJcQDlGyPkXdddviS076xhpt8qATpfsjSA==
X-Google-Smtp-Source: ABdhPJw0HZwXPcLo//EczcgVXfgCoPygmr1NBFuvYx/x1uW1dl3OMND/B2J+O3qSjPApkjyMTlGdBw==
X-Received: by 2002:ab0:334f:0:b0:341:d742:9327 with SMTP id
 h15-20020ab0334f000000b00341d7429327mr57341uap.112.1645174567639; 
 Fri, 18 Feb 2022 00:56:07 -0800 (PST)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com.
 [209.85.217.44])
 by smtp.gmail.com with ESMTPSA id u63sm1014550vke.41.2022.02.18.00.56.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Feb 2022 00:56:07 -0800 (PST)
Received: by mail-vs1-f44.google.com with SMTP id u10so9150360vsu.13;
 Fri, 18 Feb 2022 00:56:07 -0800 (PST)
X-Received: by 2002:a67:e10e:0:b0:31b:956b:70cf with SMTP id
 d14-20020a67e10e000000b0031b956b70cfmr2916488vsl.77.1645174557092; Fri, 18
 Feb 2022 00:55:57 -0800 (PST)
MIME-Version: 1.0
References: <20220216131332.1489939-1-arnd@kernel.org>
 <20220216131332.1489939-9-arnd@kernel.org>
In-Reply-To: <20220216131332.1489939-9-arnd@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 18 Feb 2022 09:55:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVtRh5GHutxGf5dzGHBca7G4td3qqDTHM2KgoDr-kJ91Q@mail.gmail.com>
Message-ID: <CAMuHMdVtRh5GHutxGf5dzGHBca7G4td3qqDTHM2KgoDr-kJ91Q@mail.gmail.com>
Subject: Re: [PATCH v2 08/18] uaccess: add generic __{get,put}_kernel_nofault
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
X-CRM114-CacheID: sfid-20220218_005612_539508_81CDF1EA 
X-CRM114-Status: GOOD (  22.07  )
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
> Nine architectures are still missing __{get,put}_kernel_nofault:
> alpha, ia64, microblaze, nds32, nios2, openrisc, sh, sparc32, xtensa.
>
> Add a generic version that lets everything use the normal
> copy_{from,to}_kernel_nofault() code based on these, removing the last
> use of get_fs()/set_fs() from architecture-independent code.
>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

>  arch/m68k/include/asm/uaccess.h     |   2 -

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
