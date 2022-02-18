Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2DD4C433F5
	for <linux-snps-arc@archiver.kernel.org>; Fri, 18 Feb 2022 06:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YPJWlI0RsTIMTgLF3lkQ7dmuOH0AkfbPBFMGd1LC0OQ=; b=e/JfNUJrNTT+it
	DIzwXRXnGD4DITGmIyNmnjsQyPfrMHnCKJIScJ/EVg1hZtuljp2jOFCh/5vqcYbcDgC2sX7a6M+0i
	TYdHZfNZDhhiOd3fjWBtMMFN/7YnYOKefyhh7eesufzp8yEBZHW/IBzkpu00Xo6RW0hlHevzk8EYJ
	bvLQwGycAeoEfRaYG9kl+UrK6b+XHDYOvhCT3WAYqSFJSEOQIt88Nus0c3ecShLBKlQ0FMDHVHt2X
	FutUZemJK7OGSkE2H5ADZGm7Mm270ORl9u9QQYSQV+8Mm7AqyheduwpcJOE3gQv33ksc5XDt9rQIw
	2BV1MtiZQUUzWUwFGOfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKwlL-00D3xQ-On; Fri, 18 Feb 2022 06:29:03 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKwlH-00D3vh-IV; Fri, 18 Feb 2022 06:29:01 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id A3FF967373; Fri, 18 Feb 2022 07:28:52 +0100 (CET)
Date: Fri, 18 Feb 2022 07:28:51 +0100
From: Christoph Hellwig <hch@lst.de>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>, linux-arch@vger.kernel.org,
 linux-mm@kvack.org, linux-api@vger.kernel.org, arnd@arndb.de,
 linux-kernel@vger.kernel.org, viro@zeniv.linux.org.uk,
 linux@armlinux.org.uk, will@kernel.org, guoren@kernel.org,
 bcain@codeaurora.org, geert@linux-m68k.org, monstr@monstr.eu,
 tsbogend@alpha.franken.de, nickhu@andestech.com, green.hu@gmail.com,
 dinguyen@kernel.org, shorne@gmail.com, deller@gmx.de,
 mpe@ellerman.id.au, peterz@infradead.org, mingo@redhat.com,
 mark.rutland@arm.com, hca@linux.ibm.com, dalias@libc.org,
 davem@davemloft.net, richard@nod.at, x86@kernel.org,
 jcmvbkbc@gmail.com, ebiederm@xmission.com,
 akpm@linux-foundation.org, ardb@kernel.org,
 linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v2 05/18] x86: remove __range_not_ok()
Message-ID: <20220218062851.GC22576@lst.de>
References: <20220216131332.1489939-1-arnd@kernel.org>
 <20220216131332.1489939-6-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220216131332.1489939-6-arnd@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220217_222859_920532_65743E57 
X-CRM114-Status: GOOD (  28.99  )
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

On Wed, Feb 16, 2022 at 02:13:19PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The __range_not_ok() helper is an x86 (and sparc64) specific interface
> that does roughly the same thing as __access_ok(), but with different
> calling conventions.
> 
> Change this to use the normal interface in order for consistency as we
> clean up all access_ok() implementations.
> 
> This changes the limit from TASK_SIZE to TASK_SIZE_MAX, which Al points
> out is the right thing do do here anyway.
> 
> The callers have to use __access_ok() instead of the normal access_ok()
> though, because on x86 that contains a WARN_ON_IN_IRQ() check that cannot
> be used inside of NMI context while tracing.
> 
> Suggested-by: Al Viro <viro@zeniv.linux.org.uk>
> Suggested-by: Christoph Hellwig <hch@infradead.org>
> Link: https://lore.kernel.org/lkml/YgsUKcXGR7r4nINj@zeniv-ca.linux.org.uk/
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/x86/events/core.c         |  2 +-
>  arch/x86/include/asm/uaccess.h | 10 ++++++----
>  arch/x86/kernel/dumpstack.c    |  2 +-
>  arch/x86/kernel/stacktrace.c   |  2 +-
>  arch/x86/lib/usercopy.c        |  2 +-
>  5 files changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/x86/events/core.c b/arch/x86/events/core.c
> index e686c5e0537b..eef816fc216d 100644
> --- a/arch/x86/events/core.c
> +++ b/arch/x86/events/core.c
> @@ -2794,7 +2794,7 @@ perf_callchain_kernel(struct perf_callchain_entry_ctx *entry, struct pt_regs *re
>  static inline int
>  valid_user_frame(const void __user *fp, unsigned long size)
>  {
> -	return (__range_not_ok(fp, size, TASK_SIZE) == 0);
> +	return __access_ok(fp, size);
>  }

valid_user_frame just need to go away and the following __get_user calls
replaced with normal get_user ones.

> diff --git a/arch/x86/kernel/dumpstack.c b/arch/x86/kernel/dumpstack.c
> index 53de044e5654..da534fb7b5c6 100644
> --- a/arch/x86/kernel/dumpstack.c
> +++ b/arch/x86/kernel/dumpstack.c
> @@ -85,7 +85,7 @@ static int copy_code(struct pt_regs *regs, u8 *buf, unsigned long src,
>  	 * Make sure userspace isn't trying to trick us into dumping kernel
>  	 * memory by pointing the userspace instruction pointer at it.
>  	 */
> -	if (__chk_range_not_ok(src, nbytes, TASK_SIZE_MAX))
> +	if (!__access_ok((void __user *)src, nbytes))
>  		return -EINVAL;

This one is not needed at all as copy_from_user_nmi already checks the
access range.

> diff --git a/arch/x86/kernel/stacktrace.c b/arch/x86/kernel/stacktrace.c
> index 15b058eefc4e..ee117fcf46ed 100644
> --- a/arch/x86/kernel/stacktrace.c
> +++ b/arch/x86/kernel/stacktrace.c
> @@ -90,7 +90,7 @@ copy_stack_frame(const struct stack_frame_user __user *fp,
>  {
>  	int ret;
>  
> -	if (__range_not_ok(fp, sizeof(*frame), TASK_SIZE))
> +	if (!__access_ok(fp, sizeof(*frame)))
>  		return 0;

Just switch the __get_user calls below to get_user instead.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
