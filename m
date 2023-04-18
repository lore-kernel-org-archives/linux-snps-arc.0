Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4180BC6FD18
	for <linux-snps-arc@archiver.kernel.org>; Tue, 18 Apr 2023 12:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:In-Reply-To:
	Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yw35BpPvOjJUyj6N0ffpbzF/Rz/ttuW29OLIgUBwqQ8=; b=Wnkj5gQug+RhpZOhRcE6zn3ZyG
	uYSBZC4uCfISpgCUZ6o/Z37FMG5t1ECej+YKdbUDfrWgqVFdAOu5+0HZUrfw+H4vJP9oNrSFhziWW
	dxdaG1OtIRKNMyXO/zM8idVr7SBP5qf0w7lMcj/VWsTw2GkZq/Cq1e4JBhug8jedVEs2l6e3bGBRh
	EGi8k84+5UfynDq93llUqerDpGi5uJRNF4l8Pb+cN7pNOIMEmcEE6Cf/7IEPn7c9weeHVtCvmMUqJ
	nSo33FqRJqOufWaYhwdnHyWsEn9ef+yevHCSszg6oJufcuR/T9sOPw8T+6k3rwRe5oeIK5y2nWiql
	P7EcrvtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poka1-0029K8-06;
	Tue, 18 Apr 2023 12:37:05 +0000
Received: from andre.telenet-ops.be ([2a02:1800:120:4::f00:15])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pokZw-0029Fx-0V
	for linux-snps-arc@lists.infradead.org;
	Tue, 18 Apr 2023 12:37:03 +0000
Received: from ramsan.of.borg ([84.195.187.55])
	by andre.telenet-ops.be with bizsmtp
	id mCci290131C8whw01CciYR; Tue, 18 Apr 2023 14:36:53 +0200
Received: from geert (helo=localhost)
	by ramsan.of.borg with local-esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1pokZe-00H56B-Ey;
	Tue, 18 Apr 2023 14:36:42 +0200
Date: Tue, 18 Apr 2023 14:36:42 +0200 (CEST)
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Arnd Bergmann <arnd@kernel.org>
cc: Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, 
    llvm@lists.linux.dev, Vineet Gupta <vgupta@kernel.org>, 
    Mike Rapoport <rppt@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
    Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
    David Hildenbrand <david@redhat.com>, 
    "Liam R. Howlett" <Liam.Howlett@Oracle.com>, 
    "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
    Suren Baghdasaryan <surenb@google.com>, 
    Naoya Horiguchi <naoya.horiguchi@nec.com>, 
    linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org, 
    linux-mm@kvack.org, Biju Das <biju.das.jz@bp.renesas.com>, 
    linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] [v2] mm: make arch_has_descending_max_zone_pfns()
 static
In-Reply-To: <20230415081904.969049-1-arnd@kernel.org>
Message-ID: <cab7df5e-a7d7-ce15-20fa-31afe6f7180@linux-m68k.org>
References: <20230415081904.969049-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_053700_351216_0799AFFC 
X-CRM114-Status: GOOD (  19.88  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

 	Hi Arnd,

On Sat, 15 Apr 2023, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> clang produces a build failure on x86 for some randconfig builds
> after a change that moves around code to mm/mm_init.c:
>
> Cannot find symbol for section 2: .text.
> mm/mm_init.o: failed
>
> I have not been able to figure out why this happens, but the __weak
> annotation on arch_has_descending_max_zone_pfns() is the trigger here.
>
> Removing the weak function in favor of an open-coded Kconfig option
> check avoids the problem and becomes clearer as well as better to
> optimize by the compiler.
>
> Fixes: 9420f89db2dd ("mm: move most of core MM initialization to mm/mm_init.c")
> Cc: llvm@lists.linux.dev
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> v2: fix logic bug reported-by: kernel test robot <oliver.sang@intel.com>,
> see https://lore.kernel.org/oe-lkp/202304151422.5e4d380b-oliver.sang@intel.com

Thanks, reverting commit 413d478d3b366d09 ("mm: make
arch_has_descending_max_zone_pfns() static") in next-20230417 and
applying your v2 makes Salvator-XS regain its DMA memory zone.

Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

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
