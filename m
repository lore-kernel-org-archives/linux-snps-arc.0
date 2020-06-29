Return-Path: <SRS0=5kko=AK=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A66EBC433DF
	for <linux-snps-arc@archiver.kernel.org>; Mon, 29 Jun 2020 15:59:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 716E425583
	for <linux-snps-arc@archiver.kernel.org>; Mon, 29 Jun 2020 15:59:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ppfbCj3J";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ve2Rt8tV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 716E425583
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2dSADtmaHO2Bk3I0j+vrdpUlsvJzmqNvq4cQ7l4HFSU=; b=ppfbCj3JhHtSTXay5aVPv10A0
	xHzHmBFHl1qoh6T1npgl4iUIi19HZMwiLF0DWeDVVJISwrUCNm38/NW8bRgRrC1RWMgmgAAccE4yi
	s6bDJyr0w5tlQ48W6RDzIHlZ1c+262BxsnfUz9FvQKn5e9hzzwAKC00728J3FCGYliDYlUZUPL4Sy
	/DvxbCatDIRspjLkpkKGkoSoobYUQMeZ+qMqF1ys5Q7eUUemzRM0roScaW/4cXUArGcZEojGSbeQG
	L6nVPwznVSogpYes5IOzcYXJ8ZqtzuqJttRxGVp/QXl/fh6H8h8ASeucC1wUVA9kx6cvJesfYHEcX
	6W/V0Yzlg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jpwC4-00053M-R2; Mon, 29 Jun 2020 15:59:40 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpwBx-000514-Pw; Mon, 29 Jun 2020 15:59:34 +0000
Received: from kernel.org (unknown [87.71.40.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5E93025581;
 Mon, 29 Jun 2020 15:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593446372;
 bh=O/nZ0BxK4nESVxMtlEZ3aR9HUzEjAJ3vpNzo90oK+Gw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ve2Rt8tVmffLLnlIRt4m0+FLkplbTh12wsmkxiiXh2shMIztHBj9/nk/f9S/ai5jU
 3BFQpw5Dz/XZFCZs/y8ymsBDt+3vvNo/l/kVYqcYBemM5Bac+QbcUhusbQGI9QlPev
 vYsxGXmlFAgYBNiTAVuThytC5RkEIP2ptiiEd7Jg=
Date: Mon, 29 Jun 2020 18:59:20 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH 4/8] asm-generic: pgalloc: provide generic
 pmd_alloc_one() and pmd_free_one()
Message-ID: <20200629155920.GD1492837@kernel.org>
References: <20200627143453.31835-1-rppt@kernel.org>
 <20200627143453.31835-5-rppt@kernel.org>
 <20200627190304.GG25039@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200627190304.GG25039@casper.infradead.org>
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, linux-mips@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>,
 Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>, linux-csky@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arch@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>,
 linux-hexagon@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Mike Rapoport <rppt@linux.ibm.com>, Abdul Haleem <abdhalee@linux.vnet.ibm.com>,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>, linux-s390@vger.kernel.org,
 linux-um@lists.infradead.org, Steven Rostedt <rostedt@goodmis.org>,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 Andy Lutomirski <luto@kernel.org>, Stafford Horne <shorne@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Sat, Jun 27, 2020 at 08:03:04PM +0100, Matthew Wilcox wrote:
> On Sat, Jun 27, 2020 at 05:34:49PM +0300, Mike Rapoport wrote:
> > More elaborate versions on arm64 and x86 account memory for the user page
> > tables and call to pgtable_pmd_page_ctor() as the part of PMD page
> > initialization.
> > 
> > Move the arm64 version to include/asm-generic/pgalloc.h and use the generic
> > version on several architectures.
> > 
> > The pgtable_pmd_page_ctor() is a NOP when ARCH_ENABLE_SPLIT_PMD_PTLOCK is
> > not enabled, so there is no functional change for most architectures except
> > of the addition of __GFP_ACCOUNT for allocation of user page tables.
> 
> Thanks for including this line; it reminded me that we're not setting
> the PageTable flag on the page, nor accounting it to the zone page stats.
> Hope you don't mind me tagging a patch to do that on as 9/8.

We also never set PageTable flag for early page tables and for the page
tables allocated directly with get_free_page(), e.g PTI, KASAN.

> We could also do with a pud_page_[cd]tor and maybe even p4d/pgd versions.
> But that brings me to the next question -- could/should some of this
> be moved over to asm-generic/pgalloc.h?  The ctor/dtor aren't called
> from anywhere else, and there's value to reducing the total amount of
> code in mm.h, but then there's also value to keeping all the ifdef
> ARCH_ENABLE_SPLIT_PMD_PTLOCK code together too.  So I'm a bit torn.
> What do you think?

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
