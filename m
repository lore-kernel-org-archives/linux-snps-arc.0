Return-Path: <SRS0=lceQ=JO=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63C55C433B4
	for <linux-snps-arc@archiver.kernel.org>; Sat, 17 Apr 2021 21:30:31 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2096B61210
	for <linux-snps-arc@archiver.kernel.org>; Sat, 17 Apr 2021 21:30:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2096B61210
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xZDMzMpPu7bkmD9Mbgbwf180odlqA6iQm5fOsRImRXU=; b=ojjCwdIaCtErhUUtaxa3gFHrU
	UsVnB0jZa37c6G0a3O1/O1Y7y3HHYxJzomijbY8APiI0MbDq0n0WouMd0pAgli90Y062t6HXTLlP/
	jfeNPPz/qFhpumuLtRqZq7X8MRVebsV034uitKvVXI23IfwnXVKW54fq8lKVZaSe3m3fO7fdntDkO
	7PxcJj1F6Y6lHyLOCLletL9orCGrwezUP7uAhEv2v0QxmNfRmQc+4Guf+5owf8OY/yE3ofUrlHsbd
	YiPip7WHt08xnk2PN+VGugtBzI9W+P4zXOUHp+9gD+mDKj6tR74kntwa2oF34pr1C5M68T3tLfWkX
	+vcodlUFw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXsWL-006KBi-Cz; Sat, 17 Apr 2021 21:30:29 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXsUl-006JoH-4O; Sat, 17 Apr 2021 21:29:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=tdMd9G9wD3dHdDB049z0mEp3bwlE87mJ0J7o89xl/iU=; b=kjCBnWRnNfJ4jh1gNX/lQqFZaV
 PIt6sDdbkDGzgmh71GE65C7gRjevycey4DoCtbejN9tL9oy21OFCEaAalEL1tJX2o90jMIunwvzlT
 aw6WnoUC4xKa/S6Fo+ZMatucihabyUEWmzgS2fQA3KuKU2AamMDSAvwzszyCc5I4TnWdPWLrwWCKi
 rVT5becyLy4eWu5C3CPFKJcjpScabeN83QGn+BwxjvQCu6su18nAbnPuTOLaKIYZFme9zSXfjcKXe
 HVFpVtf65QAh/PF06VB9QUA3eZMEV6/SGt6UIGiIg++xfTnOleyRsiTg4gP470cAho43TKpegokfh
 QjMDTCHQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1lXsUd-00BiOm-RD; Sat, 17 Apr 2021 21:28:45 +0000
Date: Sat, 17 Apr 2021 22:28:43 +0100
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
Subject: Re: [PATCH 2/2] mm: Indicate pfmemalloc pages in compound_head
Message-ID: <20210417212843.GT2531743@casper.infradead.org>
References: <20210416230724.2519198-1-willy@infradead.org>
 <20210416230724.2519198-3-willy@infradead.org>
 <2a531a42f23e4046833e0feb8faef0b5@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2a531a42f23e4046833e0feb8faef0b5@AcuMS.aculab.com>
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

On Sat, Apr 17, 2021 at 09:13:45PM +0000, David Laight wrote:
> >  		struct {	/* page_pool used by netstack */
> > -			/**
> > -			 * @dma_addr: might require a 64-bit value on
> > -			 * 32-bit architectures.
> > -			 */
> > +			unsigned long pp_magic;
> > +			unsigned long xmi;
> > +			unsigned long _pp_mapping_pad;
> >  			unsigned long dma_addr[2];
> >  		};
> 
> You've deleted the comment.

Yes.  It no longer added any value.  You can see dma_addr now occupies
two words.

> I also think there should be a comment that dma_addr[0]
> must be aliased to ->index.

That's not a requirement.  Moving the pfmemalloc indicator is a
requirement so that we _can_ use index, but there's no requirement about
how index is used.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
