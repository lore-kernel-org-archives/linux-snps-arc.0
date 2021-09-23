Return-Path: <SRS0=XnSr=ON=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79FB9C433F5
	for <linux-snps-arc@archiver.kernel.org>; Thu, 23 Sep 2021 15:29:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C34561038
	for <linux-snps-arc@archiver.kernel.org>; Thu, 23 Sep 2021 15:29:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2C34561038
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/GMiRVVaYX8ceTNg7vySov4gtlJcXxSKhs1Cic6rMlE=; b=dq0+kMJxk7bELw29njBQJAJbok
	lkTIK80bTQ3t68qdTEPtxEJq8W4T8ekGsr9mRIqWkvl6So+Rs8RGCQalCJFOmf0NGS03HdAb+b2nU
	Rhd+002kMkTZrOiq8dIKirbl875a2pUWbQ9VWKQmimUkoNMXvH0fYf4OLdczRRNTHSJBVdFMf/kNn
	UYpWzBYEOf/GETIJfRbcGBUa7IPzdor3YwP2baBeOM0zDbrzdhh5nNFZx2e9xGVTlEestuXXEVdPr
	RHwfXe9VRkhZ6ZdGyN+WbyxBgBhNsug+plinkOdnZ8QB/NIDfe5F+GcEfGqPHMxMSkFR6RDnX4hOP
	UkprOPFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTQeu-00C3Wu-MH; Thu, 23 Sep 2021 15:29:12 +0000
Received: from [2601:1c0:6280:3f0::aa0b]
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTQet-00C3Wc-7f; Thu, 23 Sep 2021 15:29:11 +0000
Subject: Re: [PATCH] clocksource: arc_timer: eliminate redefined macro error
To: Shahab Vahedi <Shahab.Vahedi@synopsys.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: Vineet Gupta <vgupta@kernel.org>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>
References: <20210923031808.5945-1-rdunlap@infradead.org>
 <61fef534-36df-2ed9-5662-ccebefef494e@synopsys.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <fab5a32c-f33f-d546-0c9e-3673f2160d66@infradead.org>
Date: Thu, 23 Sep 2021 08:29:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <61fef534-36df-2ed9-5662-ccebefef494e@synopsys.com>
Content-Language: en-US
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

On 9/23/21 2:42 AM, Shahab Vahedi wrote:
> Hi Randy,
> 
> I have one minor comment.
> 
> On 9/23/21 5:18 AM, Randy Dunlap wrote:
>>
>> --- linux-next-20210917.orig/include/soc/arc/timers.h
>> +++ linux-next-20210917/include/soc/arc/timers.h
>> @@ -17,7 +17,7 @@
>>   #define ARC_REG_TIMER1_CNT	0x100	/* timer 1 count */
>>   
>>   /* CTRL reg bits */
>> -#define TIMER_CTRL_IE	        (1 << 0) /* Interrupt when Count reaches limit */
>> +#define TIMER_CTRL_IEN	        (1 << 0) /* Interrupt when Count reaches limit */
> 
> Could you change the name to "ARC_TIMER_CTRL_IE" instead? and while at it, please rename
> "TIMER_CTRL_NH" to "ARC_TIMER_CTRL_NH" for obvious consistency reasons and saving us
> from future clashes.  Thank you!
> 

OK, no problem.

Thanks for the feedback.

-- 
~Randy

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
