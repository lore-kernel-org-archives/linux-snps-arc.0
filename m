Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 680F8C4167D
	for <linux-snps-arc@archiver.kernel.org>; Wed,  8 Nov 2023 01:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+4Cs7h8Z5zKS5ty/xdRcZkDbn4+ySjh0kzQYkiVLXPk=; b=gwmzDx6BnOdsUF
	cbmOKggyab0EmMX9PXzGA3Tx/Pp7RRnVgL2GHMd7cKiKB10KivEOnXTOT19xAfpGcrNMmXdcq5UjE
	7X05YZc8UUG07ZL2r+EZZ0s/OfKfybjhHnjHzGX2XbaIJT7UfSLbm2/jSt0YLpDb+tOD5DOturw0I
	RGEhB7wlN1bfnY3Nf0J3SSgxRqNuPJlXSE7suZi09cWt4GT/8knpOJ2Ec/+1qGw9T8lc4Eky/pbnT
	CJcVYEV1X37TCOJtFyCzpsSevEt0ylTbRJ/LhrVZEXjLJkcHx5G0Wf2qg/QaBGnNCFNijX2lJE/1T
	KG4saX1zk9LlQvTdryyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0X0A-002jwr-1d;
	Wed, 08 Nov 2023 01:05:02 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0X07-002jvq-1t
	for linux-snps-arc@lists.infradead.org;
	Wed, 08 Nov 2023 01:05:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9F4A6CE0F58;
	Wed,  8 Nov 2023 01:04:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BA94C433C7;
	Wed,  8 Nov 2023 01:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699405494;
	bh=Bb9XKa7jIR6VwQRh41pyRMgtodshR4fjkkH7tV2ml4A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=nPTtD48BSRmCkDgS/RfJsFIi1sKbGzyo4h5xtQs7N7j5AVgSDYZ0T0CpL9g/GTRsK
	 ewIh/QniSRBH8KRH+wUNUYe9upNv6TaotXCP1xqp5PF+Md67uxzNtEt9E1+GECdI4E
	 wHph6U8H7Z/IFbYDb/13oWXXC6Hv25qX5f81fFCsAkGNV92zWYlAXmDiXiGOXDKwvX
	 91t4Gqnxzi9fnAahSAw5IfBX3MOqNuXyJnyXDt1V4ye53MFp96sHVpiRxCyA4gMVvs
	 X5lbRBW3IWsxSgK9E1ZedLDmIYCoQlFwQT9HmI7HlFzVTf1wrK1Y10freRG4la9t4/
	 X8dDgdFJU3Kew==
Date: Wed, 8 Nov 2023 10:04:47 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: "wuqiang.matt" <wuqiang.matt@bytedance.com>
Cc: vgupta@kernel.org, bcain@quicinc.com, jonas@southpole.se,
 stefan.kristiansson@saunalahti.fi, shorne@gmail.com, geert@linux-m68k.org,
 andi.shyti@linux.intel.com, mingo@kernel.org, palmer@rivosinc.com,
 andrzej.hajda@intel.com, arnd@arndb.de, peterz@infradead.orgm,
 linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-openrisc@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, mattwu@163.com, linux@roeck-us.ne,
 kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 4/4] locking/atomic: hexagon: arch_cmpxchg[64]_local
 undefined
Message-Id: <20231108100447.8bd6ff06f59f4b41a8f3d0ec@kernel.org>
In-Reply-To: <20231104091615.4884-5-wuqiang.matt@bytedance.com>
References: <20231104091615.4884-1-wuqiang.matt@bytedance.com>
	<20231104091615.4884-5-wuqiang.matt@bytedance.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231107_170459_968075_09F6CF16 
X-CRM114-Status: GOOD (  18.49  )
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

On Sat,  4 Nov 2023 17:16:15 +0800
"wuqiang.matt" <wuqiang.matt@bytedance.com> wrote:

> For architectures that support native cmpxchg, we'd like to
> implement arch_cmpxchg[64]_local with the native variants of
> supported data size. If not, the generci_cmpxchg[64]_local
> will be used.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202310272207.tLPflya4-lkp@intel.com/
> 

Looks good to me.

Reviewed-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>

But I need hexagon's maintainer's comment too.

Thank you,

> Signed-off-by: wuqiang.matt <wuqiang.matt@bytedance.com>
> ---
>  arch/hexagon/include/asm/cmpxchg.h | 51 +++++++++++++++++++++++++++++-
>  1 file changed, 50 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/hexagon/include/asm/cmpxchg.h b/arch/hexagon/include/asm/cmpxchg.h
> index bf6cf5579cf4..2b5e5bbaf807 100644
> --- a/arch/hexagon/include/asm/cmpxchg.h
> +++ b/arch/hexagon/include/asm/cmpxchg.h
> @@ -8,6 +8,8 @@
>  #ifndef _ASM_CMPXCHG_H
>  #define _ASM_CMPXCHG_H
>  
> +#include <linux/build_bug.h>
> +
>  /*
>   * __arch_xchg - atomically exchange a register and a memory location
>   * @x: value to swap
> @@ -51,13 +53,15 @@ __arch_xchg(unsigned long x, volatile void *ptr, int size)
>   *  variable casting.
>   */
>  
> -#define arch_cmpxchg(ptr, old, new)				\
> +#define __cmpxchg_32(ptr, old, new)				\
>  ({								\
>  	__typeof__(ptr) __ptr = (ptr);				\
>  	__typeof__(*(ptr)) __old = (old);			\
>  	__typeof__(*(ptr)) __new = (new);			\
>  	__typeof__(*(ptr)) __oldval = 0;			\
>  								\
> +	BUILD_BUG_ON(sizeof(*(ptr)) != 4);			\
> +								\
>  	asm volatile(						\
>  		"1:	%0 = memw_locked(%1);\n"		\
>  		"	{ P0 = cmp.eq(%0,%2);\n"		\
> @@ -72,4 +76,49 @@ __arch_xchg(unsigned long x, volatile void *ptr, int size)
>  	__oldval;						\
>  })
>  
> +#define __cmpxchg(ptr, old, val, size)				\
> +({								\
> +	__typeof__(*(ptr)) oldval;				\
> +								\
> +	switch (size) {						\
> +	case 4:							\
> +		oldval = __cmpxchg_32(ptr, old, val);		\
> +		break;						\
> +	default:						\
> +		BUILD_BUG();					\
> +		oldval = val;					\
> +		break;						\
> +	}							\
> +								\
> +	oldval;							\
> +})
> +
> +#define arch_cmpxchg(ptr, o, n)	__cmpxchg((ptr), (o), (n), sizeof(*(ptr)))
> +
> +/*
> + * always make arch_cmpxchg[64]_local available, native cmpxchg
> + * will be used if available, then generic_cmpxchg[64]_local
> + */
> +#include <asm-generic/cmpxchg-local.h>
> +
> +#define arch_cmpxchg_local(ptr, old, val)			\
> +({								\
> +	__typeof__(*(ptr)) retval;				\
> +	int size = sizeof(*(ptr));				\
> +								\
> +	switch (size) {						\
> +	case 4:							\
> +		retval = __cmpxchg_32(ptr, old, val);		\
> +		break;						\
> +	default:						\
> +		retval = __generic_cmpxchg_local(ptr, old,	\
> +						 val, size);	\
> +		break;						\
> +	}							\
> +								\
> +	retval;							\
> +})
> +
> +#define arch_cmpxchg64_local(ptr, o, n) __generic_cmpxchg64_local((ptr), (o), (n))
> +
>  #endif /* _ASM_CMPXCHG_H */
> -- 
> 2.40.1
> 


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
