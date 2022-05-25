Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C808AC433F5
	for <linux-snps-arc@archiver.kernel.org>; Wed, 25 May 2022 08:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MTDNGzsMVUHTcKzeLBH8nb341W92ACmFt6TXIu3izwU=; b=NK5PQpo3wLWnti
	i1ys7Vq2pnc4nOWmLaWA7w+U+eISABy5CBmPvjE3Ho/9UaFw+38wYc1Nq+my/oCb4nrKlzyNO0z8n
	l/DemzyvcPrPaieZGWHjfbhYSjFjRDHZbufaW9wBC9YYPqgQ9uvyFdX8msLKGL7zkzgxQw8K1Y7hl
	rLMBN3ENFPOg7FewF/SjMc2epaivQbwIXFwPCc4datbhahASKuCoZ+iTf5cxC6W8Rei8nYMNp9g/f
	W196TYe6BPN8u9ZLqH78YLG1lUuoaAkLyrJTrY2c/MhR10/x4oIBaJlQn5vwnqbhAKbjBZxccO87Q
	U5C0oB/66gQWv0+K1ApA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntm07-00AGss-1Y; Wed, 25 May 2022 08:04:15 +0000
Received: from mail-qv1-f43.google.com ([209.85.219.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntm02-00AGrC-Lq; Wed, 25 May 2022 08:04:12 +0000
Received: by mail-qv1-f43.google.com with SMTP id v5so15917005qvs.10;
 Wed, 25 May 2022 01:04:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AP6YAmjuideizUL7mupGqzQ5PgkASmXHUBF+HT7ISso=;
 b=xfRpagz6pwjDPJJAkAIl2Q88cF4wimc7HVbKjo5VHLOB6TwDboGHIxe3reIH7TEyCJ
 cYS6qW+vfeNRpV6/c/JlGDVwf7Vp3QX1acrz4rNef5TDeD1bPgIX5aGCMb+p4w01E3dt
 MGEpvwLgZwSyw11aVjna6zlh6QELvCE1UeUOez01jvaGR/cd2DtY8H4RmAmnyssveBu6
 i4qQQU3heim/FXSU8wdxtMtD7sN1n02bf8IgPBkmWBZEeEaIiyc9zT73qp8+oO/EqxgG
 pYb8zldPPxzj0HyctmlRnZJTemX070xw/fjk4eFTXpqG+kFVd1hszpdBHDC7m4S87knG
 SatA==
X-Gm-Message-State: AOAM531uFYCmt4D75O5LBYzcOOzhxPmkF4dU5KEaFVD9MP/LWG9AfMZE
 Nbn0q3FiARU0xISkN1AT15yTRKph+J8KeA==
X-Google-Smtp-Source: ABdhPJyEzH8slkVlY5lEbxb+2T+irkFAOPYvnjoKPmspBmCDW6t9qNj0vVG0Lnyvl5L2oFmY8HgY2A==
X-Received: by 2002:a05:6214:2309:b0:435:374d:4bbb with SMTP id
 gc9-20020a056214230900b00435374d4bbbmr24404270qvb.105.1653465847941; 
 Wed, 25 May 2022 01:04:07 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com.
 [209.85.219.174]) by smtp.gmail.com with ESMTPSA id
 y21-20020a376415000000b0069fc13ce23csm896465qkb.109.2022.05.25.01.04.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 May 2022 01:04:06 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id g72so6897778ybf.0;
 Wed, 25 May 2022 01:04:05 -0700 (PDT)
X-Received: by 2002:a05:6902:120e:b0:634:6f29:6b84 with SMTP id
 s14-20020a056902120e00b006346f296b84mr30228977ybu.604.1653465845434; Wed, 25
 May 2022 01:04:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220524234531.1949-1-peterx@redhat.com>
In-Reply-To: <20220524234531.1949-1-peterx@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 May 2022 10:03:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWpCUGXn=KzfpfZqResRR41XkBKZiQQVo_O_Hq+KMcDKg@mail.gmail.com>
Message-ID: <CAMuHMdWpCUGXn=KzfpfZqResRR41XkBKZiQQVo_O_Hq+KMcDKg@mail.gmail.com>
Subject: Re: [PATCH v3] mm: Avoid unnecessary page fault retires on shared
 memory types
To: Peter Xu <peterx@redhat.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux MM <linux-mm@kvack.org>, 
 Richard Henderson <rth@twiddle.net>, David Hildenbrand <david@redhat.com>,
 Matt Turner <mattst88@gmail.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Michal Simek <monstr@monstr.eu>, 
 Russell King <linux@armlinux.org.uk>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, 
 Jonas Bonn <jonas@southpole.se>, Will Deacon <will@kernel.org>, 
 "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
 "H . Peter Anvin" <hpa@zytor.com>, 
 Andrea Arcangeli <aarcange@redhat.com>, openrisc@lists.librecores.org, 
 linux-s390@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, 
 linux-m68k@lists.linux-m68k.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 Heiko Carstens <hca@linux.ibm.com>, Chris Zankel <chris@zankel.net>, 
 Peter Zijlstra <peterz@infradead.org>, Alistair Popple <apopple@nvidia.com>,
 linux-csky@vger.kernel.org, 
 linux-hexagon@vger.kernel.org, Vlastimil Babka <vbabka@suse.cz>, 
 Thomas Gleixner <tglx@linutronix.de>, sparclinux@vger.kernel.org, 
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Stafford Horne <shorne@gmail.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Paul Mackerras <paulus@samba.org>, 
 linux-arm-kernel@lists.infradead.org, Sven Schnelle <svens@linux.ibm.com>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linux-xtensa@linux-xtensa.org, 
 Nicholas Piggin <npiggin@gmail.com>, linux-sh@vger.kernel.org, 
 Vasily Gorbik <gor@linux.ibm.com>, Borislav Petkov <bp@alien8.de>,
 linux-mips@vger.kernel.org, 
 Max Filippov <jcmvbkbc@gmail.com>, Helge Deller <deller@gmx.de>,
 Vineet Gupta <vgupta@kernel.org>, 
 Al Viro <viro@zeniv.linux.org.uk>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Johannes Weiner <hannes@cmpxchg.org>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, linux-um@lists.infradead.org, 
 linux-alpha@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>, 
 linux-ia64@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, 
 Guo Ren <guoren@kernel.org>, linux-snps-arc@lists.infradead.org, 
 Hugh Dickins <hughd@google.com>, Rich Felker <dalias@libc.org>,
 Andy Lutomirski <luto@kernel.org>, 
 Richard Weinberger <richard@nod.at>, linuxppc-dev@lists.ozlabs.org, 
 Brian Cain <bcain@quicinc.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 linux-parisc@vger.kernel.org, "David S . Miller" <davem@davemloft.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220525_010410_757965_78E52194 
X-CRM114-Status: GOOD (  38.53  )
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

On Wed, May 25, 2022 at 1:45 AM Peter Xu <peterx@redhat.com> wrote:
> I observed that for each of the shared file-backed page faults, we're very
> likely to retry one more time for the 1st write fault upon no page.  It's
> because we'll need to release the mmap lock for dirty rate limit purpose
> with balance_dirty_pages_ratelimited() (in fault_dirty_shared_page()).
>
> Then after that throttling we return VM_FAULT_RETRY.
>
> We did that probably because VM_FAULT_RETRY is the only way we can return
> to the fault handler at that time telling it we've released the mmap lock.
>
> However that's not ideal because it's very likely the fault does not need
> to be retried at all since the pgtable was well installed before the
> throttling, so the next continuous fault (including taking mmap read lock,
> walk the pgtable, etc.) could be in most cases unnecessary.
>
> It's not only slowing down page faults for shared file-backed, but also add
> more mmap lock contention which is in most cases not needed at all.
>
> To observe this, one could try to write to some shmem page and look at
> "pgfault" value in /proc/vmstat, then we should expect 2 counts for each
> shmem write simply because we retried, and vm event "pgfault" will capture
> that.
>
> To make it more efficient, add a new VM_FAULT_COMPLETED return code just to
> show that we've completed the whole fault and released the lock.  It's also
> a hint that we should very possibly not need another fault immediately on
> this page because we've just completed it.
>
> This patch provides a ~12% perf boost on my aarch64 test VM with a simple
> program sequentially dirtying 400MB shmem file being mmap()ed and these are
> the time it needs:
>
>   Before: 650.980 ms (+-1.94%)
>   After:  569.396 ms (+-1.38%)
>
> I believe it could help more than that.
>
> We need some special care on GUP and the s390 pgfault handler (for gmap
> code before returning from pgfault), the rest changes in the page fault
> handlers should be relatively straightforward.
>
> Another thing to mention is that mm_account_fault() does take this new
> fault as a generic fault to be accounted, unlike VM_FAULT_RETRY.
>
> I explicitly didn't touch hmm_vma_fault() and break_ksm() because they do
> not handle VM_FAULT_RETRY even with existing code, so I'm literally keeping
> them as-is.
>
> Signed-off-by: Peter Xu <peterx@redhat.com>

>  arch/m68k/mm/fault.c          |  4 ++++

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
