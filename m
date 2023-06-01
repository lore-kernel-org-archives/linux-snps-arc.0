Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D761EC77B7E
	for <linux-snps-arc@archiver.kernel.org>; Thu,  1 Jun 2023 11:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CISPNrFjas8nc1qfBv6G345OhxfRVnRHfqBUbfn6Qo0=; b=Q5uMKvM3i8V9Zx
	n0HroM/lNSFntWIRD3elNsWJ+g+DMGU7zhFjGcMSvbTak1+aGJOx632tJTFHOHnxtxZ0R35FOrQzC
	FTzCA0l6YH6ptO6jaA05zcGplO+0nlCpEoyxCr8Stjzq2YPPBP8oNT/nrqfNTVx2HrzLAd2jX6eNI
	66/4FA6irbqYWccd4oRnzjZWSBvnLuAzaZTDi3qyajwRLaw2Mw87aiw6rF2cd5juAaER2DEVchi2D
	1Oyz69wG2ePIqOhn63bpcIHheKF61TwTn4AjD6lJIog4yCwuB1xlgjpI4WsRciVwWvpxM5ROmk44Q
	1cGa+mTEh16EvueqXXyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4gFq-003Co5-2C;
	Thu, 01 Jun 2023 11:14:06 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1q4gFp-003Cnd-0D;
	Thu, 01 Jun 2023 11:14:05 +0000
Date: Thu, 1 Jun 2023 04:14:05 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Baoquan He <bhe@redhat.com>
Cc: Christoph Hellwig <hch@infradead.org>, linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org, arnd@arndb.de,
	christophe.leroy@csgroup.eu, agordeev@linux.ibm.com,
	wangkefeng.wang@huawei.com, schnelle@linux.ibm.com,
	David.Laight@aculab.com, shorne@gmail.com, willy@infradead.org,
	deller@gmx.de, Vineet Gupta <vgupta@kernel.org>,
	linux-snps-arc@lists.infradead.org
Subject: Re: [PATCH v5 RESEND 07/17] arc: mm: Convert to GENERIC_IOREMAP
Message-ID: <ZHh9fdJJeq4cQMkV@infradead.org>
References: <20230515090848.833045-1-bhe@redhat.com>
 <20230515090848.833045-8-bhe@redhat.com>
 <ZGR01vnozJmVIVEi@infradead.org>
 <ZHXA7RP9bv4Cz4VA@MiWiFi-R3L-srv>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZHXA7RP9bv4Cz4VA@MiWiFi-R3L-srv>
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

On Tue, May 30, 2023 at 05:25:01PM +0800, Baoquan He wrote:
> On 05/16/23 at 11:31pm, Christoph Hellwig wrote:
> > > +#define ioremap ioremap
> > > +#define ioremap_prot ioremap_prot
> > > +#define iounmap iounmap
> > 
> > Nit:  I think it's cleaner to have these #defines right next to the
> > function declaration.
> 
> For this one, I didn't add function declaration of ioremap_prot and
> iounmap in arch/arc/include/asm/io.h and the same to other arch's
> asm/io.h. Because asm-generic/io.h already has those function
> declaration, then ARCH's asm/io.h includeasm-generic/io.h. I tried
> adding function declarations for ioremap_prot() and iounmap(), building
> passed too. Do you think we need add extra function declarations in
> ARCH's asm/io.h file?

No, sorry.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
