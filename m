Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 050F2C4167D
	for <linux-snps-arc@archiver.kernel.org>; Thu,  2 Nov 2023 09:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6wEKkyclFuiimSWCql9lxa4yNm/8mWq7c4nywleEqzY=; b=H+sO0JObjV1Kfd
	Rk2qhzqmESIXlxgrhgiC2mIEYQB2y/3IgNorCQ3xKGztEL93kq9CWUZCWZWzXCnWf6B5R+OHI/rQY
	Wf9AD5Qhk3uh68Xp4X9IWzEbwNP2+Ybk/FF2YxGYFJ6B5fuWL0UNXdHZEKEKEV/AWVYjVDlPe0i/D
	BMr+ba0wOL1lLwvLRsEoe4jGiePfIktPGKsEonlYtfyMl8tlCDIQ0BO3hybouW3TDtB5AIvWwDrrU
	hVntVeGXljBGdXmW/2O6KkDm5wd7RemHs/9ST9TgRLpFwTfE9XvyhIl5yptQIwgpUmTHxKA3lAZaa
	gn3hWDI6lNrxNTidoA2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyU2O-00926i-0o;
	Thu, 02 Nov 2023 09:30:52 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyU2I-00925S-0Y
	for linux-snps-arc@lists.infradead.org;
	Thu, 02 Nov 2023 09:30:50 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1cc131e52f1so15158105ad.0
        for <linux-snps-arc@lists.infradead.org>; Thu, 02 Nov 2023 02:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1698917439; x=1699522239; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LOcfCrDkuhZUmX1+BonF5HFJ3qtHRcdHUWybtTWqJQM=;
        b=fj2sESzr/Me7zUJoFeB2QtQ3S7lc5xWyZtGdtaP4fAwhy029ykYDfI+2EOXvheFuWf
         G6EQzTmNSS2CPxk7tlkIZk82B40dN10/0jnixdl+UaPWt0uej8nw74zZ54ZQnFbqCj16
         duUxl9SZyEAD6rzLSZUvazfB2iFKvNQhq1u0kaEjgJTfwI4kquRbmOmoDqUPPzagj5Sd
         SL+qC6z0+2RPjiBJEkCsUdbM0XIsNruwIS+I8Os4z0r3CPys5QeFZzbyQThNgU0oqjAv
         4h7uJtORFieOu6o0MW43HHNwu0NEVk8QmILGZW0QVMWq8400al4y+PTisgpsRV9VhWjH
         qBhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698917439; x=1699522239;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LOcfCrDkuhZUmX1+BonF5HFJ3qtHRcdHUWybtTWqJQM=;
        b=aa281F0ElcvLmx2YcidmDaDyRNiIof2OTqoN9ajXv7l4Bzsq+uGKgAAHuQUzTj0Ly8
         XNEzrXbNDouesrTChdKmlFZgRJiNY+q45YWKZjRaHiY9UMgl7m0vb915tSEQuMX0WCHI
         b0psBPGo0tcaBNWSY1MQ0kZNLTfpOs2hY4qt/tYluSkwC80MAY+HoYSrgRSMxe3talRL
         WhGRQF/5v4FHd7aeO6viBlOBDZpau56gBssMYzhpTJP09tTehbvTCR2U8B1E0gsds4e6
         0DDlokIo8V0L/uoAUXzLmQqFiIQzEGbBfTHNso++4NpnB368f+jEDXuAJJv1LZ3ae+4x
         Z0Kg==
X-Gm-Message-State: AOJu0YzbXSGAM2c/s99DmoRwNh7Nwu9+KIAfTWkWuHGj8lgmUWidsSC9
	KgxBVZ52/NTp13Dg7M9gYBVAbA==
X-Google-Smtp-Source: AGHT+IFeeglhdb271Gl7rcRT410vB2+Mle9CoKzLKqQ8MknEa/nQhB2EebX9eYmPtBlmsb7UKfBxkQ==
X-Received: by 2002:a17:903:2347:b0:1cc:4625:74e2 with SMTP id c7-20020a170903234700b001cc462574e2mr7940931plh.24.1698917439414;
        Thu, 02 Nov 2023 02:30:39 -0700 (PDT)
Received: from [192.168.6.6] ([203.208.167.147])
        by smtp.gmail.com with ESMTPSA id u7-20020a170902e80700b001c444f185b4sm2661736plg.237.2023.11.02.02.30.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Nov 2023 02:30:39 -0700 (PDT)
Message-ID: <3c7cc279-d5ea-4071-ba68-88563a6a0877@bytedance.com>
Date: Thu, 2 Nov 2023 17:30:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] locking/atomic: openrisc: use
 generic_cmpxchg[64]_local for arch_cmpxchg[64]_local
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
Content-Language: en-US
From: "wuqiang.matt" <wuqiang.matt@bytedance.com>
Autocrypt: addr=wuqiang.matt@bytedance.com; keydata=
 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
 4mCJUdEkdwCS
In-Reply-To: <67f536b5-1b42-49b1-b219-f5fd8906495d@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231102_023046_233056_3455B8D1 
X-CRM114-Status: GOOD (  23.25  )
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

T24gMjAyMy8xMS8yIDEyOjUzLCBWaW5lZXQgR3VwdGEgd3JvdGU6Cj4gCj4gCj4gT24gMTAvMjkv
MjMgMjA6NDEsIHd1cWlhbmcubWF0dCB3cm90ZToKPj4+Pj4KPj4+Pj4gYXJjaF9jbXB4Y2hnX3Jl
bGF4ZWQ6Cj4+Pj4+IC4uLgo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgc3dpdGNoKHNpemVvZigo
X3BfKSkpIHsKPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGNhc2UgNDoKPj4+Pj4gLi4uLgo+Pj4+
Pgo+Pj4+PiBhcmNoX2NtcHhjaGc6Cj4+Pj4+IC4uLgo+Pj4+PiDCoMKgwqDCoEJVSUxEX0JVR19P
TihzaXplb2YoX3BfKSAhPSA0KTsKPj4+Pj4gLi4uCj4+Pj4+Cj4+Pj4+IF9wIGlzIHRoZSBhZGRy
ZXNzIHBvaW50ZXIsIHNvIEknbSB0aGlua2luZyBpdCdzIGEgdHlwbyBidXQgSSBjb3VsZG4ndAo+
Pj4+PiB5ZXQgY29uZmlybS4gVGhlcmUgaXMgbm90IG11Y2ggYWJvdXQgYXJjIHByb2Nlc3NvcnMg
aW4gdGhlIHdlYiA6KAo+Pj4+IEhtbSwgaW5kZWVkLiBUaGlzIHNlZW1zIGxpa2UgYSBidWcgYnV0
IGl0IGRlcGVuZHMgb24gdGhlICdsbG9ja8KgICUwLCBbJTFdJwo+Pj4+IGNhbiB0YWtlIGEgMzJi
aXQgYWRkcmVzcyBvciAzMmJpdCBkYXRhIHJlZ2lzdGVyLiBVc3VhbGx5IGl0IHNob3VsZAo+Pj4+
IGNoZWNrIHRoZSBzaXplIG9mIGRhdGEsIGJ1dCBuZWVkIHRvIGNoZWNrIHdpdGggSVNBIG1hbnVh
bC4KPj4+Pgo+Pj4+IFZpbmVldCwgY2FuIHlvdSBjaGVjayB0aGlzIHN1c3BpY2lvdXMgYnVnPwo+
Pj4KPj4+IEFSQ3YyIGlzIGEgMzItYml0IElTQSBhbmQgTExPQ0svU0NPTkQgd29yayBvbiAzMi1i
aXQgZGF0YS4KPj4+IFNvIHRoZSBwb2ludGVycyB3aWxsIGJlIDMyLWJpdCBhbnl3YXlzLiBJcyB0
aGUgaXNzdWUgdGhhdCBwb2ludGVyL2NtcHhjaGcgCj4+PiBvcGVyYXRpb24gY291bGQgYmUgb24g
YSBzbWFsbGVyIGRhdGEgdHlwZSA/Cj4+Cj4+IEZvciBBUkN2MiB3aXRoIENPTkZJR19BUkNfSEFT
X0xMU0MsIGJldHRlciBhZGQgdGhlIGRhdGEgc2l6ZSBjaGVja2luZyBhbmQKPj4gb25seSBwZXJt
aXQgMzJiaXQgZGF0YSBzaXplLiBFdmVuIGZvciAzMi1iaXQgc3lzdGVtLCBkYXRhIHNob3VsZCBj
YW4gYmUKPj4gNjRiaXQgJ2xvbmcgbG9uZycuCj4gCj4gUmlnaHQsIG1ha2VzIHNlbnNlLiBDYW4g
eW91IHNlbmQgYSBwYXRjaCA/CgpPa2F5LCBJIHdpbGwuCgo+Pgo+PiBBbmQgSW4gdGhlIGNhc2Ug
dGhhdCBDT05GSUdfQVJDX0hBU19MTFNDIGlzIHVuZGVmaW5lZCwgaW4gYXJjaF9jbXB4Y2hnOiB0
aGUKPj4gcG9pbnRlciBzaXplIGNoZWNraW5nIGlzIHVubmVjZXNzYXJ5LCBzaW5jZSBpdCdzIHVz
aW5nIHNwaW5sb2NrIGludGVybmFsbHk6Cj4gCj4gQ29ycmVjdCwgSSBoYWQgdGhlIHNhbWUgdGhv
dWdodC4KPiAKPj4KPj4gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjYuNi1yYzcv
c291cmNlL2FyY2gvYXJjL2luY2x1ZGUvYXNtL2NtcHhjaGcuaCNMNjA6Cj4+IMKgwqDCoMKgQlVJ
TERfQlVHX09OKHNpemVvZihfcF8pICE9IDQpO8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIFwKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4+IMKgwqDCoMKgLyrCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4+IMKg
wqDCoMKgICogc3BpbiBsb2NrL3VubG9jayBwcm92aWRlIHRoZSBuZWVkZWQgc21wX21iKCkgYmVm
b3JlL2FmdGVywqDCoMKgIFwKPj4gwqDCoMKgwqAgKi/CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4+IMKgwqDCoMKgYXRvbWlj
X29wc19sb2NrKF9fZmxhZ3MpO8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IFwKPj4gwqDCoMKgwqBfcHJldl8gPSAqX3BfO8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4+IMKgwqDCoMKgaWYgKF9wcmV2XyA9PSBfb18p
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4+IMKgwqDC
oMKgwqDCoMKgICpfcF8gPSBfbl87wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBcCj4+IMKgwqDCoMKgYXRvbWljX29wc191bmxvY2soX19mbGFncyk7Cj4gCj4g
Q2FuIHlvdSBkbyB0aGF0IGZpeCBpbiBzYW1lIHBhdGNoIGFzIHdlbGwgPwoKU3VyZS4KCj4+IEFu
b3RoZXIgcXVlc3Rpb24gYWJvdXQgdGhlIG5hbWluZzogYXJjaF9jbXB4Y2hnX3JlbGF4ZWQoKSBp
bXBsZW1lbnRlZCBpZgo+PiBDT05GSUdfQVJDX0hBU19MTFNDIGlzIGNvbmZpZ3VyZWQgYW5kIGFy
Y2hfY21weGNoZygpIGRlZmluZWQgZm9yIHRoZSByZXN0Lgo+PiBBcmUgdGhlcmUgYW55IHJlYXNv
bnMgZm9yIGRpZmZlcmVuY2UgbmFtZXMgPwo+IAo+IFllcyB0aGUgYXRvbWljcyBBUEkgY29uc2lz
dHMgb2YgX3JlbGF4ZWQsIF9hY3F1aXJlLCBfcmVsZWFzZSBhbmQgdW5hZG9ybmVkLgo+IF9yZWxh
eGVkIGlzIHRoZSBtb3N0IGVmZmljaWVudCwgd2l0aCByZXN0IGhhdmluZyBzb21lIGV4dHJhIGJh
cnJpZXJzLgo+IElmIGFyY2ggcHJvdmlkZXMgX3JlbGF4ZWQsIGdlbmVyaWMgY29kZSBjYW4gY3Jl
YXRlIHRoZSByZXN0IC0gYXNzdW1pbmcgYXJjaCAKPiBoYXJkd2FyZSBjYW4gc3VwcG9ydCB0aGUg
cmVsYXhlZCBvbmVzLgoKRGVmaW5pdGVseSBZZXMhIFRoZSBnZW5lcmljIGNtcHhjaGcgd2lsbCBw
cmVmZXIgYXJjaF9jbXB4Y2hnX3JlbGF4ZWQgcmF0aGVyCnRoYW4gYXJjaF9jbXB4Y2hnLgoKPiBU
aGF0IGlzIHRydWUgZm9yIExMU0MuCj4gCj4gSG93ZXZlciBmb3IgIUxMU0MsIHNwaW5sb2NrIHZl
cnNpb25zIGFscmVhZHkgaGF2ZSBmdWxsIGJhcnJpZXJzIGR1ZSB0byAKPiBzcGlubG9jaywgc28g
cmVsYXhlZCB2YXJpYW50IGRvZXNuJ3QgbWFrZSBzZW5zZS4KPiAKPj4KPj4gQXMgSSBjaGVja2Vk
LCBTeW5vcHN5cyBoYXMgcmVsZWFzZWQgNjRiaXQgQVJDIHByb2Nlc3NvcnMgKEhTNjYvSFM2OCks
IGJ1dAo+PiBJIGRvbid0IGtub3cgdGhlIHN0YXR1cyBvZiBMaW51eCBrZXJuZWwgc3VwcG9ydC4K
PiAKPiBZZXMgdGhlcmUncyBhbiBpbnRlcm5hbCBBUkM2NCBwb3J0IHJ1bm5pbmcgYnV0IGl0IGlz
IG5vdCByZWFkeSBmb3IgdXBzdHJlYW1pbmcgCj4geWV0LgoKVGhhbmtzIGZvciB0aGUgdXBkYXRl
LgoKPiAtVmluZWV0CgpSZWdhcmRzLAp3dXFpYW5nCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgt
c25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
