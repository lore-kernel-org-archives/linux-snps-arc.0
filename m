Return-Path: <SRS0=mt4L=MZ=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D95EC4338F
	for <linux-snps-arc@archiver.kernel.org>; Mon,  2 Aug 2021 15:55:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2FC4B61104
	for <linux-snps-arc@archiver.kernel.org>; Mon,  2 Aug 2021 15:55:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2FC4B61104
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2dPQ1HTgKpH/Cp2FzLkPrGjbt8HPbRYX2JVKgHPxnBU=; b=cIpRqzc8IvlNAZ
	tfr/QeKWikMR0fsKkd/9zptZU5UDguMxS7g+eaxTLqgj91N+9DoXQRmmEYjqAyCEymle1hJC+eF1n
	PPtGKfji02ntIP2W9ucyCfLG2WsVVkRETR4WiOnSPRnq+jN+AAkLtyb7yvDASK6WgZGlIn3/WuxuQ
	5ife3bYUeDZeNjF2bdrriNYzWAi0VtixpDIRk/JQcL8uQpHa8u0UfD5VFOqssWGXrq1/EGEd65z13
	N4hbRTWaVI0RIXqEXBpLo6y9igW54mO27bbD9tAlWzmd11khwwSkaeR9KNQLBizbBc6LQDFYu7ABn
	HcbRUqv9V6Zwnk5MrBpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAaI1-00H4L7-Lf; Mon, 02 Aug 2021 15:55:41 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAaHw-00H4IJ-CB; Mon, 02 Aug 2021 15:55:37 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3008461107;
 Mon,  2 Aug 2021 15:55:25 +0000 (UTC)
Date: Mon, 2 Aug 2021 16:55:22 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>,
 Arnd Bergmann <arnd@arndb.de>, Ard Biesheuvel <ardb@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Linus Walleij <linus.walleij@linaro.org>,
 Ley Foon Tan <ley.foon.tan@intel.com>, x86@kernel.org,
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Nick Hu <nickhu@andestech.com>, Thomas Gleixner <tglx@linutronix.de>,
 Mike Rapoport <rppt@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Peter Zijlstra <peterz@infradead.org>,
 linux-riscv@lists.infradead.org, YiFei Zhu <yifeifz2@illinois.edu>,
 Greentime Hu <green.hu@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Michal Simek <monstr@monstr.eu>, Helge Deller <deller@gmx.de>,
 linux-sh@vger.kernel.org, Vineet Gupta <vgupta@synopsys.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Guo Ren <guoren@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
 Richard Weinberger <richard@nod.at>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Rich Felker <dalias@libc.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Carstens <hca@linux.ibm.com>, Jeff Dike <jdike@addtoit.com>,
 Max Filippov <jcmvbkbc@gmail.com>, linux-hexagon@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, "H. Peter Anvin" <hpa@zytor.com>,
 Will Deacon <will@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 linux-s390@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 linux-um@lists.infradead.org, Andrey Konovalov <andreyknvl@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Brian Cain <bcain@codeaurora.org>, linux-csky@vger.kernel.org,
 Stafford Horne <shorne@gmail.com>, Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Chris Zankel <chris@zankel.net>, Vasily Gorbik <gor@linux.ibm.com>,
 linux-snps-arc@lists.infradead.org, Jonas Bonn <jonas@southpole.se>,
 linux-parisc@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Colin Ian King <colin.king@canonical.com>,
 "David S. Miller" <davem@davemloft.net>,
 linux-kernel@vger.kernel.org, Vincent Chen <deanbo422@gmail.com>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 linuxppc-dev@lists.ozlabs.org, openrisc@lists.librecores.org
Subject: Re: [PATCH 2/3] trace: refactor TRACE_IRQFLAGS_SUPPORT in Kconfig
Message-ID: <20210802155521.GI18685@arm.com>
References: <20210731052233.4703-1-masahiroy@kernel.org>
 <20210731052233.4703-2-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210731052233.4703-2-masahiroy@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210802_085536_453623_29F4AD1A 
X-CRM114-Status: GOOD (  10.09  )
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

On Sat, Jul 31, 2021 at 02:22:32PM +0900, Masahiro Yamada wrote:
> Make architectures select TRACE_IRQFLAGS_SUPPORT instead of
> having many defines.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

For arm64:

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
