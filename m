Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E6CEC9830B
	for <linux-snps-arc@archiver.kernel.org>; Wed, 23 Sep 2026 13:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5xh8CcrGZlxm/mlh+U+dWcQ8p7mMUUHn59KppS+2HJ4=; b=Bpv3ReuSlowa4v
	7seO/ljjJJ9x+nl3e5/Yg/s1T8iNfh/QQe0FLcZVQfg+UlN2XxfFDIKR9S0yXB/WMQamrfq4f29sD
	g8DJrZXWrg0EGDMRPWWEwFJvFry52rX/DRWds7+E/WGbZfbK7/dEEGO2a0GO0d9aCHEbj+gyUmis5
	ShIVbNgpc3AQcAZuKZ6WN1SzRkRtfQAxmOu5TywZNGIW0FFBmJJSAblY4jiT5XbCsw+B2Hgo1AUda
	dI1tSQj+RVE8haiqYNAfgXejz5Uea3zHSH4VKIOAEDQcx2MZHEeTixhWzgS1evDZ93GbuPFWpZUV3
	K9Gai3tVqnnodgU7YpRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9MvY-00000008NQe-370V;
	Wed, 23 Sep 2026 13:22:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9MvW-00000008NQF-3Hog;
	Wed, 23 Sep 2026 13:22:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 85A34600AA;
	Wed, 23 Sep 2026 13:22:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B955C1F000FF;
	Wed, 23 Sep 2026 13:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790169741;
	bh=fv/PJsh8Z0zTlCVSKOt2XBkxllgDkngoF7NIde+KnzE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oQwWOQkywYDf1JkmRsDbC/o6DR3oPInrHh+/leVHpzXY/fgKnBPlAbat4yOirXksi
	 EWALa8XUeMd2tsIqTrSCJ0hISS3LcHe3D0i0Tgz4u8GN0a6ybM3BZinVZZLhG3Kwem
	 I7b4mFWjjtLPtBFFyxKMPPiC1fv/6tqbKR6ms7bWmlQ8jqkRp5houN8+Tl0nlHq8Ok
	 pNWxEWvRV+ENJCiZHISEOFERm2DQsybnZiI9c7WeH02xnMWwF75/9ODvNlEXLXkUxS
	 1sCqPrGh63gyzzgORCeokaPT4Set6v00jX6f1b6hgWldcMbm+rJMuLtgU0iQ1Yzy3g
	 sAGIwJhyz9HZg==
Date: Wed, 23 Sep 2026 14:21:56 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Lance Yang <lance.yang@linux.dev>
Cc: akpm@linux-foundation.org, david@kernel.org, ziy@nvidia.com, 
	baolin.wang@linux.alibaba.com, liam@infradead.org, nico.pache@linux.dev, ryan.roberts@arm.com, 
	dev.jain@arm.com, baohua@kernel.org, usama.arif@linux.dev, kas@kernel.org, 
	guoren@kernel.org, bcain@kernel.org, geert@linux-m68k.org, dinguyen@kernel.org, 
	schuster.simon@siemens-energy.com, jonas@southpole.se, stefan.kristiansson@saunalahti.fi, 
	shorne@gmail.com, dalias@libc.org, glaubitz@physik.fu-berlin.de, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, linux@armlinux.org.uk, 
	vgupta@kernel.org, monstr@monstr.eu, chris@zankel.net, jcmvbkbc@gmail.com, 
	will@kernel.org, aneesh.kumar@kernel.org, npiggin@gmail.com, peterz@infradead.org, 
	davem@davemloft.net, andreas@gaisler.com, richard.henderson@linaro.org, 
	mattst88@gmail.com, linmag7@gmail.com, catalin.marinas@arm.com, mark.rutland@arm.com, 
	chenhuacai@kernel.org, kernel@xen0n.name, tsbogend@alpha.franken.de, 
	James.Bottomley@hansenpartnership.com, deller@gmx.de, maddy@linux.ibm.com, mpe@ellerman.id.au, 
	chleroy@kernel.org, hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com, 
	borntraeger@linux.ibm.com, svens@linux.ibm.com, richard@nod.at, 
	anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net, tglx@kernel.org, mingo@redhat.com, 
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	arnd@arndb.de, vbabka@kernel.org, rppt@kernel.org, surenb@google.com, 
	mhocko@suse.com, jgg@ziepe.ca, jhubbard@nvidia.com, peterx@redhat.com, 
	ysato@users.sourceforge.jp, shakeel.butt@linux.dev, corbet@lwn.net, rdunlap@infradead.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org, 
	linux-hexagon@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-openrisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-snps-arc@lists.infradead.org, linux-arch@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-alpha@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-s390@vger.kernel.org, linux-um@lists.infradead.org, hughd@google.com, 
	qi.zheng@linux.dev, linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 09/12] mm: enable MMU_GATHER_RCU_TABLE_FREE for
 m68k-motorola
Message-ID: <arPSa1dVX3AOHAvM@gremlin>
References: <20260922-rcu-pagetable-freeing-v4-9-fe1ad1f1e303@kernel.org>
 <20260923131634.47896-1-lance.yang@linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260923131634.47896-1-lance.yang@linux.dev>
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

On Wed, Sep 23, 2026 at 09:16:34PM +0800, Lance Yang wrote:
>
> On Tue, Sep 22, 2026 at 04:35:40PM +0100, Lorenzo Stoakes (ARM) wrote:
> >sun3 and coldfire are already supported, however motorola requires a little
> >more care.
> >
> >Here, custom table removal logic is required, so
> >CONFIG_HAVE_ARCH_TLB_REMOVE_TABLE is enabled for m68k-motorola.
> >
> >Firstly as part of this change, the page table level must be communicated
> >to the underlying __tlb_remove_table() implementation.
> >
> >Take advantage of the fact that page tables are aligned by more than enough
> >to permit setting TABLE_PTE or TABLE_PMD in the low bits of the pointer,
> >and store this there.
> >
> >Then update __pte_free_tlb() and __pmd_free_tlb() to pass this through,
> >then have __tlb_remove_table() decode this and pass it to
> >free_pointer_table().
> >
> >The page table freeing is performed via call_rcu(), so free_pointer_table()
> >now will be invoked from softirq context, and as such may be re-entrant.
> >
> >Introduce an irq save/restore spinlock to handle this, and hold it over the
> >time a given ptable entry is being referenced in both get_pointer_table()
> >and free_pointer_table().
> >
> >In order to make things a little easier in this respect, separate out the
> >logic for adding a new ptable entry into add_pointer_table() and only hold
> >the lock during ptable entry insertion in this case.
> >
> >Note that original list_add_tail(new, dp) added new prior to dp, which is
> >ptable_list[type].next, i.e. after ptable_list[type].
> >
> >The equivalent therefore is list_add(new, &ptable_list[type]), which adds
> >new after ptable_list[type], only without needing to make reference to dp.
> >
> >Note that, as m68k-motorola specifies CONFIG_HAVE_ARCH_TLB_REMOVE_TABLE, it
> >does not enable CONFIG_PT_RECLAIM. This isn't meaningfully impactful.
> >
> >With this applied, all of m68k implements CONFIG_MMU_GATHER_RCU_TABLE_FREE.
> >
> >This forms part of an overall effort to switch every architecture to this
> >mode.
> >
> >Acked-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> >Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> >---
>
> I wondered about slot reuse during the RCU wait, but that can't happen :)
>
> The slot stays marked busy until free_pointer_table() runs after RCU, and
> the last free unlinks the page under ptable_lock.
>
> Also ran page-table teardown stress and fork/exec churn on
> qemu-system-m68k (virt, m68040, CONFIG_MMU_MOTOROLA=y). All 40 rounds ran
> cleanly :D
>
> Acked-by: Lance Yang <lance.yang@linux.dev>
>
> Tested-by: Lance Yang <lance.yang@linux.dev>

Great, thanks! Really appreciate the testing :)

--
Cheers, Lorenzo

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
