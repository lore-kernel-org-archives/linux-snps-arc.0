Return-Path: <SRS0=KDTa=6E=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA5D5C54FD0
	for <linux-snps-arc@archiver.kernel.org>; Mon, 20 Apr 2020 21:04:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8AF4E2078C
	for <linux-snps-arc@archiver.kernel.org>; Mon, 20 Apr 2020 21:04:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="M3/xYGgj";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="KLGeSVsa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8AF4E2078C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lm+RQYmYxoyDkKGk/87PFM+oU0qRJD3jBVDBNn0EHwo=; b=M3/xYGgjndrARt
	Bl19YNCo1Sw7QCMeyIlriH+z/DJRwHPe4hCZJL3cQN3L6uz5Slak1EFJfvTKHkqh0R/08+3hhPfm1
	L3Hmj5DzAGU1I9SummDpgj4aBVjip0Hw2xuaOiBqGzIZlke1BYCezjaV/gJGTdlRnKksEBp979gc1
	DxKoEqK0g+dmllP14gPEsGxDJhvgIHD3YVYbPRUR8cR10oo0DvHlKxYJeJNFKWXwhaBSxoz92qr7a
	jwS1q0sujv/dcPxoe0hoQRiyuqrbgZaQ8cPghj6ro1y404lx2je4/r3uNHj8e8+PJIEiG7egNuebw
	tHyOmEDls60hbBnCaJ+g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQdaN-00061j-3w; Mon, 20 Apr 2020 21:04:11 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQdaD-0005s7-Uh; Mon, 20 Apr 2020 21:04:03 +0000
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5C73920724;
 Mon, 20 Apr 2020 21:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587416641;
 bh=B6tu4PQYxSMIHwT8IIW2BqLBbquTlTHzD+k7VKRWKiY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KLGeSVsaKscXEomFaxLVk4/08pxBFxLmWwvvp/xVS1rq81o2K8P2Bnl1v4kjl/sb2
 XFU86f/Aa7FwnQNCuJpc1uYdan2zLkqza8h9twbemUXWVnnZf6ZvW2IinHp4Lp24AC
 ML8bBjhsBDp85WIi7Pe/U+i6OaK7Z5IAiZJu87jg=
Date: Mon, 20 Apr 2020 22:03:55 +0100
From: Will Deacon <will@kernel.org>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH 2/2] mm/thp: Rename pmd_mknotpresent() as pmd_mknotvalid()
Message-ID: <20200420210354.GD29998@willie-the-truck>
References: <1584680057-13753-1-git-send-email-anshuman.khandual@arm.com>
 <1584680057-13753-3-git-send-email-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1584680057-13753-3-git-send-email-anshuman.khandual@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200420_140402_009307_4D40F08C 
X-CRM114-Status: GOOD (  10.81  )
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
Cc: x86@kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-kernel@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Russell King <linux@armlinux.org.uk>, Steven Rostedt <rostedt@goodmis.org>,
 linux-mips@vger.kernel.org, linux-mm@kvack.org, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 Andy Lutomirski <luto@kernel.org>, Vineet Gupta <vgupta@synopsys.com>,
 nouveau@lists.freedesktop.org, Thomas Gleixner <tglx@linutronix.de>,
 linux-snps-arc@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Fri, Mar 20, 2020 at 10:24:17AM +0530, Anshuman Khandual wrote:
> pmd_present() is expected to test positive after pmdp_mknotpresent() as the
> PMD entry still points to a valid huge page in memory. pmdp_mknotpresent()
> implies that given PMD entry is just invalidated from MMU perspective while
> still holding on to pmd_page() referred valid huge page thus also clearing
> pmd_present() test. This creates the following situation which is counter
> intuitive.
> 
> [pmd_present(pmd_mknotpresent(pmd)) = true]
> 
> This renames pmd_mknotpresent() as pmd_mknotvalid() reflecting the helper's
> functionality more accurately while changing the above mentioned situation
> as follows. This does not create any functional change.
> 
> [pmd_present(pmd_mknotvalid(pmd)) = true]
> 
> This is not applicable for platforms that define own pmdp_invalidate() via
> __HAVE_ARCH_PMDP_INVALIDATE. Suggestion for renaming came during a previous
> discussion here.

Bikeshed alert: maybe pmd_mkinvalid() would be better, given that this is
a one-trick pony for pmdp_invalidate()?

Will

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
