Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6105BC43334
	for <linux-snps-arc@archiver.kernel.org>; Tue, 12 Jul 2022 02:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yXlrRj0SKlhbyMVFLH/wIuPc+lU8iZr2baWMx05RdfQ=; b=iWmcOPlWHD4Qzm
	qprxAyn5Eii7EglBCCdP2aY/KUvMC7hZjA+0ru+EoOieW2QFNdFbG00AcGaWBnSzNTg1ivHqaurTc
	PMABbDYAmmsZ9EloZj0FZ8jCmHCAuBKpRce6wwKAhrSqWJrb7hQdLcv1UEyBgfLBV6Uc6ZyPpZs5j
	u7Uv8M3rO3eZAIkSflzERBPFFzbMGxpjgHybK9WlaJxKTHrIBi6qNXy4AlvR24OWPrsKf84tGqtEB
	2TXB/KnuBibS3AT76clt7EE5Zf74F3rcRB779vofAeg2dxtp8m84AbhfKTPl0boArzK6XnNC4eH+D
	yewOC2rxp2ipe2fBGEsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oB5oz-006mHJ-MN; Tue, 12 Jul 2022 02:40:21 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oB5om-006mCj-EI; Tue, 12 Jul 2022 02:40:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5600415DB;
	Mon, 11 Jul 2022 19:40:04 -0700 (PDT)
Received: from [10.162.42.8] (unknown [10.162.42.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 840C13F792;
	Mon, 11 Jul 2022 19:39:56 -0700 (PDT)
Message-ID: <48ab9e36-48be-916e-2ce7-03ef59d67dae@arm.com>
Date: Tue, 12 Jul 2022 08:09:53 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH V7 00/26] mm/mmap: Drop __SXXX/__PXXX macros from across
 platforms
Content-Language: en-US
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, hch@infradead.org, christophe.leroy@csgroup.eu,
 linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org, x86@kernel.org,
 openrisc@lists.librecores.org, linux-xtensa@linux-xtensa.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-m68k@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-um@lists.infradead.org,
 linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220711070600.2378316-1-anshuman.khandual@arm.com>
 <20220711131417.9cac57d9b88eea8bbd7d8616@linux-foundation.org>
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20220711131417.9cac57d9b88eea8bbd7d8616@linux-foundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220711_194008_541230_E22F555D 
X-CRM114-Status: UNSURE (   9.26  )
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



On 7/12/22 01:44, Andrew Morton wrote:
> On Mon, 11 Jul 2022 12:35:34 +0530 Anshuman Khandual <anshuman.khandual@arm.com> wrote:
> 
>> This series drops __SXXX/__PXXX macros from across platforms in the tree.
> 
> I've updated mm-unstable to this version, thanks.  I skipped the added-to-mm
> emails to avoid wearing out people's inboxes.
> 
> Reissuing a 26-patch series N times is rather noisy.  Please prefer to send incremental
> fixes when changes are minor.  It makes it so much easier for reviewers to see what
> happened.

Sure, got it, will follow next time.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
