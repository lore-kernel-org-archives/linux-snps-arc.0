Return-Path: <SRS0=50yL=2K=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AA01C43603
	for <linux-snps-arc@archiver.kernel.org>; Fri, 20 Dec 2019 21:48:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3323820866
	for <linux-snps-arc@archiver.kernel.org>; Fri, 20 Dec 2019 21:48:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="m7/6WQFH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b1buLVrc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3323820866
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ov+JM5R3VM3d/r+sejgFMmTt2DPwzNmd5aJhIyccmaM=; b=m7/6WQFH7UKxaN
	9tpxNe6xxRWP+dE1+IkMXTe5Y5Nq6g/J1KgiJi1M+xLDJwjFy8qh8H2jEWcHGdnm4dRs2CLYcqyZi
	jVJG4tjHM6KlyEgtwupkuqeJf4dHXB+XHrADYk+qyhh827Ha4FJPxb3d5tFJJQOvgNNFaocS7z6bY
	Zp654Ak9YW8UYvy7QVjhEcfFmt1UtBWBT99FoKoa5Tyd9vtZ9Um3adI1bNh2eNDF8Hges14TlgmG/
	V4x3VZ5SlOw+mskQ37xYNlUJNVsW8IN+xlRxWrUSx2rx0Bf89JoTZFDV5jFNLyYZaVF5rDAffiC4m
	A2QLT2Fh3nNEaY3gkwnA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iiQ7s-00085N-A8; Fri, 20 Dec 2019 21:48:00 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iiQ7p-000850-Dv; Fri, 20 Dec 2019 21:47:58 +0000
Received: by mail-pg1-x543.google.com with SMTP id b9so5571203pgk.12;
 Fri, 20 Dec 2019 13:47:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=SCnpICgEJeNeCv47il/wnhnHnvIZwSGzZQhEEwYiGvo=;
 b=b1buLVrcIi2WUUxWLFoeLQb9FVcK1qgS9/fBzOXy6UhFYggw0shBZ1DqaV/Bsj0d8s
 5pT6WYnteJrzsDqr7s+PqHusfKSAa49ZtKdwFSzgdgLcgiKmVUcxeaPkQgqTl7SeCaEu
 +HRk+myRoT900y/IzJdXsRLKaVx1VPsm5X6CSfrwnFqUSnwDdlosV7JDPSPPiXN5aFtu
 2c260ZOjgZENiZ6tICIFwYInxRejB1puQ6hKEmhv4lEJDHqQ94qNwBdI7212s+XohNMn
 Cz15+VxW7lP2DaBPRMqEHkfta2iiQInxCPhhWPmCFqFAdI4fwSjEsQ+msR6aG3yDu1pA
 Q4RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=SCnpICgEJeNeCv47il/wnhnHnvIZwSGzZQhEEwYiGvo=;
 b=FBgjwk1ec6cr+kWggOHj4LTDA8nLgqnmiidJf7ekq5w9PsJeSjThMZWr/UWXWd2hUt
 LDFt6h055bsfg/+zsDRB/e+bcs6Ftv+THJOw4N7XAKK3LcFBaqNyIF8s5H12+binSxq/
 mwGeiyKEfdkGzbDCHw5tg6X0Kwuvg2+HN/cQ+ZZidM9HxeknRsgh6h+mrckIGnb9R4Of
 ZI3r4mCKSdo/PCuB8scuTmmSKvzWJ3gguES9uE35CzhDcxr3etmFd0YDUp3E9tKrLiZU
 pZ9kfWFlSsJB+7jYcUBhyG/7JSgDx6T68uJ9sCExnmPGE3UeYnTQJ13p8jcsZyMN1CrZ
 8m4w==
X-Gm-Message-State: APjAAAX/eiTOlI3rCcIEBFOPpegiHOe3cOxJg56bV56j+i1HL6Tfqa1k
 wjHxcr+Pf3sQMZzyubNwn0I=
X-Google-Smtp-Source: APXvYqy1Jp9AL+dJzZ9QrF/l/Ro8FMCkBcW7GQQLLHu27AU9qj0cPqfcIxSyuddz+LVjjATjVmZGhA==
X-Received: by 2002:a65:5242:: with SMTP id q2mr4224476pgp.74.1576878475976;
 Fri, 20 Dec 2019 13:47:55 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
 by smtp.gmail.com with ESMTPSA id z64sm14237771pfz.23.2019.12.20.13.47.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Dec 2019 13:47:54 -0800 (PST)
Date: Fri, 20 Dec 2019 13:47:52 -0800
From: Dmitry  Torokhov <dmitry.torokhov@gmail.com>
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: Re: [RFC PATCH v1] devres: align devres.data strictly only for
 devm_kmalloc()
Message-ID: <20191220214752.GB8314@dtor-ws>
References: <74ae22cd-08c1-d846-3e1d-cbc38db87442@free.fr>
 <bf020a68-00fd-2bb7-c3b6-00f5befa293a@free.fr>
 <20191220140655.GN2827@hirez.programming.kicks-ass.net>
 <9be1d523-e92c-836b-b79d-37e880d092a0@arm.com>
 <CY4PR1201MB012011E554FC69F7B074B7E2A12D0@CY4PR1201MB0120.namprd12.prod.outlook.com>
 <20191220202346.GT2827@hirez.programming.kicks-ass.net>
 <CY4PR1201MB0120C3727E907005D24F5A03A12D0@CY4PR1201MB0120.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CY4PR1201MB0120C3727E907005D24F5A03A12D0@CY4PR1201MB0120.namprd12.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191220_134757_472392_C8AD95CF 
X-CRM114-Status: GOOD (  25.82  )
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
Cc: Marc Gonzalez <marc.w.gonzalez@free.fr>,
 Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>,
 Vineet Gupta <Vineet.Gupta1@synopsys.com>, Rafael Wysocki <rjw@rjwysocki.net>,
 LKML <linux-kernel@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Russell King <rmk+kernel@armlinux.org.uk>, Mark Brown <broonie@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Tejun Heo <tj@kernel.org>,
 arcml <linux-snps-arc@lists.infradead.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Fri, Dec 20, 2019 at 09:02:24PM +0000, Alexey Brodkin wrote:
> Hi Peter,
> 
> > > Well it somehow used to work for quite some time now with the data-buffer
> > > being allocated with 4 words offset (which is 16 bytes for 32-bit platform
> > 
> > 3 words, devres_node is 3 words.
> 
> Correct, but 4th word was implicitly there due to the fact
> on most of 32-bit arches "long long" is aligned by 2 words.
>  
> > Which is exactly why we had to change it, the odd alignment caused ARC
> > to explode.
> 
> I know that better than anybody else as it was my pain & grief :)
>  
> > > and 32 for 64-bit which is still much less than mentioned 128 bytes).
> > > Or we just never managed to identify those rare cases when data corruption
> > > really happened?
> > 
> > The races are rather rare methinks, you'd have to get a list-op
> > concurrently with a DMA.
> > 
> > If you get the list corrupted, I'm thinking the crash is fairly likely,
> > albeit really difficuly to debug.
> 
> So that alone IMHO is a good reason to not allow that thing to happen even
> in theory.
> 
> > > > No matter which way round you allocate devres and data, by necessity
> > > > they're always going to consume the same total amount of memory.
> > >
> > > So then the next option I guess is to separate meta-data from data buffers
> > > completely. Are there any reasons to not do that
> > 
> > Dunno, should work just fine I think.
> > 
> > > other than the hack we're
> > > discussing here (meta-data in the beginning of the buffer) used to work OK-ish?
> > 
> > If meta-data at the beginngin used to work, I don't see why meta-data at
> > the end wouldn't work equally well. They'd be equally broken.

No, not really. With data being ARCH_KMALLOC_MINALIGN and coming after
the devres private stuff, given that the another allocation will also be
aligned to ARCH_KMALLOC_MINALIGN (because that's what k*alloc will give
us) we are guaranteed that DMA will not stomp onto any unrelated data.
With devres private coming after data and not having any alignment
constraints we may very well clobber it when doing DMA.

BTW, I am not sure where the page size restriction you mentioned earlier
is coming from. We have been using kmalloc()ed memory as buffers
suitable for DMA since forever, and we only need to make sure such data
is isolated from other data CPU might be accessing by ARCH_DMA_MINALIGN
which is usually L1 cache size.

From Documentation/DMA-API-HOWTO.txt:

2) ARCH_DMA_MINALIGN

   Architectures must ensure that kmalloc'ed buffer is
   DMA-safe. Drivers and subsystems depend on it. If an architecture
   isn't fully DMA-coherent (i.e. hardware doesn't ensure that data in
   the CPU cache is identical to data in main memory),
   ARCH_DMA_MINALIGN must be set so that the memory allocator
   makes sure that kmalloc'ed buffer doesn't share a cache line with
   the others. See arch/arm/include/asm/cache.h as an example.

   Note that ARCH_DMA_MINALIGN is about DMA memory alignment
   constraints. You don't need to worry about the architecture data
   alignment constraints (e.g. the alignment constraints about 64-bit
   objects).

> 
> Agree. But if we imagine devm allocations are not used for DMA
> (which is yet another case of interface usage which was never designed for
> but alas this happens left and right) then move of the meta-data to the end of
> the buffers solves [mostly my] problem... but given that DMA case we discuss
> exists I'm not sure if this move actually worth spending time on.

Well, there is a metric ton of devm users that do not allocate memory
buffers, but other objects, and for which we do not need to worry about
alignment.

Thanks.

-- 
Dmitry

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
