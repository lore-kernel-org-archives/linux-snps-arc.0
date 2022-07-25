Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCD6FC43334
	for <linux-snps-arc@archiver.kernel.org>; Mon, 25 Jul 2022 19:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pctA6RCcvz8z30HCxfdtWoJVk0eG8+SwVBaUJQc4VHY=; b=KDkRkJy1JF79fD
	js/AahXVPaKztBd+caBN6+jQzVzXcXieoBeinIuNAsK3hvShkh47HpGGRe7iumGuFoQ727EMvecUR
	t5+Gi5Lu0l3Afda2kkkimszX4xqnbblLuf3c3IDiAmC0hGsqkD8wR+ZQEIUSwee7uUSWiu9RzsvAA
	fcCWnu8j+LV9Xs11ML0UxpyBTf5PT1yEg/lWdVicwJklD0JOE/vgzhmRXLKcWz6w8kW+rlwL60XMa
	SxPuiXJu8T6XBxk4DaprMnOKrm4tvrnJkbIt2Le/2CkXdkyXpusuiLrxtPSGyk83kcxD/DZygSkKt
	RrQY38Ql/4CB4b1fTyRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oG3vx-000vWR-Ug; Mon, 25 Jul 2022 19:40:05 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oG3vl-000v3F-7r; Mon, 25 Jul 2022 19:39:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id E5517B810A4;
	Mon, 25 Jul 2022 19:39:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24445C341C6;
	Mon, 25 Jul 2022 19:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1658777989;
	bh=cuudPE0wtvbxElXfQCMzPg0O3xDu7MgSPTnAUbd2BI0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=lnm0tSCCxjmphQNW5NriYcH19FeO0pMC/0MZl19jo18xWrIdpmYjjReLjZrbQc3nV
	 M3OCLSW3PO1gZvubU1+zIdU9EZbB6ratbRpHX/aNA2dD8ZrjXLNedUC8xa5hrDNMbu
	 lcZp1M+CGZGybihQDDnCvRc7tTtqd8IELi5v8huc=
Date: Mon, 25 Jul 2022 12:39:48 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Ben Dooks <ben-linux@fluff.org>
Cc: linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-parisc@vger.kernel.org, openrisc@lists.librecores.org,
 linux-ia64@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-snps-arc@lists.infradead.org, linux-alpha@vger.kernel.org
Subject: Re: [PATCH] profile: setup_profiling_timer() is moslty not
 implemented
Message-Id: <20220725123948.f16674b10022404814161d4a@linux-foundation.org>
In-Reply-To: <20220721195509.418205-1-ben-linux@fluff.org>
References: <20220721195509.418205-1-ben-linux@fluff.org>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_123953_491304_B844C8A7 
X-CRM114-Status: GOOD (  17.00  )
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

On Thu, 21 Jul 2022 20:55:09 +0100 Ben Dooks <ben-linux@fluff.org> wrote:

> The setup_profiling_timer() is mostly un-implemented by many
> architectures. In many places it isn't guarded by CONFIG_PROFILE
> which is needed for it to be used. Make it a weak symbol in
> kernel/profile.c and remove the 'return -EINVAL' implementations
> from the kenrel.
> 
> There are a couple of architectures which do return 0 from
> the setup_profiling_timer() function but they don't seem to
> do anything else with it. To keep the /proc compatibility for
> now, leave these for a future update or removal.
> 
> On ARM, this fixes the following sparse warning:
> arch/arm/kernel/smp.c:793:5: warning: symbol 'setup_profiling_timer' was not declared. Should it be static?

I'll grab this.

We have had some problems with weak functions lately.  See

https://lore.kernel.org/all/87ee0q7b92.fsf@email.froward.int.ebiederm.org/T/#u

Hopefully that was a rare corner case.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
