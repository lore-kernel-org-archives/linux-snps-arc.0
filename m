Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42C7EC433F5
	for <linux-snps-arc@archiver.kernel.org>; Mon, 30 May 2022 13:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tQvBn5BlAF4Xnm0teyQMqPBEkjH80ZEVuKvkpekziZU=; b=cgn+1wY69CM3mC
	m5zJXUPxJ8eStkNL5QgnHL6MsO1mIlQC0oR1CYc55+4+iwDtlipi0upvRsye6W/mdp/56EssAI+rC
	GYJRCkrt7u9VexUJ1CUksOOJ9bbLt2dOp6gsn6gKpRFtVY6jS9APWNtmCzXb1AFKB++lGV/mLiiji
	HWbYjGspX5zgzDYm3TTiyleSXEZbXra0yNvPs3G4Q9j2n1Xsllkpd8VYR9hRb25rlHg4kVHXHieWx
	j+Qgp+xjFrtNWKnf6bzm/HGSB2sJ0PbsZeEMv9FhqxuyNjABJcsPqHZT8IOJfarXdFwpni+21kkbI
	tC2LvU75fsvrZe0K2HGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvfbT-006nCd-IQ; Mon, 30 May 2022 13:38:39 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvfVB-006jfC-TB; Mon, 30 May 2022 13:32:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B4F0960F74;
	Mon, 30 May 2022 13:32:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83CBBC385B8;
	Mon, 30 May 2022 13:31:55 +0000 (UTC)
Date: Mon, 30 May 2022 14:31:52 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Peter Xu <peterx@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	Will Deacon <will@kernel.org>, Matt Turner <mattst88@gmail.com>,
	linux-s390@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Brian Cain <bcain@quicinc.com>, Borislav Petkov <bp@alien8.de>,
	linux-alpha@vger.kernel.org, Alistair Popple <apopple@nvidia.com>,
	Jonas Bonn <jonas@southpole.se>,
	linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	linux-snps-arc@lists.infradead.org,
	Vineet Gupta <vgupta@kernel.org>, Vasily Gorbik <gor@linux.ibm.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Rich Felker <dalias@libc.org>, sparclinux@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>,
	David Hildenbrand <david@redhat.com>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
	linux-xtensa@linux-xtensa.org, linux-sh@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org,
	Richard Henderson <rth@twiddle.net>, Guo Ren <guoren@kernel.org>,
	linux-parisc@vger.kernel.org,
	Andrea Arcangeli <aarcange@redhat.com>,
	Helge Deller <deller@gmx.de>, Al Viro <viro@zeniv.linux.org.uk>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-um@lists.infradead.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	openrisc@lists.librecores.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-hexagon@vger.kernel.org, Andy Lutomirski <luto@kernel.org>,
	Stafford Horne <shorne@gmail.com>, linux-csky@vger.kernel.org,
	Heiko Carstens <hca@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>, linux-mips@vger.kernel.org,
	Paul Mackerras <paulus@samba.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	"David S . Miller" <davem@davemloft.net>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Hugh Dickins <hughd@google.com>, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	linux-riscv@lists.infradead.org, Max Filippov <jcmvbkbc@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>,
	x86@kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Richard Weinberger <richard@nod.at>, Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH v4] mm: Avoid unnecessary page fault retires on shared
 memory types
Message-ID: <YpTHSNQxzQxwJ4vQ@arm.com>
References: <20220527193936.30678-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220527193936.30678-1-peterx@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_063210_072958_2A09FD9D 
X-CRM114-Status: GOOD (  15.90  )
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

On Fri, May 27, 2022 at 03:39:36PM -0400, Peter Xu wrote:
> diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
> index 77341b160aca..e401d416bbd6 100644
> --- a/arch/arm64/mm/fault.c
> +++ b/arch/arm64/mm/fault.c
> @@ -607,6 +607,10 @@ static int __kprobes do_page_fault(unsigned long far, unsigned int esr,
>  		return 0;
>  	}
>  
> +	/* The fault is fully completed (including releasing mmap lock) */
> +	if (fault & VM_FAULT_COMPLETED)
> +		return 0;
> +
>  	if (fault & VM_FAULT_RETRY) {
>  		mm_flags |= FAULT_FLAG_TRIED;
>  		goto retry;

For arm64:

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
