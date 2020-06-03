Return-Path: <SRS0=RjUh=7Q=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 072D8C433E0
	for <linux-snps-arc@archiver.kernel.org>; Wed,  3 Jun 2020 17:09:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CEC5320674
	for <linux-snps-arc@archiver.kernel.org>; Wed,  3 Jun 2020 17:09:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HxD8ww/j";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u+zjyPOx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CEC5320674
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DrZ1gfL2EqoABJpI5jvDr/4niei245QD3FfSU3hmMNM=; b=HxD8ww/j33KZi2
	BL8ZDJXdOtdbdK/pNmXGWjmiPnGEcl3djRCs6t0uRT41Io3b7HUi4sC4nKmIjq2v+F7VuAPcr/h5U
	3VfMfrhF+paNEcbfuxF2afWjUoVRq8iXt6vholXGuTsW0G2xJQ1YGE3yLSh8ODBV/9f2JDR/sLYG8
	20JXZMx9QOT6UeyzKX5ROlMBdV+ARQE70inSFRwcfXAJCVQS8J6ICHrHJzAELkocORwFdIyw4dud3
	/OK/UJug2BiPjSNYWMJBqfGJ04lTrhiSMSCxE21jxd2+YY695v0BBX0v7f3UliwD4F2achXexyr7O
	PFcdlxaqlT/5h/HuB+nw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jgWtW-0007Jc-W0; Wed, 03 Jun 2020 17:09:38 +0000
Received: from mail-qk1-x742.google.com ([2607:f8b0:4864:20::742])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jgWtU-0007Iz-LT
 for linux-snps-arc@lists.infradead.org; Wed, 03 Jun 2020 17:09:37 +0000
Received: by mail-qk1-x742.google.com with SMTP id g28so2946235qkl.0
 for <linux-snps-arc@lists.infradead.org>; Wed, 03 Jun 2020 10:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bnYt02XlhAOC4C2BcpBAPLvL1oraMnm/MOEK96nXxiU=;
 b=u+zjyPOxH0NPPP3W+GjlM/w7Ucn+9yWlxait9sF3ZOkhNB7s6105n+plImLZZhXie3
 uvnSvRnSKsw5Wj6ib451Z95dj3OwmqxH6n488ibHCap2gM77AD02bZzURYRiBmG5u4Lh
 UbKqXOmBgV2mpjJe74JjhgW/HS6fmRtAIlaTVua2Rp7Yy8eesMDPwXEgKudCaBnT0qNf
 Gjvw8uefyhcaDtd4x+oxKMjOK7YXNv5bQKBxUC1sjDQShb1mJt8mHyHiVnKXbwsfomgj
 nyWR2Pp1PkLAK7wutp7pKW79UXpPnU/qBOW+N98FgryhcNAxMI8o2pUKfox3Xodgqg7K
 12aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=bnYt02XlhAOC4C2BcpBAPLvL1oraMnm/MOEK96nXxiU=;
 b=mlxKDbCwi0lmv7mI4BBBhhsD6BvkWvMjihWgdrgizajZCtBM3VK25Xh0qFsfoxtppL
 kbnBKO2k+kdkQ2b0UJbmJTfCK3BqLz1x/lAINTRyVZS2jKcw7neR/JU6zssGRLq6W8El
 ETOgnwzuRJDSHxroB58a9XC9pcjyiLJfgkdfSaA7kuXrVXIdWP7BWp0FChmblC/t1X0o
 /cB16/+O3VcJwchyiAYWg97ASAtaS+QL0QWL6N9XLcymTtewzppTLHya4je3gajbO7G3
 PYSUAKBSgQF91gi9qgn9rpEjwFqFrxn09bBAXvCyZUdGPn2VwikUDHD+mIRuYi1Z28Oy
 VwHw==
X-Gm-Message-State: AOAM532WIWEOyzUy+xiBJNaLdiq0f06GB/13C+2UasgV7SYZ6EQ10Xxl
 GKMtCWxKXf+jxfkHT3U5hgH7Kg==
X-Google-Smtp-Source: ABdhPJxDidDmYKORpUpNnZ7xudGTsMByq8jd/B0KZVyUzHJtUXyFRPX93V27vcwaJKQffwPAvCfabQ==
X-Received: by 2002:a37:9bd7:: with SMTP id d206mr660009qke.113.1591204175576; 
 Wed, 03 Jun 2020 10:09:35 -0700 (PDT)
Received: from [192.168.1.4] ([177.194.48.209])
 by smtp.googlemail.com with ESMTPSA id i94sm2437420qtd.2.2020.06.03.10.09.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jun 2020 10:09:35 -0700 (PDT)
Subject: Re: [PATCH v3 1/4] iee754: provide gcc builtins based generic sqrt
 functions
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 Andreas Schwab <schwab@linux-m68k.org>
References: <20200602213220.6201-1-vgupta@synopsys.com>
 <20200602213220.6201-2-vgupta@synopsys.com> <87k10o4jvb.fsf@igel.home>
 <2729cfdf-1f8a-e2d1-e36e-b833a7c15d0b@synopsys.com>
From: Adhemerval Zanella <adhemerval.zanella@linaro.org>
Autocrypt: addr=adhemerval.zanella@linaro.org; prefer-encrypt=mutual; keydata=
 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
Message-ID: <69813bfb-a62b-5801-91eb-f1652dc8ea92@linaro.org>
Date: Wed, 3 Jun 2020 14:09:32 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <2729cfdf-1f8a-e2d1-e36e-b833a7c15d0b@synopsys.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200603_100936_710371_2614CBD3 
X-CRM114-Status: UNSURE (   8.69  )
X-CRM114-Notice: Please train this message.
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
Cc: "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "libc-alpha @ sourceware . org" <libc-alpha@sourceware.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org



On 03/06/2020 14:06, Vineet Gupta via Libc-alpha wrote:
> On 6/3/20 1:46 AM, Andreas Schwab wrote:
>> s/iee754/ieee754/
> 
> Fixed. Thx
> 

I think this patchset is ok, there is no need to send a v4. Do you 
need someone to push it upstream for you?

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
