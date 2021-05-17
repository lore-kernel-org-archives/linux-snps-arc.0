Return-Path: <SRS0=QMqO=KM=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C8F6C433B4
	for <linux-snps-arc@archiver.kernel.org>; Mon, 17 May 2021 06:19:21 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC44B6121F
	for <linux-snps-arc@archiver.kernel.org>; Mon, 17 May 2021 06:19:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC44B6121F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OStfujJpwC8fH5HoBxZohiDAcy1PYccNY9X2gEoDlNE=; b=hb2jExQhObNsVTB0BVFCVB+mz
	l/Yyiuw1pHR0D+3mtcmLMkqmCW2efHITy3CIYjV7RmXj1Pcp7DTKzJolZoCF7A/gaiiw4+9ePEhx6
	jeR7uQo58OX8pHDNfcSU5kqqrGGR5OcS+GU1FljNVj5TvBIUNhsa/G6lYiKBP6kqHnMIA2G4aPR59
	DikkvVJuTj16+Ddaj5q5bVECgfcYepzsaNSqfcdLOKkdPffOjPkXbIAKh4Wd0zy6y8Cg5b9OsfWwO
	O8U8nz2uT+S5lnlcwfKzFcAwIHuQdvAQDdOO5MhNYeqcBkIOMKwuElRvpM1Uz+N/F6q9X/pJMb3zc
	WYLYszaIg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1liWb0-00DqmC-Kv; Mon, 17 May 2021 06:19:18 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liWYn-00DqOI-NL; Mon, 17 May 2021 06:17:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Rc39pSTelZ0E7dwuNrXoMHBf3l0C451wcyf/Kvd1O6E=; b=lOQbmoKenA8Yy4Ntf8VbGkAxBm
 PftAEcPlhhqexAJpmQyv5s6wQYXfoJ4Aq9c7dfgSoT66QC4l9QPwu/xH20wJ28a6cBR0OKt5YL1BF
 /O7Os4JvgyXVgljnO2yY4/Kgtej7NnHo1vlndfmptBYnXvGwYZ7P6qpeOMF9ha5jHcMI1A0MvG7V9
 Ne1ijrC0nOHNJRgpUEgVM/mvpjjErqM5UV/Dz1jqZmrFyGcczklR/rzqxtOWHox1WatovacX4bIUM
 wC+tCUrdyhgNu4DN1V7kyjWdBZPa09ikmjjKXzVc9eUq0QD4xkBvzbrx0NojkGYipQ5MHloT+i0tD
 GFC792Pg==;
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liWYl-00DVIK-9l; Mon, 17 May 2021 06:17:00 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 60D5F6736F; Mon, 17 May 2021 08:16:56 +0200 (CEST)
Date: Mon, 17 May 2021 08:16:56 +0200
From: Christoph Hellwig <hch@lst.de>
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-arch@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Christoph Hellwig <hch@lst.de>, Al Viro <viro@zeniv.linux.org.uk>,
 Vineet Gupta <vgupta@synopsys.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Brian Cain <bcain@codeaurora.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Jeff Dike <jdike@addtoit.com>,
 Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Sid Manning <sidneym@codeaurora.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>, linux-snps-arc@lists.infradead.org,
 linux-kernel@vger.kernel.org, uclinux-h8-devel@lists.sourceforge.jp,
 linux-hexagon@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-riscv@lists.infradead.org, linux-um@lists.infradead.org
Subject: Re: [PATCH 4/6] [v2] arc: use generic strncpy/strnlen from_user
Message-ID: <20210517061656.GB23581@lst.de>
References: <20210515101803.924427-1-arnd@kernel.org>
 <20210515101803.924427-5-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210515101803.924427-5-arnd@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210516_231659_508403_19567863 
X-CRM114-Status: GOOD (  13.27  )
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

On Sat, May 15, 2021 at 12:18:01PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Most per-architecture versions of these functions are broken
> in some form, and they are almost certainly slower than the
> generic code as well.
> 
> This version is fairly slow because it always does byte accesses
> even for aligned data, and its checks for user_addr_max() differ
> from the generic code.
> 
> Remove the ones for arc and instead use the generic version.

Same comment as for hexaon before.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
