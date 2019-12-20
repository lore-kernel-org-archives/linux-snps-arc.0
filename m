Return-Path: <SRS0=50yL=2K=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D74EC43603
	for <linux-snps-arc@archiver.kernel.org>; Fri, 20 Dec 2019 20:24:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F03E021655
	for <linux-snps-arc@archiver.kernel.org>; Fri, 20 Dec 2019 20:24:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HfMs65BI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F03E021655
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P0+lAEUOrs6M2AKkVyuKXyH9/Wuujb3FtuO1oeQ53rw=; b=HfMs65BI9B0ngP
	31cNUHT9NyyYXceNmtU23BXxd0aMNkpz6iFictv3tXKxG1WWVdaZvq41qxz8Kz4EqHE6H2YKK1cr8
	cpszflvkz1r8dIx4xJyiZVPY2Ebgr0KLQnToP0pY/fHz+ylZCDqpR83B20XFIp2l69+kYxqEDusib
	fuR7gTq/AgPKbzJ8n8ozZ57Ror4fCVeh1q/lYX7Vk1pqPajx87oYyJaegRwadePbpeq8+FxSOJsM7
	baPATCu+6B8VwY8qiUAQE1SCMXSkLxg+pGGZuxu7/sTKtdYntedo+8EjxxJPSAkEBdKQGQE2Oix0K
	32Ce9/AIvs1s7LON0VrQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iiOoW-0006e9-CE; Fri, 20 Dec 2019 20:23:56 +0000
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iiOoO-0006ZS-Cg; Fri, 20 Dec 2019 20:23:48 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id F2FA33007F2;
 Fri, 20 Dec 2019 21:22:21 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 12A0C2024479A; Fri, 20 Dec 2019 21:23:46 +0100 (CET)
Date: Fri, 20 Dec 2019 21:23:46 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: Re: [RFC PATCH v1] devres: align devres.data strictly only for
 devm_kmalloc()
Message-ID: <20191220202346.GT2827@hirez.programming.kicks-ass.net>
References: <74ae22cd-08c1-d846-3e1d-cbc38db87442@free.fr>
 <bf020a68-00fd-2bb7-c3b6-00f5befa293a@free.fr>
 <20191220140655.GN2827@hirez.programming.kicks-ass.net>
 <9be1d523-e92c-836b-b79d-37e880d092a0@arm.com>
 <CY4PR1201MB012011E554FC69F7B074B7E2A12D0@CY4PR1201MB0120.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CY4PR1201MB012011E554FC69F7B074B7E2A12D0@CY4PR1201MB0120.namprd12.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Cc: Will Deacon <will@kernel.org>, Marc Gonzalez <marc.w.gonzalez@free.fr>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Rafael Wysocki <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Russell King <rmk+kernel@armlinux.org.uk>, Mark Brown <broonie@kernel.org>,
 Tejun Heo <tj@kernel.org>, arcml <linux-snps-arc@lists.infradead.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Fri, Dec 20, 2019 at 07:32:16PM +0000, Alexey Brodkin wrote:

> Well it somehow used to work for quite some time now with the data-buffer
> being allocated with 4 words offset (which is 16 bytes for 32-bit platform

3 words, devres_node is 3 words.

Which is exactly why we had to change it, the odd alignment caused ARC
to explode.

> and 32 for 64-bit which is still much less than mentioned 128 bytes).
> Or we just never managed to identify those rare cases when data corruption
> really happened?

The races are rather rare methinks, you'd have to get a list-op
concurrently with a DMA.

If you get the list corrupted, I'm thinking the crash is fairly likely,
albeit really difficuly to debug.

> > No matter which way round you allocate devres and data, by necessity
> > they're always going to consume the same total amount of memory.
> 
> So then the next option I guess is to separate meta-data from data buffers
> completely. Are there any reasons to not do that

Dunno, should work just fine I think.

> other than the hack we're
> discussing here (meta-data in the beginning of the buffer) used to work OK-ish?

If meta-data at the beginngin used to work, I don't see why meta-data at
the end wouldn't work equally well. They'd be equally broken.

But I'm still flabbergasted at the fact that they're doing non-coherent
DMA to kmalloc memory, I thought we had a DMA api for that, with a
special allocator and everything (but what do I know, I've never used
that).

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
