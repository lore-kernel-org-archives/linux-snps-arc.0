Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DB3DC27C40
	for <linux-snps-arc@archiver.kernel.org>; Wed, 22 Nov 2023 22:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ROOWBegRZczaEDOrPe0eLBI38xHHQEdev9gQB6i7xHY=; b=g6Be+cXSANlxOS
	FCGeOAONtiDf2Iu8ijdfEaua2ayB85eHzZ/zvzeM8pdl0VwflknKhRFFSS7oZJC7k1om0xhyanFKw
	jeHelVKs/0rjZjA7ZyUEgdnEi5UaeSOgd/3G5NJOJhGsxrAfzPwmdlXYzJCDmTkSxhUgA1OHm3T5g
	4XILhDko0GAUtL7q/SxVwWXbXfrXjo45nGclm0XM2qTD0jQCL7TzAcgUCaMUBryTkuIBRQCXdAP1i
	As8FOsb9ZN8ejFq6nTqnfDLzClb9n+HtB4WzAJPfvRBKYngtMpGHyrif3CkdkMq2Cs01KcfvHK4gv
	8Yx0pVtUuf3EojvwLbAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5vXD-003Bjb-0P;
	Wed, 22 Nov 2023 22:17:27 +0000
Received: from mgamail.intel.com ([134.134.136.20])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5vXA-003Bhn-1l
	for linux-snps-arc@lists.infradead.org;
	Wed, 22 Nov 2023 22:17:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700691444; x=1732227444;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yeWZ3BdyhhUuU0VGr46b+afl1WUFwAC0SYpHXwdB+Hk=;
  b=C+xMtwydzIxvYsaMRa6hopY15obuvBMHKSGvGp+212oOpcguPEikJQMW
   b25OCE2SubS0TK9F91F/bar2TXqYuMejK6r0u/X/Tv8rkfRWCE/lWedSo
   ppXA7YK82RRpqmJ+RIOuvP1rm4cvBzQYXKndGvuyxyz4G2oAxvnPLrNvF
   kDo9VOlbK8/I4ZQ0LZz6D5IwmauuRHY37c2vL/RrU3iilU9YgSWfRMjcq
   CoGPtPlQjAv4pvcyFbIR0f7gm8c4LeG+MT/pBfK+E8yPAWtBjEXMA3vjz
   bJCksS5IRQQnMkhOkiNFZ3UJfiHnASpeoKm3YhlI/VKxyLcyb57dSZhop
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="382553929"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; 
   d="scan'208";a="382553929"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 14:17:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="770797680"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; 
   d="scan'208";a="770797680"
Received: from aconradi-mobl.ger.corp.intel.com (HELO intel.com) ([10.251.221.156])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 14:17:10 -0800
Date: Wed, 22 Nov 2023 23:17:07 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: "wuqiang.matt" <wuqiang.matt@bytedance.com>
Cc: ubizjak@gmail.com, mark.rutland@arm.com, vgupta@kernel.org,
	bcain@quicinc.com, jonas@southpole.se,
	stefan.kristiansson@saunalahti.fi, shorne@gmail.com,
	chris@zankel.net, jcmvbkbc@gmail.com, geert@linux-m68k.org,
	andi.shyti@linux.intel.com, mingo@kernel.org, palmer@rivosinc.com,
	andrzej.hajda@intel.com, arnd@arndb.de, peterz@infradead.org,
	mhiramat@kernel.org, linux-arch@vger.kernel.org,
	linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-hexagon@vger.kernel.org, linux-openrisc@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, mattwu@163.com,
	linux@roeck-us.net
Subject: Re: [PATCH v3 1/5] arch,locking/atomic: arc: arch_cmpxchg should
 check data size
Message-ID: <ZV594z0bNQR-vo2b@ashyti-mobl2.lan>
References: <20231121142347.241356-1-wuqiang.matt@bytedance.com>
 <20231121142347.241356-2-wuqiang.matt@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231121142347.241356-2-wuqiang.matt@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_141724_627956_1F133D9E 
X-CRM114-Status: GOOD (  18.21  )
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

Hi Wuqiang,

On Tue, Nov 21, 2023 at 10:23:43PM +0800, wuqiang.matt wrote:
> arch_cmpxchg() should check data size rather than pointer size in case
> CONFIG_ARC_HAS_LLSC is defined. So rename __cmpxchg to __cmpxchg_32 to
> emphasize it's explicit support of 32bit data size with BUILD_BUG_ON()
> added to avoid any possible misuses with unsupported data types.
> 
> In case CONFIG_ARC_HAS_LLSC is undefined, arch_cmpxchg() uses spinlock
> to accomplish SMP-safety, so the BUILD_BUG_ON checking is uncecessary.
> 
> v2 -> v3:
>   - Patches regrouped and has the improvement for xtensa included
>   - Comments refined to address why these changes are needed
> 
> v1 -> v2:
>   - Try using native cmpxchg variants if avaialble, as Arnd advised
> 
> Signed-off-by: wuqiang.matt <wuqiang.matt@bytedance.com>
> Reviewed-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
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

I think I made some comments here that have not been addressed or
replied.

Thanks,
Andi

>  	/*								\
>  	 * spin lock/unlock provide the needed smp_mb() before/after	\
>  	 */								\
> -- 
> 2.40.1

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
