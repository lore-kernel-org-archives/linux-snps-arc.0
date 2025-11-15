Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AA9DCEB2CA
	for <linux-snps-arc@archiver.kernel.org>; Sat, 15 Nov 2025 09:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W0/G8qMA/p/olGM6uQFLlAwcjFrB7nxerz/aWYLTqqQ=; b=tMj49Gpbm96aP8
	PvZKygpoOyy8ts2bp4NPD4w3hZcnXDab36gZtqZU+Q0arTnTePb3vdK1Z/BUGB4pkJ2dt/pamSAUB
	bhotYKqm33n0Bgjlicy0mcrRTXGhEoTqVePaz3aTjqTsV5bxY5Sum8Pq6fX0AyzbX1WKCIXyD98Vy
	a0mcy0Q7MMxre9XTr48c38EgN48rEyX8xS78fAtg14vPTK7CiVf2mAfsoK6KSwF2mN8svQmRVm83e
	ddaFudJdjGGRadRmbi8qFPnqvXEIqkoi+fZg9UB/BkJhf2B3w+m351w8tuPh7Sp8Y5i2dSI+nKjge
	ACAD7YyR0fZNxyCrW2CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKCI4-0000000Dd3q-3FeD;
	Sat, 15 Nov 2025 09:09:52 +0000
Received: from out-178.mta1.migadu.com ([95.215.58.178])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKCI1-0000000Dd2x-47ea
	for linux-snps-arc@lists.infradead.org;
	Sat, 15 Nov 2025 09:09:51 +0000
Message-ID: <f7bd2dc1-e7a5-4e80-9cad-2acac8065876@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1763197777;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qfm+MQXULvTpw1aaUw2GJFWd+i9+TwJ4lZKozAzdhws=;
	b=M/YUuAH3IyWhHYn5ZNYhvN1s6M7xHKp63PCRpmUrEKXu53qQ1HuLBjIKdBsHH7i0tHGrO2
	MjXPtZjS13xHfyK5QioHDDtwAUCXkyGqTgTAJkTaZnWGxD0YWfwq7kF4quaoj4fCBUjoDA
	i6LWMMM3rWw68vjk72a2dDN7mW73xXw=
Date: Sat, 15 Nov 2025 17:08:35 +0800
MIME-Version: 1.0
Subject: Re: [PATCH 2/7] arc: mm: enable MMU_GATHER_RCU_TABLE_FREE
To: Vineet Gupta <vgupta@kernel.org>, will@kernel.org,
 aneesh.kumar@kernel.org, npiggin@gmail.com, peterz@infradead.org,
 dev.jain@arm.com, akpm@linux-foundation.org, david@redhat.com,
 ioworker0@gmail.com
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-alpha@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-um@lists.infradead.org
References: <cover.1763117269.git.zhengqi.arch@bytedance.com>
 <6a4192f5cef3049f123f08cb04ef5cd0179c3281.1763117269.git.zhengqi.arch@bytedance.com>
 <5199c367-aabb-43e7-951e-452657dcdddc@linux.dev>
 <4e120357-6fa3-436a-8474-b07b473381b6@kernel.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Qi Zheng <qi.zheng@linux.dev>
In-Reply-To: <4e120357-6fa3-436a-8474-b07b473381b6@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251115_010950_168898_F748564A 
X-CRM114-Status: UNSURE (   5.16  )
X-CRM114-Notice: Please train this message.
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



On 11/15/25 7:10 AM, Vineet Gupta wrote:
> On 11/14/25 03:20, Qi Zheng wrote:
>> Strangely, it seems that only ARC does not define CONFIG_64BIT?
>>
>> Does the ARC architecture support 64-bit? Did I miss something?
> 
> ARC is 32-bit only !

Got it! Will drop this patch in the next version.

Thanks!

> 
> -Vineet


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
