Return-Path: <SRS0=CgLW=J4=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_ALL,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9024C433B4
	for <linux-snps-arc@archiver.kernel.org>; Sat,  1 May 2021 21:03:57 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA7546139A
	for <linux-snps-arc@archiver.kernel.org>; Sat,  1 May 2021 21:03:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA7546139A
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=natalenko.name
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mAGROjHv757wyPCfrvry2tCHQzue17WbdQF820vUoyI=; b=PMQM5dYeHuu86dYAbfavlkMpD
	WRLU+WRve6GS5ZmLwEUIar6BUckmvKFzH9P2ww+7Cr1CTkRV1xvvX4I6hDK9EfDl+WuijGLZBBudJ
	X4pmy/MQ3k72HeT1W/1JeCIe+3aN6pjdTWRzCEIwLLSbuc2d+Em9tI4v88kHLM7LSP3nxAUBzd+WD
	4WTJ1xqZ+RmLTqYn3T2F+ukWVdrzVA92Soh3ZsXPuBobtTgkCo5WkLRCiBZXe6vvPcFMNW6EvpBy/
	KnoykUaCE+TN+YKvz4PMqYq9pHc8zfTQ46aPXXKc4tZGtC3Mnw8xyArP0sBR9rDc2ZYu4mhHAdKLM
	raGRKKYhg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lcwmJ-00AgYM-Bc; Sat, 01 May 2021 21:03:55 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcwmG-00AgYC-DL
 for linux-snps-arc@desiato.infradead.org; Sat, 01 May 2021 21:03:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=AcbSLwuICr6Udix8ctgEOYjRfptG+tEIQT5YVV6bUi8=; b=JAed4Zk6nboswJzihhMCUi0UcH
 YQ8cidYlKe1YNWmmYeZ0OIrCfegDK/vUzFhDu5FiBpHvYHpUwjEy0MGAd+GxtsmJsdKC721k8Z4/b
 NKndnLmOzKJ+a8EreSmn8StUDHJVWPrIqeP3VJ2rrkBPf+nRzk9xRfmUBwql60dGYS3jQqly7BbLI
 SUEqRBGKwrnR9LbAECesJWx1NOizvSN0HQj+oan+bflUjGHOwBXmZmYJUjUboQbaC8pcPmUCkEJou
 M6hZtP8bKRfuXV3GB6MojQ5leqp5iBSImBuAalRvmwroqah4do2RpREt+J0tOvhjQlhuc8ZfszPIu
 fiT+Nk4g==;
Received: from vulcan.natalenko.name ([2001:19f0:6c00:8846:5400:ff:fe0c:dfa0])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcwmB-0029Vz-Sv
 for linux-snps-arc@lists.infradead.org; Sat, 01 May 2021 21:03:49 +0000
Received: from localhost (unknown [151.237.229.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by vulcan.natalenko.name (Postfix) with ESMTPSA id 8DC33A5DF54;
 Sat,  1 May 2021 23:03:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=natalenko.name;
 s=dkim-20170712; t=1619903018;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AcbSLwuICr6Udix8ctgEOYjRfptG+tEIQT5YVV6bUi8=;
 b=R+qKBo8+Odi+ppTFSIOpPGb8VaxfcVkkhTqC4TE0dsGVraIuFto8vUJM1p3s+WYkrA1JIQ
 7I+tt3lWzHq7mfTV52Y+RB0MgE/jVJ8gZ4PAwDEKxqqFxLQB7xWu8GS1SdkOOEWwj8w1M9
 52Rggvh2enI1e83tRL9WDcbTEGAikkg=
Date: Sat, 1 May 2021 23:03:37 +0200
From: Oleksandr Natalenko <oleksandr@natalenko.name>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Vineet Gupta <Vineet.Gupta1@synopsys.com>, Arnd Bergmann <arnd@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Jann Horn <jannh@google.com>, lkml <linux-kernel@vger.kernel.org>,
 arcml <linux-snps-arc@lists.infradead.org>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>
Subject: Re: Heads up: gcc miscompiling initramfs zlib decompression code at
 -O3
Message-ID: <20210501210337.66qxgomc643lbdyi@spock.localdomain>
References: <75d07691-1e4f-741f-9852-38c0b4f520bc@synopsys.com>
 <CAHk-=wjJEgjCYzHZFPxTs01p7FMEHKKqXyqwRVBk6KnvHB1qVA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHk-=wjJEgjCYzHZFPxTs01p7FMEHKKqXyqwRVBk6KnvHB1qVA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210501_140348_113916_F835C6E5 
X-CRM114-Status: GOOD (  17.79  )
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

Hello.

On Fri, Apr 30, 2021 at 03:06:30PM -0700, Linus Torvalds wrote:
> On Fri, Apr 30, 2021 at 1:46 PM Vineet Gupta <Vineet.Gupta1@synopsys.com> wrote:
> >
> > I've hit a mainline gcc 10.2 (also gcc 9.3) bug which triggers at -O3
> > causing wrong codegen.
> 
> I'd be more than happy to just disable CC_OPTIMIZE_FOR_PERFORMANCE_O3 entirely.

FWIW, we used to find real bugs using -O3 in the past [1].

> The advantages are very questionable - with a lot of the optimizations
> at O3 being about loops, something which the kernel to a close
> approximation doesn't have.
> 
> Most kernel loops are "count on one hand" iterations, and loop
> optimizations generally just make things worse.
> 
> And we've had problems with -O3 before, because not only are the
> optimizations a bit esoteric, they are often relatively untested. If
> you look around at various projects (outside the kernel), -O2 is
> generally the "default".
> 
> And that's entirely ignoring the gcc history - where -O3 has often
> been very buggy indeed. It's gotten much better, but I just don't see
> the upside of using -O3.
> 
> In fact, it looks like we already have that
> 
>         depends on ARC
> 
> for -O3, exactly because nobody really wants to use this.
> 
> So this bug seems to be entirely ARC-specific, in that only ARC can
> use -O3 for the kernel already.
> 
>              Linus

[1] https://lore.kernel.org/lkml/673b885183fb64f1cbb3ed2387524077@natalenko.name/

-- 
  Oleksandr Natalenko (post-factum)

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
