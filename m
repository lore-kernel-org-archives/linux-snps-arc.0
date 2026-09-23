Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74D4CC98302
	for <linux-snps-arc@archiver.kernel.org>; Wed, 23 Sep 2026 06:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7mCv+Cr0K99TH2X3TA0yk3kn9OeBiOnT5qGluANDax4=; b=ZMx9Ne/njn4VBk
	G39tt4IkVVq251Ayxr3AG81inm6kMLuxsfU1roJ2F7RpR32Hmc+mZKkIeTxzIEvJgKpkBw9tKbVPo
	EIVl71BnhyC8cj329yzIE1nPgm3W40tf1wAPW4puJj+RbmiAXptT5FYVbkKhR7FOiZ8OkGIiCIQ7J
	joATRf8qJ9/dr09aOshdpSNnthHkLlhKXD7TDWMokSBSGRVUkw9MoMCjLAg8RBQGTZdJ/LvqWxxen
	yOjtxkI03X6pj0keTWeRp/kYTMV7H/AneEgTHsu7Xnmz3eY43PoR1jsuQQXj0y5mlN6xO/nfSTwOL
	9zbetNJUZAiX+ZXwMJpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9GH5-00000007Fr7-0YRv;
	Wed, 23 Sep 2026 06:16:11 +0000
Received: from out-75.mta1.migadu.com ([95.215.58.75] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9GH2-00000007Fpl-1E5Q
	for linux-snps-arc@lists.infradead.org;
	Wed, 23 Sep 2026 06:16:10 +0000
X-Envelope-To: linux-snps-arc@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=iNN52+OjGBWKHuNTOEPyALCLpNm9HUlYo8ccDdYusP4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790144164; v=1; x=1790748964;
 b=gag9wr/2m9nlYMg94wqKX0sL+xHtX2PQLyIL0XDY/IEf6zvjcqM4ToozQDjaYNC0SbsW7uX0
 h9u+YxvHsPkhrZniHNejScthRlTvUpSuJw+p86CP75SstPEgn2FWeIj1kXX89now5P/OA7ZLzps
 fk4oVuIAdp5yGiKT1mU1fOEY=
X-Envelope-To: linux-snps-arc@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 4b4ce70d101944f5;
	Wed, 23 Sep 2026 06:16:01 +0000
X-Mizu-Trace-ID: 4b4ce70d101944f5
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
Subject: Re: [PATCH v4 03/12] mm: enable MMU_GATHER_RCU_TABLE_FREE for MMU riscv
Date: Wed, 23 Sep 2026 14:15:51 +0800
Message-ID: <20260923061551.84398-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260922-rcu-pagetable-freeing-v4-3-fe1ad1f1e303@kernel.org>
References: <20260922-rcu-pagetable-freeing-v4-3-fe1ad1f1e303@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_231608_479643_FFFE1859 
X-CRM114-Status: UNSURE (   6.81  )
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


On Tue, Sep 22, 2026 at 04:35:34PM +0100, Lorenzo Stoakes (ARM) wrote:
>Currently riscv gates MMU_GATHER_RCU_TABLE_FREE on CONFIG_SMP and
>CONFIG_MMU.
>
>Commit 69be3fb111e7 ("riscv: enable MMU_GATHER_RCU_TABLE_FREE for SMP &&
>MMU") enabled CONFIG_MMU_GATHER_RCU_TABLE_FREE for CONFIG_SMP, CONFIG_MMU
>riscv builds.
>
>This is expressly for the safety of GUP-fast walkers (CONFIG_HAVE_GUP_FAST
>is enabled if CONFIG_MMU is enabled).
>
>Naturally a single core system does not encounter issues with software page
>table walkers being correctly synchronised across cores, as there is only a
>single core.
>
>However, CONFIG_PREEMPT_RCU is still available on a riscv UP system, so for
>a future RCU-only page table walker, this guarantee is required to prevent
>concurrent page table teardown.
>
>All page table freeing is already done via tlb_remove_ptdesc() so the
>conditions of CONFIG_MMU_GATHER_RCU_TABLE_FREE are already met.
>
>This forms part of an overall effort to switch every architecture to this
>mode.
>
>Acked-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
>Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
>---

Yeah, for RISC-V, page-table freeing already goes through
tlb_remove_ptdesc() :) Tested on QEMU, no issues seen :)

Tested-by: Lance Yang <lance.yang@linux.dev>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
