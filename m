Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B47DDC636D7
	for <linux-snps-arc@archiver.kernel.org>; Mon, 13 Feb 2023 01:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=weR96aNYwzlUQVX9B07nk1ljLo6JxfSYgl7tc9v7Pqw=; b=gZ5UXMCAXzrYaa
	4pqbh5mtaH0rFKVrJVpfbZ4L/MSpr+z4sf+VCxEQd3gpRYIvA5DOmJKKkQo30WDjlf6tT49y/DenO
	90prijGGbbuE/3CfGnmyh7VOMRsyObF0faps8q2eppBt0sI7F7x5cMc1BtuqH1J7zZQTCQW5zdDiL
	5jKeWtNFf9Kyth68Q9ugVtD5AVPJEHJSQLU/MS7FDjwSXATwMAC38flqCMC4Cpk2jykQVu//wt/Uc
	1CA1XByCSkZ2DxhRDejq8cs4ol3CDsPHMtFw7BIm4zGM5mw0kfvxCA2MppHnv+8UnQry0Z/4QBgGa
	pMbLscSzCN9KYkktazMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRNRl-00CjfL-OK; Mon, 13 Feb 2023 01:15:57 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRNRX-00CjcU-GW; Mon, 13 Feb 2023 01:15:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C2FA3B80DE4;
	Mon, 13 Feb 2023 01:15:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B8BDC433D2;
	Mon, 13 Feb 2023 01:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676250940;
	bh=6xoS4EH/AvrMxo4l4vmXuR4AQHVc+FNzj7T1N0mRmNE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bKep+A7+xJ/92/b5KLIU8b6MYcaWdBzqmXK2ccWLreI9FGxL9egqBJn5q9Vph791j
	 puzGhxH7ZpaphtMdqK+3u3KsDuIEgHvlXlfLgmHHLQNOyillSnmjqnmwiGzCbHWjb2
	 2krsDHjlf6yqyGqww3UHLRxAwb0QSBHd/9sygOcwxOdkSqrf1/TVIPBqYAN5wMsPzT
	 PnV7iDcLnk7lrEiGPpJTZccklii69bbqjJq5C+ceXe3xFjyi/KyqxO5SmsQLDNoU+D
	 LBpxjUIf9Bd02MtBnZ2ZZuuQW+pyfJ5367aFv0T2s55DZVNFbZYgmjmloY7QF6OTXd
	 vYxO5PxdceqiA==
Date: Mon, 13 Feb 2023 03:15:17 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>, Brian Cain <bcain@quicinc.com>,
	"David S. Miller" <davem@davemloft.net>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Greg Ungerer <gerg@linux-m68k.org>, Guo Ren <guoren@kernel.org>,
	Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>,
	Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Simek <monstr@monstr.eu>,
	Palmer Dabbelt <palmer@dabbelt.com>, Rich Felker <dalias@libc.org>,
	Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>,
	Stafford Horne <shorne@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Vineet Gupta <vgupta@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	linux-alpha@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org, linux-mm@kvack.org,
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org,
	linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org,
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
	openrisc@lists.librecores.org, sparclinux@vger.kernel.org,
	x86@kernel.org
Subject: Re: [PATCH v2 2/4] m68k: use asm-generic/memory_model.h for both MMU
 and !MMU
Message-ID: <Y+mPJYpVBk1YutDL@kernel.org>
References: <20230129124235.209895-1-rppt@kernel.org>
 <20230129124235.209895-3-rppt@kernel.org>
 <20230212173513.GA4052259@roeck-us.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230212173513.GA4052259@roeck-us.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230212_171543_853197_EEE67DE4 
X-CRM114-Status: GOOD (  23.91  )
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

Hi,

On Sun, Feb 12, 2023 at 09:35:13AM -0800, Guenter Roeck wrote:
> Hi,
> 
> On Sun, Jan 29, 2023 at 02:42:33PM +0200, Mike Rapoport wrote:
> > From: "Mike Rapoport (IBM)" <rppt@kernel.org>
> > 
> > The MMU variant uses generic definitions of page_to_pfn() and
> > pfn_to_page(), but !MMU defines them in include/asm/page_no.h for no
> > good reason.
> > 
> > Include asm-generic/memory_model.h in the common include/asm/page.h and
> > drop redundant definitions.
> > 
> > Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
> > Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
> 
> This patch results in a boot failure when trying to boot the mcf5208evb qemu
> emulation. Reverting it together with "mm, arch: add generic implementation
> of pfn_valid() for FLATMEM" fixes the problem. There is no error log - the
> emulation hangs silently until aborted.

With the patch below I was able to get to the mount of the root file system,
but I don't have one, so I couldn't test the boot properly.

diff --git a/arch/m68k/include/asm/page_no.h b/arch/m68k/include/asm/page_no.h
index 43ff6b109ebb..060e4c0e7605 100644
--- a/arch/m68k/include/asm/page_no.h
+++ b/arch/m68k/include/asm/page_no.h
@@ -28,6 +28,8 @@ extern unsigned long memory_end;
 #define	virt_addr_valid(kaddr)	(((unsigned long)(kaddr) >= PAGE_OFFSET) && \
 				((unsigned long)(kaddr) < memory_end))
 
+#define ARCH_PFN_OFFSET PHYS_PFN(PAGE_OFFSET_RAW)
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* _M68K_PAGE_NO_H */
 
> Guenter
> 
> ---
> bisect log:
> 
> # bad: [6ba8a227fd19d19779005fb66ad7562608e1df83] Add linux-next specific files for 20230210
> # good: [4ec5183ec48656cec489c49f989c508b68b518e3] Linux 6.2-rc7
> git bisect start 'HEAD' 'v6.2-rc7'
> # good: [94613f0efc69ed41f9229ef5c294db3ec37145da] Merge branch 'master' of git://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git
> git bisect good 94613f0efc69ed41f9229ef5c294db3ec37145da
> # good: [19e62c715fe70dae4582c2874ed3e66715d09af6] Merge branch 'rcu/next' of git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git
> git bisect good 19e62c715fe70dae4582c2874ed3e66715d09af6
> # good: [5d8b7ecef7f4a681b6e5538db59ff26c389c0ab6] Merge branch 'for-next' of https://gitlab.com/peda-linux/mux.git
> git bisect good 5d8b7ecef7f4a681b6e5538db59ff26c389c0ab6
> # good: [c349bf6ec83903b20fe570c5609b9a864a64e09c] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/krisman/unicode.git
> git bisect good c349bf6ec83903b20fe570c5609b9a864a64e09c
> # good: [5a06a9f17454df38f35672be522ff5eb9b4277d2] selftest: add testing unsharing and counting ksm zero page
> git bisect good 5a06a9f17454df38f35672be522ff5eb9b4277d2
> # bad: [f5d115a7b06e5661ed5218ffa9a2644c4ff1c135] Merge branch 'mm-nonmm-unstable' into mm-everything
> git bisect bad f5d115a7b06e5661ed5218ffa9a2644c4ff1c135
> # bad: [acb018d6ea0c055381fba7dddaef386ee28f8075] mm/vmalloc.c: allow vread() to read out vm_map_ram areas
> git bisect bad acb018d6ea0c055381fba7dddaef386ee28f8075
> # good: [1a5d9782ac969dc6e61c6786500b5160603188ea] mm/mmap: remove __vma_adjust()
> git bisect good 1a5d9782ac969dc6e61c6786500b5160603188ea
> # good: [4b32363697de957dcc890b6245bec3f58903639a] arm: include asm-generic/memory_model.h from page.h rather than memory.h
> git bisect good 4b32363697de957dcc890b6245bec3f58903639a
> # bad: [328cf3fa6682ce6a4de6f8bb8009c833dc33f3c8] mm/migrate: convert isolate_movable_page() to use folios
> git bisect bad 328cf3fa6682ce6a4de6f8bb8009c833dc33f3c8
> # bad: [b704c765b08cabe82adf76a4d1a74f3688eee410] mm/mempolicy: convert queue_pages_pmd() to queue_folios_pmd()
> git bisect bad b704c765b08cabe82adf76a4d1a74f3688eee410
> # bad: [e5734c8b0edfd2a053a5c256189586a3b1e9f63d] mm, arch: add generic implementation of pfn_valid() for FLATMEM
> git bisect bad e5734c8b0edfd2a053a5c256189586a3b1e9f63d
> # bad: [ad8aecea034c591b9754bc5908da9719853aa7fa] mips: drop definition of pfn_valid() for DISCONTIGMEM
> git bisect bad ad8aecea034c591b9754bc5908da9719853aa7fa
> # bad: [1f6271a0dfdf952c2e3981f424784d48f243a2be] m68k: use asm-generic/memory_model.h for both MMU and !MMU
> git bisect bad 1f6271a0dfdf952c2e3981f424784d48f243a2be
> # first bad commit: [1f6271a0dfdf952c2e3981f424784d48f243a2be] m68k: use asm-generic/memory_model.h for both MMU and !MMU

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
