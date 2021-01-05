Return-Path: <SRS0=DkXR=GI=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF454C433DB
	for <linux-snps-arc@archiver.kernel.org>; Tue,  5 Jan 2021 04:18:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33F5422597
	for <linux-snps-arc@archiver.kernel.org>; Tue,  5 Jan 2021 04:18:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 33F5422597
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Cd3eFKyaiIgfGcGWntzH4d2PzhN+Sl7PeWCxaN3e0n8=; b=OYYVXU2pTry+PSXyPluJud8QR
	3FNUwgHrHrIB8J/3OODtBtpRh4knE1eg6vcJyBQ9lAboFf8NyYx8NyTa8Y+hsEsPgl4+69mhJqmHv
	DtApNwJO9UxyRjoIAUIr/nSfp9oPeeBhSzToSq/xHsKg2wo/kZn1dXYhn37bs343um/p5HHC3kuEi
	J8atTb/ROa8CXp+JcpRAI6ZO3Rmj+2LtvVfyVSQ8xI2bX32AotxT6Ax9sMJzwZ8xvgOsxNe0IMdEJ
	gSDJ2GmeGabY3jGsTjdQBBGLBA/GwempMnsnWRBNTDLixj90+qaI4MUqf3iRN1hh14VmjRczl1xwg
	eDaNq+Ppw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwdnM-0004jv-B9; Tue, 05 Jan 2021 04:18:08 +0000
Received: from [2002:c35c:fd02::1] (helo=ZenIV.linux.org.uk)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwdnK-0004jZ-I9
 for linux-snps-arc@lists.infradead.org; Tue, 05 Jan 2021 04:18:07 +0000
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1kwdms-006y0f-FZ; Tue, 05 Jan 2021 04:17:38 +0000
Date: Tue, 5 Jan 2021 04:17:38 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v2] fs/dax: include <asm/page.h> to fix build error on ARC
Message-ID: <20210105041738.GS3579531@ZenIV.linux.org.uk>
References: <20210101042914.5313-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210101042914.5313-1-rdunlap@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210104_231806_767858_946C4860 
X-CRM114-Status: GOOD (  11.36  )
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
 linux-nvdimm@lists.01.org, Vineet Gupta <vgupta@synopsys.com>,
 linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 Vineet Gupta <vgupts@synopsys.com>, linux-fsdevel@vger.kernel.org,
 Dan Williams <dan.j.williams@intel.com>, linux-snps-arc@lists.infradead.org,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Thu, Dec 31, 2020 at 08:29:14PM -0800, Randy Dunlap wrote:
> fs/dax.c uses copy_user_page() but ARC does not provide that interface,
> resulting in a build error.
> 
> Provide copy_user_page() in <asm/page.h> (beside copy_page()) and
> add <asm/page.h> to fs/dax.c to fix the build error.
> 
> ../fs/dax.c: In function 'copy_cow_page_dax':
> ../fs/dax.c:702:2: error: implicit declaration of function 'copy_user_page'; did you mean 'copy_to_user_page'? [-Werror=implicit-function-declaration]

Could somebody explain what the force-cast is doing in there?
I mean, the call is
        copy_user_page(vto, (void __force *)kaddr, vaddr, to);
kaddr is a local variable there, declared as void *; AFAICS, that
had been pure cargo-cult since
commit 7a9eb20666317794d0279843fbd091af93907780
Author: Dan Williams <dan.j.williams@intel.com>
Date:   Fri Jun 3 18:06:47 2016 -0700

    pmem: kill __pmem address space

I mean, it's been more than 4 years, time to bury that body...

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
