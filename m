Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D49DC4332F
	for <linux-snps-arc@archiver.kernel.org>; Mon, 30 Oct 2023 03:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q8ov+vpQ5Zj31yXaMnhNdkrC7/2YK1/GtEwaRM2S8ic=; b=RZmkyCDRd1xVRX
	E7RjGY1aD7h6OpvhKtPMqomcpRjtiTvqw4yGB00LMsoo/ii76tx2CIPR4bunYBI5/DdTzXlaCcE9A
	SS1sucWRK+FskY3g7eJv0H5bEJLZqOX7MxiIgvMO+thHdNGUh5d6l6G6JYukmpWlgx7SipmP3Cm8d
	Ce49R0ffqFbOixgJco4YmkU2dC0/PL2K34+Q6Nt0+bDmw4Q3Y8gbqxxLna56P/Y6UxHpr9lqkVotS
	iwKCNTdP3rViOwgoNwhtV8KDMyeiGNYEWjjPlQVQh7JXF6kqTGR1WY+60MiQy7ux7D4xBXOHVDFyS
	7j3xdN/RLDOzXk5TETBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxJAH-002UvX-0w;
	Mon, 30 Oct 2023 03:42:09 +0000
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxJAE-002Uuf-0H
	for linux-snps-arc@lists.infradead.org;
	Mon, 30 Oct 2023 03:42:08 +0000
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-6ce2ee17cb5so2808055a34.2
        for <linux-snps-arc@lists.infradead.org>; Sun, 29 Oct 2023 20:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1698637317; x=1699242117; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UFA7XAcFie/JhCiQl6pMzZYEdRmFHLdXEhUI5ZhUkqE=;
        b=eQus+ZKo43cTkTEws1seZQ3FbC0goPNkjrZNq3jCxmiX72yGkM/A054UtRpQkCbShf
         btdf7nXadfxh9BvS7mGvYXVeetO5YjDcOCrhH2XPand1tBATB6HuMBCU2pKMZbJEyira
         uvCq4So1BAvGOx6AX3CKci7+V84Ry+oUpPadQ9X5dp4swPucU84gDT2JWk0Pz7sfYON1
         c6QM2qiQGNOH3BoIDH3dJ6UVyXc1UogdSwNN4ZQmmlz+HkCA7pTfvyi5KPwV5UQyJi0m
         lbIRaETL4gHMqvgnitw0RtJ2fUmrDMCc3wmT2w0z+uftCjDZ6QlQQsQStv/4t4KhbPj9
         nPOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698637317; x=1699242117;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UFA7XAcFie/JhCiQl6pMzZYEdRmFHLdXEhUI5ZhUkqE=;
        b=j2prCfYdpfqsCO1kR0esAe/2IY11FdPphdYP7I5lcT/2J9giQhor0AkYer9uA1dogC
         wztXzGKzg5K4ykW3AbeCVcXNmX9SFf2FBLjn/a5FGAK8EX5MIC6o87FZ6hGaJEwDkxrh
         OMj6LPAWDnHPy1ggNhLBplgp7ftekWX0n2HO0CuLtSGaqRK02dj3lBVIt+Gi8cwzDo8h
         +uAewYFhKFMEWaFJANDHqLQQ0mZ/85vBM1s7V0Ka9kGO6rW7exdbJRoV6mON/y7U09K+
         6+Ds9TsrZIebgTtRQsEzJmZ2zqgmD0fpAjL2lYLFTygpShEf+ZSCQTBB+YBHdUvvQrDi
         YSjw==
X-Gm-Message-State: AOJu0YybdknE5fBlB0OTGqdNGtSFDgNZM93lhZWIcJPUcy9o5Ty8wSgW
	cxV8CaUfgljStLk7J3gYi4JsFQ==
X-Google-Smtp-Source: AGHT+IFBKTulY1yGKK6SLWJybdyT0GD4yTFgaLeyz3OyhlaBhZJXJVcFwNDCd2OdyltcXlX0JMsjvA==
X-Received: by 2002:a9d:6245:0:b0:6bf:3f4:3edc with SMTP id i5-20020a9d6245000000b006bf03f43edcmr9342918otk.22.1698637317202;
        Sun, 29 Oct 2023 20:41:57 -0700 (PDT)
Received: from [192.168.3.101] ([104.28.213.201])
        by smtp.gmail.com with ESMTPSA id gx13-20020a056a001e0d00b0068aca503b9fsm4886767pfb.114.2023.10.29.20.41.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Oct 2023 20:41:56 -0700 (PDT)
Message-ID: <7836be7b-ed41-4e0f-8983-9603bd6fcde0@bytedance.com>
Date: Mon, 30 Oct 2023 11:41:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] locking/atomic: openrisc: use
 generic_cmpxchg[64]_local for arch_cmpxchg[64]_local
Content-Language: en-US
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
From: "wuqiang.matt" <wuqiang.matt@bytedance.com>
Autocrypt: addr=wuqiang.matt@bytedance.com; keydata=
 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
 4mCJUdEkdwCS
In-Reply-To: <391884b5-12b3-4377-bd44-9ae69a4a13df@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231029_204206_133743_27809A48 
X-CRM114-Status: GOOD (  25.98  )
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

T24gMjAyMy8xMC8zMCAxMDoyMiwgVmluZWV0IEd1cHRhIHdyb3RlOgo+IAo+IAo+IE9uIDEwLzI4
LzIzIDIwOjI2LCBNYXNhbWkgSGlyYW1hdHN1IChHb29nbGUpIHdyb3RlOgo+PiBPbiBTdW4sIDI5
IE9jdCAyMDIzIDAwOjQwOjE3ICswODAwCj4+ICJ3dXFpYW5nLm1hdHQiIDx3dXFpYW5nLm1hdHRA
Ynl0ZWRhbmNlLmNvbT4gd3JvdGU6Cj4+Cj4+PiBPbiAyMDIzLzEwLzI4IDIwOjQ5LCBNYXNhbWkg
SGlyYW1hdHN1IChHb29nbGUpIHdyb3RlOgo+Pj4+IEhpIFd1cWlhbmcsCj4+Pj4KPj4+PiBPbiBU
aHUsIDI2IE9jdCAyMDIzIDE5OjA1OjUxICswODAwCj4+Pj4gInd1cWlhbmcubWF0dCIgPHd1cWlh
bmcubWF0dEBieXRlZGFuY2UuY29tPiB3cm90ZToKPj4+Pgo+Pj4+PiBPbiAyMDIzLzEwLzI2IDE2
OjQ2LCBBcm5kIEJlcmdtYW5uIHdyb3RlOgo+Pj4+Pj4gT24gVGh1LCBPY3QgMjYsIDIwMjMsIGF0
IDA5OjM5LCB3dXFpYW5nLm1hdHQgd3JvdGU6Cj4+Pj4+Pj4gYXJjaF9jbXB4Y2hnWzY0XV9sb2Nh
bCgpIGFyZSBub3QgZGVmaW5lZCBmb3Igb3BlbnJpc2MuIFNvIGltcGxlbWVudAo+Pj4+Pj4+IHRo
ZW0gd2l0aCBnZW5lcmNpX2NtcHhjaGdbNjRdX2xvY2FsLCBhZHZpc2VkIGJ5IE1hc2FtaSBIaXJh
bWF0c3UuCj4+Pj4+Pj4KPj4+Pj4+PiBDbG9zZXM6Cj4+Pj4+Pj4gaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvbGludXgtdHJhY2Uta2VybmVsLzE2OTgyNDY2MDQ1OS4yNDM0MC4xNDYxNDgxNzEzMjY5
NjM2MDUzMS5zdGdpdEBkZXZub3RlMgo+Pj4+Pj4+IENsb3NlczoKPj4+Pj4+PiBodHRwczovL2xv
cmUua2VybmVsLm9yZy9vZS1rYnVpbGQtYWxsLzIwMjMxMDI0MTMxMC5JcjV1dWtPRy1sa3BAaW50
ZWwuY29tCj4+Pj4+Pj4KPj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiB3dXFpYW5nLm1hdHQgPHd1cWlh
bmcubWF0dEBieXRlZGFuY2UuY29tPgo+Pj4+Pj4gSSB0aGluayBvbiBhcmNoaXRlY3R1cmVzIHRo
YXQgaGF2ZSBhY3R1YWwgYXRvbWljcywgeW91Cj4+Pj4+PiBnZW5lcmFsbHkgd2FudCB0byBkZWZp
bmUgdGhpcyB0byBiZSB0aGUgc2FtZSBhcyBhcmNoX2NtcHhjaGcoKQo+Pj4+Pj4gcmF0aGVyIHRo
YW4gdGhlIGdlbmVyaWMgdmVyc2lvbi4KPj4+Pj4+Cj4+Pj4+PiBJdCBkZXBlbmRzIG9uIHRoZSBy
ZWxhdGl2ZSBjb3N0IG9mIGRvaW5nIG9uZSBhdG9taWMgY29tcGFyZWQKPj4+Pj4+IHRvIGFuIGly
cS1kaXNhYmxlL2VuYWJsZSBwYWlyLCBidXQgZXZlcnlvbmUgZWxzZSB3ZW50IHdpdGgKPj4+Pj4+
IHRoZSBmb3JtZXIgaWYgdGhleSBjb3VsZC4gVGhlIGV4Y2VwdGlvbnMgYXJlIGFybXY0L2FybXY1
LAo+Pj4+Pj4gc3BhcmMzMiBhbmQgcGFyaXNjLCB3aGljaCBkb24ndCBoYXZlIGEgZ2VuZXJpYyBj
bXB4Y2hnKCkKPj4+Pj4+IG9yIHNpbWlsYXIgb3BlcmF0aW9uLgo+Pj4+PiBTdXJlLCBiZXR0ZXIg
bmF0aXZlIHRoYW4gdGhlIGdlbmVyaWMuIEknbGwgdHJ5IHRvIGNvbGxlY3QgbW9yZQo+Pj4+PiBp
bnNpZ2h0cyBiZWZvcmUgbmV4dCBtb3ZlLgo+Pj4+IFNvIEkgd2lsbCB0ZW1wb3JhbGx5IHJlbW92
ZSB0aGUgbGFzdCBjaGFuZ2UgKHVzZSBhcmNoX2NtcHhjaGdfbG9jYWwKPj4+PiBpbiBvYmpwb29s
KSB1bnRpbCB0aGVzZSBzZXJpZXMgYXJlIHJld3JpdHRlbiB3aXRoIGFyY2ggbmF0aXZlIGNvZGUs
Cj4+Pj4gc28gdGhhdCB0aGUgbmV4dCByZWxlYXNlIHdpbGwgbm90IGJyZWFrIHRoZSBrZXJuZWwg
YnVpbGQuCj4+PiBPaywgaXQncyBmaW5lIHRvIG1lLiBUaGFuayB5b3UuCj4+Pgo+Pj4KPj4+PiBC
dXQgdGhpcyBtdXN0IGJlIGZpeGVkIGJlY2F1c2UgYXJjaF9jbXB4Y2hnX2xvY2FsKCkgaXMgcmVx
dWlyZWQKPj4+PiBmb3IgZWFjaCBhcmNoIGFueXdheS4KPj4+IFllcy4gSSdtIHdvcmtpbmcgb24g
dGhlIG5ldyB1cGRhdGUgZm9yIGFyYy9vcGVucmlzYy9oZXhhZ29uLiBJdCB3b3VsZAo+Pj4gYmUg
YmV0dGVyIHJlc29sdmUgdGhpcyBpc3N1ZSBmaXJzdCwgdGhlbiBjb25zaWRlciB0aGUgb2JqcG9v
bCB1cGRhdGUKPj4+IG9mIHVzaW5nIGFyY2hfY21weGNoZ19sb2NhbC4KPj4+Cj4+Pj4+PiBZb3Ug
Y291bGQgZG8gdGhlIHRoaW5nIHRoYXQgc3BhcmM2NCBhbmQgeHRlbnNhIGRvLCB3aGljaAo+Pj4+
Pj4gdXNlIHRoZSBuYXRpdmUgY21weGNoZyBmb3Igc3VwcG9ydGVkIHdvcmQgc2l6ZXMgYnV0IHRo
ZQo+Pj4+Pj4gZ2VuZXJpYyB2ZXJzaW9uIGZvciAxLSBhbmQgMi1ieXRlIHN3YXBzLCBidXQgdGhh
dCBoYXMgaXRzCj4+Pj4+PiBvd24gc2V0IG9mIHByb2JsZW1zIGlmIHlvdSBlbmQgdXAgZG9pbmcg
b3BlcmF0aW9ucyBvbiBib3RoCj4+Pj4+PiB0aGUgZW50aXJlIHdvcmQgYW5kIGEgc3ViLXVuaXQg
b2YgdGhlIHNhbWUgdGhpbmcuCj4+Pj4+IFRoYW5rIHlvdSBmb3IgcG9pbnRpbmcgb3V0IHRoaXMu
IEknbGwgZG8gc29tZSByZXNlYXJjaCBvbiB0aGVzZQo+Pj4+PiBpbXBsZW1lbnRhdGlvbnMuCj4+
Pj4gYXJjIGFsc28gaGFzIHRoZSBMTC1TQyBpbnN0cnVjdGlvbiBidXQgZGVwZW5kcyBvbiB0aGUg
Y29yZSBmZWF0dXJlLAo+Pj4+IHNvIEkgdGhpbmsgd2UgY2FuIHVzZSBpdC4KPj4+IFJpZ2h0LiBU
aGUgYXJjIHByb2Nlc3NvciBkb2VzIGhhdmUgdGhlIENPTkZJR19BUkNfSEFTX0xMU0Mgb3B0aW9u
LCBidXQKPj4+IEkgZG91YnQgdGhlIGNvcnJlY3RuZXNzIG9mIGFyY2hfY21weGNoZ19yZWxheGVk
IGFuZCBhcmNoX2NtcHhjaGc6Cj4+Pgo+Pj4gYXJjaF9jbXB4Y2hnX3JlbGF4ZWQ6Cj4+PiAuLi4K
Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBzd2l0Y2goc2l6ZW9mKChfcF8pKSkgewo+Pj4gwqDCoMKg
wqDCoMKgwqDCoMKgIGNhc2UgNDoKPj4+IC4uLi4KPj4+Cj4+PiBhcmNoX2NtcHhjaGc6Cj4+PiAu
Li4KPj4+IMKgwqDCoMKgQlVJTERfQlVHX09OKHNpemVvZihfcF8pICE9IDQpOwo+Pj4gLi4uCj4+
Pgo+Pj4gX3AgaXMgdGhlIGFkZHJlc3MgcG9pbnRlciwgc28gSSdtIHRoaW5raW5nIGl0J3MgYSB0
eXBvIGJ1dCBJIGNvdWxkbid0Cj4+PiB5ZXQgY29uZmlybS4gVGhlcmUgaXMgbm90IG11Y2ggYWJv
dXQgYXJjIHByb2Nlc3NvcnMgaW4gdGhlIHdlYiA6KAo+PiBIbW0sIGluZGVlZC4gVGhpcyBzZWVt
cyBsaWtlIGEgYnVnIGJ1dCBpdCBkZXBlbmRzIG9uIHRoZSAnbGxvY2vCoCAlMCwgWyUxXScKPj4g
Y2FuIHRha2UgYSAzMmJpdCBhZGRyZXNzIG9yIDMyYml0IGRhdGEgcmVnaXN0ZXIuIFVzdWFsbHkg
aXQgc2hvdWxkCj4+IGNoZWNrIHRoZSBzaXplIG9mIGRhdGEsIGJ1dCBuZWVkIHRvIGNoZWNrIHdp
dGggSVNBIG1hbnVhbC4KPj4KPj4gVmluZWV0LCBjYW4geW91IGNoZWNrIHRoaXMgc3VzcGljaW91
cyBidWc/Cj4gCj4gQVJDdjIgaXMgYSAzMi1iaXQgSVNBIGFuZCBMTE9DSy9TQ09ORCB3b3JrIG9u
IDMyLWJpdCBkYXRhLgo+IFNvIHRoZSBwb2ludGVycyB3aWxsIGJlIDMyLWJpdCBhbnl3YXlzLiBJ
cyB0aGUgaXNzdWUgdGhhdCBwb2ludGVyL2NtcHhjaGcgCj4gb3BlcmF0aW9uIGNvdWxkIGJlIG9u
IGEgc21hbGxlciBkYXRhIHR5cGUgPwoKRm9yIEFSQ3YyIHdpdGggQ09ORklHX0FSQ19IQVNfTExT
QywgYmV0dGVyIGFkZCB0aGUgZGF0YSBzaXplIGNoZWNraW5nIGFuZApvbmx5IHBlcm1pdCAzMmJp
dCBkYXRhIHNpemUuIEV2ZW4gZm9yIDMyLWJpdCBzeXN0ZW0sIGRhdGEgc2hvdWxkIGNhbiBiZQo2
NGJpdCAnbG9uZyBsb25nJy4KCkFuZCBJbiB0aGUgY2FzZSB0aGF0IENPTkZJR19BUkNfSEFTX0xM
U0MgaXMgdW5kZWZpbmVkLCBpbiBhcmNoX2NtcHhjaGc6IHRoZQpwb2ludGVyIHNpemUgY2hlY2tp
bmcgaXMgdW5uZWNlc3NhcnksIHNpbmNlIGl0J3MgdXNpbmcgc3BpbmxvY2sgaW50ZXJuYWxseToK
Cmh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y2LjYtcmM3L3NvdXJjZS9hcmNoL2Fy
Yy9pbmNsdWRlL2FzbS9jbXB4Y2hnLmgjTDYwOiAKCglCVUlMRF9CVUdfT04oc2l6ZW9mKF9wXykg
IT0gNCk7CQkJCQlcCgkJCQkJCQkJCVwKCS8qCQkJCQkJCQlcCgkgKiBzcGluIGxvY2svdW5sb2Nr
IHByb3ZpZGUgdGhlIG5lZWRlZCBzbXBfbWIoKSBiZWZvcmUvYWZ0ZXIJXAoJICovCQkJCQkJCQlc
CglhdG9taWNfb3BzX2xvY2soX19mbGFncyk7CQkJCQlcCglfcHJldl8gPSAqX3BfOwkJCQkJCQlc
CglpZiAoX3ByZXZfID09IF9vXykJCQkJCQlcCgkJKl9wXyA9IF9uXzsJCQkJCQlcCglhdG9taWNf
b3BzX3VubG9jayhfX2ZsYWdzKTsKCkFub3RoZXIgcXVlc3Rpb24gYWJvdXQgdGhlIG5hbWluZzog
YXJjaF9jbXB4Y2hnX3JlbGF4ZWQoKSBpbXBsZW1lbnRlZCBpZgpDT05GSUdfQVJDX0hBU19MTFND
IGlzIGNvbmZpZ3VyZWQgYW5kIGFyY2hfY21weGNoZygpIGRlZmluZWQgZm9yIHRoZSByZXN0LgpB
cmUgdGhlcmUgYW55IHJlYXNvbnMgZm9yIGRpZmZlcmVuY2UgbmFtZXMgPwoKQXMgSSBjaGVja2Vk
LCBTeW5vcHN5cyBoYXMgcmVsZWFzZWQgNjRiaXQgQVJDIHByb2Nlc3NvcnMgKEhTNjYvSFM2OCks
IGJ1dApJIGRvbid0IGtub3cgdGhlIHN0YXR1cyBvZiBMaW51eCBrZXJuZWwgc3VwcG9ydC4KCj4g
LVZpbmVldAoKUmVnYXJkcywKd3VxaWFuZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtc25wcy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4LXNucHMt
YXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1zbnBzLWFyYwo=
