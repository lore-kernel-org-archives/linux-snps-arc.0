Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD99EC5475B
	for <linux-snps-arc@archiver.kernel.org>; Wed,  6 Mar 2024 17:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V36VRzpGq/42D0EB7BO7G2T1ygg4uxV3nfgvpvnYU8U=; b=MMDSL+J9F9TLYZ
	nApBB25h/U3lh50RNQ2KrRT6TMnKOJCdODBmvwdbmSJARqkIMXx+ua18+cmgEm/SEQuEg9dzTw9wA
	AynmgApXvCLM+8hKFzkpuYbIl55SHg+4+3iD3uJsZz/27Y26QFt0HBl2HyrRJEZSiWVGfQhTlETQx
	ei1jSwaR7jZakYlsObR5Z+8qljVPsltaWg/9HfBhfLmh9uN5WiSzU6WrLRsz5XOBP6W3guPajoXh0
	6fjUcWuKwgOScdizgPj0STxldTN992CRC8lCLrqRx37g79S3gq/WW0nhNL7RRIKQAmiVFpj40HNHL
	+ZBGFSILDedNM7K8Iqgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhusG-00000001981-22DM;
	Wed, 06 Mar 2024 17:16:12 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhus8-0000000193p-0gqB;
	Wed, 06 Mar 2024 17:16:08 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1709745362;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bRnUqxYmz7US3PiJQqP3g2Rv7dTwvUQyVio9ZZY8LKI=;
	b=x/PfoZyLbxCtOLtwhNHZrAjQXk47NM0qm+OUuf1jx9diwAf0o8l0QrENFNc7WZ0SAcP2iu
	1E3xoLIGmEOu+hfn0K2lPNJvO3b46lm0DOxOiCCku7OS5SbvnNXS1k5nodzwqKqNeT+fYS
	RkGr9j0rFdgc3W9X3lUHXNB8NKrW75TUo1Im1jkI3tbQA3Xu8jc29FwyOiIOPW69kZ5gI2
	HFqFMyez91owlk6gDCMWjLsasDv2ZUcIrJ1LGI20cJzK1UAtbOHuYuAhisXVvC2Z9efSuo
	0ZgOB7XFUmDTVtjkDtaAS4S/3WfhiuenOt6DaTQZiQk6K2C7Z37rod5h/TSpug==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1709745362;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bRnUqxYmz7US3PiJQqP3g2Rv7dTwvUQyVio9ZZY8LKI=;
	b=LO7ZB53rWp+dyfEzJwj+/7uvMaejjC+uiKbRNMUR/894l60M5BZc+f+41YHx9zRBlkGwEN
	IuyIzAJJmTm/VdBw==
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
Subject: Re: [PATCH v2 2/3] arch: simplify architecture specific page size
 configuration
In-Reply-To: <20240306141453.3900574-3-arnd@kernel.org>
References: <20240306141453.3900574-1-arnd@kernel.org>
 <20240306141453.3900574-3-arnd@kernel.org>
Date: Wed, 06 Mar 2024 18:16:02 +0100
Message-ID: <8734t3uvql.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240306_091604_637734_09258BF9 
X-CRM114-Status: UNSURE (   7.65  )
X-CRM114-Notice: Please train this message.
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
> arc, arm64, parisc and powerpc all have their own Kconfig symbols
> in place of the common CONFIG_PAGE_SIZE_4KB symbols. Change these
> so the common symbols are the ones that are actually used, while
> leaving the arhcitecture specific ones as the user visible
> place for configuring it, to avoid breaking user configs.
>
> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu> (powerpc32)
> Acked-by: Catalin Marinas <catalin.marinas@arm.com>
> Acked-by: Helge Deller <deller@gmx.de> # parisc
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Thomas Gleixner <tglx@linutronix.de>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
