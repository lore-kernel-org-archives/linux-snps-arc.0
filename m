Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D12FC48BF6
	for <linux-snps-arc@archiver.kernel.org>; Thu,  7 Mar 2024 12:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aChLhcX1fJEscNfJvgi8aKMhnUudxxHv29KeChSHSNQ=; b=4JLZXZI/pSli8B
	CEUWSPUPKJ35GbZSZw7Jc1yu6+NxbADstF4Y7V0yVlDQiTCbwmglTbo4s3VyugeRN/v2foRZ28ftk
	/BA6PjJ0xlJjXKsvY2DqRGHxjC51lCmmNq12FmBQ2UwXXqNs+UwXT1IndKUP/vdVD96rPvtAKmEVu
	fEQLs/65seAZuwGYQd3MnFSLstVWlXKGS487h2gR9rIw4oY4wBHc495DhYsOCuN9NMPL2bgfzU1ls
	vVSRy909h2jUbDsn8+yrwbqtyL2TOoDNJgTsab7x5NkIrgg8abdSqNpgZHAbgayIfc9jsP3xWckXP
	Ter2mSAIymJJflNxdjbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riCx0-00000004aDb-0hcR;
	Thu, 07 Mar 2024 12:34:18 +0000
Received: from gandalf.ozlabs.org ([150.107.74.76])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riCwv-00000004aC1-1mz0;
	Thu, 07 Mar 2024 12:34:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1709814848;
	bh=5GCSx/SWwEQN6H1v+rlc6aQIECBTZdtYZCIuJdaUGZc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=m2hV8+UzshtbVo1SMQpGCIZAVMu9h2hQvtpDC9CkF6Ead01MUqjonBYL92rbYu9o5
	 eONdwUL5JV+qzsPtqxYxcbEZTnxik/VNQnkbfcaMbISw7CbDppUAmAH/9P3sku/f8b
	 i2LMQgXCW1DJms0NeuRTzJ0tBX4bUIMqKowAPBctWZSTjYyNqR0YILGQIfrcB30lQJ
	 AxLogULtOaYvLPcYayeLz0xu9HzQh3oaG4608ibo49kkmjQLQ5CoPOkqEhC/05rYgX
	 JxgCpZfY9Df2KdR0oUWson/F66hS7hXm3iPnnhME1f/unkDf0IfUz0QTmy9qELYv1z
	 htVjJ1WY+KwZQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Tr7yd1VsMz4wc8;
	Thu,  7 Mar 2024 23:34:01 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Arnd Bergmann <arnd@kernel.org>, Anna-Maria Behnsen
 <anna-maria@linutronix.de>, Thomas Gleixner <tglx@linutronix.de>, Vincenzo
 Frascino <vincenzo.frascino@arm.com>, Kees Cook <keescook@chromium.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Matt Turner <mattst88@gmail.com>, Vineet
 Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, Catalin
 Marinas <catalin.marinas@arm.com>, Guo Ren <guoren@kernel.org>, Brian Cain
 <bcain@quicinc.com>, Huacai Chen <chenhuacai@kernel.org>, Geert
 Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Helge Deller
 <deller@gmx.de>, Christophe Leroy <christophe.leroy@csgroup.eu>, Palmer
 Dabbelt <palmer@dabbelt.com>, John Paul Adrian Glaubitz
 <glaubitz@physik.fu-berlin.de>, Andreas Larsson <andreas@gaisler.com>,
 Richard Weinberger <richard@nod.at>, x86@kernel.org, Max Filippov
 <jcmvbkbc@gmail.com>, Andy Lutomirski <luto@kernel.org>, Jan Kiszka
 <jan.kiszka@siemens.com>, Kieran Bingham <kbingham@kernel.org>, Andrew
 Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-um@lists.infradead.org
Subject: Re: [PATCH v2 2/3] arch: simplify architecture specific page size
 configuration
In-Reply-To: <20240306141453.3900574-3-arnd@kernel.org>
References: <20240306141453.3900574-1-arnd@kernel.org>
 <20240306141453.3900574-3-arnd@kernel.org>
Date: Thu, 07 Mar 2024 23:34:00 +1100
Message-ID: <878r2unruv.fsf@mail.lhotse>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240307_043414_008002_F40D317B 
X-CRM114-Status: GOOD (  10.38  )
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

Arnd Bergmann <arnd@kernel.org> writes:
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
> ---
> No changes from v1
>
>  arch/arc/Kconfig                  |  3 +++
>  arch/arc/include/uapi/asm/page.h  |  6 ++----
>  arch/arm64/Kconfig                | 29 +++++++++++++----------------
>  arch/arm64/include/asm/page-def.h |  2 +-
>  arch/parisc/Kconfig               |  3 +++
>  arch/parisc/include/asm/page.h    | 10 +---------
>  arch/powerpc/Kconfig              | 31 ++++++-------------------------
>  arch/powerpc/include/asm/page.h   |  2 +-
>  scripts/gdb/linux/constants.py.in |  2 +-
>  scripts/gdb/linux/mm.py           |  2 +-
>  10 files changed, 32 insertions(+), 58 deletions(-)

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
