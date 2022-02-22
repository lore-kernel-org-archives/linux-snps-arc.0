Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7897DC433F5
	for <linux-snps-arc@archiver.kernel.org>; Tue, 22 Feb 2022 16:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uQXta0ZsTiK9wvm2Qs5A2JiyjH3wGb8yycoD6TszR3w=; b=PrepWUllmcwg4D
	121LGlR4tkXeWeeA5ubpzjS0ajJSA094MkQEog+z2HSxethgVPoKO3BJ/7oVbPm6URrHN7I5qsBoD
	z/kL2rwQsYqd9TXGuDtXDpRI1xNJ33rz1XYhmRlXBs6N3/2Tf0qsrmK47W8l+Ny2Yo7kwACrWAH0O
	7QTmmIAUZru8ql4Un1eaYcmiEmqHnewZkqnvjg+8XATiHVa9Cdk8+quEIxGW32Zqn8pnRik0E5L4H
	bFx5seIHyOX8+14MH0wFESEO9ibj+WrdQLXIXK96xZ4sTecNFvKI4UGyuf2PfOpm361TRGl7cA6Q4
	/GLTq92jHrJ4FxK1FoDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMYJG-00Ajst-90; Tue, 22 Feb 2022 16:46:42 +0000
Received: from elvis.franken.de ([193.175.24.41])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMY9X-00Ag5F-GS; Tue, 22 Feb 2022 16:36:42 +0000
Received: from uucp (helo=alpha)
 by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
 id 1nMY9J-00055T-00; Tue, 22 Feb 2022 17:36:25 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
 id 38AACC2609; Tue, 22 Feb 2022 17:36:15 +0100 (CET)
Date: Tue, 22 Feb 2022 17:36:15 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>, linux-arch <linux-arch@vger.kernel.org>,
 Linux-MM <linux-mm@kvack.org>, Linux API <linux-api@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Al Viro <viro@zeniv.linux.org.uk>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
 Brian Cain <bcain@codeaurora.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Michal Simek <monstr@monstr.eu>, Nick Hu <nickhu@andestech.com>,
 Greentime Hu <green.hu@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>,
 Stafford Horne <shorne@gmail.com>, Helge Deller <deller@gmx.de>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Mark Rutland <mark.rutland@arm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Rich Felker <dalias@libc.org>,
 David Miller <davem@davemloft.net>, Richard Weinberger <richard@nod.at>,
 the arch/x86 maintainers <x86@kernel.org>,
 Max Filippov <jcmvbkbc@gmail.com>,
 "Eric W . Biederman" <ebiederm@xmission.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Ard Biesheuvel <ardb@kernel.org>, alpha <linux-alpha@vger.kernel.org>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 linux-csky@vger.kernel.org,
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
 linux-ia64@vger.kernel.org, linux-m68k <linux-m68k@lists.linux-m68k.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Openrisc <openrisc@lists.librecores.org>,
 Parisc List <linux-parisc@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-s390 <linux-s390@vger.kernel.org>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>,
 linux-um <linux-um@lists.infradead.org>,
 "open list:TENSILICA XTENSA PORT (xtensa)" <linux-xtensa@linux-xtensa.org>
Subject: Re: [PATCH v2 09/18] mips: use simpler access_ok()
Message-ID: <20220222163615.GA14620@alpha.franken.de>
References: <20220216131332.1489939-1-arnd@kernel.org>
 <20220216131332.1489939-10-arnd@kernel.org>
 <20220221132456.GA7139@alpha.franken.de>
 <CAK8P3a2usZWPDDDUcscwS0aVKsY6aLXFGFPqYNkm4hcDERim9w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a2usZWPDDDUcscwS0aVKsY6aLXFGFPqYNkm4hcDERim9w@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_083639_911286_B41B3D28 
X-CRM114-Status: GOOD (  12.74  )
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

On Mon, Feb 21, 2022 at 03:31:23PM +0100, Arnd Bergmann wrote:
> I'll update it this way, otherwise I'd need help in form of a patch
> that changes the exception handling so __get_user/__put_user
> also return -EFAULT for an address error.

https://lore.kernel.org/all/20220222155345.138861-1-tsbogend@alpha.franken.de/

That does the trick.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
