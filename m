Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4907C77B7D
	for <linux-snps-arc@archiver.kernel.org>; Wed, 17 May 2023 06:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pyITWHfEng5BuEjEyZkckX3PmAjIS3qJ02LvALAS6rY=; b=xTG+WC8c1ZS0OC
	qljSuugpGXiALIb5vnNmvGxqoDkddVP0TNxxNR5yblah4Q9+n3wak+8/ZX4RNbaAJBeOs93w7l4Yp
	0FMXnut21egkHv9LmAFtYYEukUgUIdMMWSHwIVElR0xsUpNi7vpkARS8C4UvZc1X7/xkolUej3W5K
	GpH4i6q4l8lrVQGdDR9lpmFvhF0LeRSTOMJeF9a13EfFxGCOqL3ao8Kcwh+SH/s/vqZngy4Dcz0Dx
	YJlPJmESsf3JP/JiRE39fmmJYBKOneUMvVyNLsbsRLP9zd2R9Tod9ebci/NRrShkMe/GDlbbVYQqV
	I3sRBEJhUWdbeeVrB5MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzAhW-008TiH-1N;
	Wed, 17 May 2023 06:31:54 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1pzAhS-008ThE-2J;
	Wed, 17 May 2023 06:31:50 +0000
Date: Tue, 16 May 2023 23:31:50 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Baoquan He <bhe@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-mm@kvack.org, arnd@arndb.de, christophe.leroy@csgroup.eu,
	hch@infradead.org, agordeev@linux.ibm.com,
	wangkefeng.wang@huawei.com, schnelle@linux.ibm.com,
	David.Laight@aculab.com, shorne@gmail.com, willy@infradead.org,
	deller@gmx.de, Vineet Gupta <vgupta@kernel.org>,
	linux-snps-arc@lists.infradead.org
Subject: Re: [PATCH v5 RESEND 07/17] arc: mm: Convert to GENERIC_IOREMAP
Message-ID: <ZGR01vnozJmVIVEi@infradead.org>
References: <20230515090848.833045-1-bhe@redhat.com>
 <20230515090848.833045-8-bhe@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230515090848.833045-8-bhe@redhat.com>
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

> +#define ioremap ioremap
> +#define ioremap_prot ioremap_prot
> +#define iounmap iounmap

Nit:  I think it's cleaner to have these #defines right next to the
function declaration.

Otherwise looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
