Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EE90C369D1
	for <linux-snps-arc@archiver.kernel.org>; Mon, 28 Apr 2025 02:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n9DJ3hSebnip3q7KtqZYo24dmYXvpN9Jv/OuVNTMY48=; b=prmXSOYUfNqP2W
	LByTPT6wC1wJOJz03n+lb/SJV8Qo1YgrN859a8SW9AES5K7ZBd/c30E30hWG1HATig2Kb5QWNzSbs
	cXN4NZzEeGBgZplQA0X3H85phSr7Q4yYyV8CY1g9m6GzhsiDw6tps4qq5SknP9GmiVcmlR0Hx4VET
	oQXXkgPx79PpBSLthvITWKKQdd+HNEGIkCOQHDtomhZE4LsTnDsgyyHhULL7INxfuXrjGWKOgqAJC
	ruNWeCTEgMkf/tl/Kv+apwA3LxZfn2ZBm484hm9N3vead3nvKp2mlqZbDANEj3cQOpc+EDQni+U/I
	2HXO3vJDufTokWg/PWHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9EKl-00000004MYf-3YVZ;
	Mon, 28 Apr 2025 02:35:03 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9EKg-00000004MXU-1OHb
	for linux-snps-arc@lists.infradead.org;
	Mon, 28 Apr 2025 02:35:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 06CABA400AB;
	Mon, 28 Apr 2025 02:29:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D499C4CEE9;
	Mon, 28 Apr 2025 02:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745807696;
	bh=sQWVX5XMLGKXftxZqCjUh6JsyiNKX1MaQ1gWHUo5Y3M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qBZkFltv3i3ud6XIjFwKOA3jy3M8Koh240Uh+2HdAj5AT2krq0VxJrAvfWi0hNFA6
	 kZPMi8iQ8w6BayT04f0j+DwYG0nSM+6GRs2e65OxVOrMLMTIYpel9s8lQkJRo4shKF
	 jaAWRPr0rt+nJVsZBu6MisCFx6AHAuOVZf9/gt4yYe7vMYG3D7OCVph/ZJxd4Jvy34
	 PIcdMkawABQ5t75pofIVthbW3JDF+UfFs4i5VlxVW3pDsy0m6fvI3LiV1KDrH1jj0F
	 RB9Gec0riE8RirWPYPWEiQMmDabdzT02Vd0DlwnYx1awJHFbbC9FGoIOqGPyefRFKB
	 25FolS69iaCvg==
Message-ID: <499792a6-f907-47aa-ae30-4b9d6fcee669@kernel.org>
Date: Sun, 27 Apr 2025 19:34:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARC: atomics: Implement arch_atomic64_cmpxchg using
 _relaxed
To: Jason Gunthorpe <jgg@nvidia.com>, Boqun Feng <boqun.feng@gmail.com>,
 linux-snps-arc@lists.infradead.org, Peter Zijlstra <peterz@infradead.org>,
 Vineet Gupta <vgupta@kernel.org>, Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, patches@lists.linux.dev
References: <0-v1-2a485c0aa33a+505-arc_atomic_jgg@nvidia.com>
From: Vineet Gupta <vgupta@kernel.org>
Content-Language: en-US
In-Reply-To: <0-v1-2a485c0aa33a+505-arc_atomic_jgg@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250427_193458_461064_C1736112 
X-CRM114-Status: GOOD (  14.43  )
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

On 4/8/25 10:22, Jason Gunthorpe wrote:
> The core atomic code has a number of macros where it elaborates
> architecture primitives into more functions. ARC uses
> arch_atomic64_cmpxchg() as it's architecture primitive which disable alot
> of the additional functions.
>
> Instead provide arch_cmpxchg64_relaxed() as the primitive and rely on the
> core macros to create arch_cmpxchg64().
>
> The macros will also provide other functions, for instance,
> try_cmpxchg64_release(), giving a more complete implementation.
>
> Suggested-by: Mark Rutland <mark.rutland@arm.com>
> Link: https://lore.kernel.org/r/Z0747n5bSep4_1VX@J2N7QTR9R3
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Acked-by: Vineet Gupta <vgupta@kernel.org>

> ---
>  arch/arc/include/asm/atomic64-arcv2.h | 15 +++++----------
>  1 file changed, 5 insertions(+), 10 deletions(-)
>
> diff --git a/arch/arc/include/asm/atomic64-arcv2.h b/arch/arc/include/asm/atomic64-arcv2.h
> index 9b5791b8547133..73080a664369b4 100644
> --- a/arch/arc/include/asm/atomic64-arcv2.h
> +++ b/arch/arc/include/asm/atomic64-arcv2.h
> @@ -137,12 +137,9 @@ ATOMIC64_OPS(xor, xor, xor)
>  #undef ATOMIC64_OP_RETURN
>  #undef ATOMIC64_OP
>  
> -static inline s64
> -arch_atomic64_cmpxchg(atomic64_t *ptr, s64 expected, s64 new)
> +static inline u64 __arch_cmpxchg64_relaxed(volatile void *ptr, u64 old, u64 new)
>  {
> -	s64 prev;
> -
> -	smp_mb();
> +	u64 prev;
>  
>  	__asm__ __volatile__(
>  	"1:	llockd  %0, [%1]	\n"
> @@ -152,14 +149,12 @@ arch_atomic64_cmpxchg(atomic64_t *ptr, s64 expected, s64 new)
>  	"	bnz     1b		\n"
>  	"2:				\n"
>  	: "=&r"(prev)
> -	: "r"(ptr), "ir"(expected), "r"(new)
> -	: "cc");	/* memory clobber comes from smp_mb() */
> -
> -	smp_mb();
> +	: "r"(ptr), "ir"(old), "r"(new)
> +	: "memory", "cc");
>  
>  	return prev;
>  }
> -#define arch_atomic64_cmpxchg arch_atomic64_cmpxchg
> +#define arch_cmpxchg64_relaxed __arch_cmpxchg64_relaxed
>  
>  static inline s64 arch_atomic64_xchg(atomic64_t *ptr, s64 new)
>  {
>
> base-commit: ea8f6ee2111cd78b32d0363ea630ba9b08ada22d

Thx for this.

FWIW I missed the cmpxchg API when the rest of atomics were relaxed in commit
301014cf6d728 ("ARC: atomic_cmpxchg/atomic_xchg: implement relaxed variants")

Added to ARC for-curr (for next)

Thx,
-Vineet

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
