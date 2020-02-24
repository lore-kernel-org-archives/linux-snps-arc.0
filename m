Return-Path: <SRS0=ka13=4M=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C501C35673
	for <linux-snps-arc@archiver.kernel.org>; Mon, 24 Feb 2020 01:59:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4568A205C9
	for <linux-snps-arc@archiver.kernel.org>; Mon, 24 Feb 2020 01:59:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="S1JQC5De"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4568A205C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mXBX/vpwnOopT72FeYh9/hIRenaz+1UaPx/Or0tvG2k=; b=S1JQC5DeuxmkYc
	tUA3VHYPhv7NdosIGVQXvDZzXYSTvOYsFnJTgJsDqXsx1WPjVZyG+vgVCeNcffBhpqfZZzUZzCQp+
	NUBH8AzQqElS6AY/nPn/1zUEaoeWsxE/z7LKn+aXv7XmMRflBvkchcVPRPJsoWF9X8J9qBVGwABvB
	4YkVl0ZfYiEHhNfNaPaHxKWtEgfQ7zvkj8OccwiiZCBLSnnz1sLDuvbG4EPH6iHj87OW3h7kJDRiX
	1WHMAm9XN4gaFBE6S9ou6c06DWN7mME7NNJO9yGepBYArrS2IRjyejygsowjjndMEE2/aWbTa2Ii5
	ikvtbZYg4uZxbd1rk3gQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j631a-0001tB-2N; Mon, 24 Feb 2020 01:59:10 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j631M-0001ft-Rd; Mon, 24 Feb 2020 01:58:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E20D41FB;
 Sun, 23 Feb 2020 17:58:53 -0800 (PST)
Received: from [10.162.16.95] (p8cg001049571a15.blr.arm.com [10.162.16.95])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 97E1F3F6CF;
 Sun, 23 Feb 2020 17:58:46 -0800 (PST)
Subject: Re: [PATCH V14] mm/debug: Add tests validating architecture page
 table helpers
To: linux-mm@kvack.org
References: <1581909460-19148-1-git-send-email-anshuman.khandual@arm.com>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <fac4f03a-0cd3-29ad-b5e2-9aca2dd07b39@arm.com>
Date: Mon, 24 Feb 2020 07:28:46 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1581909460-19148-1-git-send-email-anshuman.khandual@arm.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200223_175856_939307_9ACEF481 
X-CRM114-Status: GOOD (  15.32  )
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
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 x86@kernel.org, Mike Rapoport <rppt@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linux-snps-arc@lists.infradead.org, Vasily Gorbik <gor@linux.ibm.com>,
 Borislav Petkov <bp@alien8.de>, Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A . Shutemov" <kirill@shutemov.name>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Christophe Leroy <christophe.leroy@c-s.fr>, Vineet Gupta <vgupta@synopsys.com>,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 02/17/2020 08:47 AM, Anshuman Khandual wrote:
> This adds a test validation for architecture exported page table helpers.
> Patch adds basic transformation tests at various levels of the page table.
> 
> This test was originally suggested by Catalin during arm64 THP migration
> RFC discussion earlier. Going forward it can include more specific tests
> with respect to various generic MM functions like THP, HugeTLB etc and
> platform specific tests.
> 
> https://lore.kernel.org/linux-mm/20190628102003.GA56463@arrakis.emea.arm.com/
> 
> Needs to be applied on linux V5.6-rc2
> 
> Changes in V14:
> 
> - Disabled DEBUG_VM_PGFLAGS for IA64 and ARM (32 Bit) per Andrew and Christophe
> - Updated DEBUG_VM_PGFLAGS documentation wrt EXPERT and disabled platforms
> - Updated RANDOM_[OR|NZ]VALUE open encodings with GENMASK() per Catalin
> - Updated s390 constraint bits from 12 to 4 (S390_MASK_BITS) per Gerald
> - Updated in-code documentation for RANDOM_ORVALUE per Gerald
> - Updated pxx_basic_tests() to use invert functions first per Catalin
> - Dropped ARCH_HAS_4LEVEL_HACK check from pud_basic_tests()
> - Replaced __ARCH_HAS_[4|5]LEVEL_HACK with __PAGETABLE_[PUD|P4D]_FOLDED per Catalin
> - Trimmed the CC list on the commit message per Catalin

Hello Andrew,

As there are no further comments on this patch from last week, wondering
if you would possibly consider this patch. But if you feel there is still
something which need to be taken care here, please do let me know.

Thank you.

- Anshuman

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
