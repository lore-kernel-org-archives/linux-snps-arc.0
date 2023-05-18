Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE076C77B7A
	for <linux-snps-arc@archiver.kernel.org>; Thu, 18 May 2023 03:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4ysNQlkTiF628jdOamso1KvsuPsDbQ0oIw6CKQ9ElmI=; b=VctKE0mjw8ty4Y
	fZAqHpAA1apuGgGvmYU+W3WiP1cwKdiCHnnlk7uUy3O8BaMJnh6YngnXU0V9H8v87BQmCI8bReN+Q
	Z22nVi7Jn3F7vaJm9nHw1NUVovhxDJ1wu+jLw7eF3u0J3pn+axYbc9nKZiLItqelTNKVMZ6LMeG+g
	hLpCVhlVwydt2mvmIQj8vMs+AHaIV/LYjIzZ7/1WdWiT1nlyGG8MdFZhM2mD/v0yqCXpB93Dj/jn8
	z3y6sj0/R2Xz+3QxUx/5JFGGoE4H7qMFGHs7XX5tMmOZ+UttpdaH5Vv0a+VDndX/LLazfPvQmXH+1
	YL0L4F+r94drcNaQ8xWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzUYS-00Bmu7-03;
	Thu, 18 May 2023 03:43:52 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzUYO-00BmtC-38
	for linux-snps-arc@lists.infradead.org;
	Thu, 18 May 2023 03:43:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684381428;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0pWi321j2dJQo9PWbhq50nZ1UrZDSkUZuy7jm8koH04=;
	b=B1k6ZL2ieESJ7Ecbeg7x8lZV53pkuOH1SiVqOoyYkVzCsw7npjD3+MUIXoDcH9xHerlHzw
	p0Nngf4bRNm6Q7hn4ixjAyRgxnW8BZi/3062NDlJK5+jT00FTgpq7oOhThyPi1uEgU2sZ9
	IPzsPTRsIRIjhbCxSQNQsca+R9WhHd4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-593-Oce8fByhNdGoyCfh1R4fzQ-1; Wed, 17 May 2023 23:43:43 -0400
X-MC-Unique: Oce8fByhNdGoyCfh1R4fzQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DD38D296A602;
	Thu, 18 May 2023 03:43:42 +0000 (UTC)
Received: from localhost (ovpn-12-79.pek2.redhat.com [10.72.12.79])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 12FA9492B00;
	Thu, 18 May 2023 03:43:41 +0000 (UTC)
Date: Thu, 18 May 2023 11:43:37 +0800
From: Baoquan He <bhe@redhat.com>
To: Christoph Hellwig <hch@infradead.org>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-mm@kvack.org, arnd@arndb.de, christophe.leroy@csgroup.eu,
	agordeev@linux.ibm.com, wangkefeng.wang@huawei.com,
	schnelle@linux.ibm.com, David.Laight@aculab.com, shorne@gmail.com,
	willy@infradead.org, deller@gmx.de,
	Vineet Gupta <vgupta@kernel.org>,
	linux-snps-arc@lists.infradead.org
Subject: Re: [PATCH v5 RESEND 07/17] arc: mm: Convert to GENERIC_IOREMAP
Message-ID: <ZGWe6VAHewU0TsOn@MiWiFi-R3L-srv>
References: <20230515090848.833045-1-bhe@redhat.com>
 <20230515090848.833045-8-bhe@redhat.com>
 <ZGR01vnozJmVIVEi@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZGR01vnozJmVIVEi@infradead.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_204349_082763_2ACC3496 
X-CRM114-Status: GOOD (  10.61  )
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

On 05/16/23 at 11:31pm, Christoph Hellwig wrote:
> > +#define ioremap ioremap
> > +#define ioremap_prot ioremap_prot
> > +#define iounmap iounmap
> 
> Nit:  I think it's cleaner to have these #defines right next to the
> function declaration.

Makes sense, will do.

> 
> Otherwise looks good:
> 
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> 


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
