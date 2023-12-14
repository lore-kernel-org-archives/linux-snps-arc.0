Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FA5AC4167D
	for <linux-snps-arc@archiver.kernel.org>; Thu, 14 Dec 2023 03:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rDFNYDWmibgQD9X6Fd7XIdA7IaCL8RYeAa5JP3nGdIY=; b=IxkVlXcxoZULO8
	MzwytfbiZ1HxqzqZ3Mn12om3A3t1+RebeOwW9pUuM5CU4BJXg0IiHS829Hh6+Xh9VgM3yDjqKysIT
	I1LZjZYlcLYt8dOmugK9OBA+sBKqMPZyOgELhpS1Ba2NI8IhlIJMfhwzwpcS52JuP8vByozlU0h53
	SgyYXUFVfUmWBHURWp0U3jxYN8k8WWCFgFuW/7euB6s6SE1x5FkDWEp5oJ3p5vGT9IvSfKw7MiFjq
	qneeNd9zElXv351vEsHw4qIgDWQ20dLRebPhi94rqFrPTYMDhLAurLsthyxvIHRE8ojkvQtfVaIxP
	D7LK8j1GUCxoxEVDwlmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDcST-00Gd8C-2P;
	Thu, 14 Dec 2023 03:32:21 +0000
Received: from out-181.mta0.migadu.com ([2001:41d0:1004:224b::b5])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDcSP-00Gd6a-2w
	for linux-snps-arc@lists.infradead.org;
	Thu, 14 Dec 2023 03:32:19 +0000
Message-ID: <c8b952ea-e5fb-491f-b444-0a4e179716c0@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1702524729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8nrtfzVsKhb+pEEnD9Dv72GTrmorIJAeKuyjqO56so4=;
	b=XHRyd9Jcy68UY2+b6OIO4TsTUvyimNKSumeotXqxtvjPUDwBFsPS6QZ2OxVWzCrdXKjOBh
	fPFtwXoydoAnjsiZn6157IVAEWdnxpxxHyRDqJttEnRoJR/udUtoD56DvXL0U+Dtazhkq9
	O2thaA9yED7ZczwVxPiYuy3XI4yzLs4=
Date: Wed, 13 Dec 2023 19:32:05 -0800
MIME-Version: 1.0
Subject: Re: [PATCH] ARC: add hugetlb definitions
Content-Language: en-US
To: Pavel Kozlov <Pavel.Kozlov@synopsys.com>,
 linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Vineet Gupta <vgupta@kernel.org>
References: <20231213150710.13574-1-kozlov@synopsys.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vineet Gupta <vineet.gupta@linux.dev>
In-Reply-To: <20231213150710.13574-1-kozlov@synopsys.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_193218_373801_40B9BC0E 
X-CRM114-Status: UNSURE (   5.56  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org



On 12/13/23 07:07, Pavel Kozlov wrote:
> From: Pavel Kozlov <pavel.kozlov@synopsys.com>
>
> Add hugetlb definitions if THP enabled. ARC doesn't support
> HugeTLB FS but it supports THP. Some kernel code such as pagemap
> uses hugetlb definitions with THP.
>
> This patch fixes ARC build issue (HPAGE_SIZE undeclared error) with
> TRANSPARENT_HUGEPAGE enabled.
>
> Signed-off-by: Pavel Kozlov <pavel.kozlov@synopsys.com>

Added to for-curr.

I'll pile this will rest of patches for some linux-next soaking.

Thx,
-Vineet

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
