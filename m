Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B487C77B7C
	for <linux-snps-arc@archiver.kernel.org>; Mon, 17 Apr 2023 18:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/ikhQ3yGsYuzNJd53O9SQImraqPyq6/sl+Gr42EqWxA=; b=Z84HKHdt6agmX1
	aA4RldWAwYwBb5Y+2228UNsFkzsJMtEPZ+tnWDRgpI75NTwBzYGG2wtodk/ebbIXw0K9wTThA8pP9
	3gkLRE16fHOWEF1DDHgS9w+WatGkh97A43nicU6jLLjkRrR/+tLVV0FM4Nc3rAzTI0EszzT3TreLZ
	i8XEQyn+0UPquU+t4gkQNlfAOfUPwgRBasqC6P048CmhLDT88sCpZzzq0mgEfVm/ZQ8X3QaQv7brt
	OXeY/xISa5fj0ATKs/U0ZUKlCS6h0YoP9Pj2axYFAasb/eu689QMFyXO9l5nRxI41+YG+1pVdUS6R
	Aa+8y0HgqzjCfHmtPiVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poU0i-00HMyf-1y;
	Mon, 17 Apr 2023 18:55:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poU0g-00HMxn-1T
	for linux-snps-arc@lists.infradead.org;
	Mon, 17 Apr 2023 18:55:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2B901626BF;
	Mon, 17 Apr 2023 18:55:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 245CAC433EF;
	Mon, 17 Apr 2023 18:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681757728;
	bh=jpvGVC73BKKb3zx3vqvMtfK1QJtXKHouU9cI0yUXfAI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nOK8sMjEU4Wb4MD/qUb4cZSsCxNFAA3MKO0hekNxrSMI973fsTIRwQbtfPWlHiUOZ
	 CL1UxIVw2mK5N1SyVVJufbiWMVt9zAvrnGQrLsb2Y/VP+C5vRUX0/K+H772BxBrnqW
	 gV76kKx1vWJgQ/GSQMsAmsvKeNWqBpQZAejLoQVL7+2ISot2MyJVxgxHl3mzMKqghK
	 fSxQgS/yktU520k2AyHVAefJzS0Vv3xSOSgHn0ZyLM8JVhlOjLNY2YlcF7yE6WZqp2
	 nUASHScS5EGGleflSPArRKwjWGJOmiX0SIfs+JOLrRUXEE4PGZke7FTHmbREz9aX/P
	 SCV2DFfCIIaFw==
From: SeongJae Park <sj@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	llvm@lists.linux.dev,
	Vineet Gupta <vgupta@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	"Liam R. Howlett" <Liam.Howlett@Oracle.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Naoya Horiguchi <naoya.horiguchi@nec.com>,
	linux-snps-arc@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	SeongJae Park <sj@kernel.org>
Subject: Re: [PATCH] [v2] mm: make arch_has_descending_max_zone_pfns() static
Date: Mon, 17 Apr 2023 18:55:25 +0000
Message-Id: <20230417185525.1420-1-sj@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230415081904.969049-1-arnd@kernel.org>
References: 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_115530_528054_ADED5D0F 
X-CRM114-Status: GOOD (  16.73  )
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

On Sat, 15 Apr 2023 10:18:20 +0200 Arnd Bergmann <arnd@kernel.org> wrote:

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

I was also encountering similar issue, and confirmed replacing the old version
of this patch with this one fixes it.

Tested-by: SeongJae Park <sj@kernel.org>


Thanks,
SJ

> ---
>  arch/arc/mm/init.c | 5 -----
>  include/linux/mm.h | 1 -
>  mm/mm_init.c       | 4 ++--
>  3 files changed, 2 insertions(+), 8 deletions(-)

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
