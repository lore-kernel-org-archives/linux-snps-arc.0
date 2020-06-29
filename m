Return-Path: <SRS0=5kko=AK=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62310C433DF
	for <linux-snps-arc@archiver.kernel.org>; Mon, 29 Jun 2020 15:42:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 300332541D
	for <linux-snps-arc@archiver.kernel.org>; Mon, 29 Jun 2020 15:42:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0rdn/ebn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 300332541D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=x6BtsF5Nd+HRz4CZ3YFqg4sN3dCnk3+EpKPywERwaIg=; b=0rdn/ebnf50+uJPbiQR0/mYoo
	VxBuSzso0jKrCyg0hPFqbJITxCSEhWIEGtJnszPCb3kbGSyZxypaTTbOr9NWmdu3Q84gl484K5JIZ
	VHM+F/Uy4v2baJEfq+ZCF6bg1G6bxrHPbAPPITitK+qYJUMP7gxRMXrSVAXRtLmErgWCGVyBHoVpa
	rlgK8fRo/4jGEF2KobyllRZqi/TD5i8mBpCUz3KDUdWlMtnT0V48DGQMAnkShocKx8b8ashijP6Lj
	laEOEGfZvAfVBDcPOnVQwZPBIi2cyUhBgXgGb8EM1nDdrLtbJuJ6m/KvBCIDBKyEHjPub8BkMThzm
	zit0RIZCw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jpvvl-00018w-Dm; Mon, 29 Jun 2020 15:42:49 +0000
Received: from mail-ot1-f68.google.com ([209.85.210.68])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpvvc-00014o-33; Mon, 29 Jun 2020 15:42:41 +0000
Received: by mail-ot1-f68.google.com with SMTP id 95so5278428otw.10;
 Mon, 29 Jun 2020 08:42:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ByBiz3Yf8Ie7OVrqv/Mz9cEMnJyRfxViWcmC4BsTpCo=;
 b=ZhHI2vYOSrnNGhSx8PtwglLILpsDvgnOMaQPgZofCPLip80giUBsBpjs6UGAsmWSWU
 qhAhiEdNIS7Ns6/NeenftS4cg+YdPBAjUT4501jGUmvkw8qfswKvyQQF3hDWg2vHLyzY
 HcL2Xh4iaqRizUbrPVBkGmoHXE0S6hxL8i6zDkkzs/4s9izsr4H2uaug9SBo35QMDrsX
 fp/SQqNdBg+Dhj7swP+W9YmVLi8Jch9dB1rChLDV1rWL9ELEt8nCUZM7HAU4ZRB35tXN
 Sydn2KYCrDAi12tz/4kgHZbJ4hrhQsBsTWAuAX3HPkg0Oz4UO31w5sFHGBPsqz8FCvpV
 Pblg==
X-Gm-Message-State: AOAM530d1kNGPdNuXYR498fO+I//DB0iJReHxLEjwiD9U2Sf7dCWGxBx
 orLtVnPIuNdLHzMFfU4Y9kSHJ670rA5iuB/eb5A=
X-Google-Smtp-Source: ABdhPJzZv9yrcqjQPIqNSuZYxDZ0MHssHdmPppPpB4X3a0jGl41oFltbqUVWyGPYv/nioiv+o7pFkroyCV6uhkj/ZSQ=
X-Received: by 2002:a05:6830:1451:: with SMTP id
 w17mr1241594otp.250.1593445359003; 
 Mon, 29 Jun 2020 08:42:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200627143453.31835-1-rppt@kernel.org>
 <20200627143453.31835-7-rppt@kernel.org>
In-Reply-To: <20200627143453.31835-7-rppt@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Jun 2020 17:42:28 +0200
Message-ID: <CAMuHMdWP07XqvgrXjCG+n5FssH3BwdDEWA4fD9TQgvVy93uMhQ@mail.gmail.com>
Subject: Re: [PATCH 6/8] asm-generic: pgalloc: provide generic pgd_free()
To: Mike Rapoport <rppt@kernel.org>
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Cc: "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>, linux-csky@vger.kernel.org,
 sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux-Arch <linux-arch@vger.kernel.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Mike Rapoport <rppt@linux.ibm.com>, Abdul Haleem <abdhalee@linux.vnet.ibm.com>,
 arcml <linux-snps-arc@lists.infradead.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 Arnd Bergmann <arnd@arndb.de>, linux-s390 <linux-s390@vger.kernel.org>,
 linux-um <linux-um@lists.infradead.org>, Steven Rostedt <rostedt@goodmis.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Openrisc <openrisc@lists.librecores.org>, Andy Lutomirski <luto@kernel.org>,
 Stafford Horne <shorne@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Parisc List <linux-parisc@vger.kernel.org>, Linux MM <linux-mm@kvack.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 alpha <linux-alpha@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Sat, Jun 27, 2020 at 4:36 PM Mike Rapoport <rppt@kernel.org> wrote:
> From: Mike Rapoport <rppt@linux.ibm.com>
>
> Most architectures define pgd_free() as a wrapper for free_page().
>
> Provide a generic version in asm-generic/pgalloc.h and enable its use for
> most architectures.
>
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>

For the m68k part:
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
