Return-Path: <SRS0=Y6oE=DO=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72E50C4363C
	for <linux-snps-arc@archiver.kernel.org>; Wed,  7 Oct 2020 04:14:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D50C2208C3
	for <linux-snps-arc@archiver.kernel.org>; Wed,  7 Oct 2020 04:14:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mWl2MAx0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qqfJiT2E"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D50C2208C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=amsat.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XOgDpiojCTuxr0nB0T/3nH2Z7/qTs6rptZWH/iQGZnE=; b=mWl2MAx0XYfDeeRejJLbYDvwK
	ZocizGpLxrpiqBjflAGE0kBvTGrVS426oa4+HbSYCE0JU2rVMloKRTSwgV/DWX1OlQkH06DaHY8YW
	Jq/lSwmMaFSJeNEWtTnDWSxkXYvkPpMrQZEEIVmMnePkHx75yetA17YJcUscMG0PMRixoZlq62r2l
	Dlh1RLqrxDVfXpQLSkUcIDf51w9cZ6E/7AtEYUGzoIH4sR4s3yUGYUVdHQ8jWoP0pZ9Ch1/0a25AL
	Mw3kBk9oU/yxjMX37rZWupfDxHb9GFfxr7ha6TN3TQUbzk+DDuZ2WaxL/2wGEhUluQFoejGt4I7YR
	XiW9+RBog==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQ0qp-0001JD-Pc; Wed, 07 Oct 2020 04:14:51 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQ0qn-0001Iq-2J
 for linux-snps-arc@lists.infradead.org; Wed, 07 Oct 2020 04:14:50 +0000
Received: by mail-wm1-x342.google.com with SMTP id e2so845526wme.1
 for <linux-snps-arc@lists.infradead.org>; Tue, 06 Oct 2020 21:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wAn7xS15a4GKezf+UjY97VnX3k65BPP67shFAVkt3q4=;
 b=qqfJiT2EMDGsZBNq0TQv3dzuGJdPxW0BS+8qH80wD5UaTGYXnIrzq3Tyex/muAJmR8
 6zoS4w8aMaZoCWIP6pHjovpA3TaLnMG3o/e/OlkNvjt/2bEiXWEe7X2SadMQJ7ghJ6MY
 8r3f95NlbhuMWRAAyRtUokibNXG5xbbfsy43c4kQ1uhOQFGBjXXaqvYQ7OZbd7ihAiUd
 wGyhY+TEsgKy3BqhUFD6wHBs0K4ykVY0J5Ne5Kg2qUYwwIdRfBFzYiVbJahUfdksYCIW
 SSYAb2+kHmrZ9vjnWQzDngxUEjUyNl7va3VlQen/AQ8HtXV6OIW4105iz6oJTtGnouQc
 2NiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wAn7xS15a4GKezf+UjY97VnX3k65BPP67shFAVkt3q4=;
 b=OtpwMZYvzMEoHbJOeKzn56lRWBCQaT+fsLyoA4c9SMcK7epWTHmNDxswcW64xkH+bu
 J9YDlrYPKFZumb/jJLpsfduKhhhyvSNeYjwJJE1fgQkyHrYZ2r9MYc/3H3FsyYMbWFLd
 h21QoLRKnaDNTIsEw16JFtTDm68LT3L4LUJbX0fzy+r18MdqPShrXdPUEOdYfi97PqK2
 WEBAVr6f1srj3uDTHkdsMFFk0xbiBz8Xe5HNYF50U3SUHtoUMsGkZZacwAnsGfe5ASv2
 X7+O2ua8qp51xF5cAZPApZkQxoOXx9aZchIwZ0Nm76zJ0x2eZ7Lss1BKwulnHphkRJlJ
 TLgQ==
X-Gm-Message-State: AOAM5328IGFlWW5/56C7V6qpFNaEmEdcP/cZSqsqE9nlr2dcVapcOi2w
 Kq/VkuCCnnLESeOpLKeAOqmK6wlM3nQ=
X-Google-Smtp-Source: ABdhPJwpaEwaYYUjjlRKrauQNzHObTd7PPyFGdyOW26/Ndys3ELMcKD7m+VKgRQBMp9YyHynl2waJw==
X-Received: by 2002:a1c:a795:: with SMTP id q143mr1059330wme.20.1602044087669; 
 Tue, 06 Oct 2020 21:14:47 -0700 (PDT)
Received: from [192.168.1.36] (106.red-83-59-162.dynamicip.rima-tde.net.
 [83.59.162.106])
 by smtp.gmail.com with ESMTPSA id g144sm861838wmg.30.2020.10.06.21.14.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Oct 2020 21:14:47 -0700 (PDT)
Subject: Re: [PATCH 13/14] arc: Add support for ARCv2
To: cupertinomiranda@gmail.com, qemu-devel@nongnu.org
References: <20200930204604.20663-1-cupertinomiranda@gmail.com>
 <20200930204604.20663-14-cupertinomiranda@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <a1282d2b-16a9-0121-a12d-7e2cd23971aa@amsat.org>
Date: Wed, 7 Oct 2020 06:14:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200930204604.20663-14-cupertinomiranda@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201007_001449_214600_1BA4571B 
X-CRM114-Status: GOOD (  13.80  )
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
Cc: Claudiu Zissulescu <claziss@gmail.com>,
 Shahab Vahedi <shahab.vahedi@gmail.com>, Shahab Vahedi <shahab@synopsys.com>,
 Cupertino Miranda <cmiranda@synopsys.com>, linux-snps-arc@lists.infradead.org,
 Claudiu Zissulescu <claziss@synopsys.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

T24gOS8zMC8yMCAxMDo0NiBQTSwgY3VwZXJ0aW5vbWlyYW5kYUBnbWFpbC5jb20gd3JvdGU6Cj4g
RnJvbTogU2hhaGFiIFZhaGVkaSA8c2hhaGFiQHN5bm9wc3lzLmNvbT4KPiAKPiBBZGQgcmVtYWlu
aW5nIGJpdHMgb2YgdGhlIFN5bm9wc3lzIEFSQ3YyIChFTS9IUykgc3VwcG9ydCBpbnRvIFFFTVUs
Cj4gY29uZmlndXJlIGJpdHMsIGFyY2hfaW5pdCBhbmQgY29uZmlndXJhdGlvbiBmaWxlcyBmb3Ig
c29mdG1tdSAoaGFyZHdhcmUKPiBlbXVsYXRpb24pLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFNoYWhh
YiBWYWhlZGkgPHNoYWhhYkBzeW5vcHN5cy5jb20+Cj4gLS0tCj4gIGNvbmZpZ3VyZSAgICAgICAg
ICAgICAgICAgICAgICAgfCAgNSArKysrKwo+ICBkZWZhdWx0LWNvbmZpZ3MvYXJjLXNvZnRtbXUu
bWFrIHwgIDUgKysrKysKPiAgZGlzYXMuYyAgICAgICAgICAgICAgICAgICAgICAgICB8ICAyICsr
Cj4gIGRpc2FzL21lc29uLmJ1aWxkICAgICAgICAgICAgICAgfCAgMSArCj4gIGh3L21lc29uLmJ1
aWxkICAgICAgICAgICAgICAgICAgfCAgMSArCj4gIGluY2x1ZGUvZGlzYXMvZGlzLWFzbS5oICAg
ICAgICAgfCAxMCArKysrKysrKystCj4gIGluY2x1ZGUvZWxmLmggICAgICAgICAgICAgICAgICAg
fCAgMyArKysKPiAgaW5jbHVkZS9leGVjL3BvaXNvbi5oICAgICAgICAgICB8ICAyICsrCj4gIGlu
Y2x1ZGUvc3lzZW11L2FyY2hfaW5pdC5oICAgICAgfCAgMSArCj4gIG1lc29uLmJ1aWxkICAgICAg
ICAgICAgICAgICAgICAgfCAgMyArKy0KPiAgc29mdG1tdS9hcmNoX2luaXQuYyAgICAgICAgICAg
ICB8ICAyICsrCj4gIHRhcmdldC9tZXNvbi5idWlsZCAgICAgICAgICAgICAgfCAgMSArCj4gIDEy
IGZpbGVzIGNoYW5nZWQsIDM0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gIGNyZWF0
ZSBtb2RlIDEwMDY0NCBkZWZhdWx0LWNvbmZpZ3MvYXJjLXNvZnRtbXUubWFrCgpSZXZpZXdlZC1i
eTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPGY0YnVnQGFtc2F0Lm9yZz4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxp
bmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1hcmMK
