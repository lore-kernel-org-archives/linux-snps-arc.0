Return-Path: <SRS0=7pOa=ZA=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C68BDFA372C
	for <linux-snps-arc@archiver.kernel.org>; Fri,  8 Nov 2019 05:15:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BD5221848
	for <linux-snps-arc@archiver.kernel.org>; Fri,  8 Nov 2019 05:15:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tWQPhDsz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8BD5221848
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uVFlmcPsYu/SwAcwBT2rmqLCMrVHjt/UJMyKvTXiTY0=; b=tWQPhDsziJMt14
	mPvQpmOJEve6Aio499pV/OKSSkS3MkaU1aKxFe4/t907bcGiaGjk88Tdy6ik/QdlHdMsLm0ArxzVR
	FlwfiJXiOq6vGNRXkkZNYihIs+Zjd9QjrVGcCcJbyWQ1lH68umGBRN8wQzxjNaR7w5E9ZsvhWOPn1
	muQCkQtiRz8mJMQtZHrY0Om+yI9EQeH6gX4KQd6avoGYv+A9f4zD7+196Ag3r9BnFqTfWSFr9bFZs
	jUMd+9R1GYpiF87TixhAoW1BT3h6vfbl4flYr5s6Yo87OLANFiD3ydkO+roVpw1n47RLVDqFOCHnK
	ciGudxrg17RwTX4cy0fA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iSwc8-0000iL-DI; Fri, 08 Nov 2019 05:15:16 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSwbW-0007Qw-Vw; Fri, 08 Nov 2019 05:14:40 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 6282368BE1; Fri,  8 Nov 2019 06:14:34 +0100 (CET)
Date: Fri, 8 Nov 2019 06:14:33 +0100
From: Christoph Hellwig <hch@lst.de>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: generic-iomap tree for linux-next
Message-ID: <20191108051433.GA29611@lst.de>
References: <20191029064834.23438-1-hch@lst.de>
 <20191107204743.GA22863@lst.de> <20191108132000.3e7bd5b8@canb.auug.org.au>
 <20191108155248.0a32a03a@canb.auug.org.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191108155248.0a32a03a@canb.auug.org.au>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191107_211439_178988_CADE5C58 
X-CRM114-Status: UNSURE (   8.94  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Vincent Chen <deanbo422@gmail.com>, Christoph Hellwig <hch@lst.de>,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-hexagon@vger.kernel.org, x86@kernel.org,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, Greentime Hu <green.hu@gmail.com>,
 nios2-dev@lists.rocketboards.org, Guan Xuetao <gxt@pku.edu.cn>,
 linux-arm-kernel@lists.infradead.org, Michal Simek <monstr@monstr.eu>,
 linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Fri, Nov 08, 2019 at 03:52:48PM +1100, Stephen Rothwell wrote:
> Hi Christoph,
> 
> On Fri, 8 Nov 2019 13:20:00 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > On Thu, 7 Nov 2019 21:47:43 +0100 Christoph Hellwig <hch@lst.de> wrote:
> > >
> > > can you add the generic-ioremap tree:
> > > 
> > >    git://git.infradead.org/users/hch/ioremap.git
> > > 
> > > to linux-next?   
> > 
> > I assume you mean the for-next branch?
> 
> With that assumption, added from today.

Yes, and thanks!

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
