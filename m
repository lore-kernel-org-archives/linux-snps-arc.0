Return-Path: <SRS0=lceQ=JO=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A680C433B4
	for <linux-snps-arc@archiver.kernel.org>; Sat, 17 Apr 2021 22:45:46 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E91FF61207
	for <linux-snps-arc@archiver.kernel.org>; Sat, 17 Apr 2021 22:45:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E91FF61207
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mk6NilJgvVqnsKKB8+yN3R7mI3Tr+XsthaVEHBFzdis=; b=Y/pVRLECZZL5xqzpfEqRBNx0C
	Cxo7ZaovKKTizck1qU7oD57oSZ9ypkLwUSpJp/9+1KyMBr0ekrObU6lO/wjSog6TW7lR5267Mn9XQ
	dKtPsOFtIs/M6tVrXgCnvTsEp66lu79r1FJpPngY+A0sIPGlT/pQMM3hQJcC6FUKuXArH7sTQDo77
	7jc2ppUVKhq7vGS7yRzqvZSYzoSFWYUxjmmKjPqCWGe9S8V57ftAhJBLb6EuFAWhq0zQMJ+C8WMZD
	hgdHPaBV277C7x1TzOK5Prjk0RD2kYpN4Y078LzYr9azg0hmqrzWZ6/TUYPkj1fN9NOXN9afKDZWz
	74GDy/N6Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXthA-006T34-8I; Sat, 17 Apr 2021 22:45:44 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXtgx-006T1W-B3; Sat, 17 Apr 2021 22:45:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=tPQBiu2Bdtxs3AC+E5Cm2VSUt8tWo9GnLe6NW3THH9A=; b=XkP7ELYUdkWzIzouAO8xPq8S7N
 GjhLlDfD3y6VNei69ths2oEltTt7VNjkaFD3kWa5YfSrMcxcQ1iVWUb/gASCBUMnk26hTvxsGcZHP
 LmMVlNo9qjiA2rXreK8yWQYyX7o6/OtiLfYOaaN9A6kBfQL7H7z+dojys6K1K5C4Hlo6Q1BwKfx6v
 3VOY2eaj9oDYuG2iFBRZJwiloByx98Wd7tPgW2ms6UJEbSMnemsL/vRvgFUw9tA9idCrdgpWi2l75
 pWbZSIdmfWoFb2mq+sdPpyKhbcnM/fMhIc2cA/kjhWA/hgymZC/OH2xGJGRDdWwwZOxlXZFOO//LW
 H9eSAzQw==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1lXtgp-00BmXi-PV; Sat, 17 Apr 2021 22:45:26 +0000
Date: Sat, 17 Apr 2021 23:45:23 +0100
From: Matthew Wilcox <willy@infradead.org>
To: David Laight <David.Laight@aculab.com>
Cc: "brouer@redhat.com" <brouer@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "ilias.apalodimas@linaro.org" <ilias.apalodimas@linaro.org>,
 "mcroce@linux.microsoft.com" <mcroce@linux.microsoft.com>,
 "grygorii.strashko@ti.com" <grygorii.strashko@ti.com>,
 "arnd@kernel.org" <arnd@kernel.org>, "hch@lst.de" <hch@lst.de>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "mhocko@kernel.org" <mhocko@kernel.org>,
 "mgorman@suse.de" <mgorman@suse.de>
Subject: Re: [PATCH 1/2] mm: Fix struct page layout on 32-bit systems
Message-ID: <20210417224523.GU2531743@casper.infradead.org>
References: <20210416230724.2519198-1-willy@infradead.org>
 <20210416230724.2519198-2-willy@infradead.org>
 <20210417024522.GP2531743@casper.infradead.org>
 <386d009232dc42bdaf83d4cc36b13864@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <386d009232dc42bdaf83d4cc36b13864@AcuMS.aculab.com>
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

On Sat, Apr 17, 2021 at 09:18:57PM +0000, David Laight wrote:
> Ugly as well.

Thank you for expressing your opinion.  Again.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
