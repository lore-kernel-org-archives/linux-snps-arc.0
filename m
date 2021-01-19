Return-Path: <SRS0=5pS1=GW=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 956E0C433E0
	for <linux-snps-arc@archiver.kernel.org>; Tue, 19 Jan 2021 06:52:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B28523120
	for <linux-snps-arc@archiver.kernel.org>; Tue, 19 Jan 2021 06:52:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B28523120
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ev5DC5/LLlyVJ5W/eJTZSYjXRD8MchaVWXMUWLM1jHE=; b=xjBvpN1tPjf9j3n3jso4RW6Yo
	NbYjOdkhAHoBUGtg5u6q256U/70yuvnqchh8NiI8iL9mkBcbxkZCGoIVJBHMRiZEooHgB/tBgLxJs
	Zkzveh+ZLqPEckHHm2jCvRnJoMUuCPbvq0ahyxfVTQqUT/rwx46a5vc4/8bbPFpFTrmNrnipHc0tv
	UoFPd66F//kvMpuB7Is/m2lMK2RKxCqFqdNHaKrqNeit+cjxJ6WZlEUzWKv4h5I3fKjR7LmKkYYoT
	3XeZmnpxZbvnzKExLmBefB4xiMBls/ifrXCIgg55W+I/q2QcFJR/Czu/14fcRj4IUwQI+d+aPpLne
	yc0732UZw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1ksc-0007Ih-5v; Tue, 19 Jan 2021 06:52:42 +0000
Received: from a1.mail.mailgun.net ([198.61.254.60])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1ksY-0007IF-Vq
 for linux-snps-arc@lists.infradead.org; Tue, 19 Jan 2021 06:52:40 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1611039159; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=HIiycmukDlMKWoaXdKMNjEk1LtaU7BFK1V4A0jvRA64=;
 b=IxBLyOIic2ToBNvx5l9x7nR5lMK6/ipq2KseHh9cKJUPLVTFK5P2RQUxF4M2MxarGLPW330G
 kM3ZWg8aZoCFL2SIvQrB16DpNCDTxaVcdSe/QrGIzs358DDGTqb2NlXr5D6YJIfTcs9pvMev
 M93DYS4YByrOmMgRDCJIdXZquT4=
X-Mailgun-Sending-Ip: 198.61.254.60
X-Mailgun-Sid: WyJjMjgwNSIsICJsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 600681b0e23dedcc3a7d896c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 19 Jan 2021 06:52:32
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id CE947C43461; Tue, 19 Jan 2021 06:52:31 +0000 (UTC)
Received: from [192.168.0.106] (unknown [182.18.191.137])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: vjitta)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 2C8B0C433CA;
 Tue, 19 Jan 2021 06:52:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2C8B0C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=vjitta@codeaurora.org
Subject: Re: [PATCH v5 1/2] lib: stackdepot: Add support to configure
 STACK_HASH_SIZE
To: Randy Dunlap <rdunlap@infradead.org>, minchan@kernel.org,
 glider@google.com, akpm@linux-foundation.org, dan.j.williams@intel.com,
 broonie@kernel.org, mhiramat@kernel.org
References: <1610963802-11042-1-git-send-email-vjitta@codeaurora.org>
 <2f12a84c-132b-7141-a89e-9e19de0e4b90@infradead.org>
From: Vijayanand Jitta <vjitta@codeaurora.org>
Message-ID: <678c5d5f-3cd4-74ad-aebc-51cbc4c9ee4b@codeaurora.org>
Date: Tue, 19 Jan 2021 12:22:22 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <2f12a84c-132b-7141-a89e-9e19de0e4b90@infradead.org>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210119_015239_676121_2BFB1C8F 
X-CRM114-Status: GOOD (  17.58  )
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



On 1/19/2021 4:23 AM, Randy Dunlap wrote:
> On 1/18/21 1:56 AM, vjitta@codeaurora.org wrote:
>> From: Yogesh Lal <ylal@codeaurora.org>
>>
>> Use CONFIG_STACK_HASH_ORDER to configure STACK_HASH_SIZE.
>>
>> Aim is to have configurable value for  STACK_HASH_SIZE,
>> so depend on use case one can configure it.
>>
>> One example is of Page Owner, default value of
>> STACK_HASH_SIZE lead stack depot to consume 8MB of static memory.
>> Making it configurable and use lower value helps to enable features like
>> CONFIG_PAGE_OWNER without any significant overhead.
>>
>> Signed-off-by: Yogesh Lal <ylal@codeaurora.org>
>> Signed-off-by: Vinayak Menon <vinmenon@codeaurora.org>
>> Signed-off-by: Vijayanand Jitta <vjitta@codeaurora.org>
> 
> Hi,
> 
> Did you see
> https://lore.kernel.org/lkml/202101050729.cwTd47Yw-lkp@intel.com/
> 
> It seems that arch/arc/ does not have:
>    arc-elf-ld: lib/stackdepot.o: in function `filter_irq_stacks':
>    (.text+0x6): undefined reference to `__irqentry_text_start'
>>> arc-elf-ld: (.text+0x6): undefined reference to `__irqentry_text_start'
>>> arc-elf-ld: (.text+0x26): undefined reference to `__irqentry_text_end'
>>> arc-elf-ld: (.text+0x26): undefined reference to `__irqentry_text_end'
>>> arc-elf-ld: (.text+0x34): undefined reference to `__softirqentry_text_start'
>>> arc-elf-ld: (.text+0x34): undefined reference to `__softirqentry_text_start'
>>> arc-elf-ld: (.text+0x3c): undefined reference to `__softirqentry_text_end'
>>> arc-elf-ld: (.text+0x3c): undefined reference to `__softirqentry_text_end'
> 
> 
> 
> 

The above issue seems to be because of a different patch.
This one
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=505a0ef15f96c6c43ec719c9fc1833d98957bb39

I didn't really get why you referred that here.

Thanks,
Vijay
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a
member of Code Aurora Forum, hosted by The Linux Foundation

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
