Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB793C79F8C
	for <linux-snps-arc@archiver.kernel.org>; Wed,  9 Sep 2026 05:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5lxaSskkcS0MO/h8+nHJTTlbIec6DJir5YDemBmN5og=; b=1PwLmjGnMyTP2J
	DQS2xzVkOUSLvfNnZ/FdN9UFg6vY47eKDnI5CpSKC0F6ZQ15NcRvSuaDLUSdBWkT8jquHP9kKjKgJ
	539ZBOmqTjweNs7QRs5DxAZ1ZhIeCOzTDf8iOIPAcdqTC8rg7i+AbQg/7bhu5y9E+mUDSzteV+T92
	H2fwGaAYCOCzTwz9yHF8TbX/spQe0/kfyQyVYb6v94/6Lkacth8fiy9pP394cc7NQZTBuY1FuNEq4
	WHWljlA4ARGHbUJ63BI2LLMoI1xsq7kh3CtjS6QLwhIcu+rh4hx+kwxSE4k6NL7vMuxJaE+V26AzI
	21Txqkc4uGJTX050hHqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Anm-0000000An76-3QvQ;
	Wed, 09 Sep 2026 05:24:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Anl-0000000An70-44mG
	for linux-snps-arc@lists.infradead.org;
	Wed, 09 Sep 2026 05:24:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E0036416A4;
	Wed,  9 Sep 2026 05:24:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6451F1F00A3A;
	Wed,  9 Sep 2026 05:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788931492;
	bh=fTwmembWulALuJ+oSUQaZjAZLiSxf9G75gTaYNdeONU=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=R3xMhQXiej9PLY9sKsP6oqMJfHd18O23R8yGBcfXwgXyV/NyhYAWrsA0Obixny48m
	 nQR3Uxh5ohlyVT9ef6Gpzaiclyuu22lcfRBDHgtOZHPBH60zgIvki4f42LXTMdMddT
	 cX0Hl9LCgCTjVi/3asfoJoKJcHn+Jcd4zEcb7QGk16GrhYD+UdHeqvPex1i3IOBCdD
	 slDJffP5EJcspeYPQoxKMyjw0l92qAGjl24wp6KJUFpibUnGylRIZ7fbai2dQgxfEf
	 qEEFGdYVInbNmQ/wrvigzRe+DVfz6xFrJhngHfd7zZmp8jypJmds7X206AAG8qQl1k
	 F/SUgvj8WMo9g==
Message-ID: <31a3ede9-3861-4837-a821-91cca14dd450@kernel.org>
Date: Wed, 9 Sep 2026 10:54:48 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Vineet Gupta <vgupta@kernel.org>
Subject: Re: [PATCH] arc: kernel: Fix clk reference leak in show_cpuinfo()
To: blaze <1466528493@qq.com>, vgupta@kernel.org
Cc: linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org
References: <tencent_0F7ECDD4429624B3213BD758BED2F788490A@qq.com>
Content-Language: en-US
In-Reply-To: <tencent_0F7ECDD4429624B3213BD758BED2F788490A@qq.com>
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

On 9/9/26 10:12 AM, blaze wrote:
> In show_cpuinfo(), clk_get() acquires a reference to the CPU clock, but
> clk_put() is never called to release it. Since show_cpuinfo() is the
> seq_file show callback for /proc/cpuinfo, this causes a clock reference
> count leak every time /proc/cpuinfo is read.
>
> The frequency is extracted via clk_get_rate() into a local variable, so
> the clock reference can be safely released immediately after.
>
> Fix this by calling clk_put(cpu_clk) right after clk_get_rate().

Thx for the fix and right on time as I was queuing up changes.

Acked-by: Vineet Gupta <vgupta@kernel.org>

Thx,
-Vineet

> Fixes: 98f2892607c5 ("ARC: [cpuinfo] Add clk info in /proc/cpuinfo")
> Signed-off-by: blaze<1466528493@qq.com>
> ---
>   arch/arc/kernel/setup.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/arch/arc/kernel/setup.c b/arch/arc/kernel/setup.c
> index 0000000..1111111 100644
> --- a/arch/arc/kernel/setup.c
> +++ b/arch/arc/kernel/setup.c
> @@ -593,6 +593,7 @@ static int show_cpuinfo(struct seq_file *m, void *v)
>   				   cpu_id);
>   	} else {
>   		freq = clk_get_rate(cpu_clk);
> +		clk_put(cpu_clk);
>   	}
>   	if (freq)
>   		seq_printf(m, "CPU speed\t: %lu.%02lu Mhz\n",
> --
> 2.43.0
>


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
