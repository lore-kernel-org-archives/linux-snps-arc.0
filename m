Return-Path: <SRS0=yxcf=M5=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A0E2C4338F
	for <linux-snps-arc@archiver.kernel.org>; Fri,  6 Aug 2021 13:44:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3E3B61078
	for <linux-snps-arc@archiver.kernel.org>; Fri,  6 Aug 2021 13:44:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F3E3B61078
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZLFf0aR13sxTVVINRFzbB6eN7gYf+XWb0PH5kcz+LAw=; b=pum+gb1VHhkp8N
	8YtWyTW70Zy3kyXU+g0UqrUXkdDCSZCUW0e8S1KvEc4fkZIFy5xpz9KwJyWEli9nkaTRpH4wVtKPw
	o43oICDgOOtZZKwXw7eJ4C35RWqFWwnHZnE6JkgaRtyMSKlAcYKzDes+e4gHLN1drjQTzszSokjsv
	5xlbz75GJ547D7KzaJFgNOa/nuGrC6gP9fl+J5DEoP8qK9M3kDK0NeGpCmbmm6QsDEdONF+EPMGY8
	/x9raA80jTq0klHRCI0B+Bbrl5kh34Q8w0XX9HffJ1oF0ImfGBc45FJOgnoPPhBwh0I3gkL682c2m
	K5A2gf43yYwHQXjFAJeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mC09h-00CeNI-5b; Fri, 06 Aug 2021 13:44:57 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mC07e-00CdB3-A4
 for linux-snps-arc@lists.infradead.org; Fri, 06 Aug 2021 13:42:51 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A806160C41;
 Fri,  6 Aug 2021 13:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628257369;
 bh=tz8ZRLoD2biYu7ZxhJ7U45RlqyfpQkBmhi9D2jv7cy8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bBmuahBBtWrCYnT6vHz1KFHrh8kUlPrkcF2F0+YfvpONFUlGG6LG2J9CLH89c8T03
 k5MZu76bsBL3hShaERTnLZD6Btzkc9851Cqhui0THxE3RJCxUTA/rEQuU0WISMETGL
 kMJdY6J9aCHAgLIu1S0CFtc++bYCnTwbAgT4t6yCHpLN5eHjXgzsLzfaoTdDOXfskj
 sC8sL8czYCBRSHGRSbMnsOnpari7wxeXudo79aF3tMxzqE0mGL/pBj6YK8MnZ9c2rI
 JH5N0fJU8yP7rOWYBc9kEW+rxKlcef1Ow1G7VGCGPWkPdL/a01OfqO/00If2Q9zLzA
 lE8LJJWGc50gA==
Date: Fri, 6 Aug 2021 14:42:45 +0100
From: Will Deacon <will@kernel.org>
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Arnd Bergmann <arnd@arndb.de>,
 Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-snps-arc@lists.infradead.org
Subject: Re: [RFC] bitops/non-atomic: make @nr unsigned to avoid any DIV
Message-ID: <20210806134244.GA2901@willie-the-truck>
References: <YQwaIIFvzdNcWnww@hirez.programming.kicks-ass.net>
 <20210805191408.2003237-1-vgupta@synopsys.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210805191408.2003237-1-vgupta@synopsys.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210806_064250_416237_9EF60328 
X-CRM114-Status: GOOD (  13.02  )
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

On Thu, Aug 05, 2021 at 12:14:08PM -0700, Vineet Gupta wrote:
> signed math causes generation of costlier instructions such as DIV when
> they could be done by barrerl shifter.
> 
> Worse part is this is not caught by things like bloat-o-meter since
> instruction length / symbols are typically same size.
> 
> e.g.
> 
> stock (signed math)
> __________________
> 
> 919b4614 <test_taint>:
> 919b4614:	div	r2,r0,0x20
>                 ^^^
> 919b4618:	add2	r2,0x920f6050,r2
> 919b4620:	ld_s	r2,[r2,0]
> 919b4622:	lsr	r0,r2,r0
> 919b4626:	j_s.d	[blink]
> 919b4628:	bmsk_s	r0,r0,0
> 919b462a:	nop_s
> 
> (patched) unsigned math
> __________________
> 
> 919b4614 <test_taint>:
> 919b4614:	lsr	r2,r0,0x5  @nr/32
>                 ^^^
> 919b4618:	add2	r2,0x920f6050,r2
> 919b4620:	ld_s	r2,[r2,0]
> 919b4622:	lsr	r0,r2,r0     #test_bit()
> 919b4626:	j_s.d	[blink]
> 919b4628:	bmsk_s	r0,r0,0
> 919b462a:	nop_s

Just FYI, but on arm64 the existing codegen is alright as we have both
arithmetic and logical shifts.

> Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
> ---
> This is an RFC for feeback, I understand this impacts every arch,
> but as of now it is only buld/run tested on ARC.
> ---
> ---
>  include/asm-generic/bitops/non-atomic.h | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)

Acked-by: Will Deacon <will@kernel.org>

We should really move test_bit() into the atomic header, but I failed to fix
the resulting include mess last time I tried that.

Will

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
