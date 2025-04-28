Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A35C4C369D1
	for <linux-snps-arc@archiver.kernel.org>; Mon, 28 Apr 2025 02:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J49NFtCdT3ZkVdmFhnHl69rYmxIE1ylPmuJ6F21dQk8=; b=3gcPsF9+5TtgUr
	e/ZLYAFtIpeAdBRLf4VxEoZIl7JST0qtxL8Evgt+Qs7Q3rmv0twn8WqVR0i9tt3yl/nieL6oC6f16
	GQzBTHcpyIMc/gAXCl612QUFYgIrAWqMX+EgoG8LQOXYF9wIgzg7ld0N/xQHkZfojtFbQw8tPsKDr
	4UsiQGTMnkQ7aygXsw5GeRNaJtSoY0LRPwqXHK+obhaNGwYfYbCRGTMAUTNpL4Jewjs7ENjdYc+0T
	wcW5jJH3HH95ZFl//sNmFiDG2mRU7ICV9DscM1Lbj3hjOgk00nfw4QAvb3122kRtjXhQuMeoVbjQb
	0js1TLQVMRB20gkMYq/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9EOm-00000004Myw-1iSi;
	Mon, 28 Apr 2025 02:39:12 +0000
Received: from out-181.mta1.migadu.com ([95.215.58.181])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9EN5-00000004Mk0-2B6J
	for linux-snps-arc@lists.infradead.org;
	Mon, 28 Apr 2025 02:37:28 +0000
Message-ID: <2cd68d9e-bfa8-4b45-a153-c836a0ab7ac8@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745807843;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Dddlu8SlfIbvlkyJoQntWYQp8R9CcBSBlvP38HYBRd0=;
	b=grEP+UQBuWPzjLqzv+lXMqzNtOlHqf3gMr2Z9k42SfvuwSXn3CZCOD0Ihpa7TQZndM997x
	mr4bLruAXCSJTFA5UF713UD1e+9BE29bKQa+kKzDwFyh0EdR8dpjgzxuz4hQ89jHY0573R
	lp7batGkhPoySZqRMSYQHVo7ZuPZtrQ=
Date: Sun, 27 Apr 2025 19:37:15 -0700
MIME-Version: 1.0
Subject: Re: [PATCH] ARC: unwind: Use built-in sort swap to reduce code size
 and improve performance
To: Yu-Chun Lin <eleanor15x@gmail.com>, vgupta@kernel.org
Cc: linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
 jserv@ccns.ncku.edu.tw, visitorckw@gmail.com
References: <20250409171116.550665-1-eleanor15x@gmail.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vineet Gupta <vineet.gupta@linux.dev>
Content-Language: en-US
In-Reply-To: <20250409171116.550665-1-eleanor15x@gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250427_193727_733200_6A280CD8 
X-CRM114-Status: GOOD (  12.52  )
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

On 4/9/25 10:11, Yu-Chun Lin wrote:
> The custom swap function used in sort() was identical to the default
> built-in sort swap. Remove the custom swap function and passes NULL to
> sort(), allowing it to use the default swap function.
>
> This change reduces code size and improves performance, particularly when
> CONFIG_MITIGATION_RETPOLINE is enabled. With RETPOLINE mitigation, indirect
> function calls incur significant overhead, and using the default swap
> function avoids this cost.
>
> $ ./scripts/bloat-o-meter ./unwind.o.old ./unwind.o.new
> add/remove: 0/1 grow/shrink: 0/1 up/down: 0/-22 (-22)
> Function                                     old     new   delta
> init_unwind_hdr.constprop                    544     540      -4
> swap_eh_frame_hdr_table_entries               18       -     -18
> Total: Before=4410, After=4388, chg -0.50%
>
> Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>

Acked-by: Vineet Gupta <vgupta@kernel.org>

Added to for-curr.

Thx,
-Vineet

> ---
> Compile test only
>
>  arch/arc/kernel/unwind.c | 11 +----------
>  1 file changed, 1 insertion(+), 10 deletions(-)
>
> diff --git a/arch/arc/kernel/unwind.c b/arch/arc/kernel/unwind.c
> index d8969dab12d4..789cfb9ea14e 100644
> --- a/arch/arc/kernel/unwind.c
> +++ b/arch/arc/kernel/unwind.c
> @@ -241,15 +241,6 @@ static int cmp_eh_frame_hdr_table_entries(const void *p1, const void *p2)
>  	return (e1->start > e2->start) - (e1->start < e2->start);
>  }
>  
> -static void swap_eh_frame_hdr_table_entries(void *p1, void *p2, int size)
> -{
> -	struct eh_frame_hdr_table_entry *e1 = p1;
> -	struct eh_frame_hdr_table_entry *e2 = p2;
> -
> -	swap(e1->start, e2->start);
> -	swap(e1->fde, e2->fde);
> -}
> -
>  static void init_unwind_hdr(struct unwind_table *table,
>  			    void *(*alloc) (unsigned long))
>  {
> @@ -345,7 +336,7 @@ static void init_unwind_hdr(struct unwind_table *table,
>  	sort(header->table,
>  	     n,
>  	     sizeof(*header->table),
> -	     cmp_eh_frame_hdr_table_entries, swap_eh_frame_hdr_table_entries);
> +	     cmp_eh_frame_hdr_table_entries, NULL);
>  
>  	table->hdrsz = hdrSize;
>  	smp_wmb();


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
