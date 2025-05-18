Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E6C1C3ABC9
	for <linux-snps-arc@archiver.kernel.org>; Sun, 18 May 2025 21:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PlxFjtl0rxln7KsGGjA0Lpf4NOUgFieLP+ZmwLX02/8=; b=kDFLs7tXNNm0if
	7yodJK4FesC+G557CahuSvEFbS9ubvKdrRkhmVl5jSyJbWNC/FExZxGF17iLNCzqOaeIGuiObiCqf
	piKISqlkqouIM2wFMmXzcH5ISwMT6VOiM1EOxvQUoUf0FYnntKBC7BI21tXDxKz/GaiKAhVzTFnJj
	sqme/H1m9lRmw2toArvBwlrbL5bxd8LOy9f6FdfEtaEpxHPfC1Cbf6gmqvBIPe6AeWggA5NgAXgbU
	KqD22RIxMPFxZb3espJj6Wy92UUBuSVDVBtkYIdaewCoPL8HANpy8vqea9Z9+0NZPMAPNNT6DbMEX
	El1ywQSRRIfPg3oXEoBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGm1M-00000007Zkv-2FAk;
	Sun, 18 May 2025 21:58:12 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGm1J-00000007ZkI-22Wy
	for linux-snps-arc@lists.infradead.org;
	Sun, 18 May 2025 21:58:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CFC17A4EB6A;
	Sun, 18 May 2025 21:58:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63047C4CEE7;
	Sun, 18 May 2025 21:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747605487;
	bh=JSbrJ9wGpbanvFoNCJ5/IWVBUzZlZ6E6rupdyUm9PIA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=urMOlBhY1pnR/pIQXb/88LCMfrdSq5HKPSRyUFycRg7yDxaiqCkEBmE+Gfr0kwfI3
	 YBYtAisU4GiLz58laz9us+WbQV0031kBxyg9X/R6xvaHW0lzILswZ3t2+y/oKb9saB
	 V8mZrWx6a+hi2WcoN7du4eSK99gdvq5ic1kBPKOgh9fb6PvLZ7+fq1z5sJ2Lz0/vKr
	 aUsY255NImn78wNYvYGA9/FJL/5tYPnjCYnDe/o38v3/BP2icMw8H6i/t/GHcG1Yup
	 pUYjwjvfKZw43ghfFJVejS+9c6j3/r73yENM7yYiGLLaDhgf03UgNhEpJ8tp7+LMs9
	 0z26xd6JfWMbg==
Message-ID: <c3fa9e90-a94b-47f7-b911-ed7c97fd1d6f@kernel.org>
Date: Sun, 18 May 2025 14:58:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 11/16] arc/perf: Remove driver-specific throttle
 support
To: kan.liang@linux.intel.com, peterz@infradead.org, mingo@redhat.com,
 namhyung@kernel.org, irogers@google.com, mark.rutland@arm.com,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org
Cc: eranian@google.com, ctshao@google.com, tmricht@linux.ibm.com,
 leo.yan@arm.com, linux-snps-arc@lists.infradead.org
References: <20250516182853.2610284-1-kan.liang@linux.intel.com>
 <20250516182853.2610284-12-kan.liang@linux.intel.com>
From: Vineet Gupta <vgupta@kernel.org>
Content-Language: en-US
In-Reply-To: <20250516182853.2610284-12-kan.liang@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250518_145809_598624_D2C342A3 
X-CRM114-Status: GOOD (  13.88  )
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



On 5/16/25 11:28, kan.liang@linux.intel.com wrote:
> From: Kan Liang <kan.liang@linux.intel.com>
>
> The throttle support has been added in the generic code. Remove
> the driver-specific throttle support.
>
> Besides the throttle, perf_event_overflow may return true because of
> event_limit. It already does an inatomic event disable. The pmu->stop
> is not required either.
>
> Signed-off-by: Kan Liang <kan.liang@linux.intel.com>
> Cc: Vineet Gupta <vgupta@ikernel.org>
> Cc: linux-snps-arc@lists.infradead.org
Acked-by: Vineet Gupta <vgupta@kernel.org>

Please let me know if you wane to take it via ARC tree.

Thx,
-Vineet

> ---
>  arch/arc/kernel/perf_event.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arc/kernel/perf_event.c b/arch/arc/kernel/perf_event.c
> index 6e5a651cd75c..ed6d4f0cd621 100644
> --- a/arch/arc/kernel/perf_event.c
> +++ b/arch/arc/kernel/perf_event.c
> @@ -599,10 +599,8 @@ static irqreturn_t arc_pmu_intr(int irq, void *dev)
>  
>  		arc_perf_event_update(event, &event->hw, event->hw.idx);
>  		perf_sample_data_init(&data, 0, hwc->last_period);
> -		if (arc_pmu_event_set_period(event)) {
> -			if (perf_event_overflow(event, &data, regs))
> -				arc_pmu_stop(event, 0);
> -		}
> +		if (arc_pmu_event_set_period(event))
> +			perf_event_overflow(event, &data, regs);
>  
>  		active_ints &= ~BIT(idx);
>  	} while (active_ints);


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
