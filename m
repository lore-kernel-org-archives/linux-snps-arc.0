Return-Path: <SRS0=eli2=EF=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E119C4741F
	for <linux-snps-arc@archiver.kernel.org>; Fri, 30 Oct 2020 18:54:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 413DF2075E
	for <linux-snps-arc@archiver.kernel.org>; Fri, 30 Oct 2020 18:54:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="igpKrN1a";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel-dk.20150623.gappssmtp.com header.i=@kernel-dk.20150623.gappssmtp.com header.b="qbs2IpGz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 413DF2075E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EJhK2PA1X+3AbpQjVK/emjJIsTTS5IMrXq2Ykt7kIuY=; b=igpKrN1acY80MWkBFuDOgc8OV
	+Oi72ycYBscTWmmQ8WXGAV6F/vYzPJydDwhtdknbgs9SLh6sXZXPE2fvPworz5JqDDch76L/lKT9n
	j8WwQ8WC4JaAt6HbkD7vjLfyTZ/DJlkEAOBCq4/YHhwXt8QRNdeqgMZPRMDqPwHm/SN+j59AWvjdm
	haI9E3ilCWyBgHmfAsyZJEMWVY3ReDRgh4p8A5bGZ9O37uK225ZheG4Y7oCcQqtuQh6nTdV8UvT/W
	0EAQCTcQutWfFDLemct17UqEgocHCberjRuix7TCxEiFPTlCUh01G6q81hhsUAuMqgvfJ64rIl5hh
	QWGlvREJA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYZXS-0007Ru-Bo; Fri, 30 Oct 2020 18:54:14 +0000
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYZXQ-0007Qy-MR
 for linux-snps-arc@lists.infradead.org; Fri, 30 Oct 2020 18:54:13 +0000
Received: by mail-il1-x135.google.com with SMTP id n5so7384737ile.7
 for <linux-snps-arc@lists.infradead.org>; Fri, 30 Oct 2020 11:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tMf9AMfk/yExuJKM8/1UQ09FC8NZ7U74R97RQRlMSQk=;
 b=qbs2IpGzLhkpw0uwpAmPgsR/EZMviSXvaO1JC73XPnteDt9+10kEjCiAWbXnMYREqp
 7uGQkGHqh3ltb6ZM0IHKXJKuH9Lb6jh8SG3AaHfnGyr+t+sUt8MQB+vsxyZ1u6+8pRZb
 aCV7u0Z0vqg824GmoM0s5cGIuSlTvCnHGJSjh29uEOeFTaaihtiVpwyfRr4eXnLusqIM
 W49Zj4iefGDGyfzOwpgygg7JB0lFWcViwKotbdYWxg1xcfOFo40Bo7QyeAQgHZUrTfoN
 QfybkZsiFCK3XpVZlcZNXpqrqq8xkhNkqR16NYoIjKhRTjrsQsbioytcth8C+5VWUzCL
 dtNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tMf9AMfk/yExuJKM8/1UQ09FC8NZ7U74R97RQRlMSQk=;
 b=avZMiJfbzuIFUZTQL1QMdy6gu1AUX9xqnLG0+89YYPfE55pfhV6RBoSZo54yZZJ/Fh
 jlh1qOYPPqy4laJRE6HgCcVFe/4FnUrcHvgKOjqroLMxOeOvZQal5iBASPL4w7lVUV1r
 PZoasqLwehN5QEfCJKHSR0XOY9/+IglZXfzkBFDQsqupmpKNOMBwYfAXTNaSHdX2ujax
 Nq4Q8FlK4GK9yiO7G5nplkkHHsq9tRnlv0Uo2fGxgeorwHXaQtc6N5xH2vWV8lIT2XLH
 sMKX/M4S7NDlKo+vjnzEJ+DIx7+7T3M7+uZQ/sn/ESEFF03Z+kYIdnOxxXH3zPHCRfW2
 10tQ==
X-Gm-Message-State: AOAM530EdPcisCpa0xX2NP0gFM0PGFCyB43nz+cIsUJshxwQ1fgfleNy
 WGDNHGWi1N9pcI/a0PQuJ19txw==
X-Google-Smtp-Source: ABdhPJygEwBCwgS21Sv8OA1FMW1uGttXMamKu8Op1aaIHgTyd6UjfUohmMCrzJlkyGbxChkRrYxRKg==
X-Received: by 2002:a05:6e02:dea:: with SMTP id
 m10mr3058662ilj.106.1604084050607; 
 Fri, 30 Oct 2020 11:54:10 -0700 (PDT)
Received: from [192.168.1.30] ([65.144.74.34])
 by smtp.gmail.com with ESMTPSA id n15sm5598618ilt.58.2020.10.30.11.54.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Oct 2020 11:54:10 -0700 (PDT)
Subject: Re: arc: kernel/entry.S:310: Error: inappropriate arguments for
 opcode 'and'
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "lkft-triage@lists.linaro.org" <lkft-triage@lists.linaro.org>
References: <CA+G9fYth+F1TnG6GQNKtrxvChvX9m+nGa8LKFG18WCzsqNJg5w@mail.gmail.com>
 <5273a136-ac9c-94fc-b6e1-d7a0abf2b385@synopsys.com>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <33ead693-0cf6-adef-c513-fd3ba0c1a6eb@kernel.dk>
Date: Fri, 30 Oct 2020 12:54:09 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <5273a136-ac9c-94fc-b6e1-d7a0abf2b385@synopsys.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201030_145412_749271_B3EDAC0C 
X-CRM114-Status: GOOD (  14.33  )
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
Cc: Thomas Gleixner <tglx@linutronix.de>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Christian Brauner <christian@brauner.io>, Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

T24gMTAvMzAvMjAgMTI6NTMgUE0sIFZpbmVldCBHdXB0YSB3cm90ZToKPiBIaSBOYXJlc2gsCj4g
Cj4gT24gMTAvMzAvMjAgMzoyOSBBTSwgTmFyZXNoIEthbWJvanUgd3JvdGU6Cj4+IGFyYyBkZWZj
b25maWcgYnVpbGQgZmFpbGVkIG9uIGxpbnV4IG5leHQgMjAyMDEwMzAgd2l0aCBnY2MtOCBhbmQg
Z2NjLTkuCj4+Cj4+IG1ha2UgLXNrIEtCVUlMRF9CVUlMRF9VU0VSPVR1eEJ1aWxkIC1DL2xpbnV4
IC1qMTYgQVJDSD1hcmMKPj4gQ1JPU1NfQ09NUElMRT1hcmMtZWxmMzItIEhPU1RDQz1nY2MgQ0M9
InNjY2FjaGUgYXJjLWVsZjMyLWdjYyIgTz1idWlsZAo+PiB1SW1hZ2UKPj4gIwo+PiAuLi9hcmNo
L2FyYy9rZXJuZWwvZW50cnkuUzogQXNzZW1ibGVyIG1lc3NhZ2VzOgo+PiAuLi9hcmNoL2FyYy9r
ZXJuZWwvZW50cnkuUzozMTA6IEVycm9yOiBpbmFwcHJvcHJpYXRlIGFyZ3VtZW50cyBmb3Igb3Bj
b2RlICdhbmQnCj4+IG1ha2VbM106ICoqKiBbLi4vc2NyaXB0cy9NYWtlZmlsZS5idWlsZDozNjQ6
Cj4+IGFyY2gvYXJjL2tlcm5lbC9lbnRyeS1hcmN2Mi5vXSBFcnJvciAxCj4+Cj4+IFJlcG9ydGVk
LWJ5OiBOYXJlc2ggS2FtYm9qdSA8bmFyZXNoLmthbWJvanVAbGluYXJvLm9yZz4KPiAKPiBUaHgg
Zm9yIHJlcG9ydGluZyB0aGlzLsKgIFRoaXMgaXMgZHVlIHRvIHRoZSBzZXJpZXMgQWRkIHN1cHBv
cnQgZm9yIAo+IFRJRl9OT1RJRllfU0lHTkFMIAo+IDxodHRwczovL2xvcmUua2VybmVsLm9yZy9p
by11cmluZy8yMDIwMTAyNjIwMzIzMC4zODYzNDgtMS1heGJvZUBrZXJuZWwuZGsvI3I+d2hlcmUg
Cj4gQVJDIHBhdGNoIGlzIGJyb2tlbiBhbmQgSSBqdXN0IHJlcGxpZWQgdG8gSmVucyBhYm91dCBp
dC4gSGUgd2lsbCAKPiBob3BlZnVsbHkgZml4IGl0IGFuZCBwdXNoIHVwZGF0ZWQgc2VyaWVzIHRv
IC1uZXh0CgpEb25lLCB3aWxsIHB1c2ggaXQgb3V0IG5vdy4gU29ycnkgYWJvdXQgdGhhdC4KCi0t
IApKZW5zIEF4Ym9lCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtc25wcy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1zbnBzLWFyYwo=
