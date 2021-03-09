Return-Path: <SRS0=4gPu=IH=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B787C433DB
	for <linux-snps-arc@archiver.kernel.org>; Tue,  9 Mar 2021 03:32:54 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B60B76528A
	for <linux-snps-arc@archiver.kernel.org>; Tue,  9 Mar 2021 03:32:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B60B76528A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QkhxVzL32CJjZ0fr0i8T7sPjkBzp4jN+MHiFH0MhZrI=; b=cLjQTvCixFro6s0Agn3S8Ey2O
	TTirhpw3wfKPPyBcnkFyXRpZUPyNppbqxJiBPn9XTvCVBSPnJmx9CnH0upcPmpINbuBBB3RK0Rusp
	V2APzbA+6QyZnlWva+pOeNWIQO630qHgismsmD3gjrR9iO/YzXagENEMjmhEclVUHGlu41Zv5MJUT
	V/2OCUGa8AMzwU39XJt/uYPuo4qqRynhaHFDuX/eS0MOmkRRjcs7WGA8gsVUCOA1EZ/RBUHptLTff
	JR/qOEuJoAnuWIDEhYkpBr3L9fonkNfWAcwa4so1WFg4mJPe+xbTxz4bCmbV9VwqkAb1NVH0sTZk2
	4mCCEv+UQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJT74-003hPW-Rv; Tue, 09 Mar 2021 03:32:51 +0000
Received: from foss.arm.com ([217.140.110.172])
 by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lJT6m-003hMh-Qv; Tue, 09 Mar 2021 03:32:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9D5F731B;
 Mon,  8 Mar 2021 19:32:27 -0800 (PST)
Received: from [192.168.0.130] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 33EE63F71B;
 Mon,  8 Mar 2021 19:32:22 -0800 (PST)
Subject: Re: [PATCH 0/6] mm: some config cleanups
To: linux-mm@kvack.org
Cc: x86@kernel.org, linux-ia64@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-sh@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <1615185706-24342-1-git-send-email-anshuman.khandual@arm.com>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <af8d16b3-aff7-6f17-a777-2ce4a264227d@arm.com>
Date: Tue, 9 Mar 2021 09:02:58 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1615185706-24342-1-git-send-email-anshuman.khandual@arm.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210309_033233_113878_5B027290 
X-CRM114-Status: GOOD (  10.05  )
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

On 3/8/21 12:11 PM, Anshuman Khandual wrote:
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

Seems like there was a problem during the email because some patches
might not have hit the mailing list. Although git send-email never
really reported any problem. Not sure what happened here.

https://patchwork.kernel.org/project/linux-mm/list/?series=443619
https://lore.kernel.org/linux-mm/1615185706-24342-1-git-send-email-anshuman.khandual@arm.com/

Will probably resend the series.

- Anshuman

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
