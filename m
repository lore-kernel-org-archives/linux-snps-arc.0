Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 872F7C3DA7F
	for <linux-snps-arc@archiver.kernel.org>; Mon,  5 Aug 2024 20:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f24PcZ3ADzYDLJ27H1W9283ZYMutpWJWSZ0NkImW+kk=; b=btLrb1wtWX6PTc
	z3S++AOFsFbLr7aagDp8XXqVwUIrCgz+8thLnH9xzFsRQSa8NCYUd9Eonw+rH+uDnwKDHmNFzIFnF
	pcYFOqd+BD0SPrFLLtS2BZh6mzlajNPdgvlFBuortWoJRqaDpU4QaeTdy2h9dTdEPtW9b9YZ1/gWU
	FN4wcye3bp+W033hDYiZaqqk9z8YErwDKJXTJNjz0yEJYlwZVSSNLa88iRWEndbEFriRuIFIsB/S4
	V6toq7CBWNF2pbA6ITUx9VvOczOwLRV3MDNlY2u1BxJ3Fwy/woIq350x7pa/SPDI6KmJw1xjENeSs
	iuMMmb2+YjczL2L53caQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sb45u-0000000H98K-3JnB;
	Mon, 05 Aug 2024 20:14:15 +0000
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sb45s-0000000H95V-0oNk
	for linux-snps-arc@lists.infradead.org;
	Mon, 05 Aug 2024 20:14:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Iizmzgk6nde+kNgm78UgLxyes+gJTtndfv7UsiQEdyk=; t=1722888852; x=1723493652; 
	b=O+nZj/oikOtgZEok+XT3CTFfsSi+/zjaLjhDREB6VNIciB2bAkNpQ6OLRC5u3s7V5o2xbwzqZlQ
	txcNDVQT45tWxRamFL8HBflHWjQw/11/iprZCKeLLkzU0mYO87wVDxInRht7XkGVS6SQ5C65vpcGM
	N5e5it27y3abBZNmmdcD79QZL/jx8c8S4jSR4w+nA4eFFbHkrfe1as5r8/kLrifeKUCIdcLRozmYP
	qzDwOS/AiIWs1xEoaCadsVGhWFmEgpIb4Utn+2JqJ/9jbXTK+f599w9m96oXIqmKlhIcqZmjG5uF+
	c49L/ArwSxBUjeUHt01EvbB1ekQ3YDQGC9aA==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1sb45L-000000010l0-3XFZ; Mon, 05 Aug 2024 22:13:39 +0200
Received: from p5b13a2bf.dip0.t-ipconnect.de ([91.19.162.191] helo=suse-laptop.fritz.box)
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1sb45L-00000000u2V-2Vas; Mon, 05 Aug 2024 22:13:39 +0200
Message-ID: <d36d1c197bed83f91299e5cf211ecc4169d3b7a1.camel@physik.fu-berlin.de>
Subject: Re: [PATCH cmpxchg 3/3] sh: Emulate one-byte cmpxchg
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: "Paul E. McKenney" <paulmck@kernel.org>, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: elver@google.com, akpm@linux-foundation.org, tglx@linutronix.de, 
	peterz@infradead.org, torvalds@linux-foundation.org, arnd@arndb.de, 
	geert@linux-m68k.org, palmer@rivosinc.com, mhiramat@kernel.org, 
	linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org, Andi Shyti
	 <andi.shyti@linux.intel.com>
Date: Mon, 05 Aug 2024 22:13:38 +0200
In-Reply-To: <20240805192119.56816-3-paulmck@kernel.org>
References: <c1b7f3a2-da50-4dfb-af6f-a1898eaf2b79@paulmck-laptop>
	 <20240805192119.56816-3-paulmck@kernel.org>
User-Agent: Evolution 3.52.3 
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 91.19.162.191
X-ZEDAT-Hint: PO
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240805_131412_389201_63387E9B 
X-CRM114-Status: GOOD (  13.69  )
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

On Mon, 2024-08-05 at 12:21 -0700, Paul E. McKenney wrote:
> Use the new cmpxchg_emu_u8() to emulate one-byte cmpxchg() on sh.
> 
> [ paulmck: Drop two-byte support per Arnd Bergmann feedback. ]
> [ paulmck: Apply feedback from Naresh Kamboju. ]
> [ Apply Geert Uytterhoeven feedback. ]
> 
> Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Palmer Dabbelt <palmer@rivosinc.com>
> Cc: Masami Hiramatsu <mhiramat@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: <linux-sh@vger.kernel.org>
> ---
>  arch/sh/Kconfig               | 1 +
>  arch/sh/include/asm/cmpxchg.h | 3 +++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/arch/sh/Kconfig b/arch/sh/Kconfig
> index 1aa3c4a0c5b27..e9103998cca91 100644
> --- a/arch/sh/Kconfig
> +++ b/arch/sh/Kconfig
> @@ -14,6 +14,7 @@ config SUPERH
>  	select ARCH_HIBERNATION_POSSIBLE if MMU
>  	select ARCH_MIGHT_HAVE_PC_PARPORT
>  	select ARCH_WANT_IPC_PARSE_VERSION
> +	select ARCH_NEED_CMPXCHG_1_EMU
>  	select CPU_NO_EFFICIENT_FFS
>  	select DMA_DECLARE_COHERENT
>  	select GENERIC_ATOMIC64
> diff --git a/arch/sh/include/asm/cmpxchg.h b/arch/sh/include/asm/cmpxchg.h
> index 5d617b3ef78f7..1e5dc5ccf7bf5 100644
> --- a/arch/sh/include/asm/cmpxchg.h
> +++ b/arch/sh/include/asm/cmpxchg.h
> @@ -9,6 +9,7 @@
>  
>  #include <linux/compiler.h>
>  #include <linux/types.h>
> +#include <linux/cmpxchg-emu.h>
>  
>  #if defined(CONFIG_GUSA_RB)
>  #include <asm/cmpxchg-grb.h>
> @@ -56,6 +57,8 @@ static inline unsigned long __cmpxchg(volatile void * ptr, unsigned long old,
>  		unsigned long new, int size)
>  {
>  	switch (size) {
> +	case 1:
> +		return cmpxchg_emu_u8(ptr, old, new);
>  	case 4:
>  		return __cmpxchg_u32(ptr, old, new);
>  	}

Acked-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
