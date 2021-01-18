Return-Path: <SRS0=ZfBq=GV=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 198A3C433E0
	for <linux-snps-arc@archiver.kernel.org>; Mon, 18 Jan 2021 22:53:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A5952222F
	for <linux-snps-arc@archiver.kernel.org>; Mon, 18 Jan 2021 22:53:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A5952222F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZA8cbm3/nBLlhCSaoexSk2NTcNLKVQjTBTXO2cTbpn4=; b=lw5+wo0JtxNKq0I6d0ClMfgGU
	mtBo+hLiRKA8exq2kpYytAKty8SzP4kQJMIrsROM4JUoqA8EFb/sf2ylgUlRuCCwqA+F5F7crDhk3
	tt6G5qSomq4Tl7M49y5JUEBl2wCi3xRjx0eV6m49L5dsOU6h+3R0+Q8Vhsya6/3GCGF60037PhOfw
	j4q7EzlINCoJ9oHF1z6mrACtxHKv/ZDbtgxbMKEKnVzGpn8MMvXUCN2qMD7ZeCrpmf35fp7hD4try
	TJm5jC9TR/VnKAtL1JFkEO7EmOeBiyx1jHFBTgNKA8UMxlIUMJCd09jyKYwNv9S5eAWA04ck2/DYR
	AGih7k5qA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1dPH-0004lo-A6; Mon, 18 Jan 2021 22:53:55 +0000
Received: from [2601:1c0:6280:3f0::9abc]
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1dPC-0004l9-4s; Mon, 18 Jan 2021 22:53:50 +0000
Subject: Re: [PATCH v5 1/2] lib: stackdepot: Add support to configure
 STACK_HASH_SIZE
To: vjitta@codeaurora.org, minchan@kernel.org, glider@google.com,
 akpm@linux-foundation.org, dan.j.williams@intel.com, broonie@kernel.org,
 mhiramat@kernel.org
References: <1610963802-11042-1-git-send-email-vjitta@codeaurora.org>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <2f12a84c-132b-7141-a89e-9e19de0e4b90@infradead.org>
Date: Mon, 18 Jan 2021 14:53:43 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <1610963802-11042-1-git-send-email-vjitta@codeaurora.org>
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
Cc: ylal@codeaurora.org, Vineet Gupta <vgupta@synopsys.com>,
 vinmenon@codeaurora.org,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 1/18/21 1:56 AM, vjitta@codeaurora.org wrote:
> From: Yogesh Lal <ylal@codeaurora.org>
> 
> Use CONFIG_STACK_HASH_ORDER to configure STACK_HASH_SIZE.
> 
> Aim is to have configurable value for  STACK_HASH_SIZE,
> so depend on use case one can configure it.
> 
> One example is of Page Owner, default value of
> STACK_HASH_SIZE lead stack depot to consume 8MB of static memory.
> Making it configurable and use lower value helps to enable features like
> CONFIG_PAGE_OWNER without any significant overhead.
> 
> Signed-off-by: Yogesh Lal <ylal@codeaurora.org>
> Signed-off-by: Vinayak Menon <vinmenon@codeaurora.org>
> Signed-off-by: Vijayanand Jitta <vjitta@codeaurora.org>

Hi,

Did you see
https://lore.kernel.org/lkml/202101050729.cwTd47Yw-lkp@intel.com/

It seems that arch/arc/ does not have:
   arc-elf-ld: lib/stackdepot.o: in function `filter_irq_stacks':
   (.text+0x6): undefined reference to `__irqentry_text_start'
>> arc-elf-ld: (.text+0x6): undefined reference to `__irqentry_text_start'
>> arc-elf-ld: (.text+0x26): undefined reference to `__irqentry_text_end'
>> arc-elf-ld: (.text+0x26): undefined reference to `__irqentry_text_end'
>> arc-elf-ld: (.text+0x34): undefined reference to `__softirqentry_text_start'
>> arc-elf-ld: (.text+0x34): undefined reference to `__softirqentry_text_start'
>> arc-elf-ld: (.text+0x3c): undefined reference to `__softirqentry_text_end'
>> arc-elf-ld: (.text+0x3c): undefined reference to `__softirqentry_text_end'




-- 
~Randy
You can't do anything without having to do something else first.
-- Belefant's Law

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
