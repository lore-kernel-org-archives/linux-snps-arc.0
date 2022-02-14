Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D173CC433EF
	for <linux-snps-arc@archiver.kernel.org>; Mon, 14 Feb 2022 21:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+8aCFCVP9rdvpKELe7DAxutdtzaUJkMqIyL8+ZRvJ/c=; b=LnGVlU3p0y56LE
	WL28SJU6/KwpW7sgIogg/taZbgvm46Np2tBt09klmpTqd8QMyFWMcTwvLCqcbshW7cA/gb8+01bzi
	pAEMaGpEhHsjISdnko56tsU6sN6ItCMbUIJEwiZVnrknlwOX5EQNbX1XOa+OR5AmEL9t9mvIWX/TV
	ZHiz4X53dyf3X7ZX7Kwr5VmCroSnncHe0P3REzfa1+lfsFBSEtgAQ6iIZFhkxnJ7YbgyxZzv/m68W
	bffq5hqJMBvw3KgoB4mvX+jsH8LPIxqr0+mF8MSs9uI6Tdr07lKhS7rB/AURYWvWBMHMG9ZmpXXjB
	g9ops/oqZeTneAN9TAng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJiZ4-00Gvuq-HD; Mon, 14 Feb 2022 21:07:18 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJiYz-00Gvs7-Bs; Mon, 14 Feb 2022 21:07:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ABB93139F;
 Mon, 14 Feb 2022 13:07:11 -0800 (PST)
Received: from [10.57.70.89] (unknown [10.57.70.89])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A689F3F718;
 Mon, 14 Feb 2022 13:07:04 -0800 (PST)
Message-ID: <cc6006c6-b073-7cc0-484d-7ddd193a8c2c@arm.com>
Date: Mon, 14 Feb 2022 21:06:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 08/14] arm64: simplify access_ok()
Content-Language: en-GB
To: Arnd Bergmann <arnd@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>, linux-arch@vger.kernel.org,
 linux-mm@kvack.org, linux-api@vger.kernel.org, arnd@arndb.de,
 linux-kernel@vger.kernel.org
Cc: linux@armlinux.org.uk, will@kernel.org, guoren@kernel.org,
 bcain@codeaurora.org, geert@linux-m68k.org, monstr@monstr.eu,
 tsbogend@alpha.franken.de, nickhu@andestech.com, green.hu@gmail.com,
 dinguyen@kernel.org, shorne@gmail.com, deller@gmx.de, mpe@ellerman.id.au,
 peterz@infradead.org, mingo@redhat.com, mark.rutland@arm.com,
 hca@linux.ibm.com, dalias@libc.org, davem@davemloft.net, richard@nod.at,
 x86@kernel.org, jcmvbkbc@gmail.com, ebiederm@xmission.com,
 akpm@linux-foundation.org, ardb@kernel.org, linux-alpha@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org
References: <20220214163452.1568807-1-arnd@kernel.org>
 <20220214163452.1568807-9-arnd@kernel.org>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20220214163452.1568807-9-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_130713_533909_843A3C3C 
X-CRM114-Status: GOOD (  25.10  )
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

On 2022-02-14 16:34, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> arm64 has an inline asm implementation of access_ok() that is derived from
> the 32-bit arm version and optimized for the case that both the limit and
> the size are variable. With set_fs() gone, the limit is always constant,
> and the size usually is as well, so just using the default implementation
> reduces the check into a comparison against a constant that can be
> scheduled by the compiler.

Aww, I still vividly remember the birth of this madness, sat with my 
phone on a Saturday morning waiting for my bike to be MOT'd, staring at 
the 7-instruction sequence that Mark and I had come up with and certain 
that it could be shortened still. Kinda sad to see it go, but at the 
same time, glad that it can.

Acked-by: Robin Murphy <robin.murphy@arm.com>

> On a defconfig build, this saves over 28KB of .text.

Not to mention saving those "WTF is going on there... oh yeah, 
access_ok()" moments when looking through disassembly :)

Cheers,
Robin.

> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   arch/arm64/include/asm/uaccess.h | 28 +++++-----------------------
>   1 file changed, 5 insertions(+), 23 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/uaccess.h b/arch/arm64/include/asm/uaccess.h
> index 357f7bd9c981..e8dce0cc5eaa 100644
> --- a/arch/arm64/include/asm/uaccess.h
> +++ b/arch/arm64/include/asm/uaccess.h
> @@ -26,6 +26,8 @@
>   #include <asm/memory.h>
>   #include <asm/extable.h>
>   
> +static inline int __access_ok(const void __user *ptr, unsigned long size);
> +
>   /*
>    * Test whether a block of memory is a valid user space address.
>    * Returns 1 if the range is valid, 0 otherwise.
> @@ -33,10 +35,8 @@
>    * This is equivalent to the following test:
>    * (u65)addr + (u65)size <= (u65)TASK_SIZE_MAX
>    */
> -static inline unsigned long __access_ok(const void __user *addr, unsigned long size)
> +static inline int access_ok(const void __user *addr, unsigned long size)
>   {
> -	unsigned long ret, limit = TASK_SIZE_MAX - 1;
> -
>   	/*
>   	 * Asynchronous I/O running in a kernel thread does not have the
>   	 * TIF_TAGGED_ADDR flag of the process owning the mm, so always untag
> @@ -46,27 +46,9 @@ static inline unsigned long __access_ok(const void __user *addr, unsigned long s
>   	    (current->flags & PF_KTHREAD || test_thread_flag(TIF_TAGGED_ADDR)))
>   		addr = untagged_addr(addr);
>   
> -	__chk_user_ptr(addr);
> -	asm volatile(
> -	// A + B <= C + 1 for all A,B,C, in four easy steps:
> -	// 1: X = A + B; X' = X % 2^64
> -	"	adds	%0, %3, %2\n"
> -	// 2: Set C = 0 if X > 2^64, to guarantee X' > C in step 4
> -	"	csel	%1, xzr, %1, hi\n"
> -	// 3: Set X' = ~0 if X >= 2^64. For X == 2^64, this decrements X'
> -	//    to compensate for the carry flag being set in step 4. For
> -	//    X > 2^64, X' merely has to remain nonzero, which it does.
> -	"	csinv	%0, %0, xzr, cc\n"
> -	// 4: For X < 2^64, this gives us X' - C - 1 <= 0, where the -1
> -	//    comes from the carry in being clear. Otherwise, we are
> -	//    testing X' - C == 0, subject to the previous adjustments.
> -	"	sbcs	xzr, %0, %1\n"
> -	"	cset	%0, ls\n"
> -	: "=&r" (ret), "+r" (limit) : "Ir" (size), "0" (addr) : "cc");
> -
> -	return ret;
> +	return likely(__access_ok(addr, size));
>   }
> -#define __access_ok __access_ok
> +#define access_ok access_ok
>   
>   #include <asm-generic/access_ok.h>
>   

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
