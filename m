Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B520C00140
	for <linux-snps-arc@archiver.kernel.org>; Mon, 15 Aug 2022 16:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7Ug7MiyeWUtjU2ooHbI0ErglR9y7Gea15gn21Qm2G9w=; b=Yw1qnGo650we9z
	D4nY2bOtierAePoKOwmaCv/F9kGlIQ0nYgIZbtdOsFqjzbTcVqOyiImtm//eAKep5nq/uMJff9Peq
	pTJEtR4+h7pRP6BF513M7P0a0SGbxSNHAeZhvV/+4tHKCDQ8GwOT2kLW9/r7aQM4d8p8YjiHtyqIP
	Q/dcbx1UEuYK7MQweo3LnqBdIUU9aDW2UkbyC4Fj28MVMShkgplpLFGHE6qtF6cLqcJHJKmC0AeCi
	jRl0S8ZUhggjE2Ppsue6MbwVFcSRfYyVWw/EjJrD11yNDCxhqJYX/jXdFMyQnNDXRBynaMJFp9hqk
	83rQnlrr97Z67/EnUSfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNcZN-001FhS-CS; Mon, 15 Aug 2022 16:04:01 +0000
Received: from mout.kundenserver.de ([217.72.192.74])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNcPZ-0018K3-Su; Mon, 15 Aug 2022 15:53:55 +0000
Received: from mail-lf1-f47.google.com ([209.85.167.47]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MmCyE-1nfj1J0PgG-00i8aQ; Mon, 15 Aug 2022 17:53:49 +0200
Received: by mail-lf1-f47.google.com with SMTP id v2so11187754lfi.6;
        Mon, 15 Aug 2022 08:53:48 -0700 (PDT)
X-Gm-Message-State: ACgBeo0j0fGsrHuzaRE3zBdmstVxBpJFApEPH5uOyT/iRi2XvgcQX48l
	uF8oyaHLDTsYTzwSkbMPxoL59CoYv4NjnQ6rZBo=
X-Google-Smtp-Source: AA6agR4kQH9OPkAoSzw4z/FBPTVCt5TcLJ18r0latd6JdISl5KaD+R3rrNlWHfqDqar+qTRK7WgfYWLgQGqiKgJkzhc=
X-Received: by 2002:a17:907:7609:b0:730:d70a:1efc with SMTP id
 jx9-20020a170907760900b00730d70a1efcmr10863122ejc.766.1660578818066; Mon, 15
 Aug 2022 08:53:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220815143959.1511278-1-zi.yan@sent.com>
In-Reply-To: <20220815143959.1511278-1-zi.yan@sent.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 15 Aug 2022 17:53:22 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0TcnXHVsxBkpqLi63XC62Jkg3HChtK4RgB6-giYb+hnw@mail.gmail.com>
Message-ID: <CAK8P3a0TcnXHVsxBkpqLi63XC62Jkg3HChtK4RgB6-giYb+hnw@mail.gmail.com>
Subject: Re: [PATCH] arch: mm: rename FORCE_MAX_ZONEORDER to ARCH_FORCE_MAX_ORDER
To: Zi Yan <ziy@nvidia.com>
Cc: linux-mm@kvack.org, David Hildenbrand <david@redhat.com>, 
	Matthew Wilcox <willy@infradead.org>, Vlastimil Babka <vbabka@suse.cz>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, Mike Kravetz <mike.kravetz@oracle.com>, 
	John Hubbard <jhubbard@nvidia.com>, Yang Shi <shy828301@gmail.com>, 
	David Rientjes <rientjes@google.com>, James Houghton <jthoughton@google.com>, 
	Mike Rapoport <rppt@kernel.org>, linux-kernel@vger.kernel.org, 
	Mike Rapoport <rppt@linux.ibm.com>, Vineet Gupta <vgupta@synopsys.com>, 
	Shawn Guo <shawnguo@kernel.org>, Taichi Sugaya <sugaya.taichi@socionext.com>, 
	Neil Armstrong <narmstrong@baylibre.com>, Qin Jian <qinjian@cqplus1.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Guo Ren <guoren@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Dinh Nguyen <dinguyen@kernel.org>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	"David S. Miller" <davem@davemloft.net>, Chris Zankel <chris@zankel.net>, Arnd Bergmann <arnd@arndb.de>, 
	Ley Foon Tan <ley.foon.tan@intel.com>, Andrew Morton <akpm@linux-foundation.org>, 
	NXP Linux Team <linux-imx@nxp.com>, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-oxnas@groups.io, 
	linux-csky@vger.kernel.org, linux-ia64@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-xtensa@linux-xtensa.org
X-Provags-ID: V03:K1:UYO6+mFs/BkVpMvpHw7KquJZ1u5ueCZ4OlZ8EYwnvMMSnfxwY9G
 PUa8xzZcshLBTe4QNX5CtuUwhporHe3RYU2Cd2Xj1EChDZRZYhZ+IMUmqMHZBmNkpSRb7Lw
 bEN5Zmy3kCx+tXMIQf+z6INo7ktfOu4jFxC6k0CIccYH8Dn9LTn6/mFs74plNTYbzFmoeNX
 u20DzDWt+NzbBJrNyBcBw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Bh8bpl54ZPw=:reZEM2PkzKDDlqTC1pl5KH
 Wr9sACgGaV1tGy4wxYvotpEG27mf+gEou9dfAde7+nVlwVU6OhDtVPt57lhayGjZVCTID5Pjh
 Os7oo7BI749OB1CHRKfhbarALH3Ltb2BwuDh3bgQR14kiUl5RFNPV2NJNO7co9ihFWTufvfGo
 GTiSXeyH7LPPlHpE5E+vHBbMs1lBgWq3sZQB9hvrUVtLw6NxhZGb4f1uDQktRWCW0nuKbnkUo
 4Az8g0voxWiVsJaFhuPnzx3ItcIy9L2azWTdvrp1j4eSPZo7nBQsXc9YILcrjOUkmXOyUdoBr
 /b0T3OBW0tuZ8vV8oxmEJ3OyiMof2WibQJcj6McxNqIvk2/tLMldmPAkSR9VL9/cFkax2+bRb
 PyYv3HjHUZ5R4Vio0H/bcJw9y5YYVKRzABmNUZpzxwP60qm7umdwzlW2yHpekBWMUTAECbMoI
 F7sTJ83OUSmbmfKoIQlQN4eb+VV5oDQ0hec5UzGRdxllOGdlLfLOhUuEHTo9qTMQiJGcHjqvy
 /AMEY2wUO6Ag0eh5Hlh/i5EZIfZcYrFFUyjlBGykpvuFA9tBlfniq1HFurdXh5l6dXM7il86X
 G+2hbmXE9x4mh5mA0kklE6tPajHYlOIUbLs8BSc3c8OfzLWsuUaF0Y7OMybQ8Zb08+/1fArt4
 hRj9fp5C62SUMlgTvf8Iv1W8ifnseMoKaHc9P2rV5OgqNe6J0lmKSkKO/lDSD55Os2v4WCbzX
 vNk4Bu+xCQeArKWX4OB+KYWsNjsLpUCggL8uQNa6WbG9aAELQi94kDy1it2OppT0VE+Somv8u
 2/c7RtYAcX/a7xhCBR20z91v0DRsg+krCvWYqmp5qRanm0iaiVoT2hgpVeS0iTiqjVcAGsdY+
 i5AoEYGogXolxamAQA+w==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220815_085354_379147_5585EAEB 
X-CRM114-Status: UNSURE (   9.32  )
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

On Mon, Aug 15, 2022 at 4:39 PM Zi Yan <zi.yan@sent.com> wrote:
>
> ---
>  arch/arc/Kconfig                             | 2 +-
>  arch/arm/Kconfig                             | 2 +-
>  arch/arm/configs/imx_v6_v7_defconfig         | 2 +-
>  arch/arm/configs/milbeaut_m10v_defconfig     | 2 +-
>  arch/arm/configs/oxnas_v6_defconfig          | 2 +-
>  arch/arm/configs/pxa_defconfig               | 2 +-
>  arch/arm/configs/sama7_defconfig             | 2 +-
>  arch/arm/configs/sp7021_defconfig            | 2 +-
>  arch/arm64/Kconfig                           | 2 +-
>  arch/csky/Kconfig                            | 2 +-
>  arch/ia64/Kconfig                            | 2 +-
>  arch/ia64/include/asm/sparsemem.h            | 6 +++---
>  arch/loongarch/Kconfig                       | 2 +-
>  arch/m68k/Kconfig.cpu                        | 2 +-
>  arch/mips/Kconfig                            | 2 +-
>  arch/nios2/Kconfig                           | 2 +-
>  arch/powerpc/Kconfig                         | 2 +-
>  arch/powerpc/configs/85xx/ge_imp3a_defconfig | 2 +-
>  arch/powerpc/configs/fsl-emb-nonhw.config    | 2 +-
>  arch/sh/configs/ecovec24_defconfig           | 2 +-
>  arch/sh/mm/Kconfig                           | 2 +-
>  arch/sparc/Kconfig                           | 2 +-
>  arch/xtensa/Kconfig                          | 2 +-
>  include/linux/mmzone.h                       | 4 ++--

Acked-by: Arnd Bergmann <arnd@arndb.de>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
