Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE683C25B08
	for <linux-snps-arc@archiver.kernel.org>; Wed, 17 Aug 2022 06:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W529HrURfM+1f+xjjbscV642P2FyEHSwpZtAUeDgILo=; b=Ux3yOOcRaAy/9O
	UUHoUMw/g1wZUAniLR0WygLujyGbG3N6emxlkuJ3mbRJyEKjY6z70W1KL+Y/yVzSUL5a3plDDtwPq
	wh6/GGJtts8j/hpSXqk82BKwqV4GU2C0OBoPIXXFCIryN1DhIux3vi7Kn+wVZAGAQuPdJvJdCcg/6
	T8hvPNFppSNNZW+/tLjV+b/MfAFUf9kuA/981TIlGoUwlZ9BnjM7b+eE6I9fXtyhB5o1ckaKDPHiQ
	L8d1U+WJ/FwQdzMf4bkWlhZS9WP3KdRjvU0Obf7FokK15ss1EPpip+5ZV+NijxU6d09wnZpYQ7QXO
	GPfNeXToh26vzEvV15SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOCgH-00C3JD-2g; Wed, 17 Aug 2022 06:37:33 +0000
Received: from gandalf.ozlabs.org ([150.107.74.76])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOCg5-00C35D-BU; Wed, 17 Aug 2022 06:37:22 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4M6ywr2Fflz4x3w;
	Wed, 17 Aug 2022 16:36:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1660718232;
	bh=5lvMCowArwqyA9jSE0Pt5Ze40kYbuyRJPhxadHGIwKI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=V5KRJdowJmJQRJnS7vKpdn3ZRXD54gk+olJ2P9NPfjmi7kMUASVQ2UXCdDQyrJ2l4
	 iCeFUua0EzB2yY0V/Z2I6yNQvrzfQPnJW1W5hxs27Vmfkv+k2UjzPlcs8lpiwhfw0s
	 rXEgyRzix9FElmstXFR+laxsxOuSRDwwsndo9tYxJEmh/ZBPqWv8VEb8et3MiTTUHN
	 x10j5udzl/wNVZu2HvSBSJ+AMCucLU+aGNDpNcmlYlO+lqwPbmi66mdTVNq3+seiCv
	 ALvJpMs3moLPQf8qL2I07gi/1+uKcpDS0UK8SnIKfeX71p9KEinWWl/Ojv6Y5XtZQh
	 hNA8dcj2NpgRA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Zi Yan <zi.yan@sent.com>, linux-mm@kvack.org
Cc: Zi Yan <ziy@nvidia.com>, David Hildenbrand <david@redhat.com>, Matthew
 Wilcox <willy@infradead.org>, Vlastimil Babka <vbabka@suse.cz>, "Kirill A
 . Shutemov" <kirill.shutemov@linux.intel.com>, Mike Kravetz
 <mike.kravetz@oracle.com>, John Hubbard <jhubbard@nvidia.com>, Yang Shi
 <shy828301@gmail.com>, David Rientjes <rientjes@google.com>, James
 Houghton <jthoughton@google.com>, Mike Rapoport <rppt@kernel.org>,
 linux-kernel@vger.kernel.org, Mike Rapoport <rppt@linux.ibm.com>, Vineet
 Gupta <vgupta@synopsys.com>, Shawn Guo <shawnguo@kernel.org>, Taichi
 Sugaya <sugaya.taichi@socionext.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Qin Jian <qinjian@cqplus1.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Guo Ren <guoren@kernel.org>, Huacai Chen
 <chenhuacai@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>, Dinh Nguyen
 <dinguyen@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, "David S. Miller"
 <davem@davemloft.net>, Chris Zankel <chris@zankel.net>, Arnd Bergmann
 <arnd@arndb.de>, Ley Foon Tan <ley.foon.tan@intel.com>, Andrew Morton
 <akpm@linux-foundation.org>, NXP Linux Team <linux-imx@nxp.com>,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-oxnas@groups.io, linux-csky@vger.kernel.org,
 linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-xtensa@linux-xtensa.org
Subject: Re: [PATCH] arch: mm: rename FORCE_MAX_ZONEORDER to
 ARCH_FORCE_MAX_ORDER
In-Reply-To: <20220815143959.1511278-1-zi.yan@sent.com>
References: <20220815143959.1511278-1-zi.yan@sent.com>
Date: Wed, 17 Aug 2022 16:36:57 +1000
Message-ID: <87tu6bv0ja.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220816_233721_588159_BEC5D575 
X-CRM114-Status: UNSURE (   6.39  )
X-CRM114-Notice: Please train this message.
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

Zi Yan <zi.yan@sent.com> writes:
> From: Zi Yan <ziy@nvidia.com>
>
> This Kconfig option is used by individual arch to set its desired
> MAX_ORDER. Rename it to reflect its actual use.
>
> Acked-by: Mike Rapoport <rppt@linux.ibm.com>
> Signed-off-by: Zi Yan <ziy@nvidia.com>
...
>  arch/powerpc/Kconfig                         | 2 +-
>  arch/powerpc/configs/85xx/ge_imp3a_defconfig | 2 +-
>  arch/powerpc/configs/fsl-emb-nonhw.config    | 2 +-

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
