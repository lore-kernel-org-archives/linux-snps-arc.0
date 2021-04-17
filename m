Return-Path: <SRS0=lceQ=JO=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BCD2C433ED
	for <linux-snps-arc@archiver.kernel.org>; Sat, 17 Apr 2021 20:23:04 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77B2760FE8
	for <linux-snps-arc@archiver.kernel.org>; Sat, 17 Apr 2021 20:23:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 77B2760FE8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=58IffFX19ZOxNoPglzi/cOIGJ1mwrxscXVqCsuwUYAs=; b=cozMZFa1/nT6o/SlRogojVvWm
	P1iXOdnC92VWo6y6IbRghq8eZk7lWcX7Hx1W3eQqqW+3U5s12F7ZAjz5uTImMzlulMPfEiPdIMpvQ
	gZliDhI9pef0bQqlMTCAx9xgf66fRQj7yvfmS5l85DnqZNbpJq1sGVcGVbojb6P/aN5XBBSV1B4NB
	6Z9SRLbAmnUrbnLR6TTuRcdUVClTRg14BhxdLgOWkpymczZ8MRN+ZxDQZ8YUp9ihTlrteRRfVr92W
	1MHLO7TGWlsEs02A/kdIddMIxd0fekS6Wu8a+l1BpuYqoFanvom7+xzrCd6+v/PDX7D2zJeVfKBPo
	ufNPOG83A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXrT4-006B65-2k; Sat, 17 Apr 2021 20:23:02 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXrSu-006B5A-AK; Sat, 17 Apr 2021 20:22:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=BnSKcc0JSuohlN33+Pj8bhxKsI7DT+Owp2PFJxUm9vg=; b=OEMC9XOgR/fKU/0oPNUu/P7cCL
 FT4t01GafWZlc1vjwl9KSjRt1IY8zFxgga7gHLRR+WCKupSKq6t9mxOaZIZufePDNN7mCVh1kH9jR
 F0u0g7a9CwiXrlGEHglrLCjcUmY6riPVWU0Qfcwq6bjvHqJmgaIV9kM3woRxgGCelw9NDnFMhLDTu
 ddS052/dNjJg/5EC844nFoPlje4sglQZ/dDMtCOaSHxgsq/MS3GcQFiMjlzkT3lk3nRsLRtoZo+VR
 X2xbTp+70dqUigqbpfzkNLRorcOijpiu4WZdd3t8LIzJQrj1saQRlw3+7gG/AlVzE/uFz4w1OL3ap
 wbKEi5/Q==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1lXrSi-00Belm-JF; Sat, 17 Apr 2021 20:22:44 +0000
Date: Sat, 17 Apr 2021 21:22:40 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Cc: brouer@redhat.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 mcroce@linux.microsoft.com, grygorii.strashko@ti.com,
 arnd@kernel.org, hch@lst.de, linux-snps-arc@lists.infradead.org,
 mhocko@kernel.org, mgorman@suse.de
Subject: Re: [PATCH 1/2] mm: Fix struct page layout on 32-bit systems
Message-ID: <20210417202240.GS2531743@casper.infradead.org>
References: <20210416230724.2519198-1-willy@infradead.org>
 <20210416230724.2519198-2-willy@infradead.org>
 <20210417024522.GP2531743@casper.infradead.org>
 <YHspptFx+T588KcG@apalos.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YHspptFx+T588KcG@apalos.home>
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

On Sat, Apr 17, 2021 at 09:32:06PM +0300, Ilias Apalodimas wrote:
> > +static inline void page_pool_set_dma_addr(struct page *page, dma_addr_t addr)
> > +{
> > +	page->dma_addr[0] = addr;
> > +	if (sizeof(dma_addr_t) > sizeof(unsigned long))
> > +		page->dma_addr[1] = addr >> 16 >> 16;
> 
> The 'error' that was reported will never trigger right?
> I assume this was compiled with dma_addr_t as 32bits (so it triggered the
> compilation error), but the if check will never allow this codepath to run.
> If so can we add a comment explaining this, since none of us will remember why
> in 6 months from now?

That's right.  I compiled it all three ways -- 32-bit, 64-bit dma, 32-bit long
and 64-bit.  The 32/64 bit case turn into:

	if (0)
		page->dma_addr[1] = addr >> 16 >> 16;

which gets elided.  So the only case that has to work is 64-bit dma and
32-bit long.

I can replace this with upper_32_bits().


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
