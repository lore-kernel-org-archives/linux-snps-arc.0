Return-Path: <SRS0=yxcf=M5=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E25F9C4338F
	for <linux-snps-arc@archiver.kernel.org>; Fri,  6 Aug 2021 08:41:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E46160EE8
	for <linux-snps-arc@archiver.kernel.org>; Fri,  6 Aug 2021 08:41:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9E46160EE8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wKSQVH5y8FsmAwK4U+sEUdfo5wndmJHAde/G1Y+NF4c=; b=FoR5fOmxBZOXUd
	W92b/qcW5vZeHJDY4KX4qr9Pqjw4aR3XDmSuYgFAEfgok+VB0PvqZYmvz20sU/3rxdfVcB1vtSjp+
	GE4C41Q4GmDvFOfX3tBK8VtuH/Wz4goMadSVPdc31qhswstTZgjDa2HzI4kqdfStJgZJk6z7Uq6vX
	OUuc0a/Tpj09vH9uIX8TDBuEDVu3lNFGmSmNF21QA+gj/jQfglYVAg8QW1I9phRbsl+rle7HRn9Qs
	VIo83xs4uHp6M4b6wMCz/x/cOld1YhSd+TJQEfMZz5PWWQumSPscgEmCmW1dOQEkljJCJDCY1DS22
	lpoF8XykAvWqMcoFZM0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBvPl-00BtgW-2r; Fri, 06 Aug 2021 08:41:13 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBvPh-00Btfb-Sv
 for linux-snps-arc@lists.infradead.org; Fri, 06 Aug 2021 08:41:11 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1889660EE8;
 Fri,  6 Aug 2021 08:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628239269;
 bh=2X17xjmGHGlgrytSaj7r9Rx++xVMsl8LbGTJrxDcYVY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=guSu2m5Q46GebwXsmOvz75ZiYpZHxyQflS5B1n4Hrnfz7jFFXeHmFtYg0ywOy1Us3
 0i4y9Hzv6mT5wywO/LcsnpYtnmgVyL3uW9s+Z1wBY44GMJOOt4nD18wXPWit4o3e+X
 07zKakiC/AzjL2P2+Ze49RVCaNgzA97L8PjNS0nyhFT9IerEFC7XldeUbvV2mfOM2d
 HBOeYGQBL9FH6aoPZSrvs+/GMQlimZNcD5I6tSisskK1cEoSkvBFzOfiC9MT0XvqcH
 Chbj9FtCClMEg/m24AI3QB10r0RcaAcV6OTFm/D+ccLXRaBtp4blSyrKOQg6VVJtgW
 F3xj2zeaj9C4A==
Date: Fri, 6 Aug 2021 09:41:04 +0100
From: Will Deacon <will@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 Arnd Bergmann <arnd@arndb.de>, Mark Rutland <mark.rutland@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 Vladimir Isaev <Vladimir.Isaev@synopsys.com>
Subject: Re: [PATCH 00/11] ARC atomics update
Message-ID: <20210806084104.GA2015@willie-the-truck>
References: <20210804191554.1252776-1-vgupta@synopsys.com>
 <20210805090209.GA22037@worktop.programming.kicks-ass.net>
 <2c2bed36-1bcf-ae34-0e94-9110c7e2b242@synopsys.com>
 <YQwaIIFvzdNcWnww@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YQwaIIFvzdNcWnww@hirez.programming.kicks-ass.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210806_014109_997199_B72F73E3 
X-CRM114-Status: GOOD (  16.71  )
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

On Thu, Aug 05, 2021 at 07:04:32PM +0200, Peter Zijlstra wrote:
> On Thu, Aug 05, 2021 at 04:18:29PM +0000, Vineet Gupta wrote:
> > On 8/5/21 2:02 AM, Peter Zijlstra wrote:
> > > On Wed, Aug 04, 2021 at 12:15:43PM -0700, Vineet Gupta wrote:
> > > 
> > >> Vineet Gupta (10):
> > >>    ARC: atomics: disintegrate header
> > >>    ARC: atomic: !LLSC: remove hack in atomic_set() for for UP
> > >>    ARC: atomic: !LLSC: use int data type consistently
> > >>    ARC: atomic64: LLSC: elide unused atomic_{and,or,xor,andnot}_return
> > >>    ARC: atomics: implement relaxed variants
> > >>    ARC: bitops: fls/ffs to take int (vs long) per asm-generic defines
> > >>    ARC: xchg: !LLSC: remove UP micro-optimization/hack
> > >>    ARC: cmpxchg/xchg: rewrite as macros to make type safe
> > >>    ARC: cmpxchg/xchg: implement relaxed variants (LLSC config only)
> > >>    ARC: atomic_cmpxchg/atomic_xchg: implement relaxed variants
> > >>
> > >> Will Deacon (1):
> > >>    ARC: switch to generic bitops
> > > 
> > > Didn't see any weird things:
> > > 
> > > Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> > 
> > Thx Peter. A lot of this is your code anyways ;-)
> > 
> > Any initial thoughts/comments on patch 06/11 - is there an obvious 
> > reason that generic bitops take signed @nr or the hurdle is need to be 
> > done consistently cross-arch.
> 
> That does indeed seem daft and ready for a cleanup. Will any
> recollection from when you touched this?

I had a patch to fix this but it blew up in the robot and I didn't get round
to reworking it:

https://lore.kernel.org/patchwork/patch/1245555/

Will

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
