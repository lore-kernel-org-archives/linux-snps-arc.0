Return-Path: <SRS0=xZI/=JE=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF6F5C433B4
	for <linux-snps-arc@archiver.kernel.org>; Wed,  7 Apr 2021 20:38:29 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 956C7611EE
	for <linux-snps-arc@archiver.kernel.org>; Wed,  7 Apr 2021 20:38:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 956C7611EE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=q/DpRFjgYNGFdk2G/kHXrVJ3JV6u/oQhLx+NnjOhjGg=; b=dLl0/AJd35JKYGFRhcvSfFeNK
	L6g9HPwwHmZVwAUUup/z2JnY+O/DFWk8GWhUJOmbYqY4WLu/Bd5cb4W+9nN+Zxp4TSVjbfva06ah/
	qpK8dlnz+EBK9uuxMwAob6aJC0R7f5GPd12JwL/7bHqh4bLmSgCSA/OuE5Rtc2H5ZQFdvDYiiC6Fc
	peksHYliCKXdi9ewghI+lyRwezI2O9DllBHAoLgwKYkm7NyMKRgfzXQUt0QS1TYrxQferPwpRcSBJ
	6AuAO/8LtUszWb9Aq+Au+UkZuPwnUuEmoKJoFAsb18PUYOp1chWlqQDj+FR2mLy5lv1Sw/GoSJM8P
	h8aDoHP+Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUEwW-005ykM-5y; Wed, 07 Apr 2021 20:38:28 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUEwT-005yjb-Dr
 for linux-snps-arc@lists.infradead.org; Wed, 07 Apr 2021 20:38:27 +0000
Received: by mail-pl1-x62c.google.com with SMTP id t7so239291plg.9
 for <linux-snps-arc@lists.infradead.org>; Wed, 07 Apr 2021 13:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=x9tjJztlwSObXYlc9WYD2kAR3Ixu8zPPT25ZRyHvJy8=;
 b=RNFkJqwxLHxNGC8VQ4ob6Ppvwx/vIs6W8O3bdG5kEATm//dun0AhPETb8RvnTHBrGi
 REnzb9LTTYFr+xv6EITsotstQ4Nr4l2hfqlwmq/M897kS7XTBBt81MSQBATvCPC2xYll
 i7hblmtNLNqJUwELgyGMCLt2PsiJQzvkmDl70Ax6fdwf5L/1c7bSyOo55saDD1zoNZjA
 hlZuVnFt5jQdKM0YccGNfIZ35PuJi82kzgKPpNBvGk9osKCT2Rxrtv2Ds9Z4EKMuIbG9
 uDwyjsdzoKHhSzUXU8KeRCfkS3codOYzE1keGdPhdENTejDidrRPeIzZeJtqXxGf+TUg
 aVow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=x9tjJztlwSObXYlc9WYD2kAR3Ixu8zPPT25ZRyHvJy8=;
 b=tJb88j5o2GEZL50gVLBPfQM95NWPhdWfmjeuLEmR5mTQ4NfU0sfaKYRU3ISpJ5ZMpe
 Do+5zECmxdQNE+exG11QN2Ym4aOGLEwpSJLnZi+oYqv3NnY8QLrStveFGi5m40eNvMAf
 lt75zTKNgUdd0GUj53mG4dHHFRfxQtuvHPCu9/MJAgQW5v21/0aOUCXfQJ3jn6F+3BNf
 NK4BrqucZAAJdrRq+pysDIdpy+xsYBHGp0Kxm05KImasgfLyslGpSAmN/ZnFeF9VYq+D
 MCtNqrvLNb4UmCBbt94S5P8d1BGjwDXhYcDzuFUc2gLrc2DSbvuVhteEf80FuNMyc+V9
 +yFg==
X-Gm-Message-State: AOAM532lNIKgWHkjOCAZAvifz5tDEXTfotopS9mN26nwZduhoMkKsUEU
 31Dgmse/rpnNGm4myRNu4hY7AQ==
X-Google-Smtp-Source: ABdhPJzj9MMgjLQlNkfrrrhAaSLG3AOxuIAIeC9+seTLSX150KMZZzI4CfhLNgM8ahaTRTGlaSHesA==
X-Received: by 2002:a17:90b:3846:: with SMTP id
 nl6mr4992247pjb.48.1617827903914; 
 Wed, 07 Apr 2021 13:38:23 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id h190sm5917955pfe.202.2021.04.07.13.38.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Apr 2021 13:38:23 -0700 (PDT)
Subject: Re: [PATCH 15/27] tests/tcg: ARC: Add TCG instruction definition tests
To: cupertinomiranda@gmail.com, qemu-devel@nongnu.org
Cc: shahab@synopsys.com, linux-snps-arc@lists.infradead.org,
 claziss@synopsys.com, cmiranda@synopsys.com
References: <20210405143138.17016-1-cupertinomiranda@gmail.com>
 <20210405143138.17016-16-cupertinomiranda@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5eba7288-ec55-e8d3-1fdd-83f1d1374b62@linaro.org>
Date: Wed, 7 Apr 2021 13:38:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210405143138.17016-16-cupertinomiranda@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210407_213825_587691_836E3062 
X-CRM114-Status: UNSURE (   9.44  )
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
> From: Claudiu Zissulescu <claziss@synopsys.com>
> 
> The added tests verify basic instructions execution as well
> as more advanced features such as zero overhead loops interrupt
> system, memory management unit and memory protection unit.
> 
> Signed-off-by: Claudiu Zissulescu <claziss@synopsys.com>
> Signed-off-by: Cupertino Miranda <cmiranda@synopsys.com>
> ---
>   tests/Makefile.include                |   1 +
>   tests/tcg/arc/Makefile                | 114 ++++
>   tests/tcg/arc/Makefile.softmmu-target |  43 ++
>   tests/tcg/arc/Makefile.target         | 101 ++++

You shoud *only* need Makefile.softmmu-target.

The bare Makefile is (or should be) unused.
The Makefile.target is for arc-linux-user,
which you do not build.


r~

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
