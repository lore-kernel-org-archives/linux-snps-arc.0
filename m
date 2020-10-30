Return-Path: <SRS0=eli2=EF=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C53AC00A89
	for <linux-snps-arc@archiver.kernel.org>; Fri, 30 Oct 2020 20:36:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E7EC20791
	for <linux-snps-arc@archiver.kernel.org>; Fri, 30 Oct 2020 20:36:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2ZT8smgV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel-dk.20150623.gappssmtp.com header.i=@kernel-dk.20150623.gappssmtp.com header.b="Jon71kR7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E7EC20791
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Gtk6Or0utCPx6hr1Mfoqpq470g0K4yxPOH7vgXhcT/o=; b=2ZT8smgVYkhno9Vn7UE2ee3Ks
	gKCP6LPvQlkoprtQNP0TWLCCdwH9Qq5uzKUsUPo6pc+Hd1IiF3Z0PtS3BpWpC5PE0lYPVgpNJ9d+f
	QKLxXlTU380AsQQKha0DAWz9BhDl//ydtZDXiOjHwuVEyswHjSrXMiPMEDNh90wpz9wSfll1tneFh
	cA0tyQMPkSyXtPHLNtbGoUien8L8M7/QVMUUOjQ4dcO/WwM1Nk6ACYkUFKa3JrKuFsJQi180oaPf5
	Toj44ZkYZOzQeo6gAet90gEvF+WS0NoQGkF2IAbJB52NwEucLWtDQ9nh0PHSMtRA5qEHY36XGomVN
	Pi5+ROhUg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYb87-00034y-8j; Fri, 30 Oct 2020 20:36:11 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYb83-00033Q-Gw
 for linux-snps-arc@lists.infradead.org; Fri, 30 Oct 2020 20:36:09 +0000
Received: by mail-pf1-x441.google.com with SMTP id w21so6304481pfc.7
 for <linux-snps-arc@lists.infradead.org>; Fri, 30 Oct 2020 13:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CuRbxzDu1XDfx5yN2GvsDOIU4u128uCEzLs7t63aMYQ=;
 b=Jon71kR7/DdyiHTml27SRzpChPyiVZVNcooGCTZNITVgVaQ+eMcHZRmxWYV+WBmpNB
 AaEGy+c3dWb/NTTAS63wkKSHngdWzKBqikpEkBi/JDsPjkkXeqyFjbAyPmWR37BaTRxJ
 074nBN79Yv3SkEhGGX5mC46fBjs6CYO/5oWYGWxQ4czpYgPyjZudtNmDwjxklZvAevDw
 j93Msn9qv8z359SuSJFEIfEiuhBkg9GfFS6Iphdpbj0azas/2nsuOz85tLUiL0/jOheu
 81BApS0X4Fbl1Yry2eGctlKnvYfr+kI/FLxBJFxXnhDrNx+FgT973DgssNo6mI9BOTpy
 2dzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CuRbxzDu1XDfx5yN2GvsDOIU4u128uCEzLs7t63aMYQ=;
 b=oW30jWdkUv2bQePb1P2Xp7g29K+3mzz8yDfV0q7Z+62jUffsFhiXGjNgaCRf8zgrwE
 KueZeuuKu23uE6eprofV+2KaMDGFqyjBXt7/DAme4ipAuRegLBCBKwE1nh0pFZo1RHu3
 mfqKNrzYo8wVQ/u24T8Q8Mz/ojElMSEpQt8wzJx34lgyTWIH9N7PeZRRXRbRA6Yynn+4
 USuViK1aZQWBUgwFsIQjZvbaqQVzCGde++8jX0WWm5TOIOeA4cDL6xivaTLeKfSB7LMk
 RXAadNLAdzDkyamyXZrQaR86rEUZ1+6y2hKnGvSNiQWcIpfZXnX3SxlxlrPYaFdx7Joq
 nkRw==
X-Gm-Message-State: AOAM532cdjkEW1FIXs1BKKYEKru7x6gxsNfXtQVAaTCppjEJlC2VV+Aw
 KF6Mq3gRnN8Ix53sRK/C2a8zCeRJGxJ4iw==
X-Google-Smtp-Source: ABdhPJwYxy7zJkLjEmNnrlWlDYOal78VkBMnMU0u9/FrqXzCgPSbCbKAMTFM/gLtVJ8FFm0WYe6cBw==
X-Received: by 2002:a63:30d:: with SMTP id 13mr3324733pgd.301.1604090165315;
 Fri, 30 Oct 2020 13:36:05 -0700 (PDT)
Received: from [192.168.1.134] ([66.219.217.173])
 by smtp.gmail.com with ESMTPSA id q23sm6744147pfg.192.2020.10.30.13.36.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Oct 2020 13:36:04 -0700 (PDT)
Subject: Re: [PATCH] arc: add support for TIF_NOTIFY_SIGNAL
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
References: <6b89e805-c645-e738-794f-05ba6be68d60@kernel.dk>
 <faa0272e-9719-8fd4-323c-b32fd4c9ccb6@synopsys.com>
 <5d59c0f2-3a5e-478a-e0e4-4f487a4718a6@kernel.dk>
 <f1a8b2c9-3a72-75c6-f504-18723689fabd@synopsys.com>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <fabeac37-f6a0-34e0-a521-4124f17f2008@kernel.dk>
Date: Fri, 30 Oct 2020 14:36:02 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <f1a8b2c9-3a72-75c6-f504-18723689fabd@synopsys.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201030_163607_608986_4F33B067 
X-CRM114-Status: GOOD (  15.84  )
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
Cc: open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 10/30/20 2:08 PM, Vineet Gupta wrote:
> On 10/30/20 11:53 AM, Jens Axboe wrote:
>>
>> Ah thanks, I'll make that change. Hard for me to test a lot of these, so
>> I really appreciate someone knowledgable taking a look at it.
> 
> Sure, glad to help, thx to you for writing the arch patches in first 
> place. It takes a bit of daring to venture in unchartered waters ;-)

Nice to do something different for a change! And another motivation is
that I can't drop some old dead code before all archs support
TIF_NOTIFY_SIGNAL.

> These days it is super easy to get your hands on a ARC cross toolchain. 
> We don't have them shipping as regular distro packages just yet, but you 
> can download a prebuilt @
> https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/download/arc-2020.09-release/arc_gnu_2020.09_prebuilt_glibc_le_archs_linux_install.tar.gz
> 
> Or you can just build upstream gcc + binutils for ARC if you so prefer.

Thanks, that's very helpful. Unfortunately my distro didn't have
gcc+binutils packaged for arc, like it did for a lot of the other
targets.

>> commit 3c6239647d95d03d1436bc826a004791c3f04617
>> Author: Jens Axboe <axboe@kernel.dk>
>> Date:   Mon Oct 12 07:15:37 2020 -0600
>>
>>      arc: add support for TIF_NOTIFY_SIGNAL
>>      
>>      Wire up TIF_NOTIFY_SIGNAL handling for arc.
>>      
>>      Cc: linux-snps-arc@lists.infradead.org
>>      Signed-off-by: Jens Axboe <axboe@kernel.dk>
> 
> Acked-by: Vineet Gupta <vgupta@synopsys.com>

Added, thanks!

-- 
Jens Axboe


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
