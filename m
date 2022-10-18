Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DF6AC433FE
	for <linux-snps-arc@archiver.kernel.org>; Tue, 18 Oct 2022 09:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+tK6gO7Lcv+bOFolLap9BHmtW4SJS/iJAqgRiaagh/Q=; b=Ia+IrpkjlD9x2Z
	YYmeU+oUuOAcj8R+tR3Z2ZiDZgJkybjqZNAq39l8GnSJMdAe4ubkzGsLku9n7zZAvcs4zKW078Tgi
	SRzV6fVfkeycbIgOvXgu/43jPVIXjr7hCXIW+cJjmcS+8BTgvQ4+wqU78kvoQWI8rHN6KlA9DCHXP
	c7iG+4tLaEMZuBk3kOv2oh2YdIPDdrHHyGbEtK9F/A8jeVvhs0ixdlHMOwRb/FLbNUYVX+VwBhuUF
	HyDUkvcd/kTeo7aKbhr6J8nSjufiE0PCtSJh3OZlaErbkA0IS25Q3gJa2T4lMXBMwUyA6qRN3I7r9
	6oxghmlY7F6yVxdE9CoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okimC-004t0T-1X; Tue, 18 Oct 2022 09:20:44 +0000
Received: from mail.xen0n.name ([115.28.160.31] helo=mailbox.box.xen0n.name)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okim4-004sfZ-0V; Tue, 18 Oct 2022 09:20:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1666084821; bh=N48MFgDUmr1tfKHznoAthvRtR1Wpy0hSpJqTj7oKYC4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cHV6qrCjD47k3jGPjUQF3lwihop1RDaw3yjdG73m7BjSD1b/7jyWqLqeN+Uyk642T
	 VvEcixZUqLhrENpMZkopSZmIH+3rzqlov7m3aEUZuBieiNorHcibY7orD6PjU5mrAB
	 wuldpVWm+HQ77bl4gfDeA0Z+scSMeI8G3x4eFq+M=
Received: from [100.100.57.122] (unknown [220.248.53.61])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 69A5760087;
	Tue, 18 Oct 2022 17:20:20 +0800 (CST)
Message-ID: <27ffa400-b947-7c83-0e79-c8eb9f96e12e@xen0n.name>
Date: Tue, 18 Oct 2022 17:20:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:107.0)
 Gecko/20100101 Thunderbird/107.0a1
Subject: Re: [PATCH] mm: remove kern_addr_valid() completely
Content-Language: en-US
To: Kefeng Wang <wangkefeng.wang@huawei.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-alpha@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-ia64@vger.kernel.org,
 loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-um@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 linux-fsdevel@vger.kernel.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner
 <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Greg Ungerer
 <gerg@linux-m68k.org>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>,
 "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 "David S . Miller" <davem@davemloft.net>, Richard Weinberger
 <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>
References: <20221018074014.185687-1-wangkefeng.wang@huawei.com>
From: WANG Xuerui <kernel@xen0n.name>
In-Reply-To: <20221018074014.185687-1-wangkefeng.wang@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_022036_238161_C4458687 
X-CRM114-Status: GOOD (  17.99  )
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

On 2022/10/18 15:40, Kefeng Wang wrote:
> Most architectures(except arm64/x86/sparc) simply return 1 for

one space before the opening parens

> kern_addr_valid(), which is only used in read_kcore(), and it
> calls copy_from_kernel_nofault() which could check whether the
> address is a valid kernel address, so no need kern_addr_valid(),

minor grammatical nit:

"... which already checks whether the address is a valid kernel address. 
So kern_addr_valid is unnecessary, let's remove it."

> let's remove unneeded kern_addr_valid() completely.
> 
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
>   arch/alpha/include/asm/pgtable.h          |  2 -
>   arch/arc/include/asm/pgtable-bits-arcv2.h |  2 -
>   arch/arm/include/asm/pgtable-nommu.h      |  2 -
>   arch/arm/include/asm/pgtable.h            |  4 --
>   arch/arm64/include/asm/pgtable.h          |  2 -
>   arch/arm64/mm/mmu.c                       | 47 -----------------------
>   arch/arm64/mm/pageattr.c                  |  3 +-
>   arch/csky/include/asm/pgtable.h           |  3 --
>   arch/hexagon/include/asm/page.h           |  7 ----
>   arch/ia64/include/asm/pgtable.h           | 16 --------
>   arch/loongarch/include/asm/pgtable.h      |  2 -
>   arch/m68k/include/asm/pgtable_mm.h        |  2 -
>   arch/m68k/include/asm/pgtable_no.h        |  1 -
>   arch/microblaze/include/asm/pgtable.h     |  3 --
>   arch/mips/include/asm/pgtable.h           |  2 -
>   arch/nios2/include/asm/pgtable.h          |  2 -
>   arch/openrisc/include/asm/pgtable.h       |  2 -
>   arch/parisc/include/asm/pgtable.h         | 15 --------
>   arch/powerpc/include/asm/pgtable.h        |  7 ----
>   arch/riscv/include/asm/pgtable.h          |  2 -
>   arch/s390/include/asm/pgtable.h           |  2 -
>   arch/sh/include/asm/pgtable.h             |  2 -
>   arch/sparc/include/asm/pgtable_32.h       |  6 ---
>   arch/sparc/mm/init_32.c                   |  3 +-
>   arch/sparc/mm/init_64.c                   |  1 -
>   arch/um/include/asm/pgtable.h             |  2 -
>   arch/x86/include/asm/pgtable_32.h         |  9 -----
>   arch/x86/include/asm/pgtable_64.h         |  1 -
>   arch/x86/mm/init_64.c                     | 41 --------------------
>   arch/xtensa/include/asm/pgtable.h         |  2 -
>   fs/proc/kcore.c                           | 26 +++++--------
>   31 files changed, 11 insertions(+), 210 deletions(-)
> 
> diff --git a/arch/loongarch/include/asm/pgtable.h b/arch/loongarch/include/asm/pgtable.h
> index 946704bee599..fc70b7041b76 100644
> --- a/arch/loongarch/include/asm/pgtable.h
> +++ b/arch/loongarch/include/asm/pgtable.h
> @@ -421,8 +421,6 @@ static inline void update_mmu_cache_pmd(struct vm_area_struct *vma,
>   	__update_tlb(vma, address, (pte_t *)pmdp);
>   }
>   
> -#define kern_addr_valid(addr)	(1)
> -
>   static inline unsigned long pmd_pfn(pmd_t pmd)
>   {
>   	return (pmd_val(pmd) & _PFN_MASK) >> _PFN_SHIFT;

Acked-by: WANG Xuerui <git@xen0n.name> # loongarch

Thanks!

-- 
WANG "xen0n" Xuerui

Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
