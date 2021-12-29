Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B302C433F5
	for <linux-snps-arc@archiver.kernel.org>; Wed, 29 Dec 2021 03:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NE7R0Ney0F4GEt6+sXIxhzH/DTUP0Qqant8ylmr2x8A=; b=fuaJwIMJPbkO60MDVe+qKhWblk
	ka/2Rnvor8OMbDoHRyuYBqQsfV7z3TaEmFWY184rAr1aEy9shLtoO/VjWt3ABdrVHPrcWbHG6WhjB
	yimSOs0u6cSYcPW/5Azd8C8jFlwMZ2yxdfQKKU2KHPlm/hkMwfC5+QxjvOnahNVY8QJOXdMHTOJp1
	QK3GI+P2boexe5cIvYmwhW2ZM8lwaWYO/wUnf7qh4pyB/lVazuLmjLjHar6R5qMa9pJ4YeCG3lVar
	WGx/Ca8NWZftuqO1tlX/kg1Q69hiGLYk6dGRHrUh9Gk4zRXFymPc9tEJDLsz2s60j8AmqOcxjWtrM
	s+Owor8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2PsT-002D1h-GH; Wed, 29 Dec 2021 03:43:49 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2PsR-002D0X-AI
 for linux-snps-arc@lists.infradead.org; Wed, 29 Dec 2021 03:43:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 82274B81188;
 Wed, 29 Dec 2021 03:43:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2812C36AE7;
 Wed, 29 Dec 2021 03:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640749424;
 bh=pBleK/HLxkq2DSqnWGQeEvon68mcB1GiuzDLEaRVwJ0=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=OttH/xv7S2dUTiQWzeyhkY3LFrabD274E1InLPRlIYe6Jq8yXe2NllsWPrHkDqZ5y
 PvTEhYXG4OyHviTSfrzWzbYSL2ccshZ+978PRcFiglgG0NUhG9dF6ZHEUfhc2Nn5A4
 I7BZwmdKFcTueLd+BnyQstFHPUqzyc2JJNngRvwv8j1XTbotpF+wIPLAJHe3fThdt2
 kcbp4nuJiK0MANHSlie440HwRTKNAU6x1wJPacH8ORWIjlbKBOJCdUFNrzgfkeZpEy
 HY3/07rOOQvevMQYx5KTBbeStOvP4gycGR22pPhcnvnN0eMUePcqGufeBBl6QJrEt1
 o1mILfqZvQWNw==
Subject: Re: [PATCH] ARC: perf: Remove redundant initialization of variable idx
To: Colin Ian King <colin.i.king@googlemail.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
 Vineet Gupta <vgupta@kernel.org>, linux-perf-users@vger.kernel.org,
 linux-snps-arc@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211126222312.1125594-1-colin.i.king@gmail.com>
From: Vineet Gupta <vgupta@kernel.org>
Message-ID: <6f199a8f-9e22-be7c-ba0b-ebb534720a8b@kernel.org>
Date: Tue, 28 Dec 2021 19:43:42 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211126222312.1125594-1-colin.i.king@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211228_194347_545202_3C658830 
X-CRM114-Status: GOOD (  13.04  )
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

On 11/26/21 2:23 PM, Colin Ian King wrote:
> The variable idx is being initialized with a value that is never
> read, it is being updated later on. The assignment is redundant and
> can be removed.
> 
> Signed-off-by: Colin Ian King<colin.i.king@gmail.com>

Sorry for the delay in getting to this. Added to ARC tree now.

Thx,
-Vineet

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
