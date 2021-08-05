Return-Path: <SRS0=zy2i=M4=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1644C4338F
	for <linux-snps-arc@archiver.kernel.org>; Thu,  5 Aug 2021 17:04:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B5BA60234
	for <linux-snps-arc@archiver.kernel.org>; Thu,  5 Aug 2021 17:04:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9B5BA60234
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ygQdnoEERw8+Ocnon5GP4eqEPOPZT5aa1r+SWBlSb9c=; b=MML2mxrxdwq/uV
	jJhJzDUmO3xNNEvdmy8RjsCHXFWJYyoK2IrC/ihqPAxI6HFluKQrEmqrgVLUBOpl+xZMnn7fq+igK
	7kkzlKUV7BSSp7IAljGT3hlae8TkJWEG7Uadl0gS4+JQLYEcm3OaOdd2ah1ZvHRjBzxVr6JvSC4DE
	wSxHiyGBpoa2RQaSKx2JDGxGE+2zcg+K/MXbNas0Buctq473qWgZmKxhjpjQ5eOkg7V50l5lS1NPf
	YY45kpzNEKFSfHnZc3dZ4PYF0FvcxYUyPLTL32EhQ/qFWbexLbCYQ36MaHIpBeaLdECpVMjmaOcvR
	iJ6fhdena76m9c61BwyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBgnN-00AKgn-4X; Thu, 05 Aug 2021 17:04:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBgnL-00AKgR-RT
 for linux-snps-arc@bombadil.infradead.org; Thu, 05 Aug 2021 17:04:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=04CagU5EAbNrLiuUdGw8amWt7aWpnxKksRF0oFOax3Q=; b=lwo4gDq0fIYCO+T+z3kf+zBidA
 uYdhe1Qfs/OqSQis3rmaZ5T3FyeZePaFsfSK9l3/wU0HqXYdESB49J0N178X/97zQABIR/pYQlbW9
 QFhV7NNqTqOjJl9WevN8lr39j5r4AevHiZ2+JBiUd6grkM2elRGqACy457XvU0tGFRu1Akj6IvxpN
 LDbx2nlhH64DMx88GmKFzKG/eVI5sb81NgyhNJnUd/jhPt8+RciEDhSyy+6Te/XACN2u82k65EoLG
 AJHMrT07NeWpg9l5FQzlH8z3R4/qO7zuoVOpOiojZu7EQt+bsS2zunwIkyQvNcZcc6M12fbTfuZko
 UKaedd9w==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBgnJ-0067e2-CW; Thu, 05 Aug 2021 17:04:33 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 8D76E300084;
 Thu,  5 Aug 2021 19:04:32 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 6E5FF2C9EB240; Thu,  5 Aug 2021 19:04:32 +0200 (CEST)
Date: Thu, 5 Aug 2021 19:04:32 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Cc: "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>, 
 Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Mark Rutland <mark.rutland@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 Vladimir Isaev <Vladimir.Isaev@synopsys.com>
Subject: Re: [PATCH 00/11] ARC atomics update
Message-ID: <YQwaIIFvzdNcWnww@hirez.programming.kicks-ass.net>
References: <20210804191554.1252776-1-vgupta@synopsys.com>
 <20210805090209.GA22037@worktop.programming.kicks-ass.net>
 <2c2bed36-1bcf-ae34-0e94-9110c7e2b242@synopsys.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2c2bed36-1bcf-ae34-0e94-9110c7e2b242@synopsys.com>
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

On Thu, Aug 05, 2021 at 04:18:29PM +0000, Vineet Gupta wrote:
> On 8/5/21 2:02 AM, Peter Zijlstra wrote:
> > On Wed, Aug 04, 2021 at 12:15:43PM -0700, Vineet Gupta wrote:
> > 
> >> Vineet Gupta (10):
> >>    ARC: atomics: disintegrate header
> >>    ARC: atomic: !LLSC: remove hack in atomic_set() for for UP
> >>    ARC: atomic: !LLSC: use int data type consistently
> >>    ARC: atomic64: LLSC: elide unused atomic_{and,or,xor,andnot}_return
> >>    ARC: atomics: implement relaxed variants
> >>    ARC: bitops: fls/ffs to take int (vs long) per asm-generic defines
> >>    ARC: xchg: !LLSC: remove UP micro-optimization/hack
> >>    ARC: cmpxchg/xchg: rewrite as macros to make type safe
> >>    ARC: cmpxchg/xchg: implement relaxed variants (LLSC config only)
> >>    ARC: atomic_cmpxchg/atomic_xchg: implement relaxed variants
> >>
> >> Will Deacon (1):
> >>    ARC: switch to generic bitops
> > 
> > Didn't see any weird things:
> > 
> > Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> 
> Thx Peter. A lot of this is your code anyways ;-)
> 
> Any initial thoughts/comments on patch 06/11 - is there an obvious 
> reason that generic bitops take signed @nr or the hurdle is need to be 
> done consistently cross-arch.

That does indeed seem daft and ready for a cleanup. Will any
recollection from when you touched this?

AFAICT bitops/atomic.h is consistently 'unsigned int nr', but
bitops/non-atomic.h is 'int nr' while bitops/instrumented-non-atomic.h
is consistently 'long nr'.

I'm thinking 'unsigned int nr' is the most sensible allround, but I've
not gone through all the cases.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
