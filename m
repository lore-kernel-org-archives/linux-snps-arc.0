Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7014BC54E41
	for <linux-snps-arc@archiver.kernel.org>; Wed,  6 Mar 2024 17:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vPKVhZ6n5CJZKMhdmI7Nq5BOaHlAy3GhoguOWyX1jFA=; b=WOjbE3NFISzGUh
	HUlMOQgtFZsETj8He0Fh0FODOCqARhtBLSDWWlT5iQRSOK9hp3tY+X8xrAYGhCEnisGfxdb5RJgd4
	1PfMuAFLPK1DNHNczNXWDadEkoLNldjFQBPQbspe05Z9Y2GwRPpHG+yP1nz2Lx/2fLpoOCCzenNgl
	HlWyMMhfD+t69kBg0AdBD1c3br5+9N0eY8M81hez4fPi6P/1aUFfk446qVGZib38GAFYtnp4Jer2V
	UYcaVC0Qes5esUiZHMl1GFFwEnNCleAT2Mzyd+9oBWngvzp2DxTcxGRaNmOsHDb4aEziFvdzUAm/8
	c0V8GEC/aDcUbvyMNqGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhuu9-000000019qs-3cUV;
	Wed, 06 Mar 2024 17:18:09 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhuu0-000000019nd-3YEK;
	Wed, 06 Mar 2024 17:18:05 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1709745479;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/OQqHSSiFO9QvgB4mY2J+LyWd+etZHTC3EZIIQab4fo=;
	b=gDCCIQT1qxbWXTzhufSmoNS52MsO6T6khcDRU4R/DvjT4G7MoNh9Ky1nmGGMUA5kBJGmB5
	azsjDUOsuP8fnYd10g8AahY82D+0bOAV5U3WP5daAn+croDLWUY3Ux3Xh7i9JWhMGu7ILz
	CZx/MWC+XoyW1OE1/HgI9ImOzMQ3Hsu7ZGgFD0XsFBH1gJkU/OqCW7ZFdp75gTfSAIe5PP
	r0Jjoh6AeTDkw4LFACDFt43V3o5FzJyQ23zOJdJCOPm4FdIlpDNblApjxSKyFng8p2xu18
	6rz3+EZYW43r4daGc6RkeHzoLH9pHS88uirHCfRuC4FSfS7+MEcP8Bkyg26BgA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1709745479;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/OQqHSSiFO9QvgB4mY2J+LyWd+etZHTC3EZIIQab4fo=;
	b=Ba8NRrLO9SKa1kou0+rIbBztNEAwJsDv3WFMK2NllzRQnMhckZV3x6THtTFG81tO6REjSx
	6aQnDwMJIY/8bAAA==
To: Arnd Bergmann <arnd@kernel.org>, Anna-Maria Behnsen
 <anna-maria@linutronix.de>, Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Kees Cook <keescook@chromium.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Matt Turner <mattst88@gmail.com>, Vineet
 Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, Catalin
 Marinas <catalin.marinas@arm.com>, Guo Ren <guoren@kernel.org>, Brian Cain
 <bcain@quicinc.com>, Huacai Chen <chenhuacai@kernel.org>, Geert
 Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Helge Deller
 <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Palmer Dabbelt <palmer@dabbelt.com>, John
 Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Andreas Larsson
 <andreas@gaisler.com>, Richard Weinberger <richard@nod.at>,
 x86@kernel.org, Max Filippov <jcmvbkbc@gmail.com>, Andy Lutomirski
 <luto@kernel.org>, Jan Kiszka <jan.kiszka@siemens.com>, Kieran Bingham
 <kbingham@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-um@lists.infradead.org
Subject: Re: [v2 PATCH 0/3] arch: mm, vdso: consolidate PAGE_SIZE definition
In-Reply-To: <20240306141453.3900574-1-arnd@kernel.org>
References: <20240306141453.3900574-1-arnd@kernel.org>
Date: Wed, 06 Mar 2024 18:17:58 +0100
Message-ID: <87wmqfth2x.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240306_091801_053408_2438A941 
X-CRM114-Status: GOOD (  10.90  )
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

On Wed, Mar 06 2024 at 15:14, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> Naresh noticed that the newly added usage of the PAGE_SIZE macro in
> include/vdso/datapage.h introduced a build regression. I had an older
> patch that I revived to have this defined through Kconfig rather than
> through including asm/page.h, which is not allowed in vdso code.
>
> The vdso patch series now has a temporary workaround, but I still want to
> get this into v6.9 so we can place the hack with CONFIG_PAGE_SIZE
> in the vdso.

Thank you for cleaning this up!

      tglx

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
