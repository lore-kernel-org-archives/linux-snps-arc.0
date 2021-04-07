Return-Path: <SRS0=xZI/=JE=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A9BEC433B4
	for <linux-snps-arc@archiver.kernel.org>; Wed,  7 Apr 2021 17:14:39 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B1C66121E
	for <linux-snps-arc@archiver.kernel.org>; Wed,  7 Apr 2021 17:14:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B1C66121E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3EfnD6RHSC6+T95Fdec4l/aM23iu0GCxli5+IcU5I+o=; b=C+ni6POiQB6LJ5+3RdERKrNct
	Xp1YBKaTpr4tnlrOldtKBsCU+ENUaBgMovHTvVgH1x4EwPCZ3f4V8mkJKnvZrnvu8sFwnAXKAaASI
	GylVWl9GdXolSCaiYdus260HIqglRsXrkRMTi6L+SJEsC5AXQgninxKj3BxPuyHbUzt7B2JwZaNvh
	UesVDxJaQa6mEiSysJBedkTIrqmmJcl4ZCtXkiWr+H6Hcf8KRSTRuFFmcvmhs9e2mSvsXaY7YGoPG
	f5Wm8veOWNa3W2x2Wfpf5NT9ZfSKyStyWPdEOto05DHLRuWxiVi1yMwEc4xZxXs6Oj7qN5PhXYxgl
	vPFSdFLUw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUBlF-005c0Z-NX; Wed, 07 Apr 2021 17:14:37 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUBlC-005c00-BO
 for linux-snps-arc@lists.infradead.org; Wed, 07 Apr 2021 17:14:36 +0000
Received: by mail-pf1-x433.google.com with SMTP id n38so3699577pfv.2
 for <linux-snps-arc@lists.infradead.org>; Wed, 07 Apr 2021 10:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=23Z4NJ9FVmwchvQmdf+rbF+jNGUBtqi/A78EWm1O7vk=;
 b=UwoZENeQEb4tCcolqpnrVUWPRT4HOAe333/9g/PlQ8AubWzWXUwKDEBoiZzcUoCvjz
 pnqOkLH17MkfbB/zZj4QMCRn0XwrGkuenJHUIRlTiCTMlO1s+vSCBGR1HysRyvmC7WCw
 AuraQXm2CspakQfUDMMNxmmCssgUfDO4sI3xwyiUiHxmuOhse/0x3qhKepZAJx6aCr94
 ndtL5cT7osJZX9QyfCgpwWaEegLV11REnsrHT8IEzu78WVq3IQgy5K1Q0O6IdG7mNUla
 z4SQuM6IMBurBIPCkLR/h49WwJK6S1efnX0CQSjgDe9EFf5oVnF7ZG8n4quUsR/SD3w6
 YJDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=23Z4NJ9FVmwchvQmdf+rbF+jNGUBtqi/A78EWm1O7vk=;
 b=cKsHC0SjXKJyZKfnFprFql8Ek3M9pLDrawIG0lbNp+bY2zEB1lRGoRPBrtT6zKZvJl
 xaYU0uEND63WqEVnygFzoauDzk7fK3Z/vhvDjeltFlPAx14RSoY6p/koyDUj0Xafy8ob
 FOs/0Zz2MRcU7vjM2GjhzyDsM0WN3xhUiQdr0byosVvIFqOti1gzSYz7iCkiZsfURnJa
 YIsFL6kIeYnFbSoK4Oz/YOOOMX4wwpxqdmlM1IRZ97OWeS52rWBSWgfQeKObPiTZed6Y
 SZToGS9EUaDqvWQtoz8k3sQ8stllq58dGc2pnkYQ+8pE/1Iel8ss2JarsojZ7i/bSwnI
 BJxA==
X-Gm-Message-State: AOAM533pIZQzKE03/NXnHjZ2SUICOKQfWYknocxv+1akh1ZWyse0BV+T
 pjJAc4qAGqHH4VyAP8P3VjcNCQ==
X-Google-Smtp-Source: ABdhPJzIO0hxVIYKibcYuD1yqbICIndxgjIZAUbM1Y3JkVR1i+Htyhl3vgPVsOfxT7acGXkQg2xPBw==
X-Received: by 2002:a05:6a00:138e:b029:204:422e:a87e with SMTP id
 t14-20020a056a00138eb0290204422ea87emr3753883pfg.24.1617815673001; 
 Wed, 07 Apr 2021 10:14:33 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id g10sm21309579pfh.212.2021.04.07.10.14.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Apr 2021 10:14:32 -0700 (PDT)
Subject: Re: [PATCH 06/27] arc: semfunc.c tcg code generator.
To: cupertinomiranda@gmail.com, qemu-devel@nongnu.org
Cc: shahab@synopsys.com, linux-snps-arc@lists.infradead.org,
 claziss@synopsys.com, cmiranda@synopsys.com
References: <20210405143138.17016-1-cupertinomiranda@gmail.com>
 <20210405143138.17016-7-cupertinomiranda@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2d3c797b-74a5-d464-fbbd-5819c88d828d@linaro.org>
Date: Wed, 7 Apr 2021 10:14:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210405143138.17016-7-cupertinomiranda@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210407_181434_466097_39E72D0F 
X-CRM114-Status: UNSURE (   8.97  )
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
> TCG generator scripts for semfunc.c file.
> 
> Signed-off-by: Cupertino Miranda<cmiranda@synopsys.com>
> ---

My only comment here is: do we really want to re-write semfunc.c, as opposed to 
read one input file and output another?  I presume that the original comments 
come from some canonical source at Synopsys?

I don't know ruby at all, and don't really know how to evaluate the rest.


r~

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
