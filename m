Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 382ACC433F5
	for <linux-snps-arc@archiver.kernel.org>; Mon, 30 May 2022 22:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NUIibvSSyQlz3Rvdy7nCqjUlXeFz1bGNmUspVL1I+d0=; b=XiBwtu6sgSnck+
	rWRov09x6JlZmE3WeAPqb9p95auJMC750sEf9FB1igmqZwznR4XJ8208tAoGOiAtnExQ5mU0dLzzm
	fwv01DLMAThCHqqPvYySo46E+CZtoX1FBaKCrJWYV5jqBMjnHShzL8rXNOgWbReHQDbFGFFxpWTB+
	SCgau89oc8bF1PnQRfHLUML0qb2WT+gy/kE9r1iSwhO0JLIs+1C39G7EO2CjBiNNMttp0T+AW/Znq
	qJ4TwJUyDzTS2JGOOsxixBR/sBigYlLCaUerSFXNG2LWBhHDfnl/OxWDc8GxvIrqnc6pTHFMnq3Jy
	85Y2+iDR8auCcxrhEhYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvnrH-008W0n-Br; Mon, 30 May 2022 22:27:31 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvnrB-008Vyp-HF; Mon, 30 May 2022 22:27:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=X1hcG5cF1NoC5nq4+hCb0hCmo39XmqfIWCQv7rPcgiY=; b=eWO5aV77vvkJjiIBqgvW710GQg
	vUFpMDqMEiL6x6ehzs6twDngkNGKUCWf6p0gPNkVCdkYzUw4LohwjCkbeTx8br66JQ7mVPtlFLMAi
	xQcE5BjaQXarYfxDsH9yBV6dUpkSOMYJDs3BtWTQ4SSfUqnhd6to3hN2nDYg0iCK1Krd9LT4iFvjg
	Ik0agmYKrpsdks9sCll0o0GWDMKu4hL9tSGpQYAEFCRiExWDQVcXArLgj2GXuayL4xHkmOik3D3ZQ
	9qVxLOOoUoADGIZLeIqMaBNrZhrWx0nOuXrU8ztpJxaIADUreCyUV7juN+/yevGYx+EE3X+fJsrQS
	sKNCXHqw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:60894)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1nvnqW-0004Nv-OC; Mon, 30 May 2022 23:26:44 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1nvnpx-0001lw-PQ; Mon, 30 May 2022 23:26:09 +0100
Date: Mon, 30 May 2022 23:26:09 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Peter Xu <peterx@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	Ingo Molnar <mingo@redhat.com>, Vasily Gorbik <gor@linux.ibm.com>,
	linuxppc-dev@lists.ozlabs.org, Stafford Horne <shorne@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Johannes Berg <johannes@sipsolutions.net>,
	Brian Cain <bcain@quicinc.com>, x86@kernel.org,
	linux-parisc@vger.kernel.org, Richard Henderson <rth@twiddle.net>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Richard Weinberger <richard@nod.at>, linux-hexagon@vger.kernel.org,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Janosch Frank <frankja@linux.ibm.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	linux-ia64@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
	Sven Schnelle <svens@linux.ibm.com>,
	Andrea Arcangeli <aarcange@redhat.com>,
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Alistair Popple <apopple@nvidia.com>,
	Jonas Bonn <jonas@southpole.se>, sparclinux@vger.kernel.org,
	linux-csky@vger.kernel.org, Will Deacon <will@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>, linux-um@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>, Matt Turner <mattst88@gmail.com>,
	linux-m68k@lists.linux-m68k.org, Paul Mackerras <paulus@samba.org>,
	linux-xtensa@linux-xtensa.org,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	David Hildenbrand <david@redhat.com>, openrisc@lists.librecores.org,
	linux-arm-kernel@lists.infradead.org,
	Nicholas Piggin <npiggin@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Chris Zankel <chris@zankel.net>, Hugh Dickins <hughd@google.com>,
	Vineet Gupta <vgupta@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Rich Felker <dalias@libc.org>, "H . Peter Anvin" <hpa@zytor.com>,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	linux-riscv@lists.infradead.org, Heiko Carstens <hca@linux.ibm.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Andy Lutomirski <luto@kernel.org>,
	Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-snps-arc@lists.infradead.org, linux-alpha@vger.kernel.org,
	linux-mips@vger.kernel.org, Helge Deller <deller@gmx.de>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH v5] mm: Avoid unnecessary page fault retires on shared
 memory types
Message-ID: <YpVEgWHzzH3ZtVzA@shell.armlinux.org.uk>
References: <20220530183450.42886-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220530183450.42886-1-peterx@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_152725_746947_E6749A39 
X-CRM114-Status: GOOD (  34.91  )
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

On Mon, May 30, 2022 at 02:34:50PM -0400, Peter Xu wrote:
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
> Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> Acked-by: Johannes Weiner <hannes@cmpxchg.org>
> Acked-by: Vineet Gupta <vgupta@kernel.org>
> Acked-by: Guo Ren <guoren@kernel.org>
> Acked-by: Max Filippov <jcmvbkbc@gmail.com>
> Acked-by: Christian Borntraeger <borntraeger@linux.ibm.com>
> Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)
> Acked-by: Catalin Marinas <catalin.marinas@arm.com>
> Reviewed-by: Alistair Popple <apopple@nvidia.com>
> Reviewed-by: Ingo Molnar <mingo@kernel.org>
> Signed-off-by: Peter Xu <peterx@redhat.com>

For:

> diff --git a/arch/arm/mm/fault.c b/arch/arm/mm/fault.c
> index a062e07516dd..46cccd6bf705 100644
> --- a/arch/arm/mm/fault.c
> +++ b/arch/arm/mm/fault.c
> @@ -322,6 +322,10 @@ do_page_fault(unsigned long addr, unsigned int fsr, struct pt_regs *regs)
>  		return 0;
>  	}
>  
> +	/* The fault is fully completed (including releasing mmap lock) */
> +	if (fault & VM_FAULT_COMPLETED)
> +		return 0;
> +
>  	if (!(fault & VM_FAULT_ERROR)) {
>  		if (fault & VM_FAULT_RETRY) {
>  			flags |= FAULT_FLAG_TRIED;

Acked-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Thanks!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
