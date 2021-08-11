Return-Path: <SRS0=gXlX=NC=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7019C4338F
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Aug 2021 18:46:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7095360E97
	for <linux-snps-arc@archiver.kernel.org>; Wed, 11 Aug 2021 18:46:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7095360E97
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.dev
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TuD5mkdUUNJ/CWM7PBjWJL2CDvhY82aOAifr79IEh/w=; b=QAiFR/cz67CGaF4/dnhhRqhzi2
	WM3ZECYnYxhR4GZq2vrS9RP0k13t6VcoKB6gnO6I/VP/Y6FrjeoXtRPthd+ImdjUB/82rpXwsVj1n
	xHR+iBvLV9FNI/epuEMCRIzP4xLPdeJK6imvI8Su2sF7hMzDvbe1AWBmdxGD1lPZN3U+nEbrHTeVL
	Kb231mafk9n0nW4eCK+FLM5kgk297dZ5+nQSsfZoa36UDCjFnZ1t/OBM2+Z2kGfTRAGiNoUZH2Iuq
	E16NROy82YXsafWCk8XmM2Udy0XAnmwUD0DpdwS6dHpaTGbhv/0Qm5x/ysfOsWz0cY0DDu9NaGxvn
	hIV11VTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDtFM-007v8h-Se; Wed, 11 Aug 2021 18:46:36 +0000
Received: from out2.migadu.com ([2001:41d0:2:aacc::])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDtFG-007v5y-J3
 for linux-snps-arc@lists.infradead.org; Wed, 11 Aug 2021 18:46:34 +0000
Subject: Re: [PATCH 03/18] ARC: mm: move mmu/cache externs out to setup.h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1628707586;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SK25dEcn466Z3Vi0DqLxIySdCp5Mv9jbvw0c3iJwG8U=;
 b=ErI1vkw1xnLMlIRzSuseZUPuXhb4a1szsgUdHWTiWa11I+f0/0hXcmuO8ezyEZFEr+Ug/B
 LQ2mc53++4EVYazWQ9RdU9yCcvWmN1NnHGek2T0hMrH8lGTiC1axkwon0TTjv6uR6jvYNA
 TgKsIEgUiph6Nmrwms/LjP5RJ6KlDkc=
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Anshuman Khandual <anshuman.khandual@arm.com>,
 Vineet Gupta <vgupta@kernel.com>
References: <20210811004258.138075-1-vgupta@kernel.org>
 <20210811004258.138075-4-vgupta@kernel.org> <YRNb0EbPzejXJdax@kernel.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Vineet Gupta <vineet.gupta@linux.dev>
Message-ID: <fe3a8a38-69ef-ff4b-6e63-b110ffc188e7@linux.dev>
Date: Wed, 11 Aug 2021 11:46:21 -0700
MIME-Version: 1.0
In-Reply-To: <YRNb0EbPzejXJdax@kernel.org>
Content-Language: en-US
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: vineet.gupta@linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210811_114630_818740_603F02FF 
X-CRM114-Status: UNSURE (   9.15  )
X-CRM114-Notice: Please train this message.
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

Hi Mike,

On 8/10/21 10:10 PM, Mike Rapoport wrote:
> Hi Vineet,
>
> On Tue, Aug 10, 2021 at 05:42:43PM -0700, Vineet Gupta wrote:
>> Signed-off-by: Vineet Gupta <vgupta@kernel.com>
> Hmm, this one seems odd. Try https://www.kernel.com/ ;-)

Oops, last minute switch to my kernel.org address - this update was not 
atomic ;-)

>> Signed-off-by: Vineet Gupta <vgupta@kernel.org>
>> ---
>>   arch/arc/include/asm/cache.h |  4 ----
>>   arch/arc/include/asm/mmu.h   |  4 ----
>>   arch/arc/include/asm/setup.h | 12 ++++++++++--
> A sentence about why these move would have been nice.

Sure
---->
"Don't pollute mmu.h and cache.h with some of ARC internal bootlog/setup 
related functions.
move them aside to setup.h"

Thx for taking the time to review !

-Vineet

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
