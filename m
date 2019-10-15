Return-Path: <SRS0=vguH=YI=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8A9AECE588
	for <linux-snps-arc@archiver.kernel.org>; Tue, 15 Oct 2019 12:10:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BAFCC21925
	for <linux-snps-arc@archiver.kernel.org>; Tue, 15 Oct 2019 12:10:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GxIikEgi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BAFCC21925
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OkYTG5bNlnswz8vT/2xWLEvObMvenhf0qqvY9upKYQM=; b=GxIikEgiYrblSX
	oPZ6sG9GLbr6NZSL2fEkzhL6WvZK5vYHGvDBDdVvQD0vvlnWWsutk3EOXNbWmMIYmx/FDb2j8hu9W
	JmbtkGyBpRlGjEC5/bGZLsesA1Cl2ZRMEAKtlWy8hsg7bFEje127zqLtnj/oELg35dn8QYAlKIf44
	NCsXQm6ewp1qcNgp1C/7Nq6Hfi945//QnqDvm/qKdmsRjmReCz72kJUwuaR1x4RQl1TXIxcsNJsLD
	GG4RgpxdXvmX5Pnzyi5zWyl9bDunUWbXjofscwENmNL/HllJCvK/LZwR0Wc6SkgCQ1YktmES0YA7Z
	W5QdvgcwtJXrVAXHgZNg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iKLeZ-0003XA-9Q; Tue, 15 Oct 2019 12:10:15 +0000
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iKLeM-0002C5-JQ; Tue, 15 Oct 2019 12:10:04 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 574D7B316;
 Tue, 15 Oct 2019 12:09:59 +0000 (UTC)
Date: Tue, 15 Oct 2019 14:09:56 +0200
From: Michal Hocko <mhocko@kernel.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH V6 1/2] mm/page_alloc: Make alloc_gigantic_page()
 available for general use
Message-ID: <20191015120956.GF317@dhcp22.suse.cz>
References: <1571131302-32290-1-git-send-email-anshuman.khandual@arm.com>
 <1571131302-32290-2-git-send-email-anshuman.khandual@arm.com>
 <9da1f196-51bd-06ac-c5dc-b55776fce2be@redhat.com>
 <20191015114723.GD317@dhcp22.suse.cz>
 <513bc2f7-8110-58f7-36c1-a04b59f11f7e@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <513bc2f7-8110-58f7-36c1-a04b59f11f7e@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191015_051002_796302_1826494B 
X-CRM114-Status: GOOD (  14.86  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 James Hogan <jhogan@kernel.org>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Andrea Arcangeli <aarcange@redhat.com>, linux-s390@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Matthew Wilcox <willy@infradead.org>, Steven Price <Steven.Price@arm.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 David Rientjes <rientjes@google.com>, linux-snps-arc@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Kees Cook <keescook@chromium.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>, linuxppc-dev@lists.ozlabs.org,
 Mark Brown <broonie@kernel.org>, "Kirill A . Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, Vlastimil Babka <vbabka@suse.cz>,
 Oscar Salvador <osalvador@suse.de>, Christophe Leroy <christophe.leroy@c-s.fr>,
 Sri Krishna chowdary <schowdary@nvidia.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dave Hansen <dave.hansen@intel.com>, linux-mips@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>,
 Mike Rapoport <rppt@linux.vnet.ibm.com>, Vineet Gupta <vgupta@synopsys.com>,
 Martin Schwidefsky <schwidefsky@de.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Mel Gorman <mgorman@techsingularity.net>,
 "David S. Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Tue 15-10-19 13:50:02, David Hildenbrand wrote:
> On 15.10.19 13:47, Michal Hocko wrote:
> > On Tue 15-10-19 13:42:03, David Hildenbrand wrote:
> > [...]
> > > > -static bool pfn_range_valid_gigantic(struct zone *z,
> > > > -			unsigned long start_pfn, unsigned long nr_pages)
> > > > -{
> > > > -	unsigned long i, end_pfn = start_pfn + nr_pages;
> > > > -	struct page *page;
> > > > -
> > > > -	for (i = start_pfn; i < end_pfn; i++) {
> > > > -		if (!pfn_valid(i))
> > > > -			return false;
> > > > -
> > > > -		page = pfn_to_page(i);
> > > 
> > > Am I missing something or should here really be a pfn_to_online_page() here
> > > instead of a pfn_valid() ?
> > 
> > http://lkml.kernel.org/r/20180423000943.GO17484@dhcp22.suse.cz
> > 
> 
> So we managed to add PageReserved(page) but not pfn_to_online_page(). But it
> is the right thing to do? (or am I missing something?)

Yeah, pfn_to_online_page is better. But please note that this is an
optimistic check. The real check has to be done when isolating the
pageblock because things might change in the meantime.
-- 
Michal Hocko
SUSE Labs

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
