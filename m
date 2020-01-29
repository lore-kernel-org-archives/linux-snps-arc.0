Return-Path: <SRS0=NTAw=3S=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: *
X-Spam-Status: No, score=1.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,URIBL_DBL_ABUSE_MALW autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFA0DC33CB2
	for <linux-snps-arc@archiver.kernel.org>; Wed, 29 Jan 2020 10:37:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F3B120708
	for <linux-snps-arc@archiver.kernel.org>; Wed, 29 Jan 2020 10:37:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ADfS9Ofx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F3B120708
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GQsLdqrmorJasvUSbuPt5MQtJrWBf3bu9huRAy3CvJg=; b=ADfS9OfxwotU7j
	7VGq3iL3QV8IARlUyWMD9fHYn7N0u2DQlOh21/XHf2k7MczHirpb2AawQEZWBMfZUQK5VlSMwE3O0
	cB9bX30Vomy8WFasNELMIfYbx1ujPElOslLzMERJU8c7bnwbTfmqOhte9Iy2oLPPO8kjnZZtULfOX
	kPKeJhdO+R3u2T63rd3mjz6nEm6HlYcA2WBvt2CSLhe23MhS3wJP0dtTOckfJL4Owc0OYAE0AA7bU
	0YAHhPPcAPWtqTb9P1ttzH82Zd8DEWv5Mei1y7EOGwkJMzikCMPPE3a//XuL72uB1swQtwf8AaOQY
	BR/vu7m3COkjE5S22baA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iwkiU-0006b2-QU; Wed, 29 Jan 2020 10:37:02 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iwkiJ-0006SZ-JM; Wed, 29 Jan 2020 10:36:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F35521FB;
 Wed, 29 Jan 2020 02:36:47 -0800 (PST)
Received: from arrakis.emea.arm.com (arrakis.cambridge.arm.com [10.1.196.47])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id
 B1FB23F52E; Wed, 29 Jan 2020 02:36:42 -0800 (PST)
Date: Wed, 29 Jan 2020 10:36:40 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Qian Cai <cai@lca.pw>
Subject: Re: [PATCH V12] mm/debug: Add tests validating architecture page
 table helpers
Message-ID: <20200129103640.GA668562@arrakis.emea.arm.com>
References: <20200128174709.GK655507@arrakis.emea.arm.com>
 <69091BA4-18C4-4425-A5E2-31FBE4654AF9@lca.pw>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <69091BA4-18C4-4425-A5E2-31FBE4654AF9@lca.pw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200129_023651_725960_6E1AAABE 
X-CRM114-Status: GOOD (  15.35  )
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
Cc: Mark Rutland <Mark.Rutland@arm.com>, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 James Hogan <jhogan@kernel.org>, Heiko Carstens <heiko.carstens@de.ibm.com>,
 Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
 Ingo Molnar <mingo@kernel.org>, linux-s390@vger.kernel.org,
 Jason Gunthorpe <jgg@ziepe.ca>, Michael Ellerman <mpe@ellerman.id.au>,
 x86@kernel.org, Russell King - ARM Linux <linux@armlinux.org.uk>,
 Matthew Wilcox <willy@infradead.org>, Steven Price <Steven.Price@arm.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Vlastimil Babka <vbabka@suse.cz>, linux-snps-arc@lists.infradead.org,
 Kees Cook <keescook@chromium.org>,
 Anshuman Khandual <Anshuman.Khandual@arm.com>,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>, Mark Brown <broonie@kernel.org>,
 "Kirill A . Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Sri Krishna chowdary <schowdary@nvidia.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Dave Hansen <dave.hansen@intel.com>, linux-mips@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>, linux-kernel@vger.kernel.org,
 Paul Burton <paul.burton@mips.com>, Mike Rapoport <rppt@linux.vnet.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Vineet Gupta <vgupta@synopsys.com>,
 Martin Schwidefsky <schwidefsky@de.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Tue, Jan 28, 2020 at 02:07:10PM -0500, Qian Cai wrote:
> On Jan 28, 2020, at 12:47 PM, Catalin Marinas <catalin.marinas@arm.com> wrote:
> > The primary goal here is not finding regressions but having clearly
> > defined semantics of the page table accessors across architectures. x86
> > and arm64 are a good starting point and other architectures will be
> > enabled as they are aligned to the same semantics.
> 
> This still does not answer the fundamental question. If this test is
> simply inefficient to find bugs,

Who said this is inefficient (other than you)?

> who wants to spend time to use it regularly? 

Arch maintainers, mm maintainers introducing new macros or assuming
certain new semantics of the existing macros.

> If this is just one off test that may get running once in a few years
> (when introducing a new arch), how does it justify the ongoing cost to
> maintain it?

You are really missing the point. It's not only for a new arch but
changes to existing arch code. And if the arch code churn in this area
is relatively small, I'd expect a similarly small cost of maintaining
this test.

If you only turn DEBUG_VM on once every few years, don't generalise this
to the rest of the kernel developers (as others pointed out, this test
is default y if DEBUG_VM).

Anyway, I think that's a pointless discussion, so not going to reply
further (unless you have technical content to add).

-- 
Catalin

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
