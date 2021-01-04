Return-Path: <SRS0=1tZ9=GH=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF225C433E0
	for <linux-snps-arc@archiver.kernel.org>; Mon,  4 Jan 2021 20:17:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CBAC6221F8
	for <linux-snps-arc@archiver.kernel.org>; Mon,  4 Jan 2021 20:17:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CBAC6221F8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TDJhRwmTIqvzPxsADmZJ6lGehthpGs+sb86YU1YNHJY=; b=dr5+L+Hr1Thj1dlTFimCazhw/
	cSMGCV2uQWjtKbl6TFvRy+J9u3vaJs7DTOHvQKJy1FfA3TBQ/S5LRFRdGh/IT8oiMYapvdNEXPN51
	hYrosC1veK/srtyz4BmXXx/Y8lJWM92ISCubMaw1Lf8+ez71Hbf0GprkNP+M++OSTCaTaZJUX4hvp
	Ztvy1SKNetDrwaiBQXQk2R9EkfIzd/NfvQxIlleFvfgk1Lw0UomasrjJ26QUlBaO2A5yKRV9FOqp9
	mI5Aqwcs2nPFW2IQrYk3n/nDDREtBZ9JZUn0TPJck+MM+TTXabb55QYl+a7nn8z8oYjlq75ctBsHS
	/ICQbP6OQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwWI8-0002Ew-2F; Mon, 04 Jan 2021 20:17:24 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwWI6-0002Ea-Tb; Mon, 04 Jan 2021 20:17:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=YBgRGjn+yLmFC+9fNHoHRFsXeCxEkKsHezqEmQ36bEQ=; b=XIYp5yjtmgky7iNoVOQb+o3wZr
 3L/KpsgoiU4PgUF/2JfxkJRLW1hcLCYXszkagaCvEljXe9Uz+u8+jE4+N39M+0neNh8AXn+EbgqWM
 UAxR+Arf7ji2B/OFG3Uuzpv6oLlzE/WKH4NRTf2C5ZLJ22nsjlTWilnsqIdsGcypiK9aJg4IAg5lM
 1g4r0kbHQm4M2Ktv1xQeCRGIRJ24dRRo5PufxYiZ9vMcYqdiYxSuk/oTaFj4aJIls1KwvNY3iTP+R
 Trby8W4LwayqM2o9OfZDsuFaS3Xmo2k+k2H9fTJbw7qxTzxk44Reo+ivVA4pG6SNp99GU0kgCtR58
 KvCbKeJQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1kwWHJ-000VKI-Fy; Mon, 04 Jan 2021 20:17:08 +0000
Date: Mon, 4 Jan 2021 20:16:33 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH v2] fs/dax: include <asm/page.h> to fix build error on ARC
Message-ID: <20210104201633.GE22407@casper.infradead.org>
References: <20210101042914.5313-1-rdunlap@infradead.org>
 <CAPcyv4jAiqyFg_BUHh_bJRG-BqzvOwthykijRapB_8i6VtwTmQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPcyv4jAiqyFg_BUHh_bJRG-BqzvOwthykijRapB_8i6VtwTmQ@mail.gmail.com>
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
Cc: Jan Kara <jack@suse.cz>, kernel test robot <lkp@intel.com>,
 linux-nvdimm <linux-nvdimm@lists.01.org>, Vineet Gupta <vgupta@synopsys.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Vineet Gupta <vgupts@synopsys.com>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-snps-arc@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Mon, Jan 04, 2021 at 12:13:02PM -0800, Dan Williams wrote:
> On Thu, Dec 31, 2020 at 8:29 PM Randy Dunlap <rdunlap@infradead.org> wrote:
> > +++ lnx-511-rc1/fs/dax.c
> > @@ -25,6 +25,7 @@
> >  #include <linux/sizes.h>
> >  #include <linux/mmu_notifier.h>
> >  #include <linux/iomap.h>
> > +#include <asm/page.h>
> 
> I would expect this to come from one of the linux/ includes like
> linux/mm.h. asm/ headers are implementation linux/ headers are api.

It does indeed come from linux/mm.h already.  And a number of
other random places, including linux/serial.h.  Our headers are a mess,
but they shouldn't be made worse by adding _this_ include.  So I
second Dan's objection here.

> Once you drop that then the subject of this patch can just be "arc:
> add a copy_user_page() implementation", and handled by the arc
> maintainer (or I can take it with Vineet's ack).
> 
> >  #include <asm/pgalloc.h>
> 
> Yes, this one should have a linux/ api header to front it, but that's
> a cleanup for another day.

Definitely more involved.


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
