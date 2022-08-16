Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A754C25B0E
	for <linux-snps-arc@archiver.kernel.org>; Tue, 16 Aug 2022 11:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2/Qz0kzk8/al3DBZ/kQRq8A04JHxMue2a2Tyd7QKaWc=; b=a63iTqnjcXaOIS
	RDLHzwOobtwCXzmLvwkdJm4yICyjxov/RdDSG1ONFzZSJ+iQm2YbLhSDcIu28Iuh7PfhpsLoCZAwe
	vVKubpwinyRras02TAeYu3FViTUxhE5I8z9ZlDXyWfYHlhIDUyPCueTuaq80Pjw6oMSsNAqn7qLgm
	unZerX9udVdbRLkhIO/QY7ntxF7GkTPtyXbpPDiUlRWjgiDhliL9+W8BoDt7rd4SYMtdPgXRXvqw1
	tIqMvi8jx98w9A4dci6zNuS9xC+opQfspq0WIM1eoB3xPvoVD81sb9TTcm+r7YIxPPDPRUcc8RM4C
	yOFNUKdd3l4f0MWvKfPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNuQY-001Ou8-B2; Tue, 16 Aug 2022 11:08:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNuQM-001Om2-IZ; Tue, 16 Aug 2022 11:07:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7FF876117B;
	Tue, 16 Aug 2022 11:07:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FE53C43470;
	Tue, 16 Aug 2022 11:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660648070;
	bh=4MGnUkOgJK43wRliQHo1gFwCDv8iRH3dd6NYX9GNPIw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=iAOtt7iIFULr/Q4/88u5bIBV4ZmOlxaddrAvxMGBvFL7Xh9Gww4sccyj8skXqsxn6
	 UxYCQFj7MaUPLNJNvJX71tmu05NUjy/cGnpqzGef54FsQ9jrjR4PVfEV2GI/pUj78b
	 f7MlEEev7pxVP4LQ1aNWa4DLtyJTNigGIftPKZtbqPiwf/wU4Y0IpgrmcHO4cGW/Sl
	 HI6m2BTanzBiCtyT/+mgyKAVQqmrJlJmHxbmBegWvcnJYAvhUqtDEC9bgTzDbdrLy6
	 tPwgkXeHiqKPMNmB/mBbxI3ITYBW3YtLGGDR513ns8pxU6wBl1D1pcvXK0C5G9GZfE
	 jwq4lrWNeLvpQ==
Received: by mail-vs1-f54.google.com with SMTP id k2so9722329vsk.8;
        Tue, 16 Aug 2022 04:07:50 -0700 (PDT)
X-Gm-Message-State: ACgBeo3QTz8iK503fOOh9tq0qxURq0HDnn4iYaJgBDp2GZ+E77248KPs
	3VmqFr/MZaEagKY/g7hZPJaWIaT6VH2cClut/4w=
X-Google-Smtp-Source: AA6agR6jPSaNNOF5k9aH9Wvt0lAB54bLIxg5uSvrINyZxUK1+FmKqYfk1bSdzRgwlPgw75Neoa0irEIOwci8GPjPWYs=
X-Received: by 2002:a05:6102:b14:b0:38a:88dd:c169 with SMTP id
 b20-20020a0561020b1400b0038a88ddc169mr8394631vst.84.1660648058275; Tue, 16
 Aug 2022 04:07:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220815143959.1511278-1-zi.yan@sent.com> <Yvtxv2jywm3+Q3ut@arm.com>
In-Reply-To: <Yvtxv2jywm3+Q3ut@arm.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 16 Aug 2022 19:07:24 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6Np=L9JcrGjh8zy1Kxb8b9f_dzD00kgV6odzZV-L5pbA@mail.gmail.com>
Message-ID: <CAAhV-H6Np=L9JcrGjh8zy1Kxb8b9f_dzD00kgV6odzZV-L5pbA@mail.gmail.com>
Subject: Re: [PATCH] arch: mm: rename FORCE_MAX_ZONEORDER to ARCH_FORCE_MAX_ORDER
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Zi Yan <ziy@nvidia.com>, Linux-MM <linux-mm@kvack.org>, 
	David Hildenbrand <david@redhat.com>, Matthew Wilcox <willy@infradead.org>, Vlastimil Babka <vbabka@suse.cz>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, Mike Kravetz <mike.kravetz@oracle.com>, 
	John Hubbard <jhubbard@nvidia.com>, Yang Shi <shy828301@gmail.com>, 
	David Rientjes <rientjes@google.com>, James Houghton <jthoughton@google.com>, 
	Mike Rapoport <rppt@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Mike Rapoport <rppt@linux.ibm.com>, Vineet Gupta <vgupta@synopsys.com>, 
	Shawn Guo <shawnguo@kernel.org>, Taichi Sugaya <sugaya.taichi@socionext.com>, 
	Neil Armstrong <narmstrong@baylibre.com>, Qin Jian <qinjian@cqplus1.com>, 
	Guo Ren <guoren@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Dinh Nguyen <dinguyen@kernel.org>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	"David S. Miller" <davem@davemloft.net>, Chris Zankel <chris@zankel.net>, Arnd Bergmann <arnd@arndb.de>, 
	Ley Foon Tan <ley.foon.tan@intel.com>, Andrew Morton <akpm@linux-foundation.org>, 
	NXP Linux Team <linux-imx@nxp.com>, linux-snps-arc@lists.infradead.org, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-oxnas@groups.io, 
	linux-csky@vger.kernel.org, linux-ia64@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k <linux-m68k@lists.linux-m68k.org>, 
	"open list:MIPS" <linux-mips@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org, 
	Linux-sh list <linux-sh@vger.kernel.org>, sparclinux@vger.kernel.org, 
	linux-xtensa@linux-xtensa.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220816_040754_709953_EECCD018 
X-CRM114-Status: GOOD (  14.02  )
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

For LoongArch:

Acked-by: Huacai Chen <chenhuacai@kernel.org>

On Tue, Aug 16, 2022 at 6:30 PM Catalin Marinas <catalin.marinas@arm.com> wrote:
>
> On Mon, Aug 15, 2022 at 10:39:59AM -0400, Zi Yan wrote:
> > diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> > index 571cc234d0b3..c6fcd8746f60 100644
> > --- a/arch/arm64/Kconfig
> > +++ b/arch/arm64/Kconfig
> > @@ -1401,7 +1401,7 @@ config XEN
> >       help
> >         Say Y if you want to run Linux in a Virtual Machine on Xen on ARM64.
> >
> > -config FORCE_MAX_ZONEORDER
> > +config ARCH_FORCE_MAX_ORDER
> >       int
> >       default "14" if ARM64_64K_PAGES
> >       default "12" if ARM64_16K_PAGES
>
> For arm64:
>
> Acked-by: Catalin Marinas <catalin.marinas@arm.com>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
