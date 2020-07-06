Return-Path: <SRS0=D8Vs=AR=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97259C433E0
	for <linux-snps-arc@archiver.kernel.org>; Mon,  6 Jul 2020 01:12:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F3A520715
	for <linux-snps-arc@archiver.kernel.org>; Mon,  6 Jul 2020 01:12:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="P1pZfbXW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F3A520715
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=D9C1IruhPfrja3xywVW4ipIOsY9V/eGmTNgE6MSU17k=; b=P1pZfbXWoPpokNObUjS5oSym3
	YPizJiuGXdwgQUEq7L0CNAlPYKBh0uheSbYztNilcq6DBSV3MdDk9Yfqv5OoOB9MyoaKWascAyQnH
	9v+RV6TC3TFcR8WWl4UBJ55UqjG3M+zYvz3FPICSeIug7uw7YHwl0MXli8if9AThzyQPqOvsi6mek
	vmRmnlAVf+l8QviZAk8OxTNdg8PY5l86bO5YZte2VtoGjgP6Jk8FHuK0VU2vpgPyIh3Ig37WgTBDf
	HimRYOTLjfe3pV7+9ARz3T+OmxeCoi6sAEUxJZga83bB0hPicR8mQBx3DZVGZ67rIn2nK7S6uwea4
	mN6lt4wUA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jsFgh-0000vx-Ng; Mon, 06 Jul 2020 01:12:51 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jsFgd-0000tz-8o; Mon, 06 Jul 2020 01:12:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C883030E;
 Sun,  5 Jul 2020 18:12:45 -0700 (PDT)
Received: from [10.163.84.195] (unknown [10.163.84.195])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F364F3F718;
 Sun,  5 Jul 2020 18:12:33 -0700 (PDT)
Subject: Re: [PATCH V4 0/4] mm/debug_vm_pgtable: Add some more tests
To: linux-mm@kvack.org
References: <1593996516-7186-1-git-send-email-anshuman.khandual@arm.com>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <3e03e6da-139f-94df-73aa-4aaf174f71f5@arm.com>
Date: Mon, 6 Jul 2020 06:41:42 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1593996516-7186-1-git-send-email-anshuman.khandual@arm.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200705_211247_384107_72126D30 
X-CRM114-Status: GOOD (  18.43  )
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
Cc: linux-doc@vger.kernel.org,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Mike Rapoport <rppt@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>, Zi Yan <ziy@nvidia.com>,
 Catalin Marinas <catalin.marinas@arm.com>, linux-snps-arc@lists.infradead.org,
 Vasily Gorbik <gor@linux.ibm.com>, Borislav Petkov <bp@alien8.de>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A . Shutemov" <kirill@shutemov.name>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Christophe Leroy <christophe.leroy@c-s.fr>, Vineet Gupta <vgupta@synopsys.com>,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org


On 07/06/2020 06:18 AM, Anshuman Khandual wrote:
> This series adds some more arch page table helper validation tests which
> are related to core and advanced memory functions. This also creates a
> documentation, enlisting expected semantics for all page table helpers as
> suggested by Mike Rapoport previously (https://lkml.org/lkml/2020/1/30/40).
> 
> There are many TRANSPARENT_HUGEPAGE and ARCH_HAS_TRANSPARENT_HUGEPAGE_PUD
> ifdefs scattered across the test. But consolidating all the fallback stubs
> is not very straight forward because ARCH_HAS_TRANSPARENT_HUGEPAGE_PUD is
> not explicitly dependent on ARCH_HAS_TRANSPARENT_HUGEPAGE.
> 
> Tested on arm64, x86 platforms but only build tested on all other enabled
> platforms through ARCH_HAS_DEBUG_VM_PGTABLE i.e powerpc, arc, s390. The
> following failure on arm64 still exists which was mentioned previously. It
> will be fixed with the upcoming THP migration on arm64 enablement series.
> 
> WARNING .... mm/debug_vm_pgtable.c:860 debug_vm_pgtable+0x940/0xa54
> WARN_ON(!pmd_present(pmd_mkinvalid(pmd_mkhuge(pmd))))
> 
> This series is based on v5.8-rc4.
> 
> Changes in V4:
> 
> - Replaced READ_ONCE() with ptep_get() while accessing PTE pointers per Christophe
> - Fixed function argument alignments per Christophe

+Cc - Zi Yan, Gerald Schaefer, Christophe Leroy

The Cc list was not complete. Please do let me know if you could
not retrieve all the four patches of the series from the list.

- Anshuman

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
