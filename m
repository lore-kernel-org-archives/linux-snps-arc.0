Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DEB8C43458
	for <linux-snps-arc@archiver.kernel.org>; Wed,  8 Jul 2026 21:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lux9i502yb9psaHRgyZ+yWjrxGDaAH6on8xZQsHiUgI=; b=lt5m+T6uYiMbep
	ItieAnrNDX2F2bg6ADVohuxtln52gLQDbBMXRbsbxuqrEww4D69CAZj2Rab4vXtac0d9lA7xiR0+C
	hSz3qfLBpcZ7/3qwwzpF4Uw9n4D9LLQ/trkESXZjzXs1mwM9twaUYYr3KrfqSnkPnLfQVgXB3dHnp
	XA2pFvfsdeNjuRaYG8RaYGJE6eVKanbtBD6HQTSIbHRGLQ/fw4wY11oJ2UpIEQsZgSE9/QTLfs6Pd
	gVcq6I8CCrvPrbMf9YyXG966AYm2Q2nzX3JhFfraaawTtkzdkJGqWuK3ufRviIo9SCspj6ylcmGrR
	UZeIlCWcpd6Pp+h/249Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wha9b-00000000T5m-0w2B;
	Wed, 08 Jul 2026 21:50:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wha9Z-00000000T5E-1EW5;
	Wed, 08 Jul 2026 21:50:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B674B42B57;
	Wed,  8 Jul 2026 21:50:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6ADD1F000E9;
	Wed,  8 Jul 2026 21:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783547400;
	bh=vmuHxwYgqm1gQOMh7c/wvEC96VXO05kzD/lM2vW9atQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=LQXgoHnJBN1jyue5u35c/dE+tvbdFa3zUViq7zqGblJh/ZruG6J0COcocKehdLFfd
	 4xXw/bCoVIbrdpJZ1yxvDgT9U95yzkk950wT9I897knLqsLOwWpBR6zC0Wl0OmKtGN
	 qA7xvyVuCxc36Uggfu07lBhQDGgG4EE5F0SW1Nvv4sJgy854Xef255mh0e3TvqBF2r
	 SBr4Ish5mjPGiV3ozZVjDpPopq53Klt37AdVF1ulSRh47ns0ya3XPMuPgRNdRIF3jm
	 1AeWmFDRhRZWLT6auHwI3KvNlkgzOBPY9SYSho4DzEN/jTu7kl2ls2cvpTtmqLBfh9
	 CtbtIsoeAAukg==
From: Thomas Gleixner <tglx@kernel.org>
To: Oleg Nesterov <oleg@redhat.com>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>, LKML
 <linux-kernel@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Mark Rutland <mark.rutland@arm.com>, Kees Cook <kees@kernel.org>, Andy
 Lutomirski <luto@kernel.org>, Richard Henderson
 <richard.henderson@linaro.org>, Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Guo Ren <guoren@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, Helge Deller <deller@gmx.de>, Yoshinori Sato
 <ysato@users.sourceforge.jp>, Richard Weinberger <richard@nod.at>, Chris
 Zankel <chris@zankel.net>, linux-arm-kernel@lists.infradead.org,
 linux-alpha@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-um@lists.infradead.org, Michael Ellerman <mpe@ellerman.id.au>,
 Shrikanth Hegde <sshegde@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, Paul
 Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, Sven Schnelle <svens@linux.ibm.com>,
 linux-s390@vger.kernel.org, x86@kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Vineet Gupta <vgupta@kernel.org>, Will Deacon <will@kernel.org>, Brian
 Cain <bcain@kernel.org>, Michal Simek <monstr@monstr.eu>, Dinh Nguyen
 <dinguyen@kernel.org>, "David S. Miller" <davem@davemloft.net>, Andreas
 Larsson <andreas@gaisler.com>, linux-snps-arc@lists.infradead.org,
 linux-hexagon@vger.kernel.org, linux-openrisc@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-arch@vger.kernel.org, Michal
 =?utf-8?Q?Such=C3=A1nek?=
 <msuchanek@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org
Subject: Re: [patch 11/18] seccomp, treewide: Rename and convert
 __secure_computing() to return boolean
In-Reply-To: <ak51A77h1YRIl5tz@redhat.com>
References: <20260707181957.433213175@kernel.org>
 <20260707190254.230735780@kernel.org>
 <2e6ed364-ce8f-4b4b-8675-acd07f140f4f@huawei.com> <871pddsuzl.ffs@fw13>
 <ak51A77h1YRIl5tz@redhat.com>
Date: Wed, 08 Jul 2026 23:49:57 +0200
Message-ID: <87pl0xqhh6.ffs@fw13>
MIME-Version: 1.0
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

On Wed, Jul 08 2026 at 18:04, Oleg Nesterov wrote:
> On 07/08, Thomas Gleixner wrote:
>>
>> On Wed, Jul 08 2026 at 09:43, Jinjie Ruan wrote:
>> >
>> > The return value of __seccomp_filter is checked in the wrong way, check
>> > -1 should be replaced with check false, maybe:
>> >
>> > -               if (__seccomp_filter(this_syscall, true))
>> > -                       return -1;
>> > +               if (!__seccomp_filter(this_syscall, true))
>> > +                       return false;
>
> Or simply
>
> 	return __seccomp_filter(this_syscall, true);
>
> and remove "return true" below ?

Duh. Obvious now that you point it out :)

> Either way, I personally like this change, I was always confused by these -1's.

Welcome to the club!

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
