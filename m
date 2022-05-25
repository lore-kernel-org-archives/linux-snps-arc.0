Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AF18C433FE
	for <linux-snps-arc@archiver.kernel.org>; Wed, 25 May 2022 11:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=askJ0xzoxBnqtYifUPxl5mOGZ2iCuqiaMII5Rtb0hyg=; b=mYrZtBNehZLbs5
	VMpuRpBSSuZ/WMzAomZSpZjTKxiWq1SLChP9AXYMHYMBUXfGwJrCe28SiXol5M5lSUWSP1Cwly55m
	A5eeR5bC4J87VfFipfCeTqOMCGJqJXhX10Xpe7Ul1LiyR9Dv0cRVFOObdc7uBmvObLj4hC2Mtbrea
	GrpwVOgpTgWPlM0HyAtgJXWjwUbDpyOYbgwkgrehUX9U1kiSuTe1/O47DC6iTXSrC3Cwgb0BIzE3A
	ZYLdTNUnUixkILMyBThLd8cDQQmhfJZHOw4e0HPNQeYSGYYEqdv2yEfycF+wkpSATQqE2FIelrRd4
	nRvXbI0ZgHoMjyiWRR3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntouY-00Aoo8-TI; Wed, 25 May 2022 11:10:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntouU-00AonC-PO; Wed, 25 May 2022 11:10:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=TTSfncRF4bwVxkeR+S4pHa2NuE5vU7NkHqU52imXoeo=; b=AZ7NLjulpP1WzqY4jAw9CJ6mzn
	eNxn6mITLdAkzreesFIusYyJANkaOvbZVslHzJxDDqo/jW9prJ6mSOYajnNAsWgSTZTPCGe4Y+H+t
	Q7b5K2i3OxODvn+feDcYZuuvagMcqlznlm2xJ6e8wPUzB4c/WkijGr50Z8D32ZlBmwWuMwGQbue1E
	mrsCyjPGVmj7xf/0/rnV0zIseeyVAHCeyTCYTi0ZFmZwkk1CWC0IMPFglArv51u64lwHpRP8/QuNm
	TypGtB34O3uGaPoduTA8k7e4jOZswva+y2onGqiOIb4Z5GAtPEnJDGpyLSzDy3ZlKvUO8MvNVaZm2
	4u9mbK6A==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntouF-001b5f-PS; Wed, 25 May 2022 11:10:25 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 5B9C13002AF;
	Wed, 25 May 2022 13:10:17 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 374CD207688E7; Wed, 25 May 2022 13:10:17 +0200 (CEST)
Date: Wed, 25 May 2022 13:10:17 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Peter Xu <peterx@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	Richard Henderson <rth@twiddle.net>,
	David Hildenbrand <david@redhat.com>,
	Matt Turner <mattst88@gmail.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Michal Simek <monstr@monstr.eu>,
	Russell King <linux@armlinux.org.uk>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	linux-riscv@lists.infradead.org,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Jonas Bonn <jonas@southpole.se>, Will Deacon <will@kernel.org>,
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Andrea Arcangeli <aarcange@redhat.com>,
	openrisc@lists.librecores.org, linux-s390@vger.kernel.org,
	Ingo Molnar <mingo@redhat.com>, linux-m68k@lists.linux-m68k.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Heiko Carstens <hca@linux.ibm.com>, Chris Zankel <chris@zankel.net>,
	Alistair Popple <apopple@nvidia.com>, linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org, Vlastimil Babka <vbabka@suse.cz>,
	Thomas Gleixner <tglx@linutronix.de>, sparclinux@vger.kernel.org,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Stafford Horne <shorne@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Paul Mackerras <paulus@samba.org>,
	linux-arm-kernel@lists.infradead.org,
	Sven Schnelle <svens@linux.ibm.com>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	linux-xtensa@linux-xtensa.org, Nicholas Piggin <npiggin@gmail.com>,
	linux-sh@vger.kernel.org, Vasily Gorbik <gor@linux.ibm.com>,
	Borislav Petkov <bp@alien8.de>, linux-mips@vger.kernel.org,
	Max Filippov <jcmvbkbc@gmail.com>, Helge Deller <deller@gmx.de>,
	Vineet Gupta <vgupta@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-um@lists.infradead.org, linux-alpha@vger.kernel.org,
	Johannes Berg <johannes@sipsolutions.net>,
	linux-ia64@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Dinh Nguyen <dinguyen@kernel.org>, Guo Ren <guoren@kernel.org>,
	linux-snps-arc@lists.infradead.org, Hugh Dickins <hughd@google.com>,
	Rich Felker <dalias@libc.org>, Andy Lutomirski <luto@kernel.org>,
	Richard Weinberger <richard@nod.at>, linuxppc-dev@lists.ozlabs.org,
	Brian Cain <bcain@quicinc.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Andrew Morton <akpm@linux-foundation.org>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	linux-parisc@vger.kernel.org,
	"David S . Miller" <davem@davemloft.net>
Subject: Re: [PATCH v3] mm: Avoid unnecessary page fault retires on shared
 memory types
Message-ID: <Yo4OmaNW5YUrGE0S@hirez.programming.kicks-ass.net>
References: <20220524234531.1949-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220524234531.1949-1-peterx@redhat.com>
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

On Tue, May 24, 2022 at 07:45:31PM -0400, Peter Xu wrote:
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

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
