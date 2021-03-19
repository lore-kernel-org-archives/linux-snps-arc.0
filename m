Return-Path: <SRS0=Zujn=IR=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B156C433E0
	for <linux-snps-arc@archiver.kernel.org>; Fri, 19 Mar 2021 18:36:18 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9EC96191B
	for <linux-snps-arc@archiver.kernel.org>; Fri, 19 Mar 2021 18:36:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B9EC96191B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZjeV1kdugrKp2SHPY3OwqojD/SiRqZl5gRvhN+q7f8M=; b=qyksSnwQ1ZLBUaDonWsPByyT8
	09pOexr1K1DVIYvuwIyubzewypJqggEFu3BpXHoJnAqZSIGLqqUkVwa+8dIJv4poCYEKAWK3pkBsw
	fHpyDMDjiu+6ts0dY1fACSVtVhMHN0/rcT1klxe1Jn18t3o2ejYR/c+XFBKwdmyCKhsOqIGfX7xwZ
	nlICJV1Iypu+C+fApLnd+03dP0sbJm9dD7PPDYlWm0c2HkzZdeeiDl/mWclOBWinMUrgGux6srJaH
	RCQr7pKrG+o2dqn6JcoIck/jNflCGZxMM3tDCQQoHtyRs7D9SJx9SlSW3SrIbCdexFda6EVXsBIfZ
	DOz1efy1A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lNJyp-007xvg-Ts; Fri, 19 Mar 2021 18:36:16 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lNJyX-007xq9-Nn; Fri, 19 Mar 2021 18:36:00 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D2EE661980;
 Fri, 19 Mar 2021 18:35:51 +0000 (UTC)
Date: Fri, 19 Mar 2021 18:35:49 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-mm@kvack.org, x86@kernel.org, linux-ia64@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] mm: some config cleanups
Message-ID: <20210319183548.GH6832@arm.com>
References: <1615278790-18053-1-git-send-email-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1615278790-18053-1-git-send-email-anshuman.khandual@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210319_183558_818492_202DF7A5 
X-CRM114-Status: UNSURE (   8.64  )
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

On Tue, Mar 09, 2021 at 02:03:04PM +0530, Anshuman Khandual wrote:
> This series contains config cleanup patches which reduces code duplication
> across platforms and also improves maintainability. There is no functional
> change intended with this series. This has been boot tested on arm64 but
> only build tested on some other platforms.
> 
> This applies on 5.12-rc2
> 
> Cc: x86@kernel.org
> Cc: linux-ia64@vger.kernel.org
> Cc: linux-s390@vger.kernel.org
> Cc: linux-snps-arc@lists.infradead.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-mips@vger.kernel.org
> Cc: linux-parisc@vger.kernel.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-riscv@lists.infradead.org
> Cc: linux-sh@vger.kernel.org
> Cc: linux-fsdevel@vger.kernel.org
> Cc: linux-mm@kvack.org
> Cc: linux-kernel@vger.kernel.org
> 
> Anshuman Khandual (6):
>   mm: Generalize ARCH_HAS_CACHE_LINE_SIZE
>   mm: Generalize SYS_SUPPORTS_HUGETLBFS (rename as ARCH_SUPPORTS_HUGETLBFS)
>   mm: Generalize ARCH_ENABLE_MEMORY_[HOTPLUG|HOTREMOVE]
>   mm: Drop redundant ARCH_ENABLE_[HUGEPAGE|THP]_MIGRATION
>   mm: Drop redundant ARCH_ENABLE_SPLIT_PMD_PTLOCK
>   mm: Drop redundant HAVE_ARCH_TRANSPARENT_HUGEPAGE
> 
>  arch/arc/Kconfig                       |  9 ++------
>  arch/arm/Kconfig                       | 10 ++-------
>  arch/arm64/Kconfig                     | 30 ++++++--------------------

For arm64:

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
