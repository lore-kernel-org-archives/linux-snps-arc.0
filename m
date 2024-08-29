Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21933C6FD35
	for <linux-snps-arc@archiver.kernel.org>; Thu, 29 Aug 2024 08:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zCa/nTQ9f7f7h580Bs9+SttnCu2aIh0znM6jR8GQmDQ=; b=HBweHwe07tUH/+
	S9Oyi8351XSSDdqL2ZJluv6Icb9jhGXJMcN6Cq3BvP0nF/Szf4TjXQld5fcTwzBUNrCY+PF87r1ad
	tnWR0mSuEJdOmATlJnBQkjOcf1UEfuJb9vo9mW9VGaamtboNChJZdImzBwFjlXOUXiMNasrzsymFx
	AfCiRJ4X38JnSKalD/m/EW/Sc72lV2+BVrA3r5bwdUBqvajYvgWUv0oEJETrZHDQyl71OykJss7H1
	/3VhZgWrL0WfVGppQUUi2VxeGKabJFH7Y+YKBqBZZ3Pe2fSH48J2Pzwfa7i1DD8S3PqjjWrUQOG+o
	S/yZf1qZhjMTYUyRifTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjaUh-0000000189y-2KhN;
	Thu, 29 Aug 2024 08:27:03 +0000
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjaUe-0000000187r-0ZQX;
	Thu, 29 Aug 2024 08:27:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1724920014;
	bh=CzX6lvuIolyjXVJmi/cVG/X6CAC23HjxHju8uHsztN0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ifdmLA2ZirGiQQ8DKH6A6ZHgCMR1ss7zyDFp3CptPsdwMvp/3YGG5gBHGQUEUKUzg
	 ITO14BjJMTtMSVhv+OWGvxvVRuqV/uDr1qMTHrjCXpCA4AhG+fXdppjYRKj1SYalDA
	 c5OEvTytT2HGK7FuARoCOz0vu+NPkuwhztoGR1vEusip5cUw9u2oaNaTthykDEP4om
	 aG2SxS1UuJhaWBae0UnoEaKnIcych9qgh1+wLPD/3IrbnzUQZgDwgKUPmcIv0mATKK
	 PtmYiyKLMkmTsA/rAyMlTUsbJAoexgEIiM3ollUIPnJsv6rs7t3Jl4HY46paJVrakT
	 7gCuXwLBau9iw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WvZBV0vd6z4wd6;
	Thu, 29 Aug 2024 18:26:42 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Charlie Jenkins <charlie@rivosinc.com>, Arnd Bergmann <arnd@arndb.de>,
 Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky
 <ink@jurassic.park.msu.ru>, Matt Turner <mattst88@gmail.com>, Vineet Gupta
 <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, Guo Ren
 <guoren@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui
 <kernel@xen0n.name>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Helge
 Deller <deller@gmx.de>, Nicholas Piggin <npiggin@gmail.com>, Christophe
 Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer
 <gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker
 <dalias@libc.org>, John Paul Adrian Glaubitz
 <glaubitz@physik.fu-berlin.de>, "David S. Miller" <davem@davemloft.net>,
 Andreas Larsson <andreas@gaisler.com>, Thomas Gleixner
 <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
 <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, Muchun Song <muchun.song@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, Lorenzo
 Stoakes <lorenzo.stoakes@oracle.com>, Shuah Khan <shuah@kernel.org>
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>
Subject: Re: [PATCH RFC v2 1/4] mm: Add MAP_BELOW_HINT
In-Reply-To: <20240829-patches-below_hint_mmap-v2-1-638a28d9eae0@rivosinc.com>
References: <20240829-patches-below_hint_mmap-v2-0-638a28d9eae0@rivosinc.com>
 <20240829-patches-below_hint_mmap-v2-1-638a28d9eae0@rivosinc.com>
Date: Thu, 29 Aug 2024 18:26:41 +1000
Message-ID: <87mskvenum.fsf@mail.lhotse>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240829_012700_647375_35FC9375 
X-CRM114-Status: GOOD (  18.58  )
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

Charlie Jenkins <charlie@rivosinc.com> writes:
> Some applications rely on placing data in free bits addresses allocated
> by mmap. Various architectures (eg. x86, arm64, powerpc) restrict the
> address returned by mmap to be less than the 48-bit address space,
> unless the hint address uses more than 47 bits (the 48th bit is reserved
> for the kernel address space).
>
> To make this behavior explicit and more versatile across all
> architectures, define a mmap flag that allows users to define an
> arbitrary upper limit on addresses returned by mmap.
>
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> ---
>  include/uapi/asm-generic/mman-common.h       | 1 +
>  tools/include/uapi/asm-generic/mman-common.h | 1 +
  
You're not meant to update the headers in tools/ directly. There's a
mail somewhere from acme somewhere describing the proper process, but
the tldr is leave it up to him.

> diff --git a/include/uapi/asm-generic/mman-common.h b/include/uapi/asm-generic/mman-common.h
> index 6ce1f1ceb432..03ac13d9aa37 100644
> --- a/include/uapi/asm-generic/mman-common.h
> +++ b/include/uapi/asm-generic/mman-common.h
> @@ -32,6 +32,7 @@
>  
>  #define MAP_UNINITIALIZED 0x4000000	/* For anonymous mmap, memory could be
>  					 * uninitialized */
> +#define MAP_BELOW_HINT	  0x8000000	/* give out address that is below (inclusive) hint address */

IMHO the API would be clearer if this actually forced the address to be
below the hint. That's what the flag name implies after all.

It would also mean the application doesn't need to take into account the
length of the mapping when passing the hint.

cheers

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
