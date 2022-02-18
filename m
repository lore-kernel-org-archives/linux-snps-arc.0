Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B553AC433F5
	for <linux-snps-arc@archiver.kernel.org>; Fri, 18 Feb 2022 07:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L2+xPLJVKKipMf4rnKg8Z+7q8ssgYr0Ob463Yetjeew=; b=ch+S3ORbH1CYAy
	6AydG25KPMJa9KwiVQ+aCIUvQSEYWydLpFXfd5UJ6qk8DFqwnnev/5dMc5Qadw6Em/GjgnLk4ns55
	AfG2sQjCy1NBJr2YIFXBBQOhAjTYAhkS4T4g1uP4piQWmuWRJMgE/UhlSUhOLBBmQflqAEBx7JdKv
	0xkCKOmDtpJkZnN8ifXeZvz3hjNBmM7OUNmbJin3mv/Le5+c+dYAbFkaZCE7FWtVyug0/e2qJxTD4
	CgIowYo+Frq2CwQ98oAFBDSCzG0MA1OPe+4eHG076/j1dVV552+SNRDBCt7klV2QFiB4vPbP35NHl
	39/JUPqhwERqlvOIeAPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKxcZ-00DBwd-Sk; Fri, 18 Feb 2022 07:24:03 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKxcV-00DBte-4Z; Fri, 18 Feb 2022 07:24:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 9615BCE3154;
 Fri, 18 Feb 2022 07:23:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CFEFC340ED;
 Fri, 18 Feb 2022 07:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645169037;
 bh=iX8k9YjATKpR4c62jPbZyUcM9GG/inNR2Rws8vh+5TI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=tqTEPi3D8ykMJuM1O5WZXRrY+x9fqigElYE+7U2lP66aiQhXjwqc8np5cgJ3nPhob
 INc5mSHbYoAozc5dz6c6XrssTjPgLHo3DEzE+GZW+ofRygPj1jwo24y8Visn79VwMA
 TYn3bM3oEslfU6UAsDfSTdiWgRHp/xbijA5Nn8EoxI84pjZNNihf5nveTL2Wg3t2Uk
 NCbKF/iOfzWH0fJ2ENk81YbpznN36uJOc4XefmD5VTowvxTO475eweZNksp6ybfoLa
 KPWJ3pTDi4VzPKsHnWQphUSIyN2wHVcVVpwH2x7YU+Z9AstU7CKENvU2MS9xP0zaMn
 bqHyOdm/qy+lw==
Received: by mail-lj1-f173.google.com with SMTP id n24so2979552ljj.10;
 Thu, 17 Feb 2022 23:23:57 -0800 (PST)
X-Gm-Message-State: AOAM531w3FyBZLT4QDqoOwLPNplO+DoqU1c0Ad/hhhUYEzrMUzpYrMrJ
 294A/dtetcqllgtW4ShOHdYNbK/Phfw9pHCcWyk=
X-Google-Smtp-Source: ABdhPJy+O8dl23fyesXRWHjz7SZRLrJN54UunjRaSC3OSIYzwaAC/i9x7WkjUHComAvPWqTtg86CqT1E/gHbWgqhIZI=
X-Received: by 2002:adf:90c1:0:b0:1e4:ad27:22b9 with SMTP id
 i59-20020adf90c1000000b001e4ad2722b9mr4994775wri.219.1645169025031; Thu, 17
 Feb 2022 23:23:45 -0800 (PST)
MIME-Version: 1.0
References: <20220216131332.1489939-1-arnd@kernel.org>
 <20220216131332.1489939-14-arnd@kernel.org>
 <20220218063450.GI22576@lst.de>
In-Reply-To: <20220218063450.GI22576@lst.de>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 18 Feb 2022 08:23:29 +0100
X-Gmail-Original-Message-ID: <CAK8P3a17kdz0gKYz3cDSpvWa80TY6QNSom11HVAb8h91RZn0Jg@mail.gmail.com>
Message-ID: <CAK8P3a17kdz0gKYz3cDSpvWa80TY6QNSom11HVAb8h91RZn0Jg@mail.gmail.com>
Subject: Re: [PATCH v2 13/18] uaccess: generalize access_ok()
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
X-CRM114-CacheID: sfid-20220217_232359_533435_95435483 
X-CRM114-Status: GOOD (  15.85  )
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

On Fri, Feb 18, 2022 at 7:34 AM Christoph Hellwig <hch@lst.de> wrote:
>
> > +#include <asm-generic/access_ok.h>
>
> Instead of the asm-generic games, shouldn't we just define access_ok in
> <linux/uaccess.h> if not already defined by the architecture?

I tried, but couldn't actually make it work because asm/uaccess.h tends
to contain inline functions that rely on access_ok(). It could work once we
move all the high-level functions into linux/uaccess.h, but that would likely
require another long patch series.

One option that can work is to require architectures to have an
asm/access_ok.h header that gets included by linux/uaccess.h.
On most architectures, that would be redirected to
asm-generic/access_ok.h, as only ia64, x86, arm64 and um
need to override the definition.

      Arnd

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
