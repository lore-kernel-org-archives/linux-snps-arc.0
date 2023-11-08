Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59D07C4332F
	for <linux-snps-arc@archiver.kernel.org>; Wed,  8 Nov 2023 01:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/MrWURpZGPqP7rTAYHOikGwVbfWfrqHD6+ZS6B4uIBE=; b=fX7g4ayOHvUN1j
	u7Bh7wt8baSHrZ5wXkZEsveSI2L2L30AnSohjnioEk+18zt9CzfrEP4S+P9oO+GMbxr0nQnwuKYZD
	py24W0boN/JrlBimJMpFzMp22crWNe5NcAe0FA30hJqTehEOz2jEbUiHB1dlGgSadKUbRNYkiBgXL
	i9M5x/hgxyInMy3+wrBJQ21SI7uM676qBJJFbmvauzx5qkeicfdgw8NlJDGTJqeTa4xrX+jql1BWr
	p9KN83Ufb0xBwXJq2Cm62RwmYLY6wyxQE03ClGLojJaEJ/lSyg9iwRWv1Zsa7Qny2lxS8udgrjcRL
	cnhl0sSUwl8DQeHWq4LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0WyC-002jor-2P;
	Wed, 08 Nov 2023 01:03:00 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0Wy9-002joP-12
	for linux-snps-arc@lists.infradead.org;
	Wed, 08 Nov 2023 01:02:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DDB1661043;
	Wed,  8 Nov 2023 01:02:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36A23C433C8;
	Wed,  8 Nov 2023 01:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699405375;
	bh=ZEcloge7EvcLciwxWbJyUqAK3+uw3aSKssS3rdqKcW0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=uCKJOlaPPiAsb3hjysLpyMF41K+ef7+yYrBxLUm1WAIj3099aNHo4EkCPdeh4tDk0
	 VeEVVdJCqzXceYtRXU0ToKjiDpojWlOjWfy58365MVFwUc1VBcPCXe8xrlxbBUTR6P
	 KBoH+BWOxinsiV9SrxfwJ84gQMGF3iJRNBl9Qt2QFCtzN1pCMLPAvbNjs+TN/Wvtb9
	 tQy1HH7D6dr/H6erkEeOlktdCsRg7yLIOsI/4KdPFdqkRVjYa3dsRS/W6YThKyO7X8
	 JuFRlhDJZK0o1OOz4+lrIliNlXL/5b/G7ImphrGhx54MwBQLxF/QhtT58M44l/4LRw
	 X4yggtgrv2vNQ==
Date: Wed, 8 Nov 2023 10:02:48 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: "wuqiang.matt" <wuqiang.matt@bytedance.com>
Cc: vgupta@kernel.org, bcain@quicinc.com, jonas@southpole.se,
 stefan.kristiansson@saunalahti.fi, shorne@gmail.com, geert@linux-m68k.org,
 andi.shyti@linux.intel.com, mingo@kernel.org, palmer@rivosinc.com,
 andrzej.hajda@intel.com, arnd@arndb.de, peterz@infradead.orgm,
 linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-openrisc@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, mattwu@163.com, linux@roeck-us.ne
Subject: Re: [PATCH v2 2/4] locking/atomic: arc: arch_cmpxchg[64]_local
 undefined
Message-Id: <20231108100248.5376b99c62a1b24fb0ce62c0@kernel.org>
In-Reply-To: <20231104091615.4884-3-wuqiang.matt@bytedance.com>
References: <20231104091615.4884-1-wuqiang.matt@bytedance.com>
	<20231104091615.4884-3-wuqiang.matt@bytedance.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231107_170257_421939_4B24CBBD 
X-CRM114-Status: GOOD (  17.58  )
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

On Sat,  4 Nov 2023 17:16:13 +0800
"wuqiang.matt" <wuqiang.matt@bytedance.com> wrote:

> For architectures that support native cmpxchg, we'd like to
> implement arch_cmpxchg[64]_local with the native variants of
> supported data size. If not, the generci_cmpxchg[64]_local
> will be used.
> 

Looks good to me.

Reviewed-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>

> Signed-off-by: wuqiang.matt <wuqiang.matt@bytedance.com>
> ---
>  arch/arc/include/asm/cmpxchg.h | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/arch/arc/include/asm/cmpxchg.h b/arch/arc/include/asm/cmpxchg.h
> index bf46514f6f12..91429f2350df 100644
> --- a/arch/arc/include/asm/cmpxchg.h
> +++ b/arch/arc/include/asm/cmpxchg.h
> @@ -80,6 +80,34 @@
>  
>  #endif
>  
> +/*
> + * always make arch_cmpxchg[64]_local available, native cmpxchg
> + * will be used if available, then generic_cmpxchg[64]_local
> + */
> +#include <asm-generic/cmpxchg-local.h>
> +static inline unsigned long __cmpxchg_local(volatile void *ptr,
> +				      unsigned long old,
> +				      unsigned long new, int size)
> +{
> +	switch (size) {
> +#ifdef CONFIG_ARC_HAS_LLSC
> +	case 4:
> +		return __cmpxchg_32((int32_t *)ptr, old, new);
> +#endif
> +	default:
> +		return __generic_cmpxchg_local(ptr, old, new, size);
> +	}
> +
> +	return old;
> +}
> +#define arch_cmpxchg_local(ptr, o, n) ({				\
> +	(__typeof__(*ptr))__cmpxchg_local((ptr),			\
> +					(unsigned long)(o),		\
> +					(unsigned long)(n),		\
> +					sizeof(*(ptr)));		\
> +})
> +#define arch_cmpxchg64_local(ptr, o, n) __generic_cmpxchg64_local((ptr), (o), (n))
> +
>  /*
>   * xchg
>   */
> -- 
> 2.40.1
> 


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
