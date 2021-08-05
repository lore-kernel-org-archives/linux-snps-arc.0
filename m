Return-Path: <SRS0=zy2i=M4=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E835FC4338F
	for <linux-snps-arc@archiver.kernel.org>; Thu,  5 Aug 2021 09:02:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B601261029
	for <linux-snps-arc@archiver.kernel.org>; Thu,  5 Aug 2021 09:02:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B601261029
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mDKWbWD2GGkSITRPDTVzAN/lpGHlqgpx32G6gvAJubo=; b=pgSOWlijiZqGzL
	/gbcdveEXqauqFX6yU+gruCBu7thwzAFneNJuv+ATXMVFn4IDFkb6dCQjrHHaceDK9IklW0/GtFzC
	yup6Er99EfiXyZN+48/0eC2a6d9jELQBkrzfJIbQgtD9LWbpK6Ne9e9vjZ6aPNFRugTHON+ugFTF4
	xJ9bHvSIseX9GyDZ1/BkgAn5EGnUkFFJ68Twg1PyMx5pvT8VK6DhFpJwoD82Tho3BVJ2R/l89zL4t
	qwcctaUhYt7OnfbCIyKb7woTA1o9nJ3FYQ2wX3pHwSLIQhyqj9Ds8YXl7/uzPpgJa382pcZ+IShPA
	qcN+KBaBSYCE3omJwHWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBZGz-008lUo-5v; Thu, 05 Aug 2021 09:02:41 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBZGp-008lRb-TX
 for linux-snps-arc@bombadil.infradead.org; Thu, 05 Aug 2021 09:02:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=iyogr41TYqX3XaEU9z9PHRCA66roQiTg9TFQpCtbrZA=; b=jHUPxFy4HCXN9LUgwTvnVmQ2Yl
 XrV4EAfZsb7u8HgY4X6H2KHY5iImkCfMry4mwvOjXBwamaCFkJN9YcRVGTORWbx/isvOYDreV2TUL
 znU9o6amdLO9qfo+MSWD3p69r0m79Fmgwk2P/GueHvHx7PdedTm1i71pY8qT3qJsnAAb3n87p2/6o
 SQu0hgj0clW2tz/mmJkwuWaplhkdTyt2D4NayDcDP7XRi4spra1PvFlC/LhPk3bUB1jJbq8b8NAqA
 wJlyx6VuqRgIQPhorHfsNRtUMXlY2uTqbbaxlLtavq7N+DTFIhZTyA6gxMfik9Gya0Y7qwjn3fkMP
 r1oeZyFQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=worktop.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBZGU-006mjC-3e; Thu, 05 Aug 2021 09:02:15 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
 id 634259862B0; Thu,  5 Aug 2021 11:02:09 +0200 (CEST)
Date: Thu, 5 Aug 2021 11:02:09 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Cc: linux-snps-arc@lists.infradead.org, Will Deacon <will@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Mark Rutland <mark.rutland@arm.com>,
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 Vladimir Isaev <Vladimir.Isaev@synopsys.com>
Subject: Re: [PATCH 00/11] ARC atomics update
Message-ID: <20210805090209.GA22037@worktop.programming.kicks-ass.net>
References: <20210804191554.1252776-1-vgupta@synopsys.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210804191554.1252776-1-vgupta@synopsys.com>
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

On Wed, Aug 04, 2021 at 12:15:43PM -0700, Vineet Gupta wrote:

> Vineet Gupta (10):
>   ARC: atomics: disintegrate header
>   ARC: atomic: !LLSC: remove hack in atomic_set() for for UP
>   ARC: atomic: !LLSC: use int data type consistently
>   ARC: atomic64: LLSC: elide unused atomic_{and,or,xor,andnot}_return
>   ARC: atomics: implement relaxed variants
>   ARC: bitops: fls/ffs to take int (vs long) per asm-generic defines
>   ARC: xchg: !LLSC: remove UP micro-optimization/hack
>   ARC: cmpxchg/xchg: rewrite as macros to make type safe
>   ARC: cmpxchg/xchg: implement relaxed variants (LLSC config only)
>   ARC: atomic_cmpxchg/atomic_xchg: implement relaxed variants
> 
> Will Deacon (1):
>   ARC: switch to generic bitops

Didn't see any weird things:

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
