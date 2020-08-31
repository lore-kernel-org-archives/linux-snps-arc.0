Return-Path: <SRS0=/aUE=CJ=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72270C433E2
	for <linux-snps-arc@archiver.kernel.org>; Mon, 31 Aug 2020 06:47:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B7582072D
	for <linux-snps-arc@archiver.kernel.org>; Mon, 31 Aug 2020 06:47:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZOvuPL1a";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="pymHDF1f"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B7582072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2+BEdQ2JSbD24i6qGLEtJPmBoa0d9ri/wceIfg11anM=; b=ZOvuPL1ayAu6zUHOCakIrYhBvh
	GYovJljvk38tGyD2L3N9H8Mux85mx7Asc6tegYN5tvnXetilRXIAhBswSPkCvRpGdADTEkZ/oEoUP
	G8uR5kM+LuepP4qz1jUr0zTrXFW/gxNr1LMoQF+DAhBM+/wqu+lUSm/WKDdkJ3UV8gmMnlHQbqh2e
	tSQ/gv7B3iflSXkI2nUXyZWPygatwtQBBE86Cgs3A2EVwCiJzMjmoxTOXRNPAJq3m8/aAdnBbjbNJ
	TaupwxFpomhD6MG+CzQku2whaBhljHo+Rp1TSKhIHZB8r+mVRKmR29wxof8qecRTQMPS+bBwk3fRe
	tLdM8yVA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kCdb9-0005ZW-HW; Mon, 31 Aug 2020 06:47:23 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kCdb6-0005Yw-Ur
 for linux-snps-arc@lists.infradead.org; Mon, 31 Aug 2020 06:47:22 +0000
Received: from aquarius.haifa.ibm.com (nesher1.haifa.il.ibm.com [195.110.40.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 31FD42072D;
 Mon, 31 Aug 2020 06:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598856440;
 bh=s6E5dk62F/7tkZOxFbrZuEem/3lQqvI4/Tqsfx9toRY=;
 h=From:To:Cc:Subject:Date:From;
 b=pymHDF1fBg8yfx6PAVz2IaxBvAtw/ssY3kRW7rngUMVuKBv0R81LSCghvTmpLikhh
 YI4JyMU7M+1fkeNgqj0V055RXTx46A256q2xujr1KGwPMXaCe+rFVi4Ygnt6xms6be
 9GT5j4qKwJyRrND1qSVBiN22fJ2pj7nDjZFcAUA4=
From: Mike Rapoport <rppt@kernel.org>
To: Vineet Gupta <vgupta@synopsys.com>
Subject: [RFC/RFT PATCH v3 0/1] arc: add sparsemem support
Date: Mon, 31 Aug 2020 09:47:13 +0300
Message-Id: <20200831064714.16562-1-rppt@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200831_024721_172215_5D3CAD48 
X-CRM114-Status: GOOD (  12.60  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Cc: linux-snps-arc@lists.infradead.org,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, linux-kernel@vger.kernel.org,
 Mike Rapoport <rppt@kernel.org>, Mike Rapoport <rppt@linux.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

From: Mike Rapoport <rppt@linux.ibm.com>

Hi,

This is yet another attempt to enable SPARSEMEM on ARC.

I've boot tested it on nSIM with haps_hs_defconfig with highmem and
sparsemem enabled.

With sparsemem the kernel text becomes a bit smaller, but bss and data are
slightly increased:

$ size discontig/vmlinux sparse/vmlinux
   text	   data	    bss	    dec	    hex	filename
4429390	 785456	 244580	5459426	 534de2	discontig/vmlinux
4415099	 786224	 244844	5446167	 531a17	sparse/vmlinux

I've also added a dummy global functions to wrap pfn_valid(), page_to_pfn()
and pfn_to_page(). Judging by objdump, sparsemem is a bit more efficient:

	DISCONTIGMEM			SPARSEMEM
<pfn_to_page>:
	seths	r2,0x3ffff,r0		lsr	r2,r0,0xe
	mpy	r2,r2,1896		mpy	r0,r0,0x24
	add	r3,r2,0x8050066c	add3	r2,0x80529d1c,r2
	add_s	r2,r2,0x80500668	ld_s	r2,[r2,0]
	ld_s	r3,[r3,0]		bmskn	r2,r2,0x3
	sub_s	r0,r0,r3		j_s.d	[blink]
	ld_s	r2,[r2,0]		add_s	r0,r0,r2
	mpy	r0,r0,0x24		nop_s
	j_s.d	[blink]
	add_s	r0,r0,r2

<page_to_pfn>:
	ld_s	r2,[r0,0]		ld_s	r2,[r0,0]
	lsr_s	r2,r2,0x1f	 	lsr_s	r2,r2,0x1b
	mpy	r2,r2,1896	 	add3	r2,0x80529d1c,r2
	add	r3,r2,0x80500668 	ld_s	r2,[r2,0]
	add_s	r2,r2,0x8050066c 	bmskn	r2,r2,0x3
	ld_s	r3,[r3,0]	 	sub_s	r0,r0,r2
	sub_s	r0,r0,r3	 	asr_s	r0,r0,0x2
	ld_s	r2,[r2,0]	 	mpy	r0,r0,0x38e38e39
	asr_s	r0,r0,0x2	 	j_s	[blink]
	mpy	r0,r0,0x38e38e39
	j_s.d	[blink]
	add_s	r0,r0,r2
	nop_s

<pfn_valid>:
	cmp_s	r0,0x3ffff		lsr_s	r0,r0,0xe
	mov_s	r2,0			brhs.nt	r0,0x20,24
	mov.ls	r2,0x768		add3	r0,0x80529d1c,r0
	add_s	r2,r2,0x80500814	breq_s	r0,0,12
	ld.as	r3,[r2,-106]		ld_s	r0,[r0,0]
	ld.as	r2,[r2,-104]		j_s.d	[blink]
	add_s	r2,r2,r3		xbfu	r0,r0,0x1
	j_s.d	[blink]			j_s.d	[blink]
	seths	r0,r2,r0		mov_s	r0,0
	nop_s

Still, SPARSEMEM has an issue with potentially wasted memory allocated for
the memory map. The memory maps are allocated for each present section,
which means that if part of the section is not populated we'll have a bunch
of unused 'struct page' objects. The smaller the section size, the smaller
is memory overhead, but the section size cannot be much smaller than the
physical address because 

	MAX_PHYSMEM_BITS - SECTION_SIZE_BITS

has to fit into page flags and the room there is limited.

There is yet another possibility to support separate banks. It is possible
to use FLATMEM and free the memmap allocated for the hole, like, for
instance, ARM does [1]. This will require ARC's override for pfn_valid()
that takes into account the actual memory configuration rather than relies
on the memmap.

[1] https://elixir.bootlin.com/linux/latest/source/arch/arm/mm/init.c#L305

Mike Rapoport (1):
  arc: add sparsemem support

 arch/arc/Kconfig                 | 10 ++++++++++
 arch/arc/include/asm/sparsemem.h | 13 +++++++++++++
 arch/arc/mm/init.c               |  6 +++++-
 3 files changed, 28 insertions(+), 1 deletion(-)
 create mode 100644 arch/arc/include/asm/sparsemem.h

-- 
2.26.2


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
