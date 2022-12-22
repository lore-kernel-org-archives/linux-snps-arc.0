Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82698C4332F
	for <linux-snps-arc@archiver.kernel.org>; Thu, 22 Dec 2022 17:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=itm1an+aXidbZBIiqs/e0xOmiwS+rk8zpfacIEOqZFU=; b=V6Y5wnNX6RCAFz
	CgKtDpF6ShuVWfAOL6FogPoMfdf5AOHSA4hWn5Aawu+qFatV3lc8tbo5e0uiRUjuiopsXyMBQVWMv
	IfyPruiWoIgKCzZVgini6FzO7WYGAWPG+ouGXAGp0E5S+Xe+vRt0O5iKvAQ7DsgguIhZxbHSAIrrU
	aI9b0eFFDITZA/CKSD7R/+2K8pASo74k9OPvaZmMB/WyWt0dYQ2i15N2b+1JrNxLhf126/nKgGAgq
	Z8kq1wSOqZMfRvBFHV090UvXu3jvVqvicUvPV77uJ0pTVYVzjSeF66WLb8Xf5VpgJpY6YzSEnAcPc
	5trYQKEWBqoPUTKyxsfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8PGd-00FEmm-Ex; Thu, 22 Dec 2022 17:22:03 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8PGQ-00FEjW-Hx; Thu, 22 Dec 2022 17:21:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6FB2361CC7;
	Thu, 22 Dec 2022 17:21:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11A31C433D2;
	Thu, 22 Dec 2022 17:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1671729708;
	bh=gMuNx/ETzj/pkU8IgNrRcwRUZ5VOS050gceZG8hotd0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=oaxbYeHTTs0NTDHc1u4zsA/7HQBinJcPSMs3s/KVnxc//k0Ntz1pPgpR2Dmr88gAU
	 WZZBXxDL6Tc0QjJMc73INnk/0KOkuFbF7iNB59sbgWiBpJYnibIJSSo4sqTI8wPaJQ
	 JdMD0wV8Cbb5JpT60P63Yh/T9dCr1NIuxhm2H/M4=
Date: Thu, 22 Dec 2022 09:21:47 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
 loongarch@lists.linux.dev, linux-m68k@vger.kernel.org,
 linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Arnd Bergmann <arnd@arndb.de>, Rodrigo
 Vivi <rodrigo.vivi@intel.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Peter Zijlstra <peterz@infradead.org>,
 Boqun Feng <boqun.feng@gmail.com>, Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 00/19] Introduce __xchg, non-atomic xchg
Message-Id: <20221222092147.d2bb177c67870884f2e59a9b@linux-foundation.org>
In-Reply-To: <20221222114635.1251934-1-andrzej.hajda@intel.com>
References: <20221222114635.1251934-1-andrzej.hajda@intel.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221222_092150_720646_39EED3E8 
X-CRM114-Status: GOOD (  22.93  )
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

On Thu, 22 Dec 2022 12:46:16 +0100 Andrzej Hajda <andrzej.hajda@intel.com> wrote:

> Hi all,
> 
> I hope there will be place for such tiny helper in kernel.
> Quick cocci analyze shows there is probably few thousands places
> where it could be useful.

So to clarify, the intent here is a simple readability cleanup for
existing open-coded exchange operations.  The intent is *not* to
identify existing xchg() sites which are unnecessarily atomic and to
optimize them by using the non-atomic version.

Have you considered the latter?

> I am not sure who is good person to review/ack such patches,

I can take 'em.

> so I've used my intuition to construct to/cc lists, sorry for mistakes.
> This is the 2nd approach of the same idea, with comments addressed[0].
> 
> The helper is tiny and there are advices we can leave without it, so
> I want to present few arguments why it would be good to have it:
> 
> 1. Code readability/simplification/number of lines:
> 
> Real example from drivers/net/ethernet/mellanox/mlx5/core/esw/qos.c:
> -       previous_min_rate = evport->qos.min_rate;
> -       evport->qos.min_rate = min_rate;
> +       previous_min_rate = __xchg(evport->qos.min_rate, min_rate);
> 
> For sure the code is more compact, and IMHO more readable.
> 
> 2. Presence of similar helpers in other somehow related languages/libs:
> 
> a) Rust[1]: 'replace' from std::mem module, there is also 'take'
>     helper (__xchg(&x, 0)), which is the same as private helper in
>     i915 - fetch_and_zero, see latest patch.
> b) C++ [2]: 'exchange' from utility header.
> 
> If the idea is OK there are still 2 qestions to answer:
> 
> 1. Name of the helper, __xchg follows kernel conventions,
>     but for me Rust names are also OK.

I like replace(), or, shockingly, exchange().

But...   Can we simply make swap() return the previous value?

	previous_min_rate = swap(&evport->qos.min_rate, min_rate);



_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
