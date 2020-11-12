Return-Path: <SRS0=0uDb=ES=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6458C2D0A3
	for <linux-snps-arc@archiver.kernel.org>; Thu, 12 Nov 2020 09:49:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E7DC221FC
	for <linux-snps-arc@archiver.kernel.org>; Thu, 12 Nov 2020 09:49:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eiMXIcju";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nCaiXL2p"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E7DC221FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qQhZ/xAvRipZHkCz3d/fqx/PR7Z9VmeXd/6GuWG8Y5g=; b=eiMXIcjuRC9JWDl9n1BjIxXOC
	DoIUYLZvg/9eiqWwNS/ZufxlpVBZhbX241OJNcMwl/GWXqwQL0DmNjUMU3216kHqAa6wK2wWVKikm
	uT1WzMxKSldHWHRhRloAFsLxsElk7EiPYtWmsMBA59m+RQ7Pt4n0olbWXslZHnTR4DweXwNsPIypV
	HBCl9D8wgWnuhX98h0eoZn28U0iAEG416cgTl73MQRDrfF3PN5s8wz9+fjt1/vMpcLaxU0SaBMzme
	Lc8y1qjihEnjGUFEKA915eD/lBCsc25UxPfUZWVl2CA7G/dSSzhXmn+th/qVBheBPlHufpVODIAOu
	i4OFrHzdQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kd9ED-0006v2-Av; Thu, 12 Nov 2020 09:49:17 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kd9EA-0006to-Uo
 for linux-snps-arc@lists.infradead.org; Thu, 12 Nov 2020 09:49:15 +0000
Received: by mail-wr1-x441.google.com with SMTP id r17so5322185wrw.1
 for <linux-snps-arc@lists.infradead.org>; Thu, 12 Nov 2020 01:49:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=a5+NFcDyPVwL4iDr+PAgUKJYb6rVA8T1U3x0Y4iCU9k=;
 b=nCaiXL2psPM+FnJMd+r6pB5nz7nVij0ktda8iIthyPuh27My6jq6bK55KBD2IBAUCx
 EECNaxhegOFYeP/1/TQKaQewftt81BMj9zxZ5fMbaXIZp+CWIVtaSZH2G6r57mDIb7et
 S8a65SAEMNUJaPQDq3G+SHeTKxqZYHFUDdjGrb4Un20AyRLdptmWJKKGBSKT0eRWRoBh
 S2hTsKp9jIgfgZhQaEQy04LTP08EqYfKvWqo2p1l4Y10eFPodBD3H2OkwMTj3isJ4ueM
 031jkS6AHE+N5dSbuxk1iPwKm4qG6+KjqCoFVw5dSLQqPRxv9GQy5q8yqiQLw/SU0g/i
 Vw3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=a5+NFcDyPVwL4iDr+PAgUKJYb6rVA8T1U3x0Y4iCU9k=;
 b=dh3/9Sfqv2ZES1svOLTEifkIQqCX5CY09isFegDTxpcdYw9GIA3UiOYNYX4wF/MYhk
 T3dCO+mSp2mCBhnuwV5ssRC508weTuHZLkowHZpoqMT48vWBlx7vjsbV1/to2LGkHXM+
 Ibruoc6C+IbcSHnNyzLAtzv8FrBvK+lxIC0wjrR0dAhShWu6/WAYpqmewKGoZ0MBTeIR
 LougP84Q9p9JPLg21163s+qiRMQSrPYuuNPb6bHIAvWmG2XjBSjeAEm5AtiX7GCW+U4D
 zNbtiYSJ227Ltbyqj4psgiQJg5tgqbcAMG91v29iWNFisLRUyzejF0GbCTvcV6+zXEyJ
 IsVA==
X-Gm-Message-State: AOAM533LSul8MyT1D6jYqOx4LUdxPbo7u+BzY8/nIxrMgAr1VoOwWC+H
 YsY8g2pQGpS22Qdg+9zFbRLgxyl4mkRdQA==
X-Google-Smtp-Source: ABdhPJz1apoQxEsILClSk8e3lpSerncqkwJEG4iNylA+2jXkWdzyi/suvY3r8p2Ego5yOLNm/c8JPg==
X-Received: by 2002:adf:e3cf:: with SMTP id k15mr18323110wrm.259.1605174551837; 
 Thu, 12 Nov 2020 01:49:11 -0800 (PST)
Received: from ?IPv6:2a01:e34:ed2f:f020:6971:b700:3764:fa96?
 ([2a01:e34:ed2f:f020:6971:b700:3764:fa96])
 by smtp.googlemail.com with ESMTPSA id r8sm6125262wrq.14.2020.11.12.01.49.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Nov 2020 01:49:11 -0800 (PST)
Subject: Re: [PATCH 1/3] drivers/clocksource: Remove EZChip NPS clocksource
 driver
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>, linux-kernel@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>
References: <20201105212210.1891598-1-vgupta@synopsys.com>
 <20201105212210.1891598-2-vgupta@synopsys.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <7647e159-411c-92ea-6a1a-6f3b9fa8ec8d@linaro.org>
Date: Thu, 12 Nov 2020 10:49:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201105212210.1891598-2-vgupta@synopsys.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201112_044915_074293_02F52CC8 
X-CRM114-Status: GOOD (  10.70  )
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
Cc: linux-snps-arc@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

T24gMDUvMTEvMjAyMCAyMjoyMiwgVmluZWV0IEd1cHRhIHdyb3RlOgo+IE5QUyBwbGF0Zm9ybSBo
YXMgYmVlbiByZW1vdmVkIGZyb20gQVJDIHBvcnQgYW5kIHRoZXJlIGFyZSBubyBpbi10cmVlCj4g
dXNlcnMgb2YgaXQgbm93LiBTbyBSSVAgIQo+IAo+IENjOiBEYW5pZWwgTGV6Y2FubyA8ZGFuaWVs
LmxlemNhbm9AbGluYXJvLm9yZz4KPiBDYzogVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9u
aXguZGU+Cj4gQ2M6IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcKPiBTaWduZWQtb2ZmLWJ5
OiBWaW5lZXQgR3VwdGEgPHZndXB0YUBzeW5vcHN5cy5jb20+Cj4gLS0tCgpBcHBsaWVkLCB0aGFu
a3MhCgoKLS0gCjxodHRwOi8vd3d3LmxpbmFyby5vcmcvPiBMaW5hcm8ub3JnIOKUgiBPcGVuIHNv
dXJjZSBzb2Z0d2FyZSBmb3IgQVJNIFNvQ3MKCkZvbGxvdyBMaW5hcm86ICA8aHR0cDovL3d3dy5m
YWNlYm9vay5jb20vcGFnZXMvTGluYXJvPiBGYWNlYm9vayB8CjxodHRwOi8vdHdpdHRlci5jb20v
IyEvbGluYXJvb3JnPiBUd2l0dGVyIHwKPGh0dHA6Ly93d3cubGluYXJvLm9yZy9saW5hcm8tYmxv
Zy8+IEJsb2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
c25wcy1hcmMK
