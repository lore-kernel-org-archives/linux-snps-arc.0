Return-Path: <SRS0=rFYR=NH=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8124FC4338F
	for <linux-snps-arc@archiver.kernel.org>; Mon, 16 Aug 2021 19:47:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 397FB60F58
	for <linux-snps-arc@archiver.kernel.org>; Mon, 16 Aug 2021 19:47:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 397FB60F58
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.dev
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hEH5J9SefEJ0CXyp1aFe28YMGRvdDKRJbcpqqjGRn+k=; b=HZr+l3m0OXh94UJEDlWhqyX9NP
	vIbPknDbDRZa1HQGfw4T1VVLWlSxi//uSsvnLcZDNW7PDnl+0XxKp90ESgqmVlXaK+u8+Sm7nyhuJ
	/hr2EK1buINqISVb0CGvo7g8h8Sl6aSmfE0DkHDRGAfj5OSvUnMh13VaTCbBFiowA7imRRA+DAkYm
	f70fOZ5aIIKseeFZYNHbtMBp4Iey0l5/UyEucw0dJX59Hf4pmhtTLnSQ5gKA2FRvGm3mwZbgOmFvC
	LrGYVnuQ5uzuPT7MZ7QC0q/OEgQzNaFP4Qygl0HmT6dVWRhPuH+GxgPhRkA980ApdVmbdUlDdxwWT
	6GIxAOeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFia9-000DK1-Mq; Mon, 16 Aug 2021 19:47:37 +0000
Received: from out0.migadu.com ([2001:41d0:2:267::])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFia4-000DId-S1
 for linux-snps-arc@lists.infradead.org; Mon, 16 Aug 2021 19:47:36 +0000
Subject: Re: [PATCH v2 03/19] ARC: mm: move mmu/cache externs out to setup.h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1629143249;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FYJm7DmTJym2Eu10SQxvpGktry/PBZKRLrfBx4S95Xk=;
 b=UndcR7Nihh6eUoLaRx1A3wJpWqQGyyuUc7+rNxBZ4S047wZKneJk8/UFj/rFdXH8zx1niP
 1/O+YgwDI2p0aGHF2UvNApPsHQblHLuGH+yAxuTyNiFBdALwXf4TUg8L3dg6nIS/ALPceu
 9TuoiigWHBJgEm/FqUZsZlidrDGH99E=
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Anshuman Khandual <anshuman.khandual@arm.com>
References: <20210812233753.104217-1-vgupta@kernel.org>
 <20210812233753.104217-4-vgupta@kernel.org> <YRjd9FO37fVZyV5V@kernel.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Vineet Gupta <vineet.gupta@linux.dev>
Message-ID: <c391bc0b-d8c8-7dc1-08af-4618e8532662@linux.dev>
Date: Mon, 16 Aug 2021 12:47:25 -0700
MIME-Version: 1.0
In-Reply-To: <YRjd9FO37fVZyV5V@kernel.org>
Content-Language: en-US
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: vineet.gupta@linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_124733_107126_2EE51AC7 
X-CRM114-Status: UNSURE (   6.60  )
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

On 8/15/21 2:27 AM, Mike Rapoport wrote:
> Heh,
>
> "Don't pollute mmu.h and cache.h with some of ARC internal bootlog/setup
> related functions.
> move them aside to setup.h"
>
> is still not there :)

Oops my bad, indeed missed out on that one. Fixed now.

Thx,
-Vineet


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
