Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C888CC4332F
	for <linux-snps-arc@archiver.kernel.org>; Wed,  8 Nov 2023 14:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=inUBGqPARN9yv81wrY8UbJuUqUUnMQvXT5lRiDa+FBE=; b=khGa1RWKLd1sCA
	4aidIxRl2jIKg2QjOmmy7Rhhc/DSzX6Na1j++fFasj/k3guxUzTw/iBic8ldyMsO9yo6XbHdXcSP3
	GjF+K1rq0sRmrpdi1eHzz8n+vvTIPAQHFipbqZ/RImOb7UANW2A2rd63PewTiPTwc/phrTsegvURP
	eUwcdSO8NhS7aiv/E/GmpbQtS90euFTE1BByvlYy6FlVfCqbCElyRerLFg4gDn63A5wUv0voY6/bw
	kvHwhFjtCaiamoRjAa5UP3oets88a09fNi379nqQ6ldcMHsGQrR4My42vAeGvvkdWwgOccSPj4JU0
	pJkkW6255HXLGPomPrcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0jO2-003zXl-2M;
	Wed, 08 Nov 2023 14:18:30 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0jO1-003zXU-1M;
	Wed, 08 Nov 2023 14:18:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=oPbIgwC0BijVgGIquFkJt/4vZ7saVONMlD6xtHIWlpI=; b=Ce8QxVd4WKG0h9ztVM/Vn/nozc
	8DRtZ9C1JiuIIVlzxZxS+Ui3PxxM3jqb/akrMqXYO3WvQUBJmaQyrGweyeK/v/2+8fZJtis97EdQ/
	Z2OUj+WkOgKAiPwjdTmxLpAN/0e+qc+yEGVcCGOKaE6IPc3x5sP1qOZYrVD/iYkmeJ7ckobeBHTNA
	IarXDpeU/s6fQAOkNZdunXkH+NJj5F0m3DXdHv+wbdxzqwV/TXUawSYG3lJPeRoYipVWG2Yq80nQd
	BOosblKbS23sgiPA/jNunjiRIP4lrtzpk4Tekhmsx6ugm9zT+y/qPe6q2ru9aKlrV+bDPpPIT9NHA
	JfjaNGoA==;
Received: from [2001:8a0:6c72:c100:c7fb:dbc0:2c8e:ab9a]
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1r0jNp-001S65-JA; Wed, 08 Nov 2023 14:18:18 +0000
Message-ID: <1b3ccc4a-41f7-46ad-9c5c-5ef44a96426e@infradead.org>
Date: Wed, 8 Nov 2023 14:18:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/22] powerpc: ps3: move udbg_shutdown_ps3gelic prototype
To: Arnd Bergmann <arnd@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Matt Turner <mattst88@gmail.com>,
 Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Guo Ren <guoren@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Ard Biesheuvel <ardb@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 Greg Ungerer <gerg@linux-m68k.org>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Dinh Nguyen <dinguyen@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Heiko Carstens <hca@linux.ibm.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 "David S. Miller" <davem@davemloft.net>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 x86@kernel.org, Helge Deller <deller@gmx.de>,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Timur Tabi <timur@kernel.org>, Kent Overstreet <kent.overstreet@linux.dev>,
 David Woodhouse <dwmw2@infradead.org>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>,
 Kees Cook <keescook@chromium.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Nicolas Schier <nicolas@fjasle.eu>, Al Viro <viro@zeniv.linux.org.uk>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-trace-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, netdev@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-bcachefs@vger.kernel.org, linux-mtd@lists.infradead.org
References: <20231108125843.3806765-1-arnd@kernel.org>
 <20231108125843.3806765-18-arnd@kernel.org>
Content-Language: en-US
From: Geoff Levand <geoff@infradead.org>
In-Reply-To: <20231108125843.3806765-18-arnd@kernel.org>
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

Hi Arnd,

On 11/8/23 12:58, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Allmodconfig kernels produce a missing-prototypes warning:
> 
> arch/powerpc/platforms/ps3/gelic_udbg.c:239:6: error: no previous prototype for 'udbg_shutdown_ps3gelic' [-Werror=missing-prototypes]
> 
> Move the declaration from a local header to asm/ps3.h where it can be
> seen from both the caller and the definition.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/powerpc/include/asm/ps3.h               | 6 ++++++
>  arch/powerpc/platforms/ps3/gelic_udbg.c      | 1 +
>  drivers/net/ethernet/toshiba/ps3_gelic_net.h | 6 ------
>  3 files changed, 7 insertions(+), 6 deletions(-)

Seems good to me.  I'll test it next chance I get.

Signed-off-by: Geoff Levand <geoff@infradead.org>



_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
