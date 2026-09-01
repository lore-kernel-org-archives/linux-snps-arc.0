Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 591E3C624CE
	for <linux-snps-arc@archiver.kernel.org>; Tue,  1 Sep 2026 01:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7rNnbeHS0xM1rbrAWYc3b4+9/0v20IezNTJcXD8JBfg=; b=vnvUg00yidoums
	ZGaJfixFAioxIDdVp3C4VdKiSwy7uLIvwU8kQw09idJ59/WG8VIUYns0WhPgwOyMASt7Y3G5uLvoI
	Aar8xx+k8YL295oXMVYwmLbOtkSkJz4HnZNcf/utqZTcU44FSnRPUwNZlps9obxh03LeA86DF9uhD
	kHufgwjFBIj/yzaItkBlYl0J5JPYn4SwWLd76CYTtKpleUc+RbYaa0yOF9r/UMbkjHw8op39uuUcc
	LS0mB+8d0jcvN64bGI4WwAjy/Oh+jHw5BayEocDP/Uq6iuMH6gMHc6kozKvBWPgWjuNUO/qbQI05p
	/jzcGfeQb5oe+uqqhUTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Dgd-0000000ApTA-2WOx;
	Tue, 01 Sep 2026 01:53:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Dgc-0000000ApS6-07oB;
	Tue, 01 Sep 2026 01:53:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 22D17409AC;
	Tue,  1 Sep 2026 01:53:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E38F1F000E9;
	Tue,  1 Sep 2026 01:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1788227597;
	bh=nfPoQFWa5XJK2n+gLXq+InLZ1SHvMm2K6VuNoOpddPc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Zq8VpLupvgE2yRJw1KQGeavVibzTXHtpjCONjfoal2aDB/f32LHC+a9EHOOObR2dz
	 XMrE7NHF4NkTlRLOvkXFK75juHDjUVcCkQ7WguvUjYiW12f7gOk81DFIAVNvWoojWS
	 hStPm28T4PEXRZKb5fXVKK4E/erKvPmWGFqjKOw0=
Date: Mon, 31 Aug 2026 18:53:15 -0700
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
Subject: Re: [PATCH 6/8] sh/mm: Stop using [p4d|pud|pmd]_ERROR()
Message-Id: <20260831185315.ec745606e7eeae6d1116b7d1@linux-foundation.org>
In-Reply-To: <20260831054331.625505-7-anshuman.khandual@arm.com>
References: <20260831054331.625505-1-anshuman.khandual@arm.com>
	<20260831054331.625505-7-anshuman.khandual@arm.com>
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

On Mon, 31 Aug 2026 11:13:28 +0530 Anshuman Khandual <anshuman.khandual@arm.com> wrote:

> Stop using [p4d|pud|pmd]_ERROR() in __get_pte_phys() as the pgtable entries
> are known to be NULL and hence could not really be accessed.

A note to the sh maintainers: Sashiko might have found a couple of bugs
in __get_pte_phys():

	https://sashiko.dev/#/patchset/20260831054331.625505-1-anshuman.khandual@arm.com

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
