Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A70CFC433F5
	for <linux-snps-arc@archiver.kernel.org>; Thu, 17 Feb 2022 07:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=93+NX0y5EDNbo1HDX0DGGJL/m/Lm2C8jb9h812314Ek=; b=04t7WuAAxLDjqV
	Vkmo4X0Httyo06p0fxkqvH3KOo2/mq+lbuctGjf6Vf03Z6T6esRCJ2SUvvMmUqp2t/d9XDf5d4Fy1
	EcCCgQ8qrAzxuR1g32cBuQF/2TSZEv1QMANFAivOd881h0Lkh4BtKNCUbV/Xe7fboeGRwFLPsCSgR
	aRwTA/xrPJcwWeOOCWr5joIiKkqGx6Mu0WT2IMiRAm5YjFcj2r2PTZqYKyL90CCwPwkRoY0bttveS
	giwIB7TcwuekmkGdgxjJJEJ9YuKWBtRgzKNr7qGUWwHDAFXz22e/SWXQ4RazvpkLUAywZg0lh/2JR
	XIZSkh92ReppfgeHj0oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKbb4-009HBZ-R6; Thu, 17 Feb 2022 07:53:02 +0000
Received: from mout.kundenserver.de ([212.227.126.133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKbaz-009H9C-Th; Thu, 17 Feb 2022 07:52:59 +0000
Received: from mail-wr1-f44.google.com ([209.85.221.44]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MMH2M-1nbZwn2eBC-00JJfv; Thu, 17 Feb 2022 08:52:55 +0100
Received: by mail-wr1-f44.google.com with SMTP id u1so7416955wrg.11;
 Wed, 16 Feb 2022 23:52:55 -0800 (PST)
X-Gm-Message-State: AOAM531cmP1ahlfjBhF3Kt+v1RLCE/kPgGnJ3ivWS/eyeqj1ecS8sF8H
 9lO8jv/1mW6GW1bodWoF7CP4y+8nb4HR7Z1+wEs=
X-Google-Smtp-Source: ABdhPJwQLFNR2EKsG8wmZOAHPh9E9pyoICR3LxZT862dIjr2W4W3Sw6yF+ayzR5i5e/QGR8IN4+3KhdYVHoGFF4fNyc=
X-Received: by 2002:adf:ea01:0:b0:1e4:b3e6:1f52 with SMTP id
 q1-20020adfea01000000b001e4b3e61f52mr1268592wrm.317.1645084364936; Wed, 16
 Feb 2022 23:52:44 -0800 (PST)
MIME-Version: 1.0
References: <20220216131332.1489939-1-arnd@kernel.org>
 <20220216131332.1489939-14-arnd@kernel.org>
In-Reply-To: <20220216131332.1489939-14-arnd@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 17 Feb 2022 08:52:29 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2T1Xr80GeM-3p1riyq=gKDJGeKVz_c5=r5=s14tXimLw@mail.gmail.com>
Message-ID: <CAK8P3a2T1Xr80GeM-3p1riyq=gKDJGeKVz_c5=r5=s14tXimLw@mail.gmail.com>
Subject: Re: [PATCH v2 13/18] uaccess: generalize access_ok()
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>, 
 linux-arch <linux-arch@vger.kernel.org>, Linux-MM <linux-mm@kvack.org>, 
 Linux API <linux-api@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Al Viro <viro@zeniv.linux.org.uk>
Cc: Russell King - ARM Linux <linux@armlinux.org.uk>,
 Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, 
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
X-Provags-ID: V03:K1:HHb4mXWIKom7XziiJa0+hDg2eyAtY9Ndl1+s2UBdn8VbuXT4C9L
 TRmVYdj3eadPIck81B59kBML9qr0OvRfge86FxVZJA74K6BHhwM/nV4JrR7Y9Aw1rmDvRgf
 +ZB8UdufGSrDGmuMqRmxPB9rRGoxwUTkLwgXAUQUn4UqIcFmhxEQ9Qe/H7rPp5/+701iaS0
 /7FYnKLKXQTkz+8jRXfpQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:vhg5PTDSo78=:Ksuns6hik6DUVcCrL85P9M
 jvHbjTWvs5Bslac72B2XbjcXlqOkd71GLm2/njmGVizGTREYwYmApxb996LnGJKe9ssOYKABn
 HXaosl5Ie88Jgrhjwc2hal0FCSoky9r8J89WC9Fg7GNOPIcoQkHZKQ7Ps5El9UmiGpP42rLjK
 hVJ7wDdRuWE+vtuxV/GYEj6bIaCv+wdtVvgDu9WZWPSUUbyPgRsul9k3+FXnw4HYZgqgxwX9O
 d1g4LSfTF1Ekv74Y2fF5rhspwqn7R9V+0B3H3UzHn0EuL5Yj7o5091Svw6RPnZVnIaIZcb4xb
 +UPkZycNu7RfUSm60tHo71vsJ+3jLS3//pghAra/OxHwAue7eX0g316CK8/DYxYhdI0u4BOGZ
 oY8gSvUYWbEyKgVcJfvKIzJVJCwDzxsS9/z7zKxhYuBiXyCUtz0JserdUu3Oacxw0jl+jeoBr
 fZP4ZNKt0L6fx3AUeUIi4Oy9GUeIEqUlYv8LR8Dqw5PMROXBfrlu0w8SUGdZK3ODP0tGZkz4U
 ptyuq2KS4ukl6Rfcfrgb95jiV14e/D0FsmiIVAfaiy1Qj7RvcdLZ/BJ0U66QUtOdgCUcT2Sy+
 mD/nxHbroS1S1EcfZUlESp3bBMrB8H9TegXCD20l6nXPdrmx4VvcV4ONBxcLF0HU9vE5IeVH9
 wVJ3bPN2pTZZu26SAYBl0HYasTHjOsRzVwznldIyHNs2t4dBLjVbpiQTHHDYagOaOTNC8Cyz6
 ws5xjzjIHwFmwECJP8XD9mXBXlO/CrdQjHV7Fydo3KoHf/5mvPrz3hTWOLvBc/f+in6FdGkHY
 lxZflnvqhapwcTptzliWxFdKojDWjBYlGP8QkhjHJAKhPr9kg8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220216_235258_259100_E47C0CF3 
X-CRM114-Status: GOOD (  14.14  )
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

On Wed, Feb 16, 2022 at 2:13 PM Arnd Bergmann <arnd@kernel.org> wrote:

> + * limit and catch all possible overflows.
> + * On architectures with separate user address space (m68k, s390, parisc,
> + * sparc64) or those without an MMU, this should always return true.
...
> +static inline int __access_ok(const void __user *ptr, unsigned long size)
> +{
> +       unsigned long limit = user_addr_max();
> +       unsigned long addr = (unsigned long)ptr;
> +
> +       if (IS_ENABLED(CONFIG_ALTERNATE_USER_ADDRESS_SPACE))
> +               return true;

I noticed that I'm missing the check for !CONFIG_MMU here, despite
mentioning that in the comment above it. I've added it now.

        Arnd

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
