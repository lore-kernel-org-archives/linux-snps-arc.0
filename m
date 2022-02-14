Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7321EC433EF
	for <linux-snps-arc@archiver.kernel.org>; Mon, 14 Feb 2022 20:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8G0nlPLl6eiFK8nAGjJCXDOu6ll1/Y/rwXaE6r58Ud0=; b=jSk4dorWMzTTdH
	8ON+r1f6Qjmw93lJglatip2KkWHgYHoGbp30KweSkGnfTwXh9/2n9wrgMzlUD4jXkzy2nIQhRmcHt
	cnZH30IvvBoAKBCjHewJJkb8Y+esn/iuhkBZYe3qJYibvXwZ/zOpLAMP9u6MJFTXEFVzOwwlD31Ba
	fQcK5UTshrjF366uPj4esEOQPdslGSAfpsqMTblNrcQPBl+97YTf8Mf6SWZRIaM1Oe4dmnDg0LfM9
	5vOIwvMSmOE01Ne32d3lQDa2QoqJ6Sb7VpdPFlIGQM8OXtzBq77PPPK2owFY/bN5+4AsrUsB0a0Qe
	MjEFzu09B9ay1Zv44+0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJhtu-00Gpto-Dq; Mon, 14 Feb 2022 20:24:46 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJhts-00GpsU-5s
 for linux-snps-arc@lists.infradead.org; Mon, 14 Feb 2022 20:24:45 +0000
Received: by mail-ej1-x62c.google.com with SMTP id p14so15585238ejf.11
 for <linux-snps-arc@lists.infradead.org>; Mon, 14 Feb 2022 12:24:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uV1vHLzIr83T8MOCn12tMQAgRRvl8B7jglczOSl4CII=;
 b=JVRzXzobglXSiT0bLuA7vSr1HiJLXJeQF0BO276l66RCTCZjx8953KmFOVPMErrs0l
 on/NKX4mjsS9TS9bqhorHzBzM+OjtKgBLqdNoyLvrA639t1A433SV7/dJ5dxrhaCdPXH
 bTp5UzrLKiAt8Y3WQUfvdICLgLXk8cVAfLq1E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uV1vHLzIr83T8MOCn12tMQAgRRvl8B7jglczOSl4CII=;
 b=z4z/vVHBUnq3bYM+3mFSOcp+SM/v3Ijbyp+P7f4GqRb7fa5uOeJHHExIXZHg/VRrIY
 I6JUgNl6STUeHa5lZmgSE32T63ra/Al1mO+C3fmNA9es2R5pQqgNFNqZaEPQeT76I99Y
 Y/SVcECdDQvQYJ+XArosoMsjIJ7rfzY7QZNr+VFjsbrUbmx49yN0Fgz9yTfASYpYGc9U
 YPecUhpN07U3nDypuAI30zOkRU494QEbVfVK4KubQfu35CSwS/Y6UZWroEUCIFR/paub
 6lHLnGLz1wGZydZBVx+18/fa86HBTaCA67koFkZOIFOjSctkWaMkoigUYKLpt3Logfr6
 ORuw==
X-Gm-Message-State: AOAM533D8qKRzDK64Q9OKlT33OqxFLHSdK/8xjKuUilzyLPvrfLZF89S
 fMCx7E+FtuJOnNV4v/CZ78jlMaWzYP+cRdAqQjE=
X-Google-Smtp-Source: ABdhPJxMJSVOzmVYzM44AzEfnhub3tfNKBtj+RUDXsa98CnOxRW3KrLBe2z8XngkJYJQ0hGp++PygQ==
X-Received: by 2002:a17:906:5344:: with SMTP id
 j4mr399078ejo.593.1644870282760; 
 Mon, 14 Feb 2022 12:24:42 -0800 (PST)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com.
 [209.85.208.50])
 by smtp.gmail.com with ESMTPSA id b4sm2034869ejv.108.2022.02.14.12.24.40
 for <linux-snps-arc@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Feb 2022 12:24:41 -0800 (PST)
Received: by mail-ed1-f50.google.com with SMTP id z22so3400670edd.1
 for <linux-snps-arc@lists.infradead.org>; Mon, 14 Feb 2022 12:24:40 -0800 (PST)
X-Received: by 2002:a05:651c:1543:: with SMTP id
 y3mr306548ljp.152.1644870269711; 
 Mon, 14 Feb 2022 12:24:29 -0800 (PST)
MIME-Version: 1.0
References: <20220214163452.1568807-1-arnd@kernel.org>
 <20220214163452.1568807-5-arnd@kernel.org>
 <YgqLFYqIqkIsNC92@infradead.org>
 <CAK8P3a1F3JaYaJPy9bSCG1+YV6EN05PE0DbwpD_GT1qRwFSJ-w@mail.gmail.com>
 <CAHk-=whq6_Nh3cB3FieP481VcRyCu69X3=wO1yLHGmcZEj69SA@mail.gmail.com>
In-Reply-To: <CAHk-=whq6_Nh3cB3FieP481VcRyCu69X3=wO1yLHGmcZEj69SA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 14 Feb 2022 12:24:13 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgYu67OwP4LhcrPdDVxv2mOsx-Xsc2DKoVW6GZwKFtOYQ@mail.gmail.com>
Message-ID: <CAHk-=wgYu67OwP4LhcrPdDVxv2mOsx-Xsc2DKoVW6GZwKFtOYQ@mail.gmail.com>
Subject: Re: [PATCH 04/14] x86: use more conventional access_ok() definition
To: Arnd Bergmann <arnd@kernel.org>
Cc: Christoph Hellwig <hch@infradead.org>, Christoph Hellwig <hch@lst.de>, 
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
 David Miller <davem@davemloft.net>, Al Viro <viro@zeniv.linux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_122444_245904_814F61FF 
X-CRM114-Status: GOOD (  17.18  )
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

On Mon, Feb 14, 2022 at 12:01 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> x86-64 has always(*) used TASK_SIZE_MAX for access_ok(), and the
> get_user() assembler implementation does the same.

Side note: we could just check the sign bit instead, and avoid big
constants that way.

Right now we actually have this complexity in the x86-64 user access code:

  #ifdef CONFIG_X86_5LEVEL
  #define LOAD_TASK_SIZE_MINUS_N(n) \
        ALTERNATIVE __stringify(mov $((1 << 47) - 4096 - (n)),%rdx), \
                    __stringify(mov $((1 << 56) - 4096 - (n)),%rdx),
X86_FEATURE_LA57
  #else
  #define LOAD_TASK_SIZE_MINUS_N(n) \
          mov $(TASK_SIZE_MAX - (n)),%_ASM_DX
  #endif

just because the code tries to get that TASK_SIZE_MAX boundary just right.

And getting that boundary just right is important on 32-bit x86, but
it's *much* less important on x86-64.

There's still a (weak) reason to do it even for 64-bit code: page
faults outside the valid user space range don't actually cause a #PF
fault - they cause #GP - and then we have the #GP handler warn about
"this address hasn't been checked".

Which is nice and useful for doing syzbot kind of randomization loads
(ie user accesses that didn't go through access_ok() will stand out
nicely), but maybe it's not worth this. syzbot would be fine with only
the "sign bit set" case warning for the same thing.

So on x86-64, we could just check the sign of the address instead, and
simplify and shrink those get/put_user() code sequences (but
array_index_mask_nospec() currently uses the carry flag computation
too, so we'd have to change that part as well, maybe not worth it).

                  Linus

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
