Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51C97C4332F
	for <linux-snps-arc@archiver.kernel.org>; Wed,  8 Nov 2023 01:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b8BT3LlCpubccUjvE1UlLIeNuazYlxneNCxkoGZTa4k=; b=gUqaWU4ms1NiE7
	oT2P1ezFujTs5xfmWs4XehU18QmdDRrC6oiRD1R+GnH/aXdY8DlSiT/0y1Ee31ZJ7yGkbDDQVPjLs
	Zx68LZqF6nwHX2kk6Er9TRqw1nSmWkzd7Byv8WjQl4wfGAwsTrlMWvUL0TX0uZ0zw+Fjdmxrzf1+C
	X2+y85C3xIRX106XKCvLtIaRRzTHupEwa4ZyfhUxXNmpRTtMhsOJHOSQO73TH9m3I+TA5WILXZVFZ
	Mo0Yop+haJoPDG3ajf2tdrgZ8E5GTQzTPfwukvH6mng5Bk1GzQDH9IwQv81Mui8emETxo4ECfY97D
	SpsupDaJuaAXFAQaxIPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0Wyi-002jrT-2o;
	Wed, 08 Nov 2023 01:03:32 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0Wyh-002jqs-0A
	for linux-snps-arc@lists.infradead.org;
	Wed, 08 Nov 2023 01:03:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 94E81B81A3F;
	Wed,  8 Nov 2023 01:03:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC996C433C7;
	Wed,  8 Nov 2023 01:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699405409;
	bh=FhuUtj4Vli4JUQLTpu9zmfbY9d6phMLcbPPqo75tvlw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=lqf7oMoEtheco4hmoHN5t08uEwJpvPetjmMKlRC7aPRnbcSay0n04O+dmA9ifts7B
	 giswChG53tAVKDO+OagzQF8T/DZzzBLMar5XCJlhVYWFoTfZr1dcrrzXhXEATNGL8h
	 RuZYoylX6+hyh3+8LdntBU7IrCmuUSHO7QTW98vLpVCAA0u1H3QVtzash3Gku+GPHb
	 vvsgBELDYFvBl4F9m4yjWT5tlCIJsNao0rQZv5CFhqJnmyi6OtRVeM6Cxfg7ABc241
	 oxxfXf9xlBpjxtGJoTaz2IABfaZfC0EFbIqTmhZhpIQbVeWhORg1MLUf0ZkLniV1h0
	 EXQOVSkXauVRQ==
Date: Wed, 8 Nov 2023 10:03:22 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: "wuqiang.matt" <wuqiang.matt@bytedance.com>
Cc: vgupta@kernel.org, bcain@quicinc.com, jonas@southpole.se,
 stefan.kristiansson@saunalahti.fi, shorne@gmail.com, geert@linux-m68k.org,
 andi.shyti@linux.intel.com, mingo@kernel.org, palmer@rivosinc.com,
 andrzej.hajda@intel.com, arnd@arndb.de, peterz@infradead.orgm,
 linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-openrisc@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, mattwu@163.com, linux@roeck-us.ne
Subject: Re: [PATCH v2 3/4] locking/atomic: openrisc: arch_cmpxchg[64]_local
 undefined
Message-Id: <20231108100322.06cc58b4fd142ccbb8d3751e@kernel.org>
In-Reply-To: <20231104091615.4884-4-wuqiang.matt@bytedance.com>
References: <20231104091615.4884-1-wuqiang.matt@bytedance.com>
	<20231104091615.4884-4-wuqiang.matt@bytedance.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231107_170331_263160_31410A9D 
X-CRM114-Status: GOOD (  14.86  )
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

On Sat,  4 Nov 2023 17:16:14 +0800
"wuqiang.matt" <wuqiang.matt@bytedance.com> wrote:

> For architectures that support native cmpxchg, we'd like to
> implement arch_cmpxchg[64]_local with the native variants of
> supported data size. If not, the generci_cmpxchg[64]_local
> will be used.


Looks good to me.

Reviewed-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>

> 
> Signed-off-by: wuqiang.matt <wuqiang.matt@bytedance.com>
> ---
>  arch/openrisc/include/asm/cmpxchg.h | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/openrisc/include/asm/cmpxchg.h b/arch/openrisc/include/asm/cmpxchg.h
> index 8ee151c072e4..f1ffe8b6f5ef 100644
> --- a/arch/openrisc/include/asm/cmpxchg.h
> +++ b/arch/openrisc/include/asm/cmpxchg.h
> @@ -139,6 +139,12 @@ static inline unsigned long __cmpxchg(volatile void *ptr, unsigned long old,
>  					       (unsigned long)(n),	\
>  					       sizeof(*(ptr)));		\
>  	})
> +#define arch_cmpxchg_local arch_cmpxchg
> +
> +/* always make arch_cmpxchg64_local available for openrisc */
> +#include <asm-generic/cmpxchg-local.h>
> +
> +#define arch_cmpxchg64_local(ptr, o, n) __generic_cmpxchg64_local((ptr), (o), (n))
>  
>  /*
>   * This function doesn't exist, so you'll get a linker error if
> -- 
> 2.40.1
> 


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
