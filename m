Return-Path: <SRS0=e49i=PO=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E15ADC433F5
	for <linux-snps-arc@archiver.kernel.org>; Tue, 26 Oct 2021 20:26:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69A1B61040
	for <linux-snps-arc@archiver.kernel.org>; Tue, 26 Oct 2021 20:26:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 69A1B61040
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=libc.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lnhNekEitH5IhPHVNiLeJVFzVR+8mo9dm2szi9gJua8=; b=2vk8+E1m0LGPxp
	zS4g8rs9j3ErJL1AxHjF6oaRcKlA4CzCD2KXJU7x1bhcd8RYLnRO366OiVAgdQGTj2cyzTwxP87jK
	K3KaUA9+zobNnakVu0AejWDEbmTcOslDgDtsByX6wX08AXv+DKBPFNOe8F/LPZDFu9ACilgzPmIPB
	QuYtZ3EAGnoNNl6xDMSXTERqKN71gpG4zwG5yfp336uS8sC08bXGq/VfSmniKriDumkaShjlNGVkU
	GIIc4FmjBP6iqtJrIPrJvWVeuJRjlFOavEUvNRCj9x+WXEQUvOqXGAftrdoNfK/hm2rB/Jep5PxX/
	hnR2Hx1zEac551lxhy2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfT1o-0030zm-SG; Tue, 26 Oct 2021 20:26:36 +0000
Received: from brightrain.aerifal.cx ([216.12.86.13])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfT1m-0030y4-7a
 for linux-snps-arc@lists.infradead.org; Tue, 26 Oct 2021 20:26:35 +0000
Date: Tue, 26 Oct 2021 16:26:27 -0400
From: Rich Felker <dalias@libc.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
 Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Jeff Dike <jdike@addtoit.com>, Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>,
 Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>,
 =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@collabora.com>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org
Subject: Re: [PATCH 2/2] futex: remove futex_cmpxchg detection
Message-ID: <20211026202625.GU7074@brightrain.aerifal.cx>
References: <20211026100432.1730393-1-arnd@kernel.org>
 <20211026100432.1730393-2-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211026100432.1730393-2-arnd@kernel.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_132634_512072_CDFC8AE5 
X-CRM114-Status: GOOD (  12.30  )
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

On Tue, Oct 26, 2021 at 12:03:48PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Now that all architectures have a working futex implementation
> in any configuration, remove the runtime detection code.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arc/Kconfig              |  1 -
>  arch/arm/Kconfig              |  1 -
>  arch/arm64/Kconfig            |  1 -
>  arch/csky/Kconfig             |  1 -
>  arch/m68k/Kconfig             |  1 -
>  arch/riscv/Kconfig            |  1 -
>  arch/s390/Kconfig             |  1 -
>  arch/sh/Kconfig               |  1 -
>  arch/um/Kconfig               |  1 -
>  arch/um/kernel/skas/uaccess.c |  1 -
>  arch/xtensa/Kconfig           |  1 -
>  init/Kconfig                  |  8 --------
>  kernel/futex/core.c           | 35 -----------------------------------
>  kernel/futex/futex.h          |  6 ------
>  kernel/futex/syscalls.c       | 22 ----------------------
>  15 files changed, 82 deletions(-)

Acked-by: Rich Felker <dalias@libc.org>


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
