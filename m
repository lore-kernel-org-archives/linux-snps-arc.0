Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFB2DC46467
	for <linux-snps-arc@archiver.kernel.org>; Fri, 18 Feb 2022 18:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+Mq2+HprDAI52RbE6OToytBDdtYZauNwWDkkl6rXN7c=; b=2cqGfbWeP5ay+H
	X+rgbq/QEWOyrJmmg4eCYFwiwyjuiBZs2NOaeSYP+DX98pemdO3WKLACdHNO4Q9dJCobTHzB5O7tL
	65/87el3/LRlGXkZVbV5JHUf+5xMep8XMFrs5wat4ohbMgtFxhcxr5cm2/0COS4gI9l8fezHLX2CU
	SJuGjRkxT7nVbMe2NXc0ni6P2Lfe2p1p9QKaptoUPvCYoJXsywiy4uf2TL+v54xPOsnv4jYhM2le0
	Khg0kjLkjkYEom3+dTNJyCdoCG3Q0h4HWutMFgkFaos3meYEKv9TdXtW0uR3gHXEbxRiPmaha1M+n
	UvY5pYafk57RTZkNm3Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nL7f8-00FSgd-VV; Fri, 18 Feb 2022 18:07:22 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nL7f6-00FSee-Os
 for linux-snps-arc@lists.infradead.org; Fri, 18 Feb 2022 18:07:22 +0000
Received: by mail-ed1-x531.google.com with SMTP id m3so10854377eda.10
 for <linux-snps-arc@lists.infradead.org>; Fri, 18 Feb 2022 10:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amacapital-net.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3DIqXxPmp6dtbTijOx2KTFQ/AdtfYUTWecKVh7q3dDI=;
 b=5c/qRto3YK3Y6/Rhnnpp4RzKmf8QhiKseObhkqXIpnLfhpnv2ua8Z7YCExbmjSYUCG
 SbBSycxSpm4FRe5zOaxst92xyRDLRie0B4d4p8x0W6snNr+dG6MghxLfcakTWMQA17Pf
 gOp7JS9gIpdJumtDaMv9IluyX8dB5LI5eLR/YC2U+D7T5N3aQr9NOYHAOP982E02xanw
 SC1uTLhbyKEp3+LiMa1bFSquyveVGLxTCPf/eSvmTiEZzxEI+wIe4AMdv5VgRD2GYf6G
 kO3gnVVxKK1wWuKxjcQ5nhLyDgmj/c1nxTJoqfRQTmuVCBNlEZ4IpVOo74LURbiOVsEg
 CBWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3DIqXxPmp6dtbTijOx2KTFQ/AdtfYUTWecKVh7q3dDI=;
 b=ODTEgMEx5JVvdCsvITLN/nqK92o4gGxwqdsOWX7Lf/JIWJZ+MaC+GO6+cvkKq7IfJO
 lIJ4Wmq2bWoFFXaNmz2Mn0M5VPuCHRmqzYd5p4OxU/+tq2rZlQJm2odloxbPTlXhzkLJ
 I2REIfgZthZ5HorsQSPU0Wg02qDmlrjSGr0lzFXp0j5k+sTfneNf/4XiUWFNkfGWbBTS
 sjjrWBYHbpOn+x1bdw8EzmQjWZANM25R1pHOsF+cJ44z9vlaL3+n2yJ9DHdR9LNrwX7a
 Yx2dg5iJIjwWDO2Z5jMHI4C62GfTjST4+WagWUmtKZhL+L8kfjsHnPoKle+WN9afScb5
 9dpQ==
X-Gm-Message-State: AOAM5327SOrF95TChdaBXYQDx6sBr5VjIzFJAxBM5Wg2HLktA+DKjOxn
 JkCurIMjwnO95bkIFKn/lxQser+uTMzXrbL7Uro2Bg==
X-Google-Smtp-Source: ABdhPJzKi9/dAquBFvy+ZlpESpcVBT1I3X4XtLJClo2SaEqFpqb8kdqwnL9Fphl8e/qcsjqeDfp/tX4JIrAspWajnck=
X-Received: by 2002:a05:6402:430f:b0:410:a082:c6da with SMTP id
 m15-20020a056402430f00b00410a082c6damr9386454edc.438.1645207638871; Fri, 18
 Feb 2022 10:07:18 -0800 (PST)
MIME-Version: 1.0
References: <20220216131332.1489939-1-arnd@kernel.org>
 <20220216131332.1489939-14-arnd@kernel.org>
 <CALCETrVOvYPN4_6hS8wpm2v9bGZupZ5x4=vZAseG57OUgvLGfw@mail.gmail.com>
 <93a1ee797e9d4f789dff85a3c0f0c232@AcuMS.aculab.com>
In-Reply-To: <93a1ee797e9d4f789dff85a3c0f0c232@AcuMS.aculab.com>
From: Andy Lutomirski <luto@amacapital.net>
Date: Fri, 18 Feb 2022 10:07:07 -0800
Message-ID: <CALCETrWTB65vJXsQTPd_o7BRoSU=uqD0pFzKS+r4YgDuiCCqaQ@mail.gmail.com>
Subject: Re: [PATCH v2 13/18] uaccess: generalize access_ok()
To: David Laight <David.Laight@aculab.com>
Cc: Arnd Bergmann <arnd@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, 
 Christoph Hellwig <hch@lst.de>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>, 
 "linux-mm@kvack.org" <linux-mm@kvack.org>, 
 "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>,
 "arnd@arndb.de" <arnd@arndb.de>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>, 
 "will@kernel.org" <will@kernel.org>, "guoren@kernel.org" <guoren@kernel.org>, 
 "bcain@codeaurora.org" <bcain@codeaurora.org>,
 "geert@linux-m68k.org" <geert@linux-m68k.org>, 
 "monstr@monstr.eu" <monstr@monstr.eu>,
 "tsbogend@alpha.franken.de" <tsbogend@alpha.franken.de>, 
 "nickhu@andestech.com" <nickhu@andestech.com>,
 "green.hu@gmail.com" <green.hu@gmail.com>, 
 "dinguyen@kernel.org" <dinguyen@kernel.org>,
 "shorne@gmail.com" <shorne@gmail.com>, "deller@gmx.de" <deller@gmx.de>, 
 "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
 "peterz@infradead.org" <peterz@infradead.org>, 
 "mingo@redhat.com" <mingo@redhat.com>,
 "mark.rutland@arm.com" <mark.rutland@arm.com>, 
 "hca@linux.ibm.com" <hca@linux.ibm.com>, "dalias@libc.org" <dalias@libc.org>, 
 "davem@davemloft.net" <davem@davemloft.net>, "richard@nod.at" <richard@nod.at>,
 "x86@kernel.org" <x86@kernel.org>, 
 "jcmvbkbc@gmail.com" <jcmvbkbc@gmail.com>,
 "ebiederm@xmission.com" <ebiederm@xmission.com>, 
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "ardb@kernel.org" <ardb@kernel.org>, 
 "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>, 
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>, 
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, 
 "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>, 
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, 
 "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>, 
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, 
 "openrisc@lists.librecores.org" <openrisc@lists.librecores.org>, 
 "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, 
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, 
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, 
 "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, 
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, 
 "linux-um@lists.infradead.org" <linux-um@lists.infradead.org>, 
 "linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220218_100720_906687_4B1CF29B 
X-CRM114-Status: GOOD (  23.71  )
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

On Fri, Feb 18, 2022 at 1:30 AM David Laight <David.Laight@aculab.com> wrote:
>
> From: Andy Lutomirski
> > Sent: 17 February 2022 19:15
> ...
> > This isn't actually optimal.  On x86, TASK_SIZE_MAX is a bizarre
> > constant that has a very specific value to work around a bug^Wdesign
> > error^Wfeature of Intel CPUs.  TASK_SIZE_MAX is the maximum address at
> > which userspace is permitted to allocate memory, but there is a huge
> > gap between user and kernel addresses, and any value in the gap would
> > be adequate for the comparison.  If we wanted to optimize this, simply
> > checking the high bit (which x86 can do without any immediate
> > constants at all) would be sufficient and, for an access known to fit
> > in 32 bits, one could get even fancier and completely ignore the size
> > of the access.  (For accesses not known to fit in 32 bits, I suspect
> > some creativity could still come up with a construction that's
> > substantially faster than the one in your patch.)
> >
> > So there's plenty of room for optimization here.
> >
> > (This is not in any respect a NAK -- it's just an observation that
> > this could be even better.)
>
> For 64bit arch that use the top bit to separate user/kernel
> you can test '(addr | size) >> 62)'.
> The compiler optimises out constant sizes.
>
> This has all been mentioned a lot of times.
> You do get different fault types.
>
> OTOH an explicit check for constant size (less than something big)
> can use the cheaper test of the sign bit.
> Big constant sizes could be compile time errors.

The different fault type issue may well be a real problem.  Right now
the core x86 fault code reserves the right to grouch if we get #GP
instead of #PF.  We could change that.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
