Return-Path: <SRS0=Lg4d=GK=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94224C433DB
	for <linux-snps-arc@archiver.kernel.org>; Thu,  7 Jan 2021 02:13:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 03EF022D01
	for <linux-snps-arc@archiver.kernel.org>; Thu,  7 Jan 2021 02:13:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 03EF022D01
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dqZREvp7rLL2cm1xmn5bVjJ9Y7jgZcTBahQhr4ahvOM=; b=XVQw13QF50jRtO0jEI9O8hhAn
	yM/0Z+8LA44y0ovsA+a+KpesBn26FoQ+B6DOfEDwqi8iUnslCB20/2r4G4HJJVesMG/efo9s6ekXk
	NzLnu2wW/4JZ83T+fNdOieY5Uf8G1VGNTF/atYxW//6u7+qDuFnhKsTGDDuFOxzPFwIGwAfU55Opl
	+c0huRGNOF0G+NL0pd5s1XOzdETAol39UJ5TsdjWq24q4Ng/q1yQdO8qCnjU6N4cykBQh1UQ3kMzU
	7c3wiGOshpZIx9A29o1dd7yGpACDZF3jzJPHuDsuWy4zk0WLnmr7PAXrkc1fFMMioL4dnyb2oYloR
	ZEIjSSTRg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxKnZ-0006Bj-Kl; Thu, 07 Jan 2021 02:13:13 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxKnX-0006BF-7h
 for linux-snps-arc@lists.infradead.org; Thu, 07 Jan 2021 02:13:12 +0000
Received: by mail-pj1-x1033.google.com with SMTP id z12so551451pjn.1
 for <linux-snps-arc@lists.infradead.org>; Wed, 06 Jan 2021 18:13:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4DKo8j9zd5HVNAsTP7vh/Z4vfechORbzWS0lt8jxtJM=;
 b=tTDlZ77eDD4Ql/QwKncvUibBxgVcOuFziriMe9Fu65c510MzufDAApkBRkCmZ7T+Se
 VV3oxhpiEgucluyXCRBDJaE5oj1FcUpODpL+NA1qaaY37kG4PcmraT4JFsGmwEIlBWqE
 jJuV/6mznWuhakFXhnQARwKuVOM3nxHTk1HDTOUtBwKDoMpDLD+kPGSVSNVSb3QxEga4
 RJz5ESH4T9I+Engo3JZGr9OZekVnnScSXFZsDCoJgVtbBhmC9T/TrR2xOJ4v/Ts4/VKo
 UhDcGJVHZPgA5auCP828wZrJIVLn4MF1Mdrqlejq3Q/3suVIDSYpePHFDyLmn9pM5bWq
 XGcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4DKo8j9zd5HVNAsTP7vh/Z4vfechORbzWS0lt8jxtJM=;
 b=WnRmPGUBynNSRUeB1Sn9ptWBxOw9qSmeZYmQiVUtjdg6aWT/vJr65qMJ4V1CVZhka1
 FTV8IwQRFFbJ/n4hav6PB7KnTox90tWj/zpdxBz4LYWtJu8OmIf5Ub9jeWZsnrwjbDmp
 YnSNjEyw2jCs7xunoE0sqvUWUFMZfmug/nL0T8OYJXzyaoSt2ayzuDvXrIum4UO1lkJK
 qAbP9f2zgQ+D/TDx2emA4uVq/Bu4foHUy6F/I6dAqYFOiAQ/IzqhShs7HqxeHexipHSA
 TJqHUvXGkN1zYM1O1ovdzzekvMHf5K7y18CDpI8UI20qpxBZA/qjcqbfRPXp4YjLMtWh
 +xdA==
X-Gm-Message-State: AOAM532q8zUTYg7GWSgJuATiqbER0LY0EXCOGKe6jt7JhGiPDVDznTk6
 52AI+/lSHgay9KYzGajiO36TvQ==
X-Google-Smtp-Source: ABdhPJyi55P4FaLeiehm3exv0s4ICVbVwfXQPiURe81s9bmktcmOCslfJ8xFNhl81y5fubuYq+TL4g==
X-Received: by 2002:a17:90a:fa18:: with SMTP id
 cm24mr6977671pjb.220.1609985585530; 
 Wed, 06 Jan 2021 18:13:05 -0800 (PST)
Received: from [192.168.1.134] ([66.219.217.173])
 by smtp.gmail.com with ESMTPSA id z23sm4129540pfj.143.2021.01.06.18.13.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Jan 2021 18:13:04 -0800 (PST)
Subject: Re: [PATCH] ARC: unbork 5.11 bootup: fix snafu in _TIF_NOTIFY_SIGNAL
 handling
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 linux-snps-arc@lists.infradead.org
References: <20210107001225.3063163-1-vgupta@synopsys.com>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <0c62fbca-87e1-f53a-26e1-35244e2e6f48@kernel.dk>
Date: Wed, 6 Jan 2021 19:13:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210107001225.3063163-1-vgupta@synopsys.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210106_211311_432182_E1D2D450 
X-CRM114-Status: GOOD (  11.24  )
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
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 1/6/21 5:12 PM, Vineet Gupta wrote:
> Linux 5.11.rcX was failing to boot on ARC HSDK board. Turns out we have
> a couple of issues, this being the first one, and I'm to blame as I
> didn't pay attention during review.
> 
> TIF_NOTIFY_SIGNAL support requires checking multiple TIF_* bits in
> kernel return code path. Old code only needed to check a single bit so
> BBIT0 <TIF_SIGPENDING> worked. New code needs to check multiple bits so
> AND <bit-mask> instruction. So needs to use bit mask variant _TIF_SIGPENDING

Sorry about that, my arc asm isn't that strong :-)
Thanks for fixing it.

-- 
Jens Axboe


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
