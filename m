Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6482BC4332F
	for <linux-snps-arc@archiver.kernel.org>; Thu,  2 Nov 2023 10:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Oo1RCQNrhoYj3k+xYY8SwFwHRXLccWRUpBwOd4swwyU=; b=AYB/1QtaOF+bqs
	fpktuN8SJH0XfI01mFUSFVaNKaxeq21QtQz7KwEZF1C4SiXgJZIdWyem2N3jDF94vJupeVmab0EjE
	ORj0U+ucVvcpg1Bl/EXliUIAJtRgMxVZmzsqaj07pmqXg9SuBdIhbUQAe1Pb0CdJ7TdCEVzQml9Uk
	2DaPxDxIZUWA/cEwjWfzyE1PXoXrnfTjlfRP/oSJppAAFwjt/ksKltjV85h/uE9GF/+72xXZfpKs1
	NHPMPi1OIIu+4PoxdZHr4lvGVRWOmccFBQAfzoO+n1nwIttxbOzZAGgBEW88Qz2WSItk/giM+mSu4
	+17OJc/hVODRbfSMxozw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyUZj-0095Xm-2h;
	Thu, 02 Nov 2023 10:05:19 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyUZd-0095Wa-30
	for linux-snps-arc@lists.infradead.org;
	Thu, 02 Nov 2023 10:05:18 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1cc1e1e74beso6333445ad.1
        for <linux-snps-arc@lists.infradead.org>; Thu, 02 Nov 2023 03:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1698919512; x=1699524312; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=//kTyjVjcUFtCf9fvPHX0Mi7MlvS7YMHsnweLRC1MB4=;
        b=bi5rdq+iNqSPoU0XIoqwmpO192/TeHw+M0+9SLPOt7notH17roq+Dyx6CtpFDqRrmi
         4sDZFRY/Kqmz41cjdNwxNaN6FoAKURZVrEIldZNdwY26LNQKNzEpH60iPxurKV6uLJiE
         o6zRTi9Iijx0k/nOEeh8w39JELxxR3ZeOk1JWepoYrgIb886O3gLmYnB8HshsyyPHny1
         Oozm7ouHuYWSzYSWLhZG/Bc2QoquBcBdA0/IuFjRyIXdtmj/QFzHYGz/4eObeK2pu610
         xNzan3vLlXMmPFaGYOMZVR+f+9WTpNI7XW6Gm41V5kW1iUyT/YU4R5nFgJsjWf51cSLa
         hCyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698919512; x=1699524312;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=//kTyjVjcUFtCf9fvPHX0Mi7MlvS7YMHsnweLRC1MB4=;
        b=qgKlsT2Uqpd5/Qxd1ldWhqvo3qqSaf+aDpw1X+/3Raj08LFZ2wJugjtbClZHk1xX8O
         NY2HFwfoj7R5SVB6TyYNGD9oHsKeD4x+Hq0z1ytvwfGvyXV9UPgFdIPmjjKeMndflKs6
         gYfaeBQRxC9VN48Dr0l/vrin5RHI0gFQFb3NBcf6dT7PC4SSXhEqJD/XBm2ONSRtszNi
         TYr/8XfmTsDM3lmxEGzucEUoRSBClJV71jRaMxzgj0RFX8SQIXjgl0JDnbW3TfUjMhoC
         xovnhdLxkWWVNGBBUKzyY6ZcPs7QqmalUC9CuqAwqf9vFo7BOPrgPp5LwkMNIMpzatJT
         4BLQ==
X-Gm-Message-State: AOJu0Yxz/bweWUXkLaK/XB/fpBdrZFQeG8ZxN54Sa0D/r5e+ZSrLga8T
	wsDjFrxV3BCku0CFKmXTvukexw==
X-Google-Smtp-Source: AGHT+IFqiDDKukwnOWMz0Wq+wYfcP0JSBT0Rbrlx+LOINIfwxDRgn2ncQILFCg6RE0JbKhtb3u1h4w==
X-Received: by 2002:a17:902:ecca:b0:1cc:54b5:b4fa with SMTP id a10-20020a170902ecca00b001cc54b5b4famr10812060plh.18.1698919512127;
        Thu, 02 Nov 2023 03:05:12 -0700 (PDT)
Received: from [192.168.6.6] ([203.208.167.147])
        by smtp.gmail.com with ESMTPSA id az5-20020a170902a58500b001c728609574sm2753180plb.6.2023.11.02.03.05.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Nov 2023 03:05:11 -0700 (PDT)
Message-ID: <8511e096-365f-4625-88d1-affd498685e1@bytedance.com>
Date: Thu, 2 Nov 2023 18:05:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] locking/atomic: openrisc: use
 generic_cmpxchg[64]_local for arch_cmpxchg[64]_local
Content-Language: en-US
From: "wuqiang.matt" <wuqiang.matt@bytedance.com>
To: Vineet Gupta <vgupta@kernel.org>,
 "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>, Ingo Molnar <mingo@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Andi Shyti <andi.shyti@linux.intel.com>, Palmer Dabbelt
 <palmer@rivosinc.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 linux-trace-kernel@vger.kernel.org, mattwu@163.com,
 linux-snps-arc@lists.infradead.org
References: <20231026073932.702197-1-wuqiang.matt@bytedance.com>
 <1e3aba7d-89ac-4b62-840e-992527115a70@app.fastmail.com>
 <66f5645c-f9f5-4c53-9503-a1f8470a9bee@bytedance.com>
 <20231028214918.e32265f1dd2ef26fd9d2d1c2@kernel.org>
 <99f9c3d4-0c9e-4542-9511-796f719c36e3@bytedance.com>
 <20231029122641.a8c90d5e6bdfa6e7175bbe97@kernel.org>
 <391884b5-12b3-4377-bd44-9ae69a4a13df@kernel.org>
 <7836be7b-ed41-4e0f-8983-9603bd6fcde0@bytedance.com>
 <67f536b5-1b42-49b1-b219-f5fd8906495d@kernel.org>
 <3c7cc279-d5ea-4071-ba68-88563a6a0877@bytedance.com>
Autocrypt: addr=wuqiang.matt@bytedance.com; keydata=
 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
 4mCJUdEkdwCS
In-Reply-To: <3c7cc279-d5ea-4071-ba68-88563a6a0877@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231102_030514_228898_AC632FD9 
X-CRM114-Status: GOOD (  23.70  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

T24gMjAyMy8xMS8yIDE3OjMwLCB3dXFpYW5nLm1hdHQgd3JvdGU6Cj4gT24gMjAyMy8xMS8yIDEy
OjUzLCBWaW5lZXQgR3VwdGEgd3JvdGU6Cj4+Cj4+Cj4+IE9uIDEwLzI5LzIzIDIwOjQxLCB3dXFp
YW5nLm1hdHQgd3JvdGU6Cj4+Pj4+Pgo+Pj4+Pj4gYXJjaF9jbXB4Y2hnX3JlbGF4ZWQ6Cj4+Pj4+
PiAuLi4KPj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBzd2l0Y2goc2l6ZW9mKChfcF8pKSkgewo+
Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGNhc2UgNDoKPj4+Pj4+IC4uLi4KPj4+Pj4+Cj4+Pj4+
PiBhcmNoX2NtcHhjaGc6Cj4+Pj4+PiAuLi4KPj4+Pj4+IMKgwqDCoMKgQlVJTERfQlVHX09OKHNp
emVvZihfcF8pICE9IDQpOwo+Pj4+Pj4gLi4uCj4+Pj4+Pgo+Pj4+Pj4gX3AgaXMgdGhlIGFkZHJl
c3MgcG9pbnRlciwgc28gSSdtIHRoaW5raW5nIGl0J3MgYSB0eXBvIGJ1dCBJIGNvdWxkbid0Cj4+
Pj4+PiB5ZXQgY29uZmlybS4gVGhlcmUgaXMgbm90IG11Y2ggYWJvdXQgYXJjIHByb2Nlc3NvcnMg
aW4gdGhlIHdlYiA6KAo+Pj4+PiBIbW0sIGluZGVlZC4gVGhpcyBzZWVtcyBsaWtlIGEgYnVnIGJ1
dCBpdCBkZXBlbmRzIG9uIHRoZSAnbGxvY2vCoCAlMCwgWyUxXScKPj4+Pj4gY2FuIHRha2UgYSAz
MmJpdCBhZGRyZXNzIG9yIDMyYml0IGRhdGEgcmVnaXN0ZXIuIFVzdWFsbHkgaXQgc2hvdWxkCj4+
Pj4+IGNoZWNrIHRoZSBzaXplIG9mIGRhdGEsIGJ1dCBuZWVkIHRvIGNoZWNrIHdpdGggSVNBIG1h
bnVhbC4KPj4+Pj4KPj4+Pj4gVmluZWV0LCBjYW4geW91IGNoZWNrIHRoaXMgc3VzcGljaW91cyBi
dWc/Cj4+Pj4KPj4+PiBBUkN2MiBpcyBhIDMyLWJpdCBJU0EgYW5kIExMT0NLL1NDT05EIHdvcmsg
b24gMzItYml0IGRhdGEuCj4+Pj4gU28gdGhlIHBvaW50ZXJzIHdpbGwgYmUgMzItYml0IGFueXdh
eXMuIElzIHRoZSBpc3N1ZSB0aGF0IHBvaW50ZXIvY21weGNoZyAKPj4+PiBvcGVyYXRpb24gY291
bGQgYmUgb24gYSBzbWFsbGVyIGRhdGEgdHlwZSA/Cj4+Pgo+Pj4gRm9yIEFSQ3YyIHdpdGggQ09O
RklHX0FSQ19IQVNfTExTQywgYmV0dGVyIGFkZCB0aGUgZGF0YSBzaXplIGNoZWNraW5nIGFuZAo+
Pj4gb25seSBwZXJtaXQgMzJiaXQgZGF0YSBzaXplLiBFdmVuIGZvciAzMi1iaXQgc3lzdGVtLCBk
YXRhIHNob3VsZCBjYW4gYmUKPj4+IDY0Yml0ICdsb25nIGxvbmcnLgo+Pgo+PiBSaWdodCwgbWFr
ZXMgc2Vuc2UuIENhbiB5b3Ugc2VuZCBhIHBhdGNoID8KPiAKPiBPa2F5LCBJIHdpbGwuCj4gCj4+
Pgo+Pj4gQW5kIEluIHRoZSBjYXNlIHRoYXQgQ09ORklHX0FSQ19IQVNfTExTQyBpcyB1bmRlZmlu
ZWQsIGluIGFyY2hfY21weGNoZzogdGhlCj4+PiBwb2ludGVyIHNpemUgY2hlY2tpbmcgaXMgdW5u
ZWNlc3NhcnksIHNpbmNlIGl0J3MgdXNpbmcgc3BpbmxvY2sgaW50ZXJuYWxseToKPj4KPj4gQ29y
cmVjdCwgSSBoYWQgdGhlIHNhbWUgdGhvdWdodC4KPj4KPj4+Cj4+PiBodHRwczovL2VsaXhpci5i
b290bGluLmNvbS9saW51eC92Ni42LXJjNy9zb3VyY2UvYXJjaC9hcmMvaW5jbHVkZS9hc20vY21w
eGNoZy5oI0w2MDoKPj4+IMKgwqDCoMKgQlVJTERfQlVHX09OKHNpemVvZihfcF8pICE9IDQpO8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKPj4+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
XAo+Pj4gwqDCoMKgwqAvKsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKPj4+IMKgwqDCoMKgICogc3BpbiBsb2NrL3VubG9jayBw
cm92aWRlIHRoZSBuZWVkZWQgc21wX21iKCkgYmVmb3JlL2FmdGVywqDCoMKgIFwKPj4+IMKgwqDC
oMKgICovwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgXAo+Pj4gwqDCoMKgwqBhdG9taWNfb3BzX2xvY2soX19mbGFncyk7wqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+Pj4gwqDCoMKgwqBfcHJldl8gPSAq
X3BfO8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBcCj4+PiDCoMKgwqDCoGlmIChfcHJldl8gPT0gX29fKcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+Pj4gwqDCoMKgwqDCoMKgwqAgKl9wXyA9IF9uXzvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKPj4+IMKgwqDC
oMKgYXRvbWljX29wc191bmxvY2soX19mbGFncyk7Cj4+Cj4+IENhbiB5b3UgZG8gdGhhdCBmaXgg
aW4gc2FtZSBwYXRjaCBhcyB3ZWxsID8KPiAKPiBTdXJlLgo+IAo+Pj4gQW5vdGhlciBxdWVzdGlv
biBhYm91dCB0aGUgbmFtaW5nOiBhcmNoX2NtcHhjaGdfcmVsYXhlZCgpIGltcGxlbWVudGVkIGlm
Cj4+PiBDT05GSUdfQVJDX0hBU19MTFNDIGlzIGNvbmZpZ3VyZWQgYW5kIGFyY2hfY21weGNoZygp
IGRlZmluZWQgZm9yIHRoZSByZXN0Lgo+Pj4gQXJlIHRoZXJlIGFueSByZWFzb25zIGZvciBkaWZm
ZXJlbmNlIG5hbWVzID8KPj4KPj4gWWVzIHRoZSBhdG9taWNzIEFQSSBjb25zaXN0cyBvZiBfcmVs
YXhlZCwgX2FjcXVpcmUsIF9yZWxlYXNlIGFuZCB1bmFkb3JuZWQuCj4+IF9yZWxheGVkIGlzIHRo
ZSBtb3N0IGVmZmljaWVudCwgd2l0aCByZXN0IGhhdmluZyBzb21lIGV4dHJhIGJhcnJpZXJzLgo+
PiBJZiBhcmNoIHByb3ZpZGVzIF9yZWxheGVkLCBnZW5lcmljIGNvZGUgY2FuIGNyZWF0ZSB0aGUg
cmVzdCAtIGFzc3VtaW5nIGFyY2ggCj4+IGhhcmR3YXJlIGNhbiBzdXBwb3J0IHRoZSByZWxheGVk
IG9uZXMuCj4gCj4gRGVmaW5pdGVseSBZZXMhIFRoZSBnZW5lcmljIGNtcHhjaGcgd2lsbCBwcmVm
ZXIgYXJjaF9jbXB4Y2hnX3JlbGF4ZWQgcmF0aGVyCj4gdGhhbiBhcmNoX2NtcHhjaGcuCgpJdCBz
aG91bGQgYmUgYXJjaF9jbXB4Y2hnIChpZiBkZWZpbmVkKSByYXRoZXIgdGhhbiBhcmNoX2NtcHhj
aGdfcmVsYXhlZC4gSQpqdXN0IGRvdWJsZSBjaGVja2VkIHdpdGggdjYuNjoKCgkuLi4KCSNpZiBk
ZWZpbmVkKGFyY2hfY21weGNoZykKCSNkZWZpbmUgcmF3X2NtcHhjaGcgYXJjaF9jbXB4Y2hnCgkj
ZWxpZiBkZWZpbmVkKGFyY2hfY21weGNoZ19yZWxheGVkKQoJCSNkZWZpbmUgcmF3X2NtcHhjaGco
Li4uKSBcCgkJX19hdG9taWNfb3BfZmVuY2UoYXJjaF9jbXB4Y2hnLCBfX1ZBX0FSR1NfXykKCSNl
bHNlCglleHRlcm4gdm9pZCByYXdfY21weGNoZ19ub3RfaW1wbGVtZW50ZWQodm9pZCk7CgkjZGVm
aW5lIHJhd19jbXB4Y2hnKC4uLikgcmF3X2NtcHhjaGdfbm90X2ltcGxlbWVudGVkKCkKCSNlbmRp
ZgoJLi4uCgkjaWYgZGVmaW5lZChhcmNoX2NtcHhjaGdfcmVsYXhlZCkKCSNkZWZpbmUgcmF3X2Nt
cHhjaGdfcmVsYXhlZCBhcmNoX2NtcHhjaGdfcmVsYXhlZAoJI2VsaWYgZGVmaW5lZChhcmNoX2Nt
cHhjaGcpCgkjZGVmaW5lIHJhd19jbXB4Y2hnX3JlbGF4ZWQgYXJjaF9jbXB4Y2hnCgkjZWxzZQoJ
ZXh0ZXJuIHZvaWQgcmF3X2NtcHhjaGdfcmVsYXhlZF9ub3RfaW1wbGVtZW50ZWQodm9pZCk7Cgkj
ZGVmaW5lIHJhd19jbXB4Y2hnX3JlbGF4ZWQoLi4uKSByYXdfY21weGNoZ19yZWxheGVkX25vdF9p
bXBsZW1lbnRlZCgpCgkjZW5kaWYKCS4uLgoKSSBtYWRlIHRoZSBtaXN0YWtlIHNpbmNlIHRoZSBk
ZWZpbml0aW9ucyBvZiB2NS4yIGNvbmZ1c2VkIG1lLiBUaGUgZm9sbG93aW5ncwphcmUgZm9yIHY1
LjIsIGFuZCB0aGVzZSBjb25kaXRpb25zIGFyZSByZW1vdmVkIGZyb20gdjUuMTQ6CgoJLi4uCgkj
aWYgIWRlZmluZWQoYXJjaF9jbXB4Y2hnX3JlbGF4ZWQpIHx8IGRlZmluZWQoYXJjaF9jbXB4Y2hn
KQoJI2RlZmluZSBjbXB4Y2hnKHB0ciwgLi4uKSBcCgkoeyBcCgkJdHlwZW9mKHB0cikgX19haV9w
dHIgPSAocHRyKTsgXAoJCWluc3RydW1lbnRfYXRvbWljX3dyaXRlKF9fYWlfcHRyLCBzaXplb2Yo
Kl9fYWlfcHRyKSk7IFwKCQlhcmNoX2NtcHhjaGcoX19haV9wdHIsIF9fVkFfQVJHU19fKTsgXAoJ
fSkKCSNlbmRpZgoJLi4uCgkjaWYgZGVmaW5lZChhcmNoX2NtcHhjaGdfcmVsYXhlZCkKCSNkZWZp
bmUgY21weGNoZ19yZWxheGVkKHB0ciwgLi4uKSBcCgkoeyBcCgkJdHlwZW9mKHB0cikgX19haV9w
dHIgPSAocHRyKTsgXAoJCWluc3RydW1lbnRfYXRvbWljX3dyaXRlKF9fYWlfcHRyLCBzaXplb2Yo
Kl9fYWlfcHRyKSk7IFwKCQlhcmNoX2NtcHhjaGdfcmVsYXhlZChfX2FpX3B0ciwgX19WQV9BUkdT
X18pOyBcCgl9KQoJI2VuZGlmCgkuLi4KClNvcnJ5IGZvciB0aGUgbm9pc2UuCgo+PiBUaGF0IGlz
IHRydWUgZm9yIExMU0MuCj4+Cj4+IEhvd2V2ZXIgZm9yICFMTFNDLCBzcGlubG9jayB2ZXJzaW9u
cyBhbHJlYWR5IGhhdmUgZnVsbCBiYXJyaWVycyBkdWUgdG8gCj4+IHNwaW5sb2NrLCBzbyByZWxh
eGVkIHZhcmlhbnQgZG9lc24ndCBtYWtlIHNlbnNlLgo+Pgo+Pj4KPj4+IEFzIEkgY2hlY2tlZCwg
U3lub3BzeXMgaGFzIHJlbGVhc2VkIDY0Yml0IEFSQyBwcm9jZXNzb3JzIChIUzY2L0hTNjgpLCBi
dXQKPj4+IEkgZG9uJ3Qga25vdyB0aGUgc3RhdHVzIG9mIExpbnV4IGtlcm5lbCBzdXBwb3J0Lgo+
Pgo+PiBZZXMgdGhlcmUncyBhbiBpbnRlcm5hbCBBUkM2NCBwb3J0IHJ1bm5pbmcgYnV0IGl0IGlz
IG5vdCByZWFkeSBmb3IgCj4+IHVwc3RyZWFtaW5nIHlldC4KPiAKPiBUaGFua3MgZm9yIHRoZSB1
cGRhdGUuCj4gCj4+IC1WaW5lZXQKPiAKPiBSZWdhcmRzLAo+IHd1cWlhbmcKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWls
aW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
