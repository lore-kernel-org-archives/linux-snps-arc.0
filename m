Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 759CBC624CE
	for <linux-snps-arc@archiver.kernel.org>; Tue,  1 Sep 2026 01:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dTDEwp4ec5q9vMoMqFrsFnyegLC7OvrsZ4qbE/DjShI=; b=O6kIKK5JRx9DLn
	OSDJmfoBL0e79SqIgomPalao6z1AaYHzj8uqjUoW1aJoHXAgLMR88tEYZ7iXUem9gZnnFyMYBjrnc
	PSkVibOu8lWAKwcIyoW1TmbXJRImp74lG6GpDgTOpLVg444Kj0BWMv9GAXrikv0PgTIFulKj2m+Zf
	rRW7mWW95HXDqVZPYzLnKyCw8Izs1inm7e5GKMGomo20CerEBxevRI+y6g4PBzNHrkKDFoJG+UENU
	tEqM+OeFK6gntEOa6XwCAlH7dPGi1lHuKk9PWIOBifiDQLIFBVsp+5PhR2J6S4FcSJN5LpxKHrzwu
	uyGCxF/eFEbwaeeL+3hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Did-0000000Apjx-0h0u;
	Tue, 01 Sep 2026 01:55:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Dib-0000000ApjJ-29rf;
	Tue, 01 Sep 2026 01:55:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A24CC601DE;
	Tue,  1 Sep 2026 01:55:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79FF81F000E9;
	Tue,  1 Sep 2026 01:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1788227720;
	bh=CbUFClJ4i3J7LjCwTB/35AHxIba4ym0JuMW7MLg9RkU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=QTvMOsLY/HyZChL07OeBST7evAmOyQDdqEsNG8IojIx94RZcYBwP8DgxztrD6FxPx
	 UxNXGzD1L06crgm/t6O7u1Azv9jZngQt1/ls6DYB8X15tavuE8dNV9b/ojCvXtSt3F
	 /qmxq+B/hEDiFvYVf1+pwfxpoT/BJ9uJYAxsblw0=
Date: Mon, 31 Aug 2026 18:55:19 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-mm@kvack.org, samuel.holland@sifive.com, David Hildenbrand
 <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, Lorenzo Stoakes
 <ljs@kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker
 <dalias@libc.org>, John Paul Adrian Glaubitz
 <glaubitz@physik.fu-berlin.de>, "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
 linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/8] mm: Drop pxd_ERROR()
Message-Id: <20260831185519.66c6e6e83ce62d0fd9aee945@linux-foundation.org>
In-Reply-To: <20260831054331.625505-1-anshuman.khandual@arm.com>
References: <20260831054331.625505-1-anshuman.khandual@arm.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
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

On Mon, 31 Aug 2026 11:13:22 +0530 Anshuman Khandual <anshuman.khandual@arm.com> wrote:

> pxd_ERROR() macros have been provided by all platforms, which are very much
> identical and can be dropped off completely if these pgtable printing could
> be moved to callers in generic MM aka all pxd_clear_bad().
> 
> But first cleanups and re-organizations are required in some platforms that
> are using these macros internally. Afterwards [pte|pmd|pud|p4d|pgd]_ERROR()
> macros have been completely dropped from the entire tree.

All was going nicely until...

> This series is based on v7.3-rc1 after the following patch and has also been
> built tested on multiple platforms.

*what* following patch???

Oh well, I'll queue it all up and shall hope for the arch maintainer
acks to roll in.  Please.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
