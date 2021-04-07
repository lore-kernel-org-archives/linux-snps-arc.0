Return-Path: <SRS0=xZI/=JE=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BC41C433B4
	for <linux-snps-arc@archiver.kernel.org>; Wed,  7 Apr 2021 23:48:37 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A09161164
	for <linux-snps-arc@archiver.kernel.org>; Wed,  7 Apr 2021 23:48:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A09161164
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JYDobYXuc0zFW4g1o2wh93XMDe/9ENJdVm89Ze/F3fE=; b=P6xvLREBUFOlhG4oYMXPb5SJa
	D4x7yCfzZ3Lfa5vWqDBxvO7nqsal5z0XX1cUIxX08WbvwoPLNYA4IcV4DDZy2uRQr1t5upnKK2OO6
	ikRZ1oy48mJAGTjjeS7qbqASwR5x5dXAFM2ly+cX2/TKfy2e/QENIRpBqcqzOb1qu8o6CVYoqL0Yh
	CTK9iBV/MX3LaZSj2uf18qQ0KTlkiyboZjX4l4wJz5mKjFFyxX2VLamXn1B+cWFkwoMBK43maRSQe
	OjWAGheGk2b7obI600KDaLKM9o2KtGswvHyKeeWwgfIaAONYMFnZiPT8DyunzxmCHAn0IutP/bIAH
	AnSVzR9/A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUHuU-006Jse-Qp; Wed, 07 Apr 2021 23:48:35 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUHuR-006JsB-1N
 for linux-snps-arc@lists.infradead.org; Wed, 07 Apr 2021 23:48:32 +0000
Received: by mail-pl1-x631.google.com with SMTP id p10so103619pld.0
 for <linux-snps-arc@lists.infradead.org>; Wed, 07 Apr 2021 16:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=w73IJ0qTnRN9l8YKxnADHdhHDSfPQelOv7h1Qh01N/k=;
 b=K9HGmNHnSLrEESSLyIl1bV+cCcbXKXC7EUwdsk66wpsLzQX8z5NT7iPJ7ikO80XRfW
 sD9gpK8fXvfgAwvT0KrxsyfcKYqAquorNy42iP+GJXkpmKkOFI3zUiL8cyKWvVEtn6hs
 ACsNv21vSqWT7vvNi6v/00YPOHmfkJnhmGFzZn3UFlhTAkW2YZWNpvlC+KUwqiycwCVM
 BXVoSiC+WMMDspR2DonEygRdmjFzL+9co8wG3xUje2J3oshihYzVAABPth7pvaAHJDVD
 58YAKkeCoY4JBQqLB8soQ1BxKz4lvQIIgDW1uE/HWEthzpUEhHfL01fdNY0eCvTJ0AKY
 RczA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=w73IJ0qTnRN9l8YKxnADHdhHDSfPQelOv7h1Qh01N/k=;
 b=a98x2eNb2XSmFi4odE9ycn/htaeM8wy/iZkedcT/LqASrX+qufsA+CTx4nebmoRVND
 OSn+Ixy+zZwMW76Rk3NJyxQ9ZIj1jwZIrTnSl/IrXt2Ltc6u8bjCqHKFIsCb4tEw0ECs
 1rnY9ZU1QMsIiObFdKHb9o6++A80Xat1JV1y926ZTDx9kVFpHo1eYtvbrsSUSxju6Rll
 RgxGgla44AoDo/VOGkQv8rMgojT4y5qHuhdzzYsrE31yWlDcXn2dyZ+eZiT5VGle7yWe
 5eDH1q5e03cFBpvQ66m7Q212At8SWrGTz5zjrHsXcZCEJrScOxCOdgA1RLN2DvHnr/fO
 N9BA==
X-Gm-Message-State: AOAM533ZXlcKzJfzXI4Ue57VwtE9DL3nf1lZamr1HvHWtUMfDsDHZ1FW
 qW6GpCQRfgvWYTCVc60MvenN6Q==
X-Google-Smtp-Source: ABdhPJxXHeqO/FxEGrGS36tlerTOyNVIim+vP953mC+hgG8mSByDq3o2OKUI4lAp2aahUEHpoHFWJQ==
X-Received: by 2002:a17:90a:528b:: with SMTP id
 w11mr5600276pjh.162.1617839308791; 
 Wed, 07 Apr 2021 16:48:28 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id x19sm22452799pfc.152.2021.04.07.16.48.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Apr 2021 16:48:28 -0700 (PDT)
Subject: Re: [PATCH 22/27] arcv3: TCG instruction definitions
To: cupertinomiranda@gmail.com, qemu-devel@nongnu.org
Cc: shahab@synopsys.com, linux-snps-arc@lists.infradead.org,
 claziss@synopsys.com, cmiranda@synopsys.com
References: <20210405143138.17016-1-cupertinomiranda@gmail.com>
 <20210405143138.17016-23-cupertinomiranda@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4bd6ab16-072e-0700-5911-6493ba70668c@linaro.org>
Date: Wed, 7 Apr 2021 16:48:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210405143138.17016-23-cupertinomiranda@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210408_004831_142769_B06A4905 
X-CRM114-Status: UNSURE (   9.79  )
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
> From: Cupertino Miranda<cmiranda@synopsys.com>
> 
> ---
>   target/arc/semfunc-helper.c |    13 +
>   target/arc/semfunc-helper.h |    31 +
>   target/arc/semfunc-v3.c     | 14653 ++++++++++++++++++++++++++++++++++
>   target/arc/semfunc-v3.h     |    55 +
>   4 files changed, 14752 insertions(+)
>   create mode 100644 target/arc/semfunc-v3.c
>   create mode 100644 target/arc/semfunc-v3.h

And there's no good way to share code between v2 and v3?

r~

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
