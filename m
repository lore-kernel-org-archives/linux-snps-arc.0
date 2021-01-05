Return-Path: <SRS0=DkXR=GI=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3066C433DB
	for <linux-snps-arc@archiver.kernel.org>; Tue,  5 Jan 2021 03:44:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A9382256F
	for <linux-snps-arc@archiver.kernel.org>; Tue,  5 Jan 2021 03:44:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A9382256F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=P4wAgf3OoBjcngs6L/bgCAHesYy6scpelG19TNZu1Dg=; b=K0P7XMghv7NqcCPhfsD2RIgni
	4SCClzfSSqPurLEjoz2OaQqPsVzZSZVbuVpnj87vm4Wiy7rreqYQieLS0hwaoUh03b9G9vR0fAuCV
	Y6/8yzUTRO5oaH9oEaMvSh/4e0RJpSvp+Z0LI2gb/fenZfpGw3ZfoJZJLNCVhmSALsRkoPQNXvGui
	mB4yY+ltKZCGc+Owjzmr7YT4lUApP0niW4jreCxcoOKeFZbALu6J0121m/aplHOym5T9PXfc7GIb6
	ryhG+lQDI2hWBb/sjgo0W1dM7/h/ufPUoF9AZSQJh3nexzGWEv6z4JBlH11BQhtjGy8dPKCTreFwE
	plswy3m3A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwdHA-0008TN-54; Tue, 05 Jan 2021 03:44:52 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwdH9-0008TG-3x
 for linux-snps-arc@merlin.infradead.org; Tue, 05 Jan 2021 03:44:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=LL0n5x3ZKQKBeJnSSJSM66PM0K/AJjwB+1HmKM1hr8U=; b=vqHQHb729MK/QOY1e4fmVZYfud
 /TD9vGo4S6EN6UBI+d2ADvQfqXa3B0+lr1/RL8oNt4hJto7ltzwc/+KwiFIxBi0ukO1d+E/O6ryKc
 Zwt7vKpdx69+TBSZLxxY7ZYbMzVj1tEmhkQO30zFGsZH7kQzEFWwiLRlP1oVDc/e2RGHwJCDnUilt
 lNs3AgC8+Msq9m4ryKAY3Nie/F51/2kCM0Nuf6Urnkka/a3bZS16Z5HICp7iqi9Wc2zQoG1uQfjDi
 r1hNWwUQH/e/pA8RC31LjXXerP46hcx0TayKREjnmGNFx6LT31RXQaVCXIVhEmqriQ94csQVnDN5t
 7iyMVmOA==;
Received: from [2601:1c0:6280:3f0::64ea]
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1kwdEH-000pgb-Q7; Tue, 05 Jan 2021 03:42:36 +0000
Subject: Re: [PATCH v2] fs/dax: include <asm/page.h> to fix build error on ARC
To: Dan Williams <dan.j.williams@intel.com>
References: <20210101042914.5313-1-rdunlap@infradead.org>
 <CAPcyv4jAiqyFg_BUHh_bJRG-BqzvOwthykijRapB_8i6VtwTmQ@mail.gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <f7803685-e255-7cfe-5259-e2a7dc5ab581@infradead.org>
Date: Mon, 4 Jan 2021 19:41:48 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAPcyv4jAiqyFg_BUHh_bJRG-BqzvOwthykijRapB_8i6VtwTmQ@mail.gmail.com>
Content-Language: en-US
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

On 1/4/21 12:13 PM, Dan Williams wrote:
> On Thu, Dec 31, 2020 at 8:29 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>>
>> fs/dax.c uses copy_user_page() but ARC does not provide that interface,
>> resulting in a build error.
>>
>> Provide copy_user_page() in <asm/page.h> (beside copy_page()) and
>> add <asm/page.h> to fs/dax.c to fix the build error.
>>
>> ../fs/dax.c: In function 'copy_cow_page_dax':
>> ../fs/dax.c:702:2: error: implicit declaration of function 'copy_user_page'; did you mean 'copy_to_user_page'? [-Werror=implicit-function-declaration]
>>
>> Fixes: cccbce671582 ("filesystem-dax: convert to dax_direct_access()")
>> Reported-by: kernel test robot <lkp@intel.com>
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>> Cc: Vineet Gupta <vgupta@synopsys.com>
>> Cc: linux-snps-arc@lists.infradead.org
>> Cc: Dan Williams <dan.j.williams@intel.com>
>> Acked-by: Vineet Gupta <vgupts@synopsys.com>
>> Cc: Andrew Morton <akpm@linux-foundation.org>
>> Cc: Matthew Wilcox <willy@infradead.org>
>> Cc: Jan Kara <jack@suse.cz>
>> Cc: linux-fsdevel@vger.kernel.org
>> Cc: linux-nvdimm@lists.01.org
>> ---
>> v2: rebase, add more Cc:
>>
>>  arch/arc/include/asm/page.h |    1 +
>>  fs/dax.c                    |    1 +
>>  2 files changed, 2 insertions(+)
>>
>> --- lnx-511-rc1.orig/fs/dax.c
>> +++ lnx-511-rc1/fs/dax.c
>> @@ -25,6 +25,7 @@
>>  #include <linux/sizes.h>
>>  #include <linux/mmu_notifier.h>
>>  #include <linux/iomap.h>
>> +#include <asm/page.h>
> 
> I would expect this to come from one of the linux/ includes like
> linux/mm.h. asm/ headers are implementation linux/ headers are api.
> 
> Once you drop that then the subject of this patch can just be "arc:
> add a copy_user_page() implementation", and handled by the arc
> maintainer (or I can take it with Vineet's ack).

Got it. Thanks.
Vineet is copied. I expect that he will take the v3 patch.

>>  #include <asm/pgalloc.h>
> 
> Yes, this one should have a linux/ api header to front it, but that's
> a cleanup for another day.

That line is only part of the contextual diff in this patch.
I guess you are just commenting in general, along with your earlier
paragraph.

>>
>>  #define CREATE_TRACE_POINTS
>> --- lnx-511-rc1.orig/arch/arc/include/asm/page.h
>> +++ lnx-511-rc1/arch/arc/include/asm/page.h
>> @@ -10,6 +10,7 @@
>>  #ifndef __ASSEMBLY__
>>
>>  #define clear_page(paddr)              memset((paddr), 0, PAGE_SIZE)
>> +#define copy_user_page(to, from, vaddr, pg)    copy_page(to, from)
>>  #define copy_page(to, from)            memcpy((to), (from), PAGE_SIZE)
>>
>>  struct vm_area_struct;


-- 
~Randy


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
