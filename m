Return-Path: <SRS0=1tZ9=GH=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5683C433E0
	for <linux-snps-arc@archiver.kernel.org>; Mon,  4 Jan 2021 20:13:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E04F21BE5
	for <linux-snps-arc@archiver.kernel.org>; Mon,  4 Jan 2021 20:13:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E04F21BE5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oWPkm6tS2h4qUNHnmJv+AHBxivpGfhO4rGmhAfklQ+E=; b=NnZ8cK0CtpPUo+OSFymjo0jsM
	Ey4Wvcfnd7ZV6hkXfavVnj1FXnb75JLymlvnTtn5sm1k9vijIyPpWBIkKPNkCisDqCojQfxm5zvRm
	7hOWGAIuqUhy1MaON38ue9lRCJeuPWjcKFssJ6XySqyfbK40HBdTM0VbpDhkLkqmNQHh2xI89GxuW
	ya9IYa8Qc9rxLUxvkuQMQjUCFE48nm+4iq67rHR81vKk79iDHbEfP7Lh4qi9Ix5sBPDCMF8/qcojs
	P493KkXQf2runKu6P0QA3PAD/Hmi9fKhS7G9VRuvvU1QqImvqmfK8slUh3pic1g8mxSrSK/BGkwG1
	c/lsfdn3A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwWE4-0001GP-7x; Mon, 04 Jan 2021 20:13:12 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwWE1-0001FC-8H
 for linux-snps-arc@lists.infradead.org; Mon, 04 Jan 2021 20:13:10 +0000
Received: by mail-ej1-x62a.google.com with SMTP id q22so38488866eja.2
 for <linux-snps-arc@lists.infradead.org>; Mon, 04 Jan 2021 12:13:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7kOBICLhgLGGyrBsGRMV3d/XVZVOrn09qft6qb67hiE=;
 b=b7+VQwx/HUQzT1Lln1PrW9cd3nW1D010dCcBMbiDuL8w8T2cMiST0QajPYCyO9SBTy
 E+7xVOhLrFVJHR+eUx1Ij+VS2X57fazwKoDionRO4qDeMd7X03I234SRmEUAPqe2R5Xa
 ILlc302XjgoH5Sb9Yqfte/wMcpHbdyYWLbrxXh4dys0bF7YG4zkHLzESiH5c7HdCyToB
 1fXlQ/L7kIH37aSQ7TFVTIolgaJRkFT5ppz+EOR/Qk4YOCFsVgzztEwTaOK4xAnSZ/xw
 nNEP6gn0mObJwoCPXe0QJbplu6Itl2Ty79I28i8dSDWE0XtVR5Sxh2PCd/D8T2JoHd3K
 JLAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7kOBICLhgLGGyrBsGRMV3d/XVZVOrn09qft6qb67hiE=;
 b=Wzn66yYM4qV1uZSwJtIGwwD3inVBh51Bg8cidosk4Xg3rrBarIqtnu2w1tpSBxIukr
 0bIXnYkB+6kca6MN3Hrc83jyuSpwC4Q+wLFwpQ+zrSK6RdhF9AfU6jIMN3Xj733Umijw
 cU4PmCo5pXQlA5hR9BY/o/8LdhTHNpqFqbjo3pYYf2+oQZgXID7/CzavLrC5yyiJeBTk
 U77+Yb3QfMooR7b5z2OIw+gTPhbszKIFfmexxul9ys0y1kavTse/2xVDYlPmIsfq6pqH
 LbiAmQBZCgThmCYABkL3MFoGN1p5dQRW4/AjmVNn2NmASLsSLMxnPaXfZ1VCH4CGKvYo
 qLAg==
X-Gm-Message-State: AOAM533aDQar4zbOxFFtZy4YSWZAtC+NQmHTevfwiOv9rIrMsHAMOawa
 FbPVQHDL9sQ70bUyC7PXL8TdqOL6uJw8IXbB0BEb9A==
X-Google-Smtp-Source: ABdhPJy+4iAG8xX6k5boBafJrxqqiEEzN3EesBcv4x2KpEgiPAMRNtZVgnB3PFS5lgHiTfJrc6ChogC2RZDjLmvXQ/E=
X-Received: by 2002:a17:906:2707:: with SMTP id
 z7mr68530499ejc.418.1609791188031; 
 Mon, 04 Jan 2021 12:13:08 -0800 (PST)
MIME-Version: 1.0
References: <20210101042914.5313-1-rdunlap@infradead.org>
In-Reply-To: <20210101042914.5313-1-rdunlap@infradead.org>
From: Dan Williams <dan.j.williams@intel.com>
Date: Mon, 4 Jan 2021 12:13:02 -0800
Message-ID: <CAPcyv4jAiqyFg_BUHh_bJRG-BqzvOwthykijRapB_8i6VtwTmQ@mail.gmail.com>
Subject: Re: [PATCH v2] fs/dax: include <asm/page.h> to fix build error on ARC
To: Randy Dunlap <rdunlap@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210104_151309_332140_91FF867E 
X-CRM114-Status: GOOD (  18.46  )
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Matthew Wilcox <willy@infradead.org>, Vineet Gupta <vgupts@synopsys.com>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-snps-arc@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Thu, Dec 31, 2020 at 8:29 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> fs/dax.c uses copy_user_page() but ARC does not provide that interface,
> resulting in a build error.
>
> Provide copy_user_page() in <asm/page.h> (beside copy_page()) and
> add <asm/page.h> to fs/dax.c to fix the build error.
>
> ../fs/dax.c: In function 'copy_cow_page_dax':
> ../fs/dax.c:702:2: error: implicit declaration of function 'copy_user_page'; did you mean 'copy_to_user_page'? [-Werror=implicit-function-declaration]
>
> Fixes: cccbce671582 ("filesystem-dax: convert to dax_direct_access()")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Vineet Gupta <vgupta@synopsys.com>
> Cc: linux-snps-arc@lists.infradead.org
> Cc: Dan Williams <dan.j.williams@intel.com>
> Acked-by: Vineet Gupta <vgupts@synopsys.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Matthew Wilcox <willy@infradead.org>
> Cc: Jan Kara <jack@suse.cz>
> Cc: linux-fsdevel@vger.kernel.org
> Cc: linux-nvdimm@lists.01.org
> ---
> v2: rebase, add more Cc:
>
>  arch/arc/include/asm/page.h |    1 +
>  fs/dax.c                    |    1 +
>  2 files changed, 2 insertions(+)
>
> --- lnx-511-rc1.orig/fs/dax.c
> +++ lnx-511-rc1/fs/dax.c
> @@ -25,6 +25,7 @@
>  #include <linux/sizes.h>
>  #include <linux/mmu_notifier.h>
>  #include <linux/iomap.h>
> +#include <asm/page.h>

I would expect this to come from one of the linux/ includes like
linux/mm.h. asm/ headers are implementation linux/ headers are api.

Once you drop that then the subject of this patch can just be "arc:
add a copy_user_page() implementation", and handled by the arc
maintainer (or I can take it with Vineet's ack).

>  #include <asm/pgalloc.h>

Yes, this one should have a linux/ api header to front it, but that's
a cleanup for another day.

>
>  #define CREATE_TRACE_POINTS
> --- lnx-511-rc1.orig/arch/arc/include/asm/page.h
> +++ lnx-511-rc1/arch/arc/include/asm/page.h
> @@ -10,6 +10,7 @@
>  #ifndef __ASSEMBLY__
>
>  #define clear_page(paddr)              memset((paddr), 0, PAGE_SIZE)
> +#define copy_user_page(to, from, vaddr, pg)    copy_page(to, from)
>  #define copy_page(to, from)            memcpy((to), (from), PAGE_SIZE)
>
>  struct vm_area_struct;

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
