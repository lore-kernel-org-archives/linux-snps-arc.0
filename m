Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 398ADC7EE39
	for <linux-snps-arc@archiver.kernel.org>; Mon, 27 Feb 2023 13:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5XjlO66Jo2EKQvuiUYngrTmncDv0OeHbyu1pgZy7WKQ=; b=KnuCLttQzzsPNn
	8FBNCpPcvIe5zbHNfK9sxV3A+m4AimUruqnOboK1OSl4cIEy+EYSxibf4xA+fs6bIPwS9oWAqoTFj
	VDTVaLHs/5NP4Co5N6XUN39ipsnRC35fB/KQIY5/36CJGfY5VKzWJbCVT3VeePPxew/d5TkQfrw8A
	RGpNwDj+XicT6mQidIQeAcYNbdWmaBsKua1Hbffe1jY3mWJrb/4bFC5o/asDXQEXM4V0RzTQgOOhc
	9Im0N5XtH4zScLjxkuzoAutlF9O9vZfFqYbNC345vaqsuguawSZjZ792GQmImidsJNV1Dj5k+9E55
	fBJp9tgjDCtiiKCj66hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWdtT-009r49-B6; Mon, 27 Feb 2023 13:50:19 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWdt8-009qzz-0D; Mon, 27 Feb 2023 13:50:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=EhR9H533iLJtMrWDRv6QbWK1xC5aZF5Krew4cuVbhkY=; b=pjNHlWPfx/mT2hbu+ptXuX0Bfl
	6zxwF35vF7M+uOcH6tkINiOev6YsMPaubnFo73g9CYU3Ll3T9vll1nI0RNIz3WNlOYgiQa0tIVuKA
	B74bpcIknADwNfdW3qiqy/LodWENLcXyHOE5GDwPy8SDC2sGnAK8XRozKiqv3/orCAw1mdFzv6HIi
	4Fd5+VtHusrJQM9si0oyzylM6PKjlqGcBBcB0+w8I4L93cScTcRI07ARzhig2+xcpAnwonlHY3QlK
	3t2CJ+UJ429TvOFTkQzXQL9J1jWkm2YGGPGX0C52K8tzDWANXamImjRh/q37GBZi3LXqJmVgYbqO9
	qyPvOYaw==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWdt1-00093q-0o; Mon, 27 Feb 2023 13:49:51 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 7835530030B;
	Mon, 27 Feb 2023 14:49:49 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 56A33200AAFE3; Mon, 27 Feb 2023 14:49:49 +0100 (CET)
Date: Mon, 27 Feb 2023 14:49:49 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-ia64@vger.kernel.org,
	linux-sh@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-mips@vger.kernel.org, sparclinux@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-hexagon@vger.kernel.org, linux-snps-arc@lists.infradead.org,
	Boqun Feng <boqun.feng@gmail.com>, linux-xtensa@linux-xtensa.org,
	Arnd Bergmann <arnd@arndb.de>, intel-gfx@lists.freedesktop.org,
	linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
	loongarch@lists.linux.dev, Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [Intel-gfx] [PATCH v5 0/7] Introduce __xchg, non-atomic xchg
Message-ID: <Y/y0/VoPAVCXGKp3@hirez.programming.kicks-ass.net>
References: <20230118153529.57695-1-andrzej.hajda@intel.com>
 <Y/ZLH5F8LA3H10aL@hirez.programming.kicks-ass.net>
 <17f40b7c-f98d-789d-fa19-12ec077b756a@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <17f40b7c-f98d-789d-fa19-12ec077b756a@intel.com>
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

On Thu, Feb 23, 2023 at 10:24:19PM +0100, Andrzej Hajda wrote:
> On 22.02.2023 18:04, Peter Zijlstra wrote:
> > On Wed, Jan 18, 2023 at 04:35:22PM +0100, Andrzej Hajda wrote:
> > 
> > > Andrzej Hajda (7):
> > >    arch: rename all internal names __xchg to __arch_xchg
> > >    linux/include: add non-atomic version of xchg
> > >    arch/*/uprobes: simplify arch_uretprobe_hijack_return_addr
> > >    llist: simplify __llist_del_all
> > >    io_uring: use __xchg if possible
> > >    qed: use __xchg if possible
> > >    drm/i915/gt: use __xchg instead of internal helper
> > 
> > Nothing crazy in here I suppose, I somewhat wonder why you went through
> > the trouble, but meh.
> 
> If you are asking why I have proposed this patchset, then the answer is
> simple, 1st I've tried to find a way to move internal i915 helper to core
> (see patch 7).
> Then I was looking for possible other users of this helper. And apparently
> there are many of them, patches 3-7 shows some.
> 
> 
> > 
> > You want me to take this through te locking tree (for the next cycle,
> > not this one) where I normally take atomic things or does someone else
> > want this?
> 
> If you could take it I will be happy.

OK, I'll go queue it in tip/locking/core after -rc1. Thanks!

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
