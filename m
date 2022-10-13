Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E9D0C433FE
	for <linux-snps-arc@archiver.kernel.org>; Thu, 13 Oct 2022 09:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F/CAIdkB6oohNT22jkF30reAmVk+uEDE05Ipit/Y0eM=; b=NiZErV6Ba8XIkF
	mWMQ5/gU0K2Tdy10TiyVqIUB7bVJ7deXRi75JWvF5V2S5qZzN8KUHEgDgvpQlIJn/2ByRe5mYeaXV
	sJ8xR4Xqp2jDbXv0UGKpvytGr3BGnVGoPvIPunjp7LsmT2Zt9NliejJ4lq+0/V5YfTGRchd2RS2Kf
	rqRvnY+NAhwFxkHJMSWrwWFO8lrEfWhbZKrXCgJOUSnpFxIO85FaDRtMje/D64PWjPksV24jKtj/3
	a7d/l9ju17OnT1NuhJrSGjta6PwPgH+F8U7U51L8aDwUIqc4AqZ1z2NWrCLU5LpY1O0EADBzyf80c
	+AkUzw3fNrJkvlNVeQYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiusX-00BLsD-1C; Thu, 13 Oct 2022 09:51:49 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiusT-00BLqF-Gf
	for linux-snps-arc@lists.infradead.org; Thu, 13 Oct 2022 09:51:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665654704;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PnamMLehA6c/ZrC5mAWlH7KtTngXqnj6RvbTVflM5BA=;
	b=Oc8afIjBCBl1bY92gNehSf+oxNO97C/xhSPBKP5S7QEtkGh9ztASNw0VW4nQ7w3VSy2WaB
	nYIinj7VNdMWaLEXlO7/woRvAf5rLWxxjlhTplrdN3FI1BUj6i/NoVQJlfXeFx4hZxGplA
	15OKT4lbnxSEj63+YSPDutkLPL22dGs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-120-wzSYpi1QPaKmyhZ3WPMPtQ-1; Thu, 13 Oct 2022 05:51:39 -0400
X-MC-Unique: wzSYpi1QPaKmyhZ3WPMPtQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AD804185A794;
	Thu, 13 Oct 2022 09:51:38 +0000 (UTC)
Received: from localhost (ovpn-12-120.pek2.redhat.com [10.72.12.120])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 136CB1121314;
	Thu, 13 Oct 2022 09:51:36 +0000 (UTC)
Date: Thu, 13 Oct 2022 17:51:33 +0800
From: Baoquan He <bhe@redhat.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"hch@infradead.org" <hch@infradead.org>,
	"agordeev@linux.ibm.com" <agordeev@linux.ibm.com>,
	"wangkefeng.wang@huawei.com" <wangkefeng.wang@huawei.com>,
	"schnelle@linux.ibm.com" <schnelle@linux.ibm.com>,
	"David.Laight@ACULAB.COM" <David.Laight@aculab.com>,
	"shorne@gmail.com" <shorne@gmail.com>,
	Vineet Gupta <vgupta@kernel.org>,
	"linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
Subject: Re: [PATCH v3 05/11] arc: mm: Convert to GENERIC_IOREMAP
Message-ID: <Y0ffpSdpAcvbXDGK@MiWiFi-R3L-srv>
References: <20221009103114.149036-1-bhe@redhat.com>
 <20221009103114.149036-6-bhe@redhat.com>
 <bbfa1fd5-3dae-2d00-0421-5f1e627eb8f7@csgroup.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bbfa1fd5-3dae-2d00-0421-5f1e627eb8f7@csgroup.eu>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221013_025145_636604_B9233264 
X-CRM114-Status: GOOD (  14.68  )
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

On 10/12/22 at 10:17am, Christophe Leroy wrote:
......
> > -/*
> > - * ioremap with access flags
> > - * Cache semantics wise it is same as ioremap - "forced" uncached.
> > - * However unlike vanilla ioremap which bypasses ARC MMU for addresses in
> > - * ARC hardware uncached region, this one still goes thru the MMU as caller
> > - * might need finer access control (R/W/X)
> > - */
> > -void __iomem *ioremap_prot(phys_addr_t paddr, unsigned long size,
> > -			   unsigned long flags)
> > +void __iomem *
> > +arch_ioremap(phys_addr_t *paddr, size_t size, unsigned long *prot_val)
> >   {
> > -	unsigned int off;
> > -	unsigned long vaddr;
> > -	struct vm_struct *area;
> > -	phys_addr_t end;
> > -	pgprot_t prot = __pgprot(flags);
> > -
> > -	/* Don't allow wraparound, zero size */
> > -	end = paddr + size - 1;
> > -	if ((!size) || (end < paddr))
> > -		return NULL;
> > -
> >   	/* An early platform driver might end up here */
> >   	if (!slab_is_available())
> > -		return NULL;
> > +		return IOMEM_ERR_PTR(-EINVAL);
> 
> I think the slab_is_available() check should be done in the generic 
> functions. On all architectures SLAB must be available before you can 
> use get_vm_area_caller() and vunmap()

Tend to agree.

W/o slab initialized, the get_vm_area_caller() calling definitely will
fail. The arch's early ioremap code could call into this.


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
