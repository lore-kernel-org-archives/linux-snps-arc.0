Return-Path: <SRS0=WOcc=ND=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76FDFC4338F
	for <linux-snps-arc@archiver.kernel.org>; Thu, 12 Aug 2021 01:37:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30CA66105A
	for <linux-snps-arc@archiver.kernel.org>; Thu, 12 Aug 2021 01:37:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 30CA66105A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tK4wMqeiBH8/rsYNU0SEaK/iZ/6CwNopiRAuCMBfxQk=; b=e1AxAQVJr+hPcflUkZbBT67fqM
	tmlh9YMmN/lQFgYI6stmZW0n2wChlwCOyI/06tCh8YRpWGCsdX3mVzuBNBs1DEYgLAGVNCczU5Fy/
	f0l+ugHSzIiVbm/JdEOD/yRS5vFdjjtMJVfmamtY9GZWQ+r3hcgdf2UOZwR/E19/+cz/rNEtXKSbb
	sptQJTZtQaJwQlWzkvxPXrW+CIJnKGOqCFHhajleZ7VzZ9HJIDuHwhcy9TVt/Jv6wdHG7nKLPRCBR
	EbvR8RroVzxhapeyYqbIYpnihEKRpphRmg304dOfbUpSoDVizbEguoffQNmFeKPB5+YPbP+qLqzM0
	N6NoctNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDzew-008OtD-Aj; Thu, 12 Aug 2021 01:37:26 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDzet-008OsR-60
 for linux-snps-arc@lists.infradead.org; Thu, 12 Aug 2021 01:37:24 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D748560EE5;
 Thu, 12 Aug 2021 01:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628732242;
 bh=3yliXKYml5z2kI731mSBDWtqWccUdEBlEAHRlw7CWUE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=XSP8c6dj01Dk9xwmmCsAnKzMr571Sw7AQT6DrDOZ10jM+pq7m+CbeVj11JDdHOQ2C
 VFgaP3oaWAa2+t7CW4ieuADIZLAIQtsWckJFx+PTLLi+BffLv5xS3ZFvcDBTnyxct4
 u/bUfqsNxdvVo6/YmLqhl1r5jrt9rZ1SrIg6BqgQD8EIQikxB6H3tG1Xg7dJf4vQXg
 oNsbfhIrYyYrTgAxI3zz2v1gni2bwmvWWr9QOBHAwo5rUdAotCas1aRMWCjXm+xxVD
 rUGcoXSY3mPJWYU6xYuufe8XfNGS1jcy0Rhi4S6zJKGLNEONxZFU2O/x/eaLOEhEov
 EcT6M9P/HJgbQ==
Subject: Re: [PATCH 09/18] ARC: mm: non-functional code cleanup ahead of 3
 levels
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Anshuman Khandual <anshuman.khandual@arm.com>
References: <20210811004258.138075-1-vgupta@kernel.org>
 <20210811004258.138075-10-vgupta@kernel.org> <YRPDL90Qr5RLDmnT@kernel.org>
From: Vineet Gupta <vgupta@kernel.org>
Message-ID: <7d022d55-c70b-b3ac-4f0b-1faa26c0d4bd@kernel.org>
Date: Wed, 11 Aug 2021 18:37:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YRPDL90Qr5RLDmnT@kernel.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210811_183723_295881_76D63F5A 
X-CRM114-Status: GOOD (  10.83  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 8/11/21 5:31 AM, Mike Rapoport wrote:
>> +/*
>> + * For ARC, pgtable_t is not struct page *, but pte_t * (to avoid
>> + * extraneous page_address() calculations) hence can't use
>> + * use asm-generic/pgalloc.h which assumes it being struct page *
>> + */
> Another reason to leave ARC without asm-generic/pgalloc.h was
> __get_order_pte() that other arches don't have.
> So this and pgtable_t aliased to pte_t * seemed to me too much to bother
> then, but probably it's worth reconsidering with addition of 3rd and 4th
> levels.

I agree that savings of not havign page_address() might not be huge. 
However asm-generic/pgalloc.h only has pte allocation routines and all 
other allocation levels come from arch file

Also for ARCv2, given the arbitrary address split and ensuing paging 
levels (as well as support for different page sizes) we will need to 
make sure that one page is enough to hold any level's paging using say 
BUILD_BUG_ON. In fact that should also be done for 3rd and 4th levels 
for sanity.

-Vineet



_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
