Return-Path: <SRS0=DkXR=GI=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B94CC433DB
	for <linux-snps-arc@archiver.kernel.org>; Tue,  5 Jan 2021 03:50:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8AC762256F
	for <linux-snps-arc@archiver.kernel.org>; Tue,  5 Jan 2021 03:50:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8AC762256F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vBmznYIZuDLV9bGh2phK3Y31W9pGD64SBOT1AlYRmrw=; b=uBxMscpAXXhJggQKsmxjwe4BI
	ArTJW4gpDqmzWWn5e/CjU3A/4ktGg9QkPjgGE59S3vqouNpKClwvmoB378KrUKqWvOzLstvy2Dw6w
	L56a76Nc3fqACWMy57huSV5dEtZ62g+xXgNEDjadl4ffbBwhO/VJ2JPYuEAHw/WrW9yrnDL+D65Q6
	YvMrqnFthctxgkOBLauEgdzksiMHfKmLNI5osnfb28tGq25oCl2MoNIjz6orNdDkIpK5MyLTzlXSP
	4xfpFnsrz+Qb+e6ILjrqjP59LP9cD1Yp1g95Ek0H1It7tkNb7U0BTWRbUDFAlVoaTkHVBIjmNUT7i
	Wk0Uqt1Lw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwdMx-0000dS-FM; Tue, 05 Jan 2021 03:50:51 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwdMu-0000bX-G7
 for linux-snps-arc@lists.infradead.org; Tue, 05 Jan 2021 03:50:50 +0000
Received: by mail-ed1-x534.google.com with SMTP id y24so29595506edt.10
 for <linux-snps-arc@lists.infradead.org>; Mon, 04 Jan 2021 19:50:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=b3i2DWNklZVjsl2UAKCa7AqbN0KVFXiRrj/Leq+WDOM=;
 b=QaoV+dt85/SIxPaD152+bpRXhieIfNZjXCLFUmnjYeOVSlH2J6hfzWGAON68nNBgrD
 /TguU7C/InTWFGCWhMMaUvR7E8YseVqLQhvWeGBHfIum06L67uPE7MK4PTnqxNrhKbi0
 Top9zLT03LMVUN9t9xou9mOwcAu0SfHQ8vG3cNhJZ94pMrW4w26tG2JgcA4Vz2Cr4+HC
 8m1ps6dEEn5wYPuqceRcDZBtkNqB42Io6Hq+8OWaLe+fItq9KgaSbkU3ML5wcpih3N4Z
 i36QU52gQvhylBwEKNULGyufAdMV0f6PG3GdI2IvKEIxPWba7I2olzRfKUvZqdepRwUn
 agJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=b3i2DWNklZVjsl2UAKCa7AqbN0KVFXiRrj/Leq+WDOM=;
 b=CcHlEjLyiXxkj5nl05pSXhhlE1u6TS0Yzw88LqOvdfnCrdhPESo1gp9oyP+9w7TCn+
 jalyHJ0abVE10HnTEUaOe+2hzP+Y1fPoPyQfnY1XI170hSxzQCuGjCwhjnEDyza4BGHw
 LI0P3FW4E7YgIvjsdgbDTLSlLRPXyjtZFXrQmT4ElF1XcKGCDNMSlHLYV0QtOmin0KK7
 TbdixU82aky2o392m+vqIxbiYk5/lU9vdDpwftycVSYdrX790eeC5PXbFeLw4AcVeazQ
 5arAcfelOAJlzzm3Ej6rNOcdu5GSgil+xmQNSheRBVFviOZD9W9ukbI2A93gj26W2+VD
 Y5kw==
X-Gm-Message-State: AOAM531+D1im/d3n63dfW6rMjtqQXHb4DrdFS4jM4ioywOOdR9QcRbA6
 T0cPV0rgwc57ENg1H4hSLYx8nfcFeaGZOm5U7oOIPw==
X-Google-Smtp-Source: ABdhPJwknNce1uVDk7EBKnwBvIlU5uz+2znHV465a20iudsxykeAovWJHlAtM2Cs1s+X+Z7S8tkSSZkk+wewPh3CAo8=
X-Received: by 2002:aa7:df0f:: with SMTP id c15mr75010622edy.354.1609818645726; 
 Mon, 04 Jan 2021 19:50:45 -0800 (PST)
MIME-Version: 1.0
References: <20210101042914.5313-1-rdunlap@infradead.org>
 <CAPcyv4jAiqyFg_BUHh_bJRG-BqzvOwthykijRapB_8i6VtwTmQ@mail.gmail.com>
 <f7803685-e255-7cfe-5259-e2a7dc5ab581@infradead.org>
In-Reply-To: <f7803685-e255-7cfe-5259-e2a7dc5ab581@infradead.org>
From: Dan Williams <dan.j.williams@intel.com>
Date: Mon, 4 Jan 2021 19:50:39 -0800
Message-ID: <CAPcyv4jPwk_xjeVjv0LhXr_d9+dbcEDJ_YOF+qrX97e_CE8yRA@mail.gmail.com>
Subject: Re: [PATCH v2] fs/dax: include <asm/page.h> to fix build error on ARC
To: Randy Dunlap <rdunlap@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210104_225048_604854_B7979ECF 
X-CRM114-Status: GOOD (  25.24  )
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

On Mon, Jan 4, 2021 at 7:47 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> On 1/4/21 12:13 PM, Dan Williams wrote:
> > On Thu, Dec 31, 2020 at 8:29 PM Randy Dunlap <rdunlap@infradead.org> wrote:
> >>
> >> fs/dax.c uses copy_user_page() but ARC does not provide that interface,
> >> resulting in a build error.
> >>
> >> Provide copy_user_page() in <asm/page.h> (beside copy_page()) and
> >> add <asm/page.h> to fs/dax.c to fix the build error.
> >>
> >> ../fs/dax.c: In function 'copy_cow_page_dax':
> >> ../fs/dax.c:702:2: error: implicit declaration of function 'copy_user_page'; did you mean 'copy_to_user_page'? [-Werror=implicit-function-declaration]
> >>
> >> Fixes: cccbce671582 ("filesystem-dax: convert to dax_direct_access()")
> >> Reported-by: kernel test robot <lkp@intel.com>
> >> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> >> Cc: Vineet Gupta <vgupta@synopsys.com>
> >> Cc: linux-snps-arc@lists.infradead.org
> >> Cc: Dan Williams <dan.j.williams@intel.com>
> >> Acked-by: Vineet Gupta <vgupts@synopsys.com>
> >> Cc: Andrew Morton <akpm@linux-foundation.org>
> >> Cc: Matthew Wilcox <willy@infradead.org>
> >> Cc: Jan Kara <jack@suse.cz>
> >> Cc: linux-fsdevel@vger.kernel.org
> >> Cc: linux-nvdimm@lists.01.org
> >> ---
> >> v2: rebase, add more Cc:
> >>
> >>  arch/arc/include/asm/page.h |    1 +
> >>  fs/dax.c                    |    1 +
> >>  2 files changed, 2 insertions(+)
> >>
> >> --- lnx-511-rc1.orig/fs/dax.c
> >> +++ lnx-511-rc1/fs/dax.c
> >> @@ -25,6 +25,7 @@
> >>  #include <linux/sizes.h>
> >>  #include <linux/mmu_notifier.h>
> >>  #include <linux/iomap.h>
> >> +#include <asm/page.h>
> >
> > I would expect this to come from one of the linux/ includes like
> > linux/mm.h. asm/ headers are implementation linux/ headers are api.
> >
> > Once you drop that then the subject of this patch can just be "arc:
> > add a copy_user_page() implementation", and handled by the arc
> > maintainer (or I can take it with Vineet's ack).
>
> Got it. Thanks.
> Vineet is copied. I expect that he will take the v3 patch.
>
> >>  #include <asm/pgalloc.h>
> >
> > Yes, this one should have a linux/ api header to front it, but that's
> > a cleanup for another day.
>
> That line is only part of the contextual diff in this patch.
> I guess you are just commenting in general, along with your earlier
> paragraph.

Yes, I was prefetching a "...hey, but, there's an asm/ include right
below this one?"

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
