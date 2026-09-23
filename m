Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14537C98308
	for <linux-snps-arc@archiver.kernel.org>; Wed, 23 Sep 2026 04:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XupzJ0S0y/OIDpxS7jXRW11SmrdPQTV719g39GvBSPA=; b=aGpGS6Iw92HjD8
	4P7f90Hr/33H9+EhllIfIDLaSVvHHrqV/T4PY0fcfVbHuQvuWis7Su1EWSXcE/f52lpqG/pviVLvj
	dFvkJYQznA2fSXLjIopCqES9FGiiyra6/riTJZF7bNKpBgEEXw2OUQR1nXEqmokh66APQZqH3gIeE
	G62SLhMyQtCDS6gzOR7TigbumptMFIS5OQGk1l9YQkGAEiS28UBgRFutsZxN9xOlwzfVWemYv7OrM
	7rW0DjNOBn9GUpIdbGDeuQ/Ni1+eLAbWZ4JbZXAdK/mbtE/5OZp3obk6wxhzmUOlKQKnijaxtFxqs
	M/9pkXYI8sgtOCg1GVCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Elh-000000077fO-1nci;
	Wed, 23 Sep 2026 04:39:41 +0000
Received: from out-221.mta0.migadu.com ([2001:41d0:1004:224b::dd] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Ele-000000077eo-3qAx
	for linux-snps-arc@lists.infradead.org;
	Wed, 23 Sep 2026 04:39:40 +0000
X-Envelope-To: linux-snps-arc@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=iSNouMXA3RwlruRYR9UspqX4v90LzLOpRZaDkTpRMn8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790138376; v=1; x=1790743176;
 b=R9I0X+KWGBE/vaDU7Ovh8r1ZnCbE8G0KoTlLMRHkS4uir8Qc8Jlg/FHj/UKQQ9vDiLa0R3/6
 CYB/ENGaBD8cL7inF0yRGc4Zo+Qg1i+33czD3MrJq68DVns18LKlpJWzyG0YmSYZyz0CpnqQ0/g
 AbdpL0U++ODsZ+08yeuu093s=
X-Envelope-To: linux-snps-arc@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 8a4b30de2f7f9df3;
	Wed, 23 Sep 2026 04:39:35 +0000
X-Mizu-Trace-ID: 8a4b30de2f7f9df3
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
Subject: Re: [PATCH v4 02/12] mm: enable MMU_GATHER_RCU_TABLE_FREE for most 2-level architectures
Date: Wed, 23 Sep 2026 12:39:26 +0800
Message-ID: <20260923043926.76397-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260922-rcu-pagetable-freeing-v4-2-fe1ad1f1e303@kernel.org>
References: <20260922-rcu-pagetable-freeing-v4-2-fe1ad1f1e303@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_213939_490577_3BE6455A 
X-CRM114-Status: UNSURE (   6.30  )
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


On Tue, Sep 22, 2026 at 04:35:33PM +0100, Lorenzo Stoakes (ARM) wrote:
>Commit e3ecf7c7d082 ("mm: pgtable: convert some architectures to use
>tlb_remove_ptdesc()") updated a number of architectures from using
>pagetable_dtor() + tlb_remove_page_ptdesc() to using tlb_remove_ptdesc() in
>__pte_free_tlb().
>
>This is meaningful as tlb_remove_ptdesc() allows for RCU page table
>freeing if CONFIG_MMU_GATHER_RCU_TABLE_FREE is specified.
>
>The csky, hexagon, nios2, openrisc, sh (except X2) and m68k-sun3
>architectures all have 2 levels of page tables, so the only page tables
>ever freed by mmu_gather are PTEs, so this update suffices to ensure that
>every page table freed by the mmu_gather mechanism is freed under RCU.
>
>Therefore, update all of these architectures to select
>CONFIG_MMU_GATHER_RCU_TABLE_FREE.
>
>This forms part of an overall effort to switch every architecture to this
>mode.
>
>Acked-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
>Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
>---

Nothing jumped out at me,

Reviewed-by: Lance Yang <lance.yang@linux.dev>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
