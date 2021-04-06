Return-Path: <SRS0=Qs2K=JD=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 737B5C433B4
	for <linux-snps-arc@archiver.kernel.org>; Tue,  6 Apr 2021 23:48:10 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CEF061380
	for <linux-snps-arc@archiver.kernel.org>; Tue,  6 Apr 2021 23:48:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1CEF061380
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eV0koQvsEThmguriXc3+jzfJPx46qFYVO7spR9HMXmA=; b=OMbOQZyeCXBqCvEfJs9IGuLms
	BgvNVxrcjFvWxis5AHDUtZQI4/0aYjQXvnDX0gl02V1dpOcRwYka4IwagmsFthFDiXVDr1AB7HlxN
	g7zqXryWAfSXMvYeYavBaNSQGmP5j3NkM7AQYK7ZALL5vpQ6OhSpT+dzhmTn78/Bvq7eLcx0FKCkl
	ElOOuXdWiYuWNNbzPHTXJ7NFTvhL6r8+phyLiWOJMC1lvZYt8tVVBNfKNntaqsVjfsledVR971iV7
	meIU5CIW5F08DY61nVn9kkoJQ9riFnwN5Y4zXSUPxcvJ+O9RaUVglpn09JTi/IqUKT7ibQNkWu7ap
	9Ag7nR+dg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTvQW-003duZ-Go; Tue, 06 Apr 2021 23:48:08 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTvQR-003dtk-Lp
 for linux-snps-arc@lists.infradead.org; Tue, 06 Apr 2021 23:48:06 +0000
Received: by mail-pj1-x102a.google.com with SMTP id s21so8821582pjq.1
 for <linux-snps-arc@lists.infradead.org>; Tue, 06 Apr 2021 16:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zV9HKJ+BKLMXg4qY1LrUGvdLvEPdBkNpH9AsmcDgn24=;
 b=RnC2RnY8EtH02OURrDdx23c5Zn/K6dRA4fSV7fU+sO8Txi6Omz706zTprkpFMig2T6
 Dl69EMKVr1o4I8EqtAyYzTWIx5m2yqq/DljOFCSKAAHAXYYSMDnpWJluwAmhlRI9Oybj
 MsflbhyNmu++ZL3m58wqHqyNqeKKDzTzUN+k3ujgvRwJQnC9lDcvs+Rx2nVdP8lTSSG2
 gW9+SX+dO19dxBNIaPCWsZdQOJfJLpRTXtjyWcCnMIPAnK8rPfqLCJXGOKFULpGrfdUv
 EvO68FTQ0lqE4skbCfPm+lA9dwU0dIHjTua0w3zHuMQfBAtGcZrQiR3PilSuxbY4x+qA
 lZwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zV9HKJ+BKLMXg4qY1LrUGvdLvEPdBkNpH9AsmcDgn24=;
 b=KfprY/XL1mtMEKWoiGDKoUGk65g1wFmhvr3qcUcDeMNsyEtl7j/X5eEhTD4ulmIUqH
 iVq1Fw5kcr2KfcgSD1w/K6Fm0xG5CfZm5SRf4Sdn0hFQ/q037NphuSLuVnrOckiUyl0J
 S4u5YRI8jXq97OKv8jLbeeY2UB3/33B4zJ6mhGobcKfxAl17aHWqh+WnrYa0mrIZ/z7B
 jV+kUCSIqxdbjeHrZRDLgOExEPbgmQ2BEXibbAA2dLKLPS1GxDksr3cuLgbaVtVsQEeL
 XurqSRo4zUQK7qeIcziTet8ILHCFIuZuuxEZgkod2bAqADTAd3RReC6GdqfHj+Qwk0WZ
 dFqg==
X-Gm-Message-State: AOAM532GJXykub3JhcLTT3XzVJPekJnPy60XovPTpEzAcjlPWiNqiQRd
 iRs/9q0LJ/EY5GvNId2mX8roXg==
X-Google-Smtp-Source: ABdhPJw7hRGmh6gECTYY2tNhi0QKQ8MwsBkCtAXxmfHcVx932B8979eIAodSh3hyQfzmwKBi4AlK6w==
X-Received: by 2002:a17:902:446:b029:e8:c376:6651 with SMTP id
 64-20020a1709020446b02900e8c3766651mr622835ple.72.1617752881531; 
 Tue, 06 Apr 2021 16:48:01 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id q10sm19418027pfc.190.2021.04.06.16.48.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Apr 2021 16:48:01 -0700 (PDT)
Subject: Re: *** ARC port for review ***
To: cupertinomiranda@gmail.com, qemu-devel@nongnu.org
Cc: shahab@synopsys.com, linux-snps-arc@lists.infradead.org,
 claziss@synopsys.com, cmiranda@synopsys.com
References: <20210405143138.17016-1-cupertinomiranda@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6af34171-223e-55d8-d908-55dab5e63abe@linaro.org>
Date: Tue, 6 Apr 2021 16:47:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210405143138.17016-1-cupertinomiranda@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210407_004803_979932_FDA4697B 
X-CRM114-Status: UNSURE (   9.69  )
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

On 4/5/21 7:31 AM, cupertinomiranda@gmail.com wrote:
> In order to simplify the review process, we have separated the patches
> for ARCv3 from the previous emailed ARCv2 ones. Being the patches from
> 1 to 16 for ARCv2 and 17 to 27 for ARCv3.

How may one find the arcv3 documentation on the synopsis website?

The closest I can find is

   https://www.synopsys.com/designware-ip/processor-solutions.html

which best I can figure leads to a paywall.


r~

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
