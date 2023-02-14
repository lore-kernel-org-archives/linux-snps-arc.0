Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 747D2C61DA4
	for <linux-snps-arc@archiver.kernel.org>; Tue, 14 Feb 2023 10:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3R9gHLockMCtl0hkY27oWNBoBnw1qlEY+StoBbtGtr8=; b=BB0It3O3MIWiJV
	irXdbhRVVF9a5Umw3P1URFvNYoKq5zUqedBgpgNt1DX5aAs7fl4UtmcZ+uigyNowQeMS0LUPpkfC0
	F55R94Zy2OtH74+pTg0wR7uyNQ0CzwrHw7pfV+YAbmobpI3YEPSmBWhd+nEEWiHKMgm2LDt3FnGXu
	7pdlt8sZR7cSGTXY0hnBn3mAtgNwp9mp1E1tgCfQC1k3CA1Vae9Uyk6YTiEzsCgz5RWnjeBi1/G06
	M+FWBK1e97UZnntJTUDlYCM3FYgV9du5kOFTfAA1MJn9fJ+BvQ/5t5ZsS7iEjvKUjV9YZ0yxgfuMi
	uMd3OmpReKLm8gp9KoNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRsj7-0013nK-SV; Tue, 14 Feb 2023 10:39:57 +0000
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRsj4-0013lA-SO; Tue, 14 Feb 2023 10:39:56 +0000
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.95)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1pRshz-000K86-Qj; Tue, 14 Feb 2023 11:38:47 +0100
Received: from p5b13aa49.dip0.t-ipconnect.de ([91.19.170.73] helo=[192.168.178.81])
          by inpost2.zedat.fu-berlin.de (Exim 4.95)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1pRshz-003Z8i-EF; Tue, 14 Feb 2023 11:38:47 +0100
Message-ID: <6a420bb0e033562bc7f67cc8f218f994e0892d3b.camel@physik.fu-berlin.de>
Subject: Re: [PATCH v3 10/24] sparc: Remove COMMAND_LINE_SIZE from uapi
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: WANG Xuerui <kernel@xen0n.name>, Sergey Shtylyov <s.shtylyov@omp.ru>, 
 Alexandre Ghiti <alexghiti@rivosinc.com>, Jonathan Corbet <corbet@lwn.net>,
 Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky
 <ink@jurassic.park.msu.ru>,  Matt Turner <mattst88@gmail.com>, Vineet Gupta
 <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>,  Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Huacai Chen
 <chenhuacai@kernel.org>,  Geert Uytterhoeven <geert@linux-m68k.org>, Michal
 Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, Helge
 Deller <deller@gmx.de>,  Michael Ellerman <mpe@ellerman.id.au>, Nicholas
 Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Paul Walmsley <paul.walmsley@sifive.com>,  Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Heiko Carstens
 <hca@linux.ibm.com>,  Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Yoshinori
 Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, "David S
 . Miller" <davem@davemloft.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo
 Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, x86@kernel.org, "H . Peter Anvin"
 <hpa@zytor.com>,  Chris Zankel <chris@zankel.net>, Max Filippov
 <jcmvbkbc@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, 
 loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org,  linux-xtensa@linux-xtensa.org,
 linux-arch@vger.kernel.org
Cc: Palmer Dabbelt <palmer@rivosinc.com>
Date: Tue, 14 Feb 2023 11:38:45 +0100
In-Reply-To: <f3db61bb-5c89-2724-769f-9d606f587f92@xen0n.name>
References: <20230214074925.228106-1-alexghiti@rivosinc.com>
	 <20230214074925.228106-11-alexghiti@rivosinc.com>
	 <017f0b40-8021-8b3b-24d2-c70661b6b292@omp.ru>
	 <f3db61bb-5c89-2724-769f-9d606f587f92@xen0n.name>
User-Agent: Evolution 3.46.4 
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 91.19.170.73
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_023955_072722_C9322EF3 
X-CRM114-Status: GOOD (  16.77  )
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

On Tue, 2023-02-14 at 16:59 +0800, WANG Xuerui wrote:
> On 2023/2/14 16:50, Sergey Shtylyov wrote:
> > On 2/14/23 10:49 AM, Alexandre Ghiti wrote:
> > 
> > > From: Palmer Dabbelt <palmer@rivosinc.com>
> > > 
> > > As far as I can tell this is not used by userspace and thus should not
> > > be part of the user-visible API.
> > > 
> > > Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> > > ---
> > >   arch/sparc/include/asm/setup.h      | 6 +++++-
> > >   arch/sparc/include/uapi/asm/setup.h | 7 -------
> > >   2 files changed, 5 insertions(+), 8 deletions(-)
> > > 
> > > diff --git a/arch/sparc/include/asm/setup.h b/arch/sparc/include/asm/setup.h
> > > index 72205684e51e..d1384ed92547 100644
> > > --- a/arch/sparc/include/asm/setup.h
> > > +++ b/arch/sparc/include/asm/setup.h
> > > @@ -7,7 +7,11 @@
> > >   
> > >   #include <linux/interrupt.h>
> > >   
> > > -#include <uapi/asm/setup.h>
> > > +#if defined(__sparc__) && defined(__arch64__)
> > 
> >     Mhm, I don't think these two can be #define'd simulaneously...
> 
> I believe it's just a SPARC-ism [1] [2] that may look strange and be 
> easily confused for __aarch64__ (notice the extra 'a')...

Yep, that's correct. On 64-bit Linux/SPARC, gcc/clang define __sparc__ AND __arch64__.

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
