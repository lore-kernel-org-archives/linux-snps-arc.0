Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE668E77184
	for <linux-snps-arc@archiver.kernel.org>; Thu, 19 Dec 2024 17:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p4bK7RHxGghD7FxmIOP/ijuludHfuqXip6Tq/h32eqY=; b=u8w4cvXfzHDISU
	T79b5dFAVlYpK18ofWBw6v887d6w9ZGRWfrD4IICYYj0coWazMlH6yjwQDsgrGZLxTM8qwy5W9yaI
	HddcMZ1susRAiM0+FFpkd59jwddylusaMV9NoNNNhuops2++YCo981Jfs16/qEC3nd8YO6NDO+tya
	j88SbcgT9gvnRC5+kJu+ZB58eruVZqGm3VtzcBhc7fx4cVWlf8Wisz/IMy4caYB6zQq/qWq5bE2ua
	Q3eewBRZ0XHwwt9SFB0LjiCcFlNjxcsAj+9iqFOVM09scUTbIQlw36ICsATKmdKejWNV18Ofa7zsP
	PzUscZ/cWHqWElrzJS5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOKDw-00000002XXs-34Ar;
	Thu, 19 Dec 2024 17:22:08 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOKBJ-00000002Wtu-3JTg;
	Thu, 19 Dec 2024 17:19:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=hD4px1JE4Hs8C37Ywe2qi4X3aSr37zS1Mt6jQs2kxto=; b=jMA8lMwSy3+bHUFP+4fZVh7IPx
	FyB8T3nnJ+VnT7ZEnXN4F5h9lorBeRxAcY4z9Maf9ZBSgXjPacaS/BsCuz4mxMNgmCy3EixkzWxA8
	9nBGzEYRwL6XhZtK8PGvIXWpbtgGjKa8UuZdrgNUr1gstWSzlDEZ4zghJ4X+5rUW+ExR2CzI8b/1g
	YgjbYJKE2JG9e/5b3h6i12Q8gw4+bdp4OGw8Yz1qz6fCcq72C9V4mGlNHIwG/Qn1QQ04br8S23m9g
	PMS2zOscxtTixVnQcYQzt7oYvJcMlPkATcO7LstZ0mhOYVVLul4cf4Ep3YiuOjwMWaSE7gfJig0Rg
	0p7Jj9wg==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tOKBE-00000004Vjs-3SFX;
	Thu, 19 Dec 2024 17:19:21 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 0A1A23004DE; Thu, 19 Dec 2024 18:19:21 +0100 (CET)
Date: Thu, 19 Dec 2024 18:19:20 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Andy Lutomirski <luto@kernel.org>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
	Matthew Wilcox <willy@infradead.org>, linux-alpha@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-snps-arc@lists.infradead.org,
	linux-um@lists.infradead.org, loongarch@lists.linux.dev,
	x86@kernel.org
Subject: Re: [PATCH 01/10] mm: Move common parts of pagetable_*_[cd]tor to
 helpers
Message-ID: <20241219171920.GB26279@noisy.programming.kicks-ass.net>
References: <20241219164425.2277022-1-kevin.brodsky@arm.com>
 <20241219164425.2277022-2-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241219164425.2277022-2-kevin.brodsky@arm.com>
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

On Thu, Dec 19, 2024 at 04:44:16PM +0000, Kevin Brodsky wrote:
> Besides the ptlock management at PTE/PMD level, all the
> pagetable_*_[cd]tor have the same implementation. Introduce common
> helpers for all levels to reduce the duplication.

Uff, I forgot to Cc you on the discussion here, sorry!:

  https://lkml.kernel.org/r/cover.1734526570.git.zhengqi.arch@bytedance.com

we now have two series doing more or less overlapping things :/

You can in fact trivially merge the all the implementations -- the
apparent non-common bit (ptlock_free) is a no-op for all those other
levels because they'll be having ptdesc->lock == NULL.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
