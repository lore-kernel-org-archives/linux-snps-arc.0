Return-Path: <SRS0=7i3W=JP=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 958BDC433ED
	for <linux-snps-arc@archiver.kernel.org>; Sun, 18 Apr 2021 11:21:36 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18E7E6102A
	for <linux-snps-arc@archiver.kernel.org>; Sun, 18 Apr 2021 11:21:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 18E7E6102A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=N+w5aWvJCVu52YzweS2Oce5pRIUmwo7/WOxGlceS0/M=; b=cMculecjf3mDjes8iGXneL/Jl
	tKq2dOT5VCxy2eiQzy5J7FglAd6+P5W6b9tN4Of9g7u/+Vf92db1aMKVhIpWEkioL3l+HtaFK+ceg
	D/+kbfReKMUgjOtu3U2qYoU00biIDQuprckG+cuW2KzwL8VxPRTF3RnI1/lFLLq0QWBoSgoMkyif/
	3KeA40dzd++jNSPPlpfuXUH9SPpNr4XJyb2dGu1NtoiMpfAe0aqFjZQeWBu4sBl9UI2480BjsrA5h
	kunmnRWgZT+Neo9vuHCrXF79c2MZd2HnCxxNdjGDJjzWeVkdhtgau7yjUPiCmSevugPPOJiZGh/PQ
	Wg78wy64A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lY5Uc-007o1T-7s; Sun, 18 Apr 2021 11:21:34 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lY5Ua-007o0u-6W
 for linux-snps-arc@desiato.infradead.org; Sun, 18 Apr 2021 11:21:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=yHuFjlT5rtKQaeRAFhvfUQECvltMrb+hYlCuEQGxGSA=; b=yNRnVNzVIFOZ97ESGsM0nSPcot
 o9zkNvBHJf8baMCVqxfOm7kAJQ7NR7dgdGufzvieF5pOCcQ7ATS+geedmH2MQCfN1yTZYUDZu3Rvv
 fbrRitGRBlGn5Y/mpL6hscvKEGkO90oGl7+dKBWC9TjMSlvM2HMcUL6Wg92Oe/7B4oPNC74RHlBTR
 Rgfupmin12AdTQsqJgKkMclrH9pV1+qmd3XU5qgJC3OAkhpyNLKSyON6FrkRaX4Xs2DVEEZPpMAGx
 S0VqJsP9kAajMYS68xbS22x9W2CmXbQ31VXrkN5Tj7JVTE94jzG/s6mAkJJbN+ADk6yAIKMPJe2C7
 YsqI88pw==;
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lY5UU-00AP4C-RJ
 for linux-snps-arc@lists.infradead.org; Sun, 18 Apr 2021 11:21:30 +0000
Received: by mail-wr1-x433.google.com with SMTP id e7so22073618wrs.11
 for <linux-snps-arc@lists.infradead.org>; Sun, 18 Apr 2021 04:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=yHuFjlT5rtKQaeRAFhvfUQECvltMrb+hYlCuEQGxGSA=;
 b=n705a9a7qdxMFuWE1zX7H+Gwn7R1Ph/HxlJsBZM2OwmgI8on3YCAfTIJ9VILLpPGVN
 U6Ei9bgVBs4WU0tgRYPLY73PulXN7X8T9DnS/lfiOp0hi2PY7rBteW4MAz4+5uRDWIzC
 tVQA+Ijyf20lSUQ31OC6X057HKNOPi+pz6Nzkf8RmSCB7uub+bAFeTOPAvt2BEhTUPA9
 e95vVEysgGXjcAyKsinTriFeM9DFcYVac9rU5mO+CY2n1SfMhFTrdb724lZinw5eig/R
 DWL2UVgqLZFgwGhAmloMkMPTn1qsrnfB8ZvGBiW/SI8QnW3O/4TL6LEClDzNGo9C+X4Y
 G8Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=yHuFjlT5rtKQaeRAFhvfUQECvltMrb+hYlCuEQGxGSA=;
 b=EvYabJK/s7w94Rg+CcdBLNED9uEyf7+IkKDSmzZGcdcTbJ28kT9Mjs/CIqme10n8NX
 xBYXTjex9stdYZoqEDFd9AF6inVnRUgRVFU5Y+mD6N2HDp7mJJ5H1lzqY812AtsW8ISu
 lIV7apcq6H3khGb8P2sxl9M/KRAqSPV58Jr+xzmakiK2/phNrcv76ZQU5AWikZo/fY+3
 vL/mWOvFGbwnwUfwGbKBM8bhPIlmrvA+ighIruwEDbfa1gh+QCwgUv/0EsRpiSepib6v
 R+zBnTNzk0YoTCf/cHB2eU3LvIop5o9QP7oeaUmtuMXneq+ailCffl8zpw+7qBQFOuJs
 IQcw==
X-Gm-Message-State: AOAM5327oQPyNYMjzhsMigBqWVazTcGFy19XuGvxqpvHRhFCwtWX2Nu5
 I4ucLWr8ezVyJQ1hV3ZVxTeffg==
X-Google-Smtp-Source: ABdhPJy/WC+K/XtmqLOKo5IrEBVbL+R26kxzPf1pRpKWFGvT15zr5cY0imTHGxHtMkaaPLJEz/z5Qw==
X-Received: by 2002:a5d:5146:: with SMTP id u6mr8768015wrt.408.1618744885216; 
 Sun, 18 Apr 2021 04:21:25 -0700 (PDT)
Received: from apalos.home (ppp-94-65-92-88.home.otenet.gr. [94.65.92.88])
 by smtp.gmail.com with ESMTPSA id i12sm17113748wrm.77.2021.04.18.04.21.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Apr 2021 04:21:24 -0700 (PDT)
Date: Sun, 18 Apr 2021 14:21:21 +0300
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
To: Matthew Wilcox <willy@infradead.org>
Cc: brouer@redhat.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 mcroce@linux.microsoft.com, grygorii.strashko@ti.com,
 arnd@kernel.org, hch@lst.de, linux-snps-arc@lists.infradead.org,
 mhocko@kernel.org, mgorman@suse.de
Subject: Re: [PATCH 1/2] mm: Fix struct page layout on 32-bit systems
Message-ID: <YHwWMfgqiRaKS2y6@apalos.home>
References: <20210416230724.2519198-1-willy@infradead.org>
 <20210416230724.2519198-2-willy@infradead.org>
 <20210417024522.GP2531743@casper.infradead.org>
 <YHspptFx+T588KcG@apalos.home>
 <20210417202240.GS2531743@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210417202240.GS2531743@casper.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210418_042126_949744_E4009D22 
X-CRM114-Status: GOOD (  15.82  )
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

On Sat, Apr 17, 2021 at 09:22:40PM +0100, Matthew Wilcox wrote:
> On Sat, Apr 17, 2021 at 09:32:06PM +0300, Ilias Apalodimas wrote:
> > > +static inline void page_pool_set_dma_addr(struct page *page, dma_addr_t addr)
> > > +{
> > > +	page->dma_addr[0] = addr;
> > > +	if (sizeof(dma_addr_t) > sizeof(unsigned long))
> > > +		page->dma_addr[1] = addr >> 16 >> 16;
> > 
> > The 'error' that was reported will never trigger right?
> > I assume this was compiled with dma_addr_t as 32bits (so it triggered the
> > compilation error), but the if check will never allow this codepath to run.
> > If so can we add a comment explaining this, since none of us will remember why
> > in 6 months from now?
> 
> That's right.  I compiled it all three ways -- 32-bit, 64-bit dma, 32-bit long
> and 64-bit.  The 32/64 bit case turn into:
> 
> 	if (0)
> 		page->dma_addr[1] = addr >> 16 >> 16;
> 
> which gets elided.  So the only case that has to work is 64-bit dma and
> 32-bit long.
> 
> I can replace this with upper_32_bits().
> 

Ok up to you, I don't mind either way and thanks for solving this!

Acked-by: Ilias Apalodimas <ilias.apalodimas@linaro.org>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
