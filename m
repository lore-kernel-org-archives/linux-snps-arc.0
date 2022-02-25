Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 004E6C43217
	for <linux-snps-arc@archiver.kernel.org>; Fri, 25 Feb 2022 04:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+QcQkb9V9zDhHiv5yCt1tIcwyfAYqFVUL7DK/9M3WQo=; b=W6pPwfxMFnZirb
	TCDpwA0zTsQRR0CCFxqg0GEbw+K4AACePb7vuas3rxlQK121C3KVCrqNRkCjLSyujoYOn1aTcTlw+
	cnZW8iEOgKbvSZPOPTWNqPgsim8TuwMMTT8v4pjfjr2gZzpdmBSdzZOEABmLrE2TBECDbeXcIVEH4
	tGmVIo5f18J1HQZoR1p2Z1bNh1IKWi/tIwDuuVHN7e8iwzpIHrbPhT16zrQxkaAesXwcL9v4R0aSM
	ed8l4RNxMMmcOHVgjIlKvU8pZiqcpjbMGv21bDww54T3fLrpVOR99VT3sddyuvpgeM2EMEP0nz8cu
	NrOz9ww/9DLJ4nK/cggA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNSGX-003IbI-5I; Fri, 25 Feb 2022 04:31:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNSGS-003IZC-Vc; Fri, 25 Feb 2022 04:31:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 73196618D2;
 Fri, 25 Feb 2022 04:31:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BF54C340E7;
 Fri, 25 Feb 2022 04:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645763491;
 bh=GLLjJ1DIY+pcaD5Wxr3GGBnMqVEARs5wDghfvFD40O8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=hIVBklbMz20Too2yeCCQf4FR/ynGbzZ2XY3Q4fmoq3AjGgtKL335uxFhoNA+O7GwZ
 1xI9NTIagmUc/WGvwJaXmKN3m6iRlWo7xNSh2VqLx5iFbuZhtPqHWNdyPZFCcQmvJg
 B/wRcBuuSGk7QMYD4O/BWhUPyLQM2U2ZADwP6zy8YV9xa2LwvKMXbfS9owW1MUfUTw
 6fHO3FMrRRy8SAogw4atZuZJaPKXrV3/3aWAhAbetYfwpuO/cHRAnjSsimimMy3Xa2
 RW5lD3MIKq24lj+jc1tNunbJNi08raKakbPeJIfU1woaZaqtvTkkP3acIOYmeu0z/S
 VxtoRQs+6FTNQ==
Message-ID: <d12e6bcc-089d-568b-62cf-036c68c08ca0@kernel.org>
Date: Thu, 24 Feb 2022 22:31:04 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 13/18] uaccess: generalize access_ok()
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>, linux-arch@vger.kernel.org,
 linux-mm@kvack.org, linux-api@vger.kernel.org, arnd@arndb.de,
 linux-kernel@vger.kernel.org, viro@zeniv.linux.org.uk
Cc: linux@armlinux.org.uk, will@kernel.org, guoren@kernel.org,
 bcain@codeaurora.org, geert@linux-m68k.org, monstr@monstr.eu,
 tsbogend@alpha.franken.de, nickhu@andestech.com, green.hu@gmail.com,
 shorne@gmail.com, deller@gmx.de, mpe@ellerman.id.au, peterz@infradead.org,
 mingo@redhat.com, mark.rutland@arm.com, hca@linux.ibm.com, dalias@libc.org,
 davem@davemloft.net, richard@nod.at, x86@kernel.org, jcmvbkbc@gmail.com,
 ebiederm@xmission.com, akpm@linux-foundation.org, ardb@kernel.org,
 linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org
References: <20220216131332.1489939-1-arnd@kernel.org>
 <20220216131332.1489939-14-arnd@kernel.org>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <20220216131332.1489939-14-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_203133_109351_A038D18E 
X-CRM114-Status: GOOD (  20.52  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org



On 2/16/22 07:13, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> There are many different ways that access_ok() is defined across
> architectures, but in the end, they all just compare against the
> user_addr_max() value or they accept anything.
> 
> Provide one definition that works for most architectures, checking
> against TASK_SIZE_MAX for user processes or skipping the check inside
> of uaccess_kernel() sections.
> 
> For architectures without CONFIG_SET_FS(), this should be the fastest
> check, as it comes down to a single comparison of a pointer against a
> compile-time constant, while the architecture specific versions tend to
> do something more complex for historic reasons or get something wrong.
> 
> Type checking for __user annotations is handled inconsistently across
> architectures, but this is easily simplified as well by using an inline
> function that takes a 'const void __user *' argument. A handful of
> callers need an extra __user annotation for this.
> 
> Some architectures had trick to use 33-bit or 65-bit arithmetic on the
> addresses to calculate the overflow, however this simpler version uses
> fewer registers, which means it can produce better object code in the
> end despite needing a second (statically predicted) branch.
> 
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Acked-by: Mark Rutland <mark.rutland@arm.com> [arm64, asm-generic]
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   arch/Kconfig                          |  7 ++++
>   arch/alpha/include/asm/uaccess.h      | 34 +++------------
>   arch/arc/include/asm/uaccess.h        | 29 -------------
>   arch/arm/include/asm/uaccess.h        | 20 +--------
>   arch/arm64/include/asm/uaccess.h      | 11 ++---
>   arch/csky/include/asm/uaccess.h       |  8 ----
>   arch/hexagon/include/asm/uaccess.h    | 25 ------------
>   arch/ia64/include/asm/uaccess.h       |  5 +--
>   arch/m68k/Kconfig.cpu                 |  1 +
>   arch/m68k/include/asm/uaccess.h       | 19 +--------
>   arch/microblaze/include/asm/uaccess.h |  8 +---
>   arch/mips/include/asm/uaccess.h       | 29 +------------
>   arch/nds32/include/asm/uaccess.h      |  7 +---
>   arch/nios2/include/asm/uaccess.h      | 11 +----

Acked-by: Dinh Nguyen <dinguyen@kernel.org>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
