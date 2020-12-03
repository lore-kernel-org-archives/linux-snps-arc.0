Return-Path: <SRS0=5ghb=FH=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2F26C4361A
	for <linux-snps-arc@archiver.kernel.org>; Thu,  3 Dec 2020 19:34:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33DDA221EC
	for <linux-snps-arc@archiver.kernel.org>; Thu,  3 Dec 2020 19:34:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 33DDA221EC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mP0Ofc2YcbeuHzlmvZaQf7Sc7aOuJM8ZDPEvZ/kCykk=; b=BFW1H7C/1eCvhEhd2iIavXjow
	vdzC7up98U/0Y266E/pFnrYz+CB76EaSKiGOS7HiIEov6jXz3yAVdma9eWXqu6BGqmH5aL2Ebay/b
	yNAhFzJ9Otq4YgjRFKHaXvfDjq2yz6NLtb8zG9QoOtaaPM9aZ2awqCHITu3lUVI14w9iLqBPcX1wP
	ZGitSFJ5JrVFtATxZU6AtZ8cAfww/K+YFsf50mzINU0OIMl6Mm9UoN3xOF/RRIKL1UxZDXUmzd7x2
	oZsmtlbO/xpoca6a+fJo7vNue+/z7dLIHpt+Is9TG4cW6TIv/V/sUJi9VOj9E1uygYG9bmj08V6EY
	0FoNeHVkA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkuNN-0002Fq-Sx; Thu, 03 Dec 2020 19:34:49 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkuNL-0002FV-6j
 for linux-snps-arc@lists.infradead.org; Thu, 03 Dec 2020 19:34:48 +0000
Received: by mail-ot1-x336.google.com with SMTP id z24so2890563oto.6
 for <linux-snps-arc@lists.infradead.org>; Thu, 03 Dec 2020 11:34:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BZCs6GgM65GWKYoKneNIjlM8hhwrNhohlnoB0m0cHo4=;
 b=AttH0cUYUC/z9Z/5DQO7uGNxPVcJ4GP1+qI2BxVKWqs7wnbhSFyrgxaRX78vCXCKam
 p/suUWVxSgqOSJkyrwFGi1GSKkpkU05JsUxbBU7uwP9+tzqircz7dstx8/9S3BBV0o8E
 l5+tnu/mdwJnza7r/tLrYChB4BVLFb9tSxvjjuxVnpeLch00m62vt9UwfulqhG+QhKF3
 qe+Iqjig1A0W4CKJpS5Fql9oGkyfiW6AM8VjADrjQIMHwfrI6cvdVciyItTFmz0EEB/X
 RUpf5pwLpCN0NRvNPsjKlxeR5DCI+jtCCImhmw3Y7bvmP8rFZzGXdxTRF/+edk2I71QE
 9fOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BZCs6GgM65GWKYoKneNIjlM8hhwrNhohlnoB0m0cHo4=;
 b=a4s5tOkXxniJOpHJi1dWR34fI1/6Q0Xj1URfMGH5AiaTc/5sqUtfMlZ81VRaoPVbRs
 nU19kmkKRJ/MzCncDqy8GHSJ9vC0sWULA2JnFqM7C0du3/YESAkO771EDQbB4jgoKVBL
 xA85ngj2LbcP9zMWyq+3QlNmnIFq+nVk8OYwy9MkBefTVWZHJs+vckkH2EMVbs7L7+yI
 hn+GBbAlVGy2+ipAgfTQBtdCLLmDbcHcSc9roWwmyXsBEWtu2Zph9ZyDLCSR3wI9MNhh
 6Mi+E9UzxBJDSsRzWY15pwwSqNR/pXW2PMvJXD2WLQk/axtS2/PVoxeCypKMW0x8pFon
 o3Qw==
X-Gm-Message-State: AOAM532wTlra5jWwCIOuTIJEZxrpV2ClSOI8KE89jazsy5OgICtlJVYm
 EGcCD2M6PYCqnYAWu9d/T41rYUPUGCwxaqWJ
X-Google-Smtp-Source: ABdhPJxakpeUG7JBrebXN5jWL9LGQ7sCKfU38gOhLOJpgSB0p1m9GfAMR5Gpo37u/CG9TZQT0V0ZrQ==
X-Received: by 2002:a05:6830:609:: with SMTP id
 w9mr614867oti.263.1607024084397; 
 Thu, 03 Dec 2020 11:34:44 -0800 (PST)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id u63sm62001oia.50.2020.12.03.11.34.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Dec 2020 11:34:43 -0800 (PST)
Subject: Re: [PATCH 06/15] arc: TCG instruction definitions
To: Cupertino Miranda <cupertinomiranda@gmail.com>
References: <20201111161758.9636-1-cupertinomiranda@gmail.com>
 <20201111161758.9636-7-cupertinomiranda@gmail.com>
 <74cfc5bd-d02c-768b-37e4-18ff8c88656b@linaro.org>
 <CAHW_PjKs5LDkrFkqSGEKgw4sL3tuyc3-n6Uo4xYfHa8=376_Ew@mail.gmail.com>
 <1dbd9a59-8e6a-ee80-f7ae-a2990a059b21@linaro.org>
 <CAHW_Pj+0Ex_PWhUzv_Fkcp2B5yOcD=p31Lu2xH+Xp9M6mAf4Vw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <836f6aed-8f2a-cecc-d796-be7286333160@linaro.org>
Date: Thu, 3 Dec 2020 13:34:40 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAHW_Pj+0Ex_PWhUzv_Fkcp2B5yOcD=p31Lu2xH+Xp9M6mAf4Vw@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201203_143447_288199_E8AA0C54 
X-CRM114-Status: GOOD (  18.25  )
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
Cc: Claudiu Zissulescu <claziss@gmail.com>, qemu-devel@nongnu.org,
 Shahab Vahedi <shahab.vahedi@gmail.com>, Shahab Vahedi <shahab@synopsys.com>,
 Cupertino Miranda <cmiranda@synopsys.com>, linux-snps-arc@lists.infradead.org,
 Claudiu Zissulescu <claziss@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 12/3/20 10:54 AM, Cupertino Miranda wrote:
> Our generation tool has different levels of verbosity, expressing
> instruction semantics from a pattern level up to what it is shown in
> <semfunc.c> as comments, which is later converted to TCG format.
> For QEMU purposes I would say that input format should be what is
> shown as comments in <semfunc.c> file.

That seems reasonable.

> Also, as is, the generator is done in Ruby, and to be honest, would
> not be very easy to redo in some other language. Would this be
> considered a problem if we would include it as Ruby code ?
> IMO execution of these scripts should not be a step of build process
> but rather a development one, such that Ruby does not become a
> requirement to build QEmu.

It's not ideal -- I would have preferred python or C -- but I won't object.

At minimum, I would expect build system changes that detects ruby support in
the system, and a manual build rule that rebuilds the generated files.  This
build + check-in process would want documenting in target/arc/README or
something.  If there are any ruby packages required apart from the base
language, this should be documented as well (I know nothing about ruby myself,
just guessing based on what happens with python and perl).

Even better would be build system changes that, if ruby is installed runs the
generator, and only fall-back to the checked-in files if ruby is missing.

In this way, anyone who wants to modify the code generator would merely have to
install the ruby packages on their system, but they would not be required for a
non-ARC developer to build.


r~

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
