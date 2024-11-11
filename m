Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BC0ED3ABCE
	for <linux-snps-arc@archiver.kernel.org>; Mon, 11 Nov 2024 16:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yDZxIMiHtuUXgIyCBTk7yX1WtP5NorpmC7oUZOI+hms=; b=TIReOjlSFLLAsO
	F9GwS5GEB6dqDWfDeBDuV8Mjal0I0AOQPRMLGHoRsNkK9PjdW8bHQ0c732TvKYnWnrcfUgZd7HpwF
	t5PF3xBPo8Ge3F2ucHHlIunWJrbaJ2OT1IbL6zoVhDm82Dya6YSeDsJGyn/zpi05IUICRF8o1xSOW
	DX+VEZ+dPwc3ThMneI9GXD0PNGFAwAFRGYommtQ27+DtXUvwsP/YWhDxh6HXxcUqubozwtkmT/rUL
	s+mw6qkueqjec8uBgUvKz9HpqgE6k0MANJ7WlTnKJrt23uGxx3TL/vplr74zjR+bdIbM0sVRHlAZv
	m6Vi1GOjhWiZk5U3wYUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAXGa-00000000ZnH-3TFm;
	Mon, 11 Nov 2024 16:27:52 +0000
Received: from out-188.mta0.migadu.com ([2001:41d0:1004:224b::bc])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAXAt-00000000Yxt-22PL
	for linux-snps-arc@lists.infradead.org;
	Mon, 11 Nov 2024 16:22:01 +0000
Message-ID: <e6d27adb-151c-46c1-9668-1cd2b492321b@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1731342114;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZT3RbCRXBHxXEQlTTWxDvrCJixuMw29drHdutEN1wOY=;
	b=a4+7fOH804lPTA220vTLYn82ssbezjKcuvoxaCZnrsUz8vLy2jU/L1kqdH4nwu5b1grSg7
	DwYzqyD1nuugc1jG3+6818g7QpZo07rcNJtDPWxR+esd6eMk0SfbYbtKEYq1MB8AcXU81m
	NnB+w9yOyFINwxUfCv6HJwrFFgBlEp0=
Date: Mon, 11 Nov 2024 16:21:47 +0000
MIME-Version: 1.0
Subject: Re: [PATCH] ARC: bpf_jit_arcv2: Remove redundant condition check
To: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
 ast@kernel.org, andrii@kernel.org
Cc: Daniel Borkmann <daniel@iogearbox.net>,
 Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman
 <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, Shahab Vahedi <list+bpf@vahedi.org>,
 Vineet Gupta <vgupta@kernel.org>, bpf@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241111142028.67708-1-hardevsinh.palaniya@siliconsignals.io>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <20241111142028.67708-1-hardevsinh.palaniya@siliconsignals.io>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_082159_960300_BE42D926 
X-CRM114-Status: GOOD (  14.10  )
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

On 11/11/2024 14:19, Hardevsinh Palaniya wrote:
> The condition 'if (ARC_CC_AL)' is always true, as ARC_CC_AL is a constant
> integer. This makes the check redundant, so it is safe to remove.
> 
> Signed-off-by: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
> ---
>   arch/arc/net/bpf_jit_arcv2.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/arch/arc/net/bpf_jit_arcv2.c b/arch/arc/net/bpf_jit_arcv2.c
> index 4458e409ca0a..19792ce952be 100644
> --- a/arch/arc/net/bpf_jit_arcv2.c
> +++ b/arch/arc/net/bpf_jit_arcv2.c
> @@ -2916,10 +2916,7 @@ bool check_jmp_32(u32 curr_off, u32 targ_off, u8 cond)
>   	addendum = (cond == ARC_CC_AL) ? 0 : INSN_len_normal;
>   	disp = get_displacement(curr_off + addendum, targ_off);
>   
> -	if (ARC_CC_AL)
> -		return is_valid_far_disp(disp);
> -	else
> -		return is_valid_near_disp(disp);
> +	return is_valid_far_disp(disp);
>   }
>   
>   /*

The original code is obviously optimized out, but the intention, I
believe, was to check if the jump is conditional or not.

So the proper fix should change the code to check cond:

-	if (ARC_CC_AL)
+	if (cond == ARC_CC_AL)



_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
