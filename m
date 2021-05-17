Return-Path: <SRS0=QMqO=KM=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA4B3C433ED
	for <linux-snps-arc@archiver.kernel.org>; Mon, 17 May 2021 06:23:40 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 804FA61185
	for <linux-snps-arc@archiver.kernel.org>; Mon, 17 May 2021 06:23:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 804FA61185
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TEcu5kCzdioraA0qz2/JLHUG5CTmuRvgpdwhXtxlCaE=; b=bqpndy7nxLjwXj1tViibxQf6q
	upY81FHJrX1IYPBdho7oXmvFk6xHPAFKnMzR5b2TMXT56fKtGSia1ulLlOFGt8dlMVD1xQxcx8NxI
	Us4hTn92dLo86WIj/3vlNl8Fnqx23Naad2eglLSMIdQGssZmUMbVIaFTvBiiqWVPOBr1EpYuz7cM4
	9H6MRGdNIu5CoaQctapRLRagJe2i1IhnBAzl8FE2O1GRkytn0JBA2V/WsUgQnBd9ou6KWNa2zfDuc
	YEzuB9PfNhxYPXzT4WtTkE2/cXm3URjhpY+XKJ//T3MnuSN8OBSuJNoZB/BX/9sZzWNNGycfqFvbU
	ZQwzf6QJQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1liWfC-00Drwg-4D; Mon, 17 May 2021 06:23:38 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liWc4-00Dr5P-F4; Mon, 17 May 2021 06:20:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=L3HgWD1ZWatejcOTZ8qpzoMfp2kYHt1Of2v8raX/g74=; b=wtw2lDqUaJp/Hx4yDfjWQfucrO
 2ZVQbDtWpUSut6dYkvCYyK/Dn4ZoREBpU5/PxAfM9cL4g1Nsnvsf4lXpptkhbjnE95hEDigyW0ON0
 1q9esjeSMiettx7n711+65CQRkd94ZAli2hahdvVouKUAntJ9Ia3FMOICkb/ULU8gvLrjlXst4WYo
 18FCTflZEZ8y8zrUC/cAr/bdlQO2w3yFbTRf+Se4PpSCUouktJaNTH1X3WgrXb2M+hjZO/+0LVPEE
 G4sj4ldkflRsa5vXh1d6caC2F6vL1rzK6qcfV0YFYv3FsxnRLIp28WlTPAEymMsiuISEIY825jQJY
 9r+zYHQw==;
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liWc1-00DVXF-UV; Mon, 17 May 2021 06:20:23 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 465B36736F; Mon, 17 May 2021 08:20:18 +0200 (CEST)
Date: Mon, 17 May 2021 08:20:18 +0200
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
Subject: Re: [PATCH 5/6] [v2] asm-generic: uaccess: remove inline
 strncpy_from_user/strnlen_user
Message-ID: <20210517062018.GC23581@lst.de>
References: <20210515101803.924427-1-arnd@kernel.org>
 <20210515101803.924427-6-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210515101803.924427-6-arnd@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210516_232022_152065_7CB06EC6 
X-CRM114-Status: GOOD (  13.53  )
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

On Sat, May 15, 2021 at 12:18:02PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Consolidate the asm-generic implementation with the library version
> that is used everywhere else.
> 
> These are the three versions for NOMMU kernels,

I don't get the three versions part?

> +	select GENERIC_STRNCPY_FROM_USER
> +	select GENERIC_STRNLEN_USER

Given that most architetures select the generic version I wonder
if it might be worth to add another patch to invert the logic so
that architectures with their own implementation need to sekect a symbol.

> +extern long strncpy_from_user(char *dst, const char __user *src, long count);
> +extern long strnlen_user(const char __user *src, long n);

No need for the extern here.

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
