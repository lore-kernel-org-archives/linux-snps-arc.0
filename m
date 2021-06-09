Return-Path: <SRS0=1R09=LD=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 706A6C47082
	for <linux-snps-arc@archiver.kernel.org>; Wed,  9 Jun 2021 00:26:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39C7B613BE
	for <linux-snps-arc@archiver.kernel.org>; Wed,  9 Jun 2021 00:26:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 39C7B613BE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZYgXNv1lb2nT1PNxiTl5uj0tesEb50fIP5D5RNwEv9Q=; b=Ketw68rGglJX4U
	lbarwkabMi6Osmo9fdLxLyTsyL2eHGHRhMTIKnydNxCnoGGnPWlyQ1h/KRQNAbmItyKOEojZnjFPJ
	rIsgaaSdPHwOAHC0BdmsIkmE3qvfrNKc6R6m4mSXz9L9UAgCIkvsoQkQtG/xrAPgN4VmJYYK34Pu5
	XSNMQ+ocd1Ks8jR64R1R9PZANOEhjn0OqIFHhw7RkhLP5aEOgVPMkU00ntNgtOPepnP1PXgfpCdFC
	mpwhdLe1ayMBNRLLk9cZx3ajHs9lPNl4l+Om+DQci5SWDRwBa+9TKdv3u0HeqxPNe5qdA3SjBw3yu
	BOZeZByT/axp4A0dWRSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqm2p-00Asf5-Lx; Wed, 09 Jun 2021 00:26:07 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqm2T-00AsXq-N0; Wed, 09 Jun 2021 00:25:46 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9F5CF61352;
 Wed,  9 Jun 2021 00:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1623198345;
 bh=j6Daa0ANcHXgawdprrhhE9gPp/k5n5R1I8bzEIzLkJ4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=SZYHTTfaMcaxuiVLTcleHa9xYaQtKKlW0lSVx8ank0QE87umgBXHwANYgV3RZTaNu
 rf7Ir5wxGLTzdarw+lfYNOq0SOvDo1l3StstPYzKpK2C8V7G7swvSJ4cooRpaDMdu2
 H1uHQBHkLxKC0zrfLh/KxjIWjXc3HCBsO4EPTYqY=
Date: Tue, 8 Jun 2021 17:25:44 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Geert Uytterhoeven
 <geert@linux-m68k.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Jonathan Corbet <corbet@lwn.net>, Matt Turner <mattst88@gmail.com>, Mike
 Rapoport <rppt@linux.ibm.com>, Richard Henderson <rth@twiddle.net>, Vineet
 Gupta <vgupta@synopsys.com>, kexec@lists.infradead.org,
 linux-alpha@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-m68k@vger.kernel.org, linux-mips@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-xtensa@linux-xtensa.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org
Subject: Re: [PATCH v3 8/9] mm: replace CONFIG_NEED_MULTIPLE_NODES with
 CONFIG_NUMA
Message-Id: <20210608172544.d9bf17549565d866fbb18451@linux-foundation.org>
In-Reply-To: <20210608091316.3622-9-rppt@kernel.org>
References: <20210608091316.3622-1-rppt@kernel.org>
 <20210608091316.3622-9-rppt@kernel.org>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210608_172545_808281_1A2B251A 
X-CRM114-Status: GOOD (  12.59  )
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

On Tue,  8 Jun 2021 12:13:15 +0300 Mike Rapoport <rppt@kernel.org> wrote:

> From: Mike Rapoport <rppt@linux.ibm.com>
> 
> After removal of DISCINTIGMEM the NEED_MULTIPLE_NODES and NUMA
> configuration options are equivalent.
> 
> Drop CONFIG_NEED_MULTIPLE_NODES and use CONFIG_NUMA instead.
> 
> Done with
> 
> 	$ sed -i 's/CONFIG_NEED_MULTIPLE_NODES/CONFIG_NUMA/' \
> 		$(git grep -wl CONFIG_NEED_MULTIPLE_NODES)
> 	$ sed -i 's/NEED_MULTIPLE_NODES/NUMA/' \
> 		$(git grep -wl NEED_MULTIPLE_NODES)
> 
> with manual tweaks afterwards.
> 
> ...
>
> --- a/include/linux/mmzone.h
> +++ b/include/linux/mmzone.h
> @@ -987,7 +987,7 @@ extern int movable_zone;
>  #ifdef CONFIG_HIGHMEM
>  static inline int zone_movable_is_highmem(void)
>  {
> -#ifdef CONFIG_NEED_MULTIPLE_NODES
> +#ifdef CONFIG_NUMA
>  	return movable_zone == ZONE_HIGHMEM;
>  #else
>  	return (ZONE_MOVABLE - 1) == ZONE_HIGHMEM;

I dropped this hunk - your "mm/mmzone.h: simplify is_highmem_idx()"
removed zone_movable_is_highmem().  

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
