Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAB56C982FA
	for <linux-snps-arc@archiver.kernel.org>; Wed, 23 Sep 2026 11:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=amzCl6i2uUMzNivwwHtmz8kt1uAmItkm97yuzL5rfzs=; b=ME+rZIIOzRWO2U
	qwpb7WFCy3xCJFnqCaIz7zJvfnOyamK4fhC7EKdK1o7Y13DApHgRQ6nwC6shuy0Lhm2lZGXQr0dWo
	MCV7n2N7Mvx326Lm9R9UkOFVcOnzQuTE8D50TAP+IhXSTo7wsY+lxQ+l9LokQ3VR6YK3XeusfWRg8
	64WRp0KlRjcY5LDVbE7lJtfgSEhVSOf2k9BF7GrZW/Xo3gPIioDS0vKAbOhaGd9rHcBs8ThUkjLoH
	2Ab7HsZ4FKuSDXiiyN1isdtdkopW+8xM++ef3EcLF8EYIJMQV0E7Rr4Y0f27lkDUS1aHkp/KZ5kBd
	ajys40AmUEdMEE/DdrRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9LYf-0000000896R-2MUp;
	Wed, 23 Sep 2026 11:54:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9LYd-0000000895y-3n72
	for linux-snps-arc@bombadil.infradead.org;
	Wed, 23 Sep 2026 11:54:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=FyI8OIcx4NePB4wjfBisQg331Da0UMxOk3af3KkO/oU=; b=ej0fbS/p4dCzzrdG2x/X3g+WVP
	TeZiNsYoHf+Df/WNqdUvbdBRdFLIzZKEbVaHbSxw7KokZMMGNccKuWW7ZoOpEFE61KSqX/iCdPi5w
	TNhXjWrnfJPrMKx1mzn69u5sJVTq4/xqiplI2915c90wnoOJttq4TFz/INHKfS/UP4LSOYzWRXIuS
	BWfrxq12YEgF4UhmdvF47UM7Ct6JEqyaVFWVVXtkLYjZOjNsxoKSJJRYakoi1TBzynETsNVSzwFMy
	+sny+ptesb5rVABuloHKhpQWQaCs/kTayLb475qPKbbCljzv3PzJzEEvOHHSM+8NxDkfICraYEK2k
	gCAWwtaQ==;
Received: from out-178.mta0.migadu.com ([2001:41d0:1004:224b::b2] helo=mta0.migadu.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9LYX-0000000EiZ8-2SqZ
	for linux-snps-arc@lists.infradead.org;
	Wed, 23 Sep 2026 11:54:37 +0000
X-Envelope-To: linux-snps-arc@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=FyI8OIcx4NePB4wjfBisQg331Da0UMxOk3af3KkO/oU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790164470; v=1; x=1790769270;
 b=kMldj4AYUT8yqJ2/HGUx81DO0sI7DTABrJnfZvZqNhEnaOcBkF3kO9ovqCglSKA3ZoGEmwzQ
 myrUpr6Ci59L3WUh0aagOl/QFTPBkM3ScedFWa3EDdBl4TTkHoFsuVqy2YM2Bi2MH585oQt1sN+
 K+GIqxsFOFPH2LASEebCNFDk=
X-Envelope-To: linux-snps-arc@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id b457f4ea14dabe32;
	Wed, 23 Sep 2026 11:54:26 +0000
X-Mizu-Trace-ID: b457f4ea14dabe32
X-Migadu-Flow: FLOW_OUT
From: Lance Yang <lance.yang@linux.dev>
To: ljs@kernel.org
Cc: akpm@linux-foundation.org,
	david@kernel.org,
	ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	liam@infradead.org,
	nico.pache@linux.dev,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	lance.yang@linux.dev,
	usama.arif@linux.dev,
	kas@kernel.org,
	guoren@kernel.org,
	bcain@kernel.org,
	geert@linux-m68k.org,
	dinguyen@kernel.org,
	schuster.simon@siemens-energy.com,
	jonas@southpole.se,
	stefan.kristiansson@saunalahti.fi,
	shorne@gmail.com,
	dalias@libc.org,
	glaubitz@physik.fu-berlin.de,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	linux@armlinux.org.uk,
	vgupta@kernel.org,
	monstr@monstr.eu,
	chris@zankel.net,
	jcmvbkbc@gmail.com,
	will@kernel.org,
	aneesh.kumar@kernel.org,
	npiggin@gmail.com,
	peterz@infradead.org,
	davem@davemloft.net,
	andreas@gaisler.com,
	richard.henderson@linaro.org,
	mattst88@gmail.com,
	linmag7@gmail.com,
	catalin.marinas@arm.com,
	mark.rutland@arm.com,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	tsbogend@alpha.franken.de,
	James.Bottomley@HansenPartnership.com,
	deller@gmx.de,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	chleroy@kernel.org,
	hca@linux.ibm.com,
	gor@linux.ibm.com,
	agordeev@linux.ibm.com,
	borntraeger@linux.ibm.com,
	svens@linux.ibm.com,
	richard@nod.at,
	anton.ivanov@cambridgegreys.com,
	johannes@sipsolutions.net,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	arnd@arndb.de,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	jgg@ziepe.ca,
	jhubbard@nvidia.com,
	peterx@redhat.com,
	ysato@users.sourceforge.jp,
	shakeel.butt@linux.dev,
	corbet@lwn.net,
	rdunlap@infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-openrisc@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-snps-arc@lists.infradead.org,
	linux-arch@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	linux-um@lists.infradead.org,
	hughd@google.com,
	qi.zheng@linux.dev,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 08/12] mm: enable MMU_GATHER_RCU_TABLE_FREE for sh-X2
Date: Wed, 23 Sep 2026 19:54:17 +0800
Message-ID: <20260923115417.34112-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260922-rcu-pagetable-freeing-v4-8-fe1ad1f1e303@kernel.org>
References: <20260922-rcu-pagetable-freeing-v4-8-fe1ad1f1e303@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_125434_654776_DFF493CD 
X-CRM114-Status: UNSURE (   9.18  )
X-CRM114-Notice: Please train this message.
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


On Tue, Sep 22, 2026 at 04:35:39PM +0100, Lorenzo Stoakes (ARM) wrote:
>Currently, non-x2 sh specifies CONFIG_MMU_GATHER_RCU_TABLE_FREE allowing
>RCU page table freeing.
>
>sh-X2 is problematic because it utilises slab-allocated PMD page tables,
>and thus tlb_remove_ptdesc() cannot be used in these cases.
>
>All other sh variants are fine as commit e3ecf7c7d082 ("mm: pgtable:
>convert some architectures to use tlb_remove_ptdesc()") already converted
>page table freeing to use tlb_remove_ptdesc(), which does so after an RCU
>grace period when CONFIG_MMU_GATHER_RCU_TABLE_FREE is specified.
>
>Resolve this issue by firstly specifying CONFIG_HAVE_ARCH_TLB_REMOVE_TABLE
>for sh-X2, so the arch can provide its own __tlb_remove_table()
>implementation (called after the RCU grace period).
>
>Then, convert __pmd_free_tlb() to tag the pointer to the PMD, and have
>__tlb_remove_table() check this tag to determine whether to free via the
>slab or to use pagetable_dtor_free().

Makes sense to me, so RCU callback won't mistake a slab PMD for a PTE
page :)

>This follows the pattern used by sparc64 as implemented in commit
>4a0100f7546f ("sparc64: use RCU page table freeing").
>
>Previously __pmd_free_tlb() freed PMD page tables immediately, before any
>TLB flush IPI. This seems to be a pre-existing bug, which this change also
>resolves.
>
>CONFIG_HAVE_ARCH_TLB_REMOVE_TABLE is only specified for sh-X2, as setting
>it disables CONFIG_PT_RECLAIM and causes __tlb_remove_table_one() to call
>tlb_remove_table_sync_rcu() and synchronize_rcu() in turn, and this is not
>necessary for other sh variants.
>
>This forms part of an overall effort to switch every architecture to this
>mode.
>
>Acked-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
>Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
>---

LGTM, feel free to add:

Acked-by: Lance Yang <lance.yang@linux.dev>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
