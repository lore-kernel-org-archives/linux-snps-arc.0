Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B93CCC4332F
	for <linux-snps-arc@archiver.kernel.org>; Wed,  8 Nov 2023 01:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JD+i89NBmazI2xYGqi1hVtB7rX1lW23+qWFcmTx0NI0=; b=dDJtlkeBsKaMNY
	UqFEc63JevxFFYU5p4Sg+cCTI7bFr94wOjvPgOKwj05IUosxJAKMfhJlr5bU24mWHNRQLf5CZdJnG
	5abAru5B07PxUmT5V62naRtq/tUshAE084ENZVHxq9vqMZ3GfJcl8F6ktUr2j6fYUGte6s68kefNr
	1Pv7xSXSPZq35Ez07NNuI7NFln94s6eYynw32Kcer8v0wmhQKGG8qQt+MiF7mkh0tGw0tFj+j9OGf
	c6j45sFq3AII1eslcTO73U496qPqvpLN/fTkajXR0XiDAFcKN4B1ZhNHsh5QrPF+xERH6+m0j0TFQ
	+KxpcHcblMeGiHvsTPUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0Wxb-002jmn-14;
	Wed, 08 Nov 2023 01:02:23 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0WxY-002jmT-28
	for linux-snps-arc@lists.infradead.org;
	Wed, 08 Nov 2023 01:02:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 53AF4B81A46;
	Wed,  8 Nov 2023 01:02:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DE5CC433C8;
	Wed,  8 Nov 2023 01:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699405337;
	bh=YCzRL+kVqkfECP59e1QJcGLwwNjryJJh+Cs7cpeWcEw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=nt2CDjhJwpkem9VZrZ5m/LnBJWzlcPt0G8R+/J6Om5IQsejFGlYCKYlj6udl4WwCB
	 F2HnU4rmciaUff6HS8zKKGnwGmMcq67t/z78urCReiOgvAQB/1SFfB8qu7PMRWjmTB
	 TObwr9QxHm4BzppdwOwlpc37JwLsGo/oaxlJ8lWFKgRDvZZtzCtOTdQZwAh471oPET
	 4y0Da5MkH4G5zGOe+aA+mBaZnLdUC2SXDGTnCZZGaC7mHs70bVpniL6aqGjA0AObJl
	 KVext8xhjSbkkhvbpkpZDr9Yt3UW5F8RrEbBNxal1kpzaHhsD71dCxeoQjOuqhkBnQ
	 9oGT3NFU5cTZQ==
Date: Wed, 8 Nov 2023 10:02:10 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: "wuqiang.matt" <wuqiang.matt@bytedance.com>
Cc: vgupta@kernel.org, bcain@quicinc.com, jonas@southpole.se,
 stefan.kristiansson@saunalahti.fi, shorne@gmail.com, geert@linux-m68k.org,
 andi.shyti@linux.intel.com, mingo@kernel.org, palmer@rivosinc.com,
 andrzej.hajda@intel.com, arnd@arndb.de, peterz@infradead.orgm,
 linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-openrisc@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, mattwu@163.com, linux@roeck-us.ne
Subject: Re: [PATCH v2 1/4] locking/atomic: arc: data size checking in
 arch_cmpxchg
Message-Id: <20231108100210.8118bdfe6fc67317f3638f1c@kernel.org>
In-Reply-To: <20231104091615.4884-2-wuqiang.matt@bytedance.com>
References: <20231104091615.4884-1-wuqiang.matt@bytedance.com>
	<20231104091615.4884-2-wuqiang.matt@bytedance.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231107_170221_011802_44E67D22 
X-CRM114-Status: GOOD (  14.94  )
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

On Sat,  4 Nov 2023 17:16:12 +0800
"wuqiang.matt" <wuqiang.matt@bytedance.com> wrote:

> Macro __cmpxchg() renamed to __cmpxchg_32() to emphasize it's explicit
> support of 32bit data size, BUILD_BUG_ON() added to avoid any possible
> misuses with unsupported data types.
> 
> In case CONFIG_ARC_HAS_LLSC is undefined, arch_cmpxchg() uses spinlock
> to accomplish SMP-safety, so the BUILD_BUG_ON checking is uncecessary.
> 

Looks good to me.

Reviewed-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>

> Signed-off-by: wuqiang.matt <wuqiang.matt@bytedance.com>
> ---
>  arch/arc/include/asm/cmpxchg.h | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arc/include/asm/cmpxchg.h b/arch/arc/include/asm/cmpxchg.h
> index e138fde067de..bf46514f6f12 100644
> --- a/arch/arc/include/asm/cmpxchg.h
> +++ b/arch/arc/include/asm/cmpxchg.h
> @@ -18,14 +18,16 @@
>   * if (*ptr == @old)
>   *      *ptr = @new
>   */
> -#define __cmpxchg(ptr, old, new)					\
> +#define __cmpxchg_32(ptr, old, new)					\
>  ({									\
>  	__typeof__(*(ptr)) _prev;					\
>  									\
> +	BUILD_BUG_ON(sizeof(*(ptr)) != 4);				\
> +									\
>  	__asm__ __volatile__(						\
> -	"1:	llock  %0, [%1]	\n"					\
> +	"1:	llock  %0, [%1]		\n"				\
>  	"	brne   %0, %2, 2f	\n"				\
> -	"	scond  %3, [%1]	\n"					\
> +	"	scond  %3, [%1]		\n"				\
>  	"	bnz     1b		\n"				\
>  	"2:				\n"				\
>  	: "=&r"(_prev)	/* Early clobber prevent reg reuse */		\
> @@ -47,7 +49,7 @@
>  									\
>  	switch(sizeof((_p_))) {						\
>  	case 4:								\
> -		_prev_ = __cmpxchg(_p_, _o_, _n_);			\
> +		_prev_ = __cmpxchg_32(_p_, _o_, _n_);			\
>  		break;							\
>  	default:							\
>  		BUILD_BUG();						\
> @@ -65,8 +67,6 @@
>  	__typeof__(*(ptr)) _prev_;					\
>  	unsigned long __flags;						\
>  									\
> -	BUILD_BUG_ON(sizeof(_p_) != 4);					\
> -									\
>  	/*								\
>  	 * spin lock/unlock provide the needed smp_mb() before/after	\
>  	 */								\
> -- 
> 2.40.1
> 


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
