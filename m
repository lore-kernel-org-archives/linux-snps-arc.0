Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCB95C77B75
	for <linux-snps-arc@archiver.kernel.org>; Tue, 16 May 2023 00:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NU9p5j+Zv1iXcqfRnP7ksR9nItwPVHgK2Hxfw6f4u5Y=; b=1DejcPYjjwV4O4
	kW05EMlPlwD5LxfwpD3IkJ45habpesSHaUUUTqhAS2fiyzAuBsvWRzg3cwKCE8F+Kz8R2Lcj2LlBT
	ld4AParEHxg0Kqg4nliBt5BG+qrwCQm6xoBeiY8PyCz/oF+cHHYBxW8+mSs3OTJ7RqmNsCjUPx+UQ
	3a0RaNqX9vukIsx2qkuwYewbV3vaO59T3CabeGHs9AzKQ1PDF7p9rGPxudcsjkAW44erNCLD/jxxh
	2UFHl9UPfFOnxg+qQHgsWyfok31GvwE3xHY6DySK5hiZbXmznYh5Jbyk2LmGwKUo44D4roQ5HTuwB
	wgb9RaXVk51obdqG6yDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyiwu-003zMZ-1T;
	Tue, 16 May 2023 00:53:56 +0000
Received: from angie.orcam.me.uk ([2001:4190:8020::34])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyiwp-003zLB-1o;
	Tue, 16 May 2023 00:53:53 +0000
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 9D7EE92009C; Tue, 16 May 2023 02:53:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 9709492009B;
	Tue, 16 May 2023 01:53:45 +0100 (BST)
Date: Tue, 16 May 2023 01:53:45 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
cc: Greg KH <gregkh@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>, 
    Richard Henderson <richard.henderson@linaro.org>, 
    Ivan Kokshaysky <ink@jurassic.park.msu.ru>, 
    Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>, 
    Russell King <linux@armlinux.org.uk>, 
    Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
    Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
    Geert Uytterhoeven <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, 
    Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, 
    Nicholas Piggin <npiggin@gmail.com>, 
    Christophe Leroy <christophe.leroy@csgroup.eu>, 
    Paul Walmsley <paul.walmsley@sifive.com>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
    Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
    Alexander Gordeev <agordeev@linux.ibm.com>, 
    Christian Borntraeger <borntraeger@linux.ibm.com>, 
    Sven Schnelle <svens@linux.ibm.com>, 
    Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
    "David S . Miller" <davem@davemloft.net>, 
    Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
    Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
    x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>, 
    Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, 
    Arnd Bergmann <arnd@arndb.de>, linux-doc@vger.kernel.org, 
    linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, 
    linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
    linux-ia64@vger.kernel.org, loongarch@lists.linux.dev, 
    linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
    linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
    linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
    linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
    linux-xtensa@linux-xtensa.org, linux-arch@vger.kernel.org, 
    Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: [PATCH v5 14/26] alpha: Remove empty <uapi/asm/setup.h>
In-Reply-To: <20230306100508.1171812-15-alexghiti@rivosinc.com>
Message-ID: <alpine.DEB.2.21.2305160147100.11892@angie.orcam.me.uk>
References: <20230306100508.1171812-1-alexghiti@rivosinc.com> <20230306100508.1171812-15-alexghiti@rivosinc.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230515_175351_785302_B84AC354 
X-CRM114-Status: GOOD (  11.21  )
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

On Mon, 6 Mar 2023, Alexandre Ghiti wrote:

> diff --git a/arch/alpha/include/uapi/asm/setup.h b/arch/alpha/include/uapi/asm/setup.h
> deleted file mode 100644
> index 9b3b5ba39b1d..000000000000
> --- a/arch/alpha/include/uapi/asm/setup.h
> +++ /dev/null
> @@ -1,5 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> -#ifndef _UAPI__ALPHA_SETUP_H
> -#define _UAPI__ALPHA_SETUP_H
> -
> -#endif /* _UAPI__ALPHA_SETUP_H */

 You can't just remove a UAPI header like this, something will break; cf. 
arch/arc/include/uapi/asm/setup.h, or arch/x86/include/uapi/asm/setup.h if 
you want it brief.

 I suggest that you fold it into 01/26 (it makes no sense to have empty 
multiple inclusion protection), and likewise for the relevant remaining 
headers.

  Maciej

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
