Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1015AC4332F
	for <linux-snps-arc@archiver.kernel.org>; Wed,  8 Nov 2023 19:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+i6i3JjNDNF1toZPGkTtBPIQogwnFOWU8t2npNf2Xoc=; b=T0n3cjLPHJkCDG
	A/LrulluNDdvP17MttPz49+vkLATG4cwK7Xm38wDZPSyoJclMW7Ps7SbBEGHqaXhkH6sCLz8bQXof
	vPG/ilneyQJF/clDb46QlI0sjiUoiL7ZOP8lijO45Trva0ZFW2DgmTaA4oEovLE1Hqz62fA+5Q7A5
	spiSey/r1Th8XBQrlubUlhW6UeCaqUzM4L+2GfiE+3jto70s1faMt9kVKPZMQUgnkRAoBRtgH3m1v
	tx/duzKOWQMpbZxxkEY698uJwwxAFjDbT8377tSh5pal8uxk1Cs0jVy8oAzrCVnhkbd61Wl5LeaQK
	4C1R7kz+r7fk6c5BTSdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0nxH-004aRo-20;
	Wed, 08 Nov 2023 19:11:11 +0000
Received: from mailrelay2-1.pub.mailoutpod2-cph3.one.com ([2a02:2350:5:401::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0nxB-004aKy-2H
	for linux-snps-arc@lists.infradead.org;
	Wed, 08 Nov 2023 19:11:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=rsa2;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=t0PhdPpL9ITFkVHWShkqwebGTKveq1EAqYCULbPtu5I=;
	b=HOH6miiY3B+TPoRIYH1MiG21R2R+dh1yYG8FVwEQyDXIhn1Ao3kJLxPWfeHQZl9v5C+Z5Chab0l7C
	 HikW4LWGdU4we9PVHZJww6fDwD1yj+77Jj5I/65wiERNQSINaBzToUrUeOoJSPC/FGkywpiTFZYc/w
	 G5VUedzBJU7HvjvKlrHVnE6S2n/CsFEdiawBE7NIbof73jQYss2IVV4HvlcVLH+T8ZX3pzF6bx9t1o
	 bMg34L0eMDuXbRC6rLKy6PjcIUoJKPRTeePAKA2fUAAx68YXNhrJFCda5nk8ULj+i07dneXw+hSXiH
	 JNZyftfJd+q/T1+u1UqHapE9CdUwJnw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=ed2;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=t0PhdPpL9ITFkVHWShkqwebGTKveq1EAqYCULbPtu5I=;
	b=xWIbuz4e/7unjVoPKeu7dePVTkZEjAQgGTQa2oJ1BHdQOZexDAZtyLcvnX3YqDagH5rAul9U45aVe
	 EhYmmucCA==
X-HalOne-ID: 87baf6c1-7e6a-11ee-909c-a34c9b1f9040
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
	by mailrelay2 (Halon) with ESMTPSA
	id 87baf6c1-7e6a-11ee-909c-a34c9b1f9040;
	Wed, 08 Nov 2023 19:10:52 +0000 (UTC)
Date: Wed, 8 Nov 2023 20:10:50 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-kbuild@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Guo Ren <guoren@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Greg Ungerer <gerg@linux-m68k.org>, Michal Simek <monstr@monstr.eu>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Geoff Levand <geoff@infradead.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	"David S. Miller" <davem@davemloft.net>,
	Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, x86@kernel.org,
	Helge Deller <deller@gmx.de>,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Timur Tabi <timur@kernel.org>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	David Woodhouse <dwmw2@infradead.org>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>,
	Kees Cook <keescook@chromium.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
	netdev@vger.kernel.org, linux-parisc@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-bcachefs@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH 09/22] [v2] arch: fix asm-offsets.c building with
 -Wmissing-prototypes
Message-ID: <20231108191050.GA171153@ravnborg.org>
References: <20231108125843.3806765-1-arnd@kernel.org>
 <20231108125843.3806765-10-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231108125843.3806765-10-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231108_111107_310935_321CD2BD 
X-CRM114-Status: GOOD (  15.27  )
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

On Wed, Nov 08, 2023 at 01:58:30PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> When -Wmissing-prototypes is enabled, the some asm-offsets.c files fail
> to build, even when this warning is disabled in the Makefile for normal
> files:
> 
> arch/sparc/kernel/asm-offsets.c:22:5: error: no previous prototype for 'sparc32_foo' [-Werror=missing-prototypes]
> arch/sparc/kernel/asm-offsets.c:48:5: error: no previous prototype for 'foo' [-Werror=missing-prototypes]
> 
> Address this by making use of the same trick as x86, marking these
> functions as 'static __used' to avoid the need for a prototype
> by not drop them in dead-code elimination.
> 
> Suggested-by: Masahiro Yamada <masahiroy@kernel.org>
> Link: https://lore.kernel.org/lkml/CAK7LNARfEmFk0Du4Hed19eX_G6tUC5wG0zP+L1AyvdpOF4ybXQ@mail.gmail.com/
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Looks good. I sometimes looks at sparc patches so I looked at this one.
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
