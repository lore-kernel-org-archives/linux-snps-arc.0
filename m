Return-Path: <SRS0=uiT2=7A=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D997EC433DF
	for <linux-snps-arc@archiver.kernel.org>; Mon, 18 May 2020 16:21:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AEE9620657
	for <linux-snps-arc@archiver.kernel.org>; Mon, 18 May 2020 16:21:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ew9boETu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jbwPB+32"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AEE9620657
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ArL4I7z3mdtBLf2wReKlCWh2i96uFs0FAku84vBfj1U=; b=ew9boETuKSNY29
	sKBQb0W+TV7zTPnLUCjduyvZQKFI0A69BXpUDZPwJcEf94Ht8sV9fCfRqhhI0brYhokCGOP5mfKtX
	v8KOY5Gvzw0ipURcbVqcdBqmBMMrSp6jz20lYkIWV4E/QNsFiQZqAaJzktigJcf9DEIfHqQis3uM7
	vT00V0n1br4XsWl7k5bdwxqOISkBgLgogibYnoJuPN6DpcKyiM5MjOcrFL9C49nn6xRHnhNk3/Dri
	X64gp2CvFVTZ1zgsll+mOu9t7dg37Ygrm+yIuAkyabalzAag4bmxNAoA+cuAcfYxsZhdG9PklH+3x
	Kden81xmoxeGIhRpTPMQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jaiWJ-0003KW-Rk; Mon, 18 May 2020 16:21:39 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jaiWH-0003JC-Mb
 for linux-snps-arc@lists.infradead.org; Mon, 18 May 2020 16:21:39 +0000
Received: by mail-wr1-x441.google.com with SMTP id l18so12589726wrn.6
 for <linux-snps-arc@lists.infradead.org>; Mon, 18 May 2020 09:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mPan/iOK3FlJrRcEPq0sqHhm0unuccyfQDLEwiWdKUY=;
 b=jbwPB+32E8dRbvJ2wuQ2JG0caMLHZmmizHiGemUQmDcbJFiV+TvTZGRDL3d8PDtLsY
 2ofvAnRHxEjj2ccKFu/Y5AQ4iCGeV1QxDIb1SuzLFLi9OIJdiJas6gQG5cCvWSMPOGBU
 x/V/WqmQj0E7HnKvep4LT6igUvk+nrxoUYNON3dPkrUZJ9KDQUPW6Har3ir+HmcgWsqf
 alrdsuwFyryYBcb3FZss6FzqoR50INrutQ/9FhINws5OiGc6tiKlOXePO31DMMzaYdT8
 /Y2of1GPQsIZoDVqZozjtvQotHRUsqHUJo+Fk8R0XnV0TubHTbxg8/nwPjxSaIXvslXu
 PaVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mPan/iOK3FlJrRcEPq0sqHhm0unuccyfQDLEwiWdKUY=;
 b=qNAXebfIqKZ+eKd1hrFCOk3W/EgTBFgDVW6OiPF1fyhhrI7Tch7UGfpgVib5QdXK8V
 FE3RPehO+oNn4TcGQkRQp0GcP3ZB8DVysUwmskFbUfUlqx4z4+QB7vPOqWzcMbKmx+Ka
 zBIKYeSKPrSNl86JW7A30QNUY3HfcUJrKOquJcyJt0D/LFpbeCg7zpfj08k6VY5PAgKi
 tDCBhaIAd4n4QAI1b9xR5IxnWRTmcpIvrBS03ops5taYe698OdqxRMmS0smOzLqg713U
 oDyJFixhuzvvbLFZxPVUFvrqGneuMw0bH0R/eZ3PbQCV8Ffbwg9OONRKZThlcKeavMJK
 pV9g==
X-Gm-Message-State: AOAM530qv7ITOodzpQyddi+EkIQYtiA2j4Y1Da6RKQldCcZmQ9qhtLl/
 p4spW1BHC99PuveII3nV641kr9I8WWA=
X-Google-Smtp-Source: ABdhPJyiDuft1ud8pm340dhXzBtCA6hZi5QfdvTeiEMwEovwvB9rBLz7UQdecu8ItPbWcTbrcrKeiQ==
X-Received: by 2002:adf:f40a:: with SMTP id g10mr21964592wro.117.1589818896319; 
 Mon, 18 May 2020 09:21:36 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:9e7:3ac5:a930:2cd8?
 ([2a01:e34:ed2f:f020:9e7:3ac5:a930:2cd8])
 by smtp.googlemail.com with ESMTPSA id i74sm17145474wri.49.2020.05.18.09.21.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 May 2020 09:21:35 -0700 (PDT)
Subject: Re: [PATCH v1] clocksource: arc_timer: remove duplicate error message
To: Dejin Zheng <zhengdejin5@gmail.com>, vgupta@synopsys.com,
 tglx@linutronix.de, linux-snps-arc@lists.infradead.org
References: <20200429151223.3120-1-zhengdejin5@gmail.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <54f33384-2d2e-ce84-4242-d15286f65dfa@linaro.org>
Date: Mon, 18 May 2020 18:21:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200429151223.3120-1-zhengdejin5@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200518_092137_736061_38D03EEA 
X-CRM114-Status: UNSURE (   8.34  )
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
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

T24gMjkvMDQvMjAyMCAxNzoxMiwgRGVqaW4gWmhlbmcgd3JvdGU6Cj4gaXQgd2lsbCBwcmludCBh
biBlcnJvciBtZXNzYWdlIGJ5IGl0c2VsZiB3aGVuIGFyY19nZXRfdGltZXJfY2xrKCkKPiBnb2Vz
IHdyb25nLiBzbyByZW1vdmUgdGhlIGR1cGxpY2F0ZSBlcnJvciBtZXNzYWdlLgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IERlamluIFpoZW5nIDx6aGVuZ2RlamluNUBnbWFpbC5jb20+CgpBcHBsaWVkLCB0
aGFua3MKCgotLSAKPGh0dHA6Ly93d3cubGluYXJvLm9yZy8+IExpbmFyby5vcmcg4pSCIE9wZW4g
c291cmNlIHNvZnR3YXJlIGZvciBBUk0gU29DcwoKRm9sbG93IExpbmFybzogIDxodHRwOi8vd3d3
LmZhY2Vib29rLmNvbS9wYWdlcy9MaW5hcm8+IEZhY2Vib29rIHwKPGh0dHA6Ly90d2l0dGVyLmNv
bS8jIS9saW5hcm9vcmc+IFR3aXR0ZXIgfAo8aHR0cDovL3d3dy5saW5hcm8ub3JnL2xpbmFyby1i
bG9nLz4gQmxvZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtc25wcy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1zbnBzLWFyYwo=
