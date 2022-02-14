Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16AC5C433EF
	for <linux-snps-arc@archiver.kernel.org>; Mon, 14 Feb 2022 17:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gq4GGh+gRMaDBOichAnep5k9KhktyKrtHof3eoQGw1Y=; b=eZvTiudv2ednoe
	V5uuqsZd7wF+80NhNUkXkmHn+h76ChRJRYZPtPq1Wd/0ED+1+6avPqrIwHK+M1XkQEpFhinnbACcN
	UcXkAM8e1oJEs6zuiWFNGn8wSnpnPJhOO/3jwCXkZ9arOtizIMHCpuZXIC8MAcuPZCjIbnb/IHckN
	0PV27DyiGsbvFixuaHeoR3tAhjOyyi0pARCfsMke6P9CjhjH49/sVFDRZajOEwa2cVmI+HN2kZPyd
	iV9y1hEWunLD/El1iV7DlqAO7scYcZkNieQCzZoV6WBqcZinFoD6XxOp3GqM/JGxlm74L0LmUzPzv
	09OrWCgVWzRLT42+k0aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJfOG-00GPpa-Hk; Mon, 14 Feb 2022 17:43:56 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJfOE-00GPp1-42
 for linux-snps-arc@lists.infradead.org; Mon, 14 Feb 2022 17:43:55 +0000
Received: by mail-ej1-x62c.google.com with SMTP id p14so14790502ejf.11
 for <linux-snps-arc@lists.infradead.org>; Mon, 14 Feb 2022 09:43:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hl2tx2/b0j1as4iPc8br7ak6VbssTN3Lkaa01qKImp4=;
 b=B3+89vMVlD+t/jr4Ir3J5heCAGLy+8O/Bfqv5DSjHS7vGRacFAUCCs0TF2tOD5+IOJ
 DARHbhMwmXg8IKTGNN5wyW1UIWJ3dy3zDkUXnMSy6euD4EH/SAawjrYbWaSs+0JtxWja
 ZBOb3OkzZ9V/CSYGxjkJVHb89skxzNvZve0yg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hl2tx2/b0j1as4iPc8br7ak6VbssTN3Lkaa01qKImp4=;
 b=FeRiGizulelMXjGl4xKJAu2ltkSWXppHf+kK6oER5pWJs1dJ83/1BeabMfabLxbjKF
 w7+oDymA/5zuhiru5hr3UynuoY7Nds3DdOf34t5WXb1JjFSbxuJ5A4J58D1XJ914uRS8
 /OhzTujiqbPpjwOA/r0nVj5a9U6yraXPCc/xPQbDPmjtTVjVbbEMboR4WwYdB8N0EwIz
 RM/f2ljwVrs9fd0q0qYpz8m/BvTnycjH65j0K6ShpT9izo8rkfw/5/+N9DeWQ+Kcndd/
 fV3JkqiH//zvJ8xnt97/7OvkzlzDv9RRDZdLbSiG7OnA6pOqyyeVdD+Bke/IoL4mdp8H
 4kFA==
X-Gm-Message-State: AOAM533ZbFyLlIE/K2o3sljmD7Z5OlYBk7popmnhQw0DwlPPOEMj0uZz
 z7D0GL2do8xhdchtWvCYGZgSU+wHc9wyn4ww1YE=
X-Google-Smtp-Source: ABdhPJwFzN8wpb5xctl+3LUdx9xBmpcrX4t7aK04SnoiTTMT91WytYuKLjHvQhVQ91UWcUbQEWZPBw==
X-Received: by 2002:a17:906:b01:: with SMTP id u1mr568462ejg.312.1644860632158; 
 Mon, 14 Feb 2022 09:43:52 -0800 (PST)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com.
 [209.85.221.49])
 by smtp.gmail.com with ESMTPSA id s16sm9385083edt.91.2022.02.14.09.43.51
 for <linux-snps-arc@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Feb 2022 09:43:51 -0800 (PST)
Received: by mail-wr1-f49.google.com with SMTP id h6so28105683wrb.9
 for <linux-snps-arc@lists.infradead.org>; Mon, 14 Feb 2022 09:43:51 -0800 (PST)
X-Received: by 2002:a19:4302:: with SMTP id q2mr49672lfa.449.1644860131952;
 Mon, 14 Feb 2022 09:35:31 -0800 (PST)
MIME-Version: 1.0
References: <20220214163452.1568807-1-arnd@kernel.org>
In-Reply-To: <20220214163452.1568807-1-arnd@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 14 Feb 2022 09:35:15 -0800
X-Gmail-Original-Message-ID: <CAHk-=whXYWoP6of7js=f4zov62on97mNFRSVRWhY75WoGM6CoQ@mail.gmail.com>
Message-ID: <CAHk-=whXYWoP6of7js=f4zov62on97mNFRSVRWhY75WoGM6CoQ@mail.gmail.com>
Subject: Re: [PATCH 00/14] clean up asm/uaccess.h, kill set_fs for good
To: Arnd Bergmann <arnd@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, linux-arch <linux-arch@vger.kernel.org>, 
 Linux-MM <linux-mm@kvack.org>, Linux API <linux-api@vger.kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>,
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
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Andrew Morton <akpm@linux-foundation.org>, 
 Ard Biesheuvel <ardb@kernel.org>, alpha <linux-alpha@vger.kernel.org>, 
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-csky@vger.kernel.org, 
 linux-hexagon <linux-hexagon@vger.kernel.org>, linux-ia64@vger.kernel.org, 
 linux-m68k <linux-m68k@lists.linux-m68k.org>, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 openrisc@lists.librecores.org, 
 linux-parisc <linux-parisc@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-s390 <linux-s390@vger.kernel.org>, 
 Linux-sh list <linux-sh@vger.kernel.org>,
 linux-sparc <sparclinux@vger.kernel.org>, 
 linux-um <linux-um@lists.infradead.org>, linux-xtensa@linux-xtensa.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_094354_180997_3C712649 
X-CRM114-Status: GOOD (  13.88  )
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

On Mon, Feb 14, 2022 at 8:35 AM Arnd Bergmann <arnd@kernel.org> wrote:
>
> I did a patch for microblaze at some point, which turned out to be fairly
> generic, and now ported it to most other architectures, using new generic
> implementations of access_ok() and __{get,put}_kernel_nocheck().

Thanks for doing this.

Apart from the sparc64 issue with completely separate address spaces
(so access_ok() should always return true like Al pointed out), this
looks excellent to me.

Somebody should check that there aren't other cases like sparc64, but
let's merge this asap other than that.

              Linus

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
