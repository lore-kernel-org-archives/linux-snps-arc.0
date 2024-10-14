Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0657ED18129
	for <linux-snps-arc@archiver.kernel.org>; Mon, 14 Oct 2024 15:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rfUAWZnzCQlxn88rSSthERxBSG44xs3HUGonqsd4kWM=; b=nreCoHV0zRw64h
	Zk/5ctcBCTofTp4hyVparyf2jvMb4GDCukw8YbZJtDjj0sN2qw29Co2Kt5Lkby9wRJG7BD4WUNbQz
	p+bkVIQ1FU2xUPp0zfaIOVk/cnMTNep5oQsV1hjqpP1wLsou+3J0xRN3upTmt2R2lhYd0QIK9jOvC
	fwqfcqSjSkVlwIOroel0WB4n/vbs6rpGjWspjH0rNewwr5Vkus83ltwgrg90SbfIVpvveDG8XZ1Dd
	7rtCMtVXGCO4t+dNcdTiPsrNhw165UIP6KlHLTnTGBwULBEKL/amBskOZ2sc4str7HwY7HjVqZYTP
	z8bun0+y3k4nSBQ/7eMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0N5k-00000005fcW-2WG3;
	Mon, 14 Oct 2024 15:34:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0KrG-00000005DMW-1Muc;
	Mon, 14 Oct 2024 13:11:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8CAC75C569A;
	Mon, 14 Oct 2024 13:11:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32D95C4CEC3;
	Mon, 14 Oct 2024 13:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728911492;
	bh=Rj0DDOED5iD2FdGYxYV+4r4tEXYq4n6Xi/0d9QAVLUc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vMvBZJVOinxsLsrPPXzSxPojzLbDfnzNQ55w0X0QwTjcMMxar0CDAK08E2JThkQpb
	 4cpioov/cqx2XJwdmLwC1BTnXl3vfXvrgA1ETi3RHPPFn/KFa3uZAW+joXD5HEZg+c
	 4U5ok631tPzwPd7hoGyNRL5ynGDynUSOamB6K2RiHfHSi/erCk9kHqPS+1U5lBuMVB
	 r0jU8Sa0yR3rOlG2WDCJ68+YmRHtYreB6qz66TSlQdG0YMQVcdBysszRX2pWrQ1lN4
	 ziJbkceFmXn8rCIwx79sxsDKS6SGBNY9GisCIBFcBwGbEy+4gMh7VJcsFjn3AG+8KF
	 uacBBUphpSFpQ==
Date: Mon, 14 Oct 2024 16:07:40 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Christoph Hellwig <hch@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Andreas Larsson <andreas@gaisler.com>,
	Andy Lutomirski <luto@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>,
	Brian Cain <bcain@quicinc.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Guo Ren <guoren@kernel.org>, Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Simek <monstr@monstr.eu>, Oleg Nesterov <oleg@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>, Song Liu <song@kernel.org>,
	Stafford Horne <shorne@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Uladzislau Rezki <urezki@gmail.com>,
	Vineet Gupta <vgupta@kernel.org>, Will Deacon <will@kernel.org>,
	bpf@vger.kernel.org, linux-alpha@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org, linux-mm@kvack.org,
	linux-modules@vger.kernel.org, linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org, linux-um@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
	sparclinux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v5 7/8] execmem: add support for cache of large ROX pages
Message-ID: <Zw0XnDHbpHDwFDHy@kernel.org>
References: <20241009180816.83591-1-rppt@kernel.org>
 <20241009180816.83591-8-rppt@kernel.org>
 <Zwd7GRyBtCwiAv1v@infradead.org>
 <ZwfPPZrxHzQgYfx7@kernel.org>
 <ZwjXz0dz-RldVNx0@infradead.org>
 <ZwuIPZkjX0CfzhjS@kernel.org>
 <ZwyyTetoLX7aXhGg@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZwyyTetoLX7aXhGg@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241014_061134_709681_8C8EC213 
X-CRM114-Status: GOOD (  13.22  )
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

On Sun, Oct 13, 2024 at 10:55:25PM -0700, Christoph Hellwig wrote:
> On Sun, Oct 13, 2024 at 11:43:41AM +0300, Mike Rapoport wrote:
> > > But why?  That's pretty different from our normal style of arch hooks,
> > > and introduces an indirect call in a security sensitive area.
> > 
> > Will change to __weak hook. 
> 
> Isn't the callback required when using the large ROX page?  I.e.
> shouldn't it be an unconditional callback and not a weak override?

I'll add a Kconfig option to ensure that an architecture that wants to use
large ROX pages has explicit callback for that.

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
