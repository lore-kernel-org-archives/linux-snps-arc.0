Return-Path: <SRS0=81lh=JR=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5FBBC433ED
	for <linux-snps-arc@archiver.kernel.org>; Tue, 20 Apr 2021 04:03:42 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CA1A6101D
	for <linux-snps-arc@archiver.kernel.org>; Tue, 20 Apr 2021 04:03:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9CA1A6101D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JmQHW+PdCKuAGCCwEsyzhFC873y5S1RSGMEYWQClqPQ=; b=YaEIxju4Sr4Tdq8Bybi+RFCrM
	gZptMj5HlWSAzBlBnn4UX8jQ1qM8c0S9XwbpzpVb0PCgY/QmSbyobig1sPQf8cF8A4osWcJZjlZou
	0z2U3NE5vxoiehG9mBi/O7PFXoEeSjt131JbQeVgkYJhoP22lnEg29XOVWFz6SERczA0gwKs0xj3s
	+e3YLsJ3vRiFzFEKVEwCVbpKqM4iUPZQduz1qghokWS6WuiufbPXkhWIAH4i+v9kfd2yoX3caHX85
	M8e8IWvR1LFVSDFfcTiXA25LIZjSrEhQ3f+RFma8SNsNZRp3wfB2lk7vmwCzUa1GjNNr8QdHDx1/u
	3e0L39LzQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYhbx-00B8n1-2l; Tue, 20 Apr 2021 04:03:41 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYhbl-00B8mO-K2; Tue, 20 Apr 2021 04:03:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:MIME-Version:Message-ID:
 Date:References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=RwfyE0YRVQ24fjvHDw9BQhBkUrpigpJUikoI3EviHLY=; b=WpcZNh1/FlGgqpRBbTqSfmAGQz
 AlbtzICPHhzqhEmmny+aFnkVDZHsVnDAxAwV0smiBv7SduOdoSkuqR6SaMzltUp9R7laY9q7ozhlO
 1DCPI0iCaE+KcL7AqzuUqLXP+Woxvjus90ilbYndrFQWQL6EzWOvhla73pT5BVv967UeFJpLCsJKg
 DouAJU0/RkQRqr9pgGbnRwEIhT46gkIz4XUq0HKHzj3SMHsEKXs3cj+haH1NrlkHPgK5pUREwYdHR
 eUEpWaGh4vZcPDSgaYVCvw1AAPfJDj2UHF8zDEegsBOdfj/0nMuoffftOnZuU5tqPXx0Uy2ReSl1M
 YiYOcQkg==;
Received: from ozlabs.org ([203.11.71.1])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYhbg-00BncL-1W; Tue, 20 Apr 2021 04:03:28 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4FPVQt5v9Kz9vDw;
 Tue, 20 Apr 2021 14:03:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1618891401;
 bh=ykDn0c4Pei/ni8JeosESXjK9PStd/mFtGxVh8YrZKPo=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=WAzcjt4GF5woknj0LOcFLLaZXQt4dxoP7XPsbd7Tfc1ZG1omi42FFMVoV9nSFqQho
 Nm9HeadCpbCSiKDCzKxPEin83TkkOVRNfkkriIZRvLAzVPgdswB9tsavwJleQekRLX
 enavKzaRFnyMjr49Bu8x4BXaAh50ERXzYbqbZnasQSQJjlRWT8GT0o8YyeWj7yNT8H
 SAQkKiu9Z5cM3IrONxJBmovgdEC2V3CpOs3qXHVGyk37PLNqcK3YziP+GQJMOP3Um8
 uEqVHGZl6+7aGF0tu9EUML9m1weR+PZkuPR+Wlqofl74HscYVDBxO8zGG3CBwzRoKJ
 ca8b0iHu4Cymg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>, brouer@redhat.com
Cc: arnd@kernel.org, grygorii.strashko@ti.com, netdev@vger.kernel.org,
 ilias.apalodimas@linaro.org, linux-kernel@vger.kernel.org, "Matthew Wilcox
 (Oracle)" <willy@infradead.org>, linux-mips@vger.kernel.org,
 mhocko@kernel.org, linux-mm@kvack.org, mgorman@suse.de,
 mcroce@linux.microsoft.com, linux-snps-arc@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, hch@lst.de,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/2] Change struct page layout for page_pool
In-Reply-To: <20210416230724.2519198-1-willy@infradead.org>
References: <20210416230724.2519198-1-willy@infradead.org>
Date: Tue, 20 Apr 2021 14:03:18 +1000
Message-ID: <874kg1d2m1.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210419_210324_266306_D40F064D 
X-CRM114-Status: GOOD (  16.71  )
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

"Matthew Wilcox (Oracle)" <willy@infradead.org> writes:
> The first patch here fixes two bugs on ppc32, and mips32.  It fixes one
> bug on arc and arm32 (in certain configurations).  It probably makes
> sense to get it in ASAP through the networking tree.  I'd like to see
> testing on those four architectures if possible?

Sorry I don't have easy access to any hardware that fits the bill. At
some point I'll be able to go to the office and setup a machine that (I
think) can test these paths, but I don't have an ETA on that.

You and others seem to have done lots of analysis on this though, so I
think you should merge the fixes without waiting on ppc32 testing.

cheers


>
> The second patch enables new functionality.  It is much less urgent.
> I'd really like to see Mel & Michal's thoughts on it.
>
> I have only compile-tested these patches.
>
> Matthew Wilcox (Oracle) (2):
>   mm: Fix struct page layout on 32-bit systems
>   mm: Indicate pfmemalloc pages in compound_head
>
>  include/linux/mm.h       | 12 +++++++-----
>  include/linux/mm_types.h |  9 ++++-----
>  include/net/page_pool.h  | 12 +++++++++++-
>  net/core/page_pool.c     | 12 +++++++-----
>  4 files changed, 29 insertions(+), 16 deletions(-)
>
> -- 
> 2.30.2

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
