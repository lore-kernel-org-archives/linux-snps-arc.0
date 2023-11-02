Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AB71C4332F
	for <linux-snps-arc@archiver.kernel.org>; Thu,  2 Nov 2023 04:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R3u9slZFndUw7yEsVCsBn2ZhTIxa52poPNd6w6prB+k=; b=nz+km6/fOqtJ83
	n0f8HEB0jXRfVg8KUj1dNkJiAwa980aABddr7BJsEUTf6F1aVeB/fSDjghdFdmCgGaZfkUGiajRa1
	pX14DcmXir1L0jKICSYP0h4ztC3uGN7NABZzcOFNSlBgu2zjDiv4dxe7W2RYVsLi8doV3k7xjnDoX
	vb1x+gmB1SWq/UJlPC12mBf/VJnthv/bBOnlHLRBtmes9l3XbqaAb4ay/ZqsHa9LuxJRysTstH3io
	7SMLAxRx2aqseb4bHFBTcFWgiiVEXYXSbn2EGhdiVEvq4mbuZApF1KsyvmuYR/3dADTsOoLnQPvPg
	YqTSF6ywzl9ZSx+/W9Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyPhr-008ivB-1g;
	Thu, 02 Nov 2023 04:53:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyPhl-008itl-2k
	for linux-snps-arc@lists.infradead.org;
	Thu, 02 Nov 2023 04:53:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8162B61342;
	Thu,  2 Nov 2023 04:53:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80D2AC433C7;
	Thu,  2 Nov 2023 04:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698900796;
	bh=b0KGNE6x/h29Z2T8T9S2Xy4wGWhLbh3W04APGfGzXzQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JVICs0ohKtVqpPsZEUHAH/fC/mp0V4N+IZTopM66fevT3qcb3BJ5+y6zHsR/7XHN7
	 r1A23ATKpGXmIoFHPf99bvusJkCp5H0+Bx8dXka2V771oaLVY5eJTzlaMBWxxlicfi
	 x7uCHvvL5OW6RkXE/PHckvdthWc7Wn8ax+ER7lKLqQpDLGMgTabRnARWY4/fXHzd0q
	 5PtxJEY7b+2gaHzuXuD63nxA996fnxhHCi/s7GCkdrutVCgZhdB2v0pxtJa1OuUEYk
	 HQ/meDg/vWWLh3IOSW1H3y+CmP9D+Ks7B+juio9iEDciDU90oRQEaGF4Ryiq9UN4jb
	 zBc3gFAfzL2DQ==
Message-ID: <67f536b5-1b42-49b1-b219-f5fd8906495d@kernel.org>
Date: Wed, 1 Nov 2023 21:53:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] locking/atomic: openrisc: use
 generic_cmpxchg[64]_local for arch_cmpxchg[64]_local
Content-Language: en-US
To: "wuqiang.matt" <wuqiang.matt@bytedance.com>,
 Vineet Gupta <vgupta@kernel.org>,
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
From: Vineet Gupta <vgupta@kernel.org>
In-Reply-To: <7836be7b-ed41-4e0f-8983-9603bd6fcde0@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231101_215317_997591_BC1325DE 
X-CRM114-Status: GOOD (  21.01  )
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

CgpPbiAxMC8yOS8yMyAyMDo0MSwgd3VxaWFuZy5tYXR0IHdyb3RlOgo+Pj4+Cj4+Pj4gYXJjaF9j
bXB4Y2hnX3JlbGF4ZWQ6Cj4+Pj4gLi4uCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIHN3aXRjaChz
aXplb2YoKF9wXykpKSB7Cj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGNhc2UgNDoKPj4+PiAuLi4u
Cj4+Pj4KPj4+PiBhcmNoX2NtcHhjaGc6Cj4+Pj4gLi4uCj4+Pj4gwqDCoMKgwqBCVUlMRF9CVUdf
T04oc2l6ZW9mKF9wXykgIT0gNCk7Cj4+Pj4gLi4uCj4+Pj4KPj4+PiBfcCBpcyB0aGUgYWRkcmVz
cyBwb2ludGVyLCBzbyBJJ20gdGhpbmtpbmcgaXQncyBhIHR5cG8gYnV0IEkgY291bGRuJ3QKPj4+
PiB5ZXQgY29uZmlybS4gVGhlcmUgaXMgbm90IG11Y2ggYWJvdXQgYXJjIHByb2Nlc3NvcnMgaW4g
dGhlIHdlYiA6KAo+Pj4gSG1tLCBpbmRlZWQuIFRoaXMgc2VlbXMgbGlrZSBhIGJ1ZyBidXQgaXQg
ZGVwZW5kcyBvbiB0aGUgJ2xsb2NrwqAgJTAsIAo+Pj4gWyUxXScKPj4+IGNhbiB0YWtlIGEgMzJi
aXQgYWRkcmVzcyBvciAzMmJpdCBkYXRhIHJlZ2lzdGVyLiBVc3VhbGx5IGl0IHNob3VsZAo+Pj4g
Y2hlY2sgdGhlIHNpemUgb2YgZGF0YSwgYnV0IG5lZWQgdG8gY2hlY2sgd2l0aCBJU0EgbWFudWFs
Lgo+Pj4KPj4+IFZpbmVldCwgY2FuIHlvdSBjaGVjayB0aGlzIHN1c3BpY2lvdXMgYnVnPwo+Pgo+
PiBBUkN2MiBpcyBhIDMyLWJpdCBJU0EgYW5kIExMT0NLL1NDT05EIHdvcmsgb24gMzItYml0IGRh
dGEuCj4+IFNvIHRoZSBwb2ludGVycyB3aWxsIGJlIDMyLWJpdCBhbnl3YXlzLiBJcyB0aGUgaXNz
dWUgdGhhdCAKPj4gcG9pbnRlci9jbXB4Y2hnIG9wZXJhdGlvbiBjb3VsZCBiZSBvbiBhIHNtYWxs
ZXIgZGF0YSB0eXBlID8KPgo+IEZvciBBUkN2MiB3aXRoIENPTkZJR19BUkNfSEFTX0xMU0MsIGJl
dHRlciBhZGQgdGhlIGRhdGEgc2l6ZSBjaGVja2luZyBhbmQKPiBvbmx5IHBlcm1pdCAzMmJpdCBk
YXRhIHNpemUuIEV2ZW4gZm9yIDMyLWJpdCBzeXN0ZW0sIGRhdGEgc2hvdWxkIGNhbiBiZQo+IDY0
Yml0ICdsb25nIGxvbmcnLgoKUmlnaHQsIG1ha2VzIHNlbnNlLiBDYW4geW91IHNlbmQgYSBwYXRj
aCA/Cgo+Cj4gQW5kIEluIHRoZSBjYXNlIHRoYXQgQ09ORklHX0FSQ19IQVNfTExTQyBpcyB1bmRl
ZmluZWQsIGluIAo+IGFyY2hfY21weGNoZzogdGhlCj4gcG9pbnRlciBzaXplIGNoZWNraW5nIGlz
IHVubmVjZXNzYXJ5LCBzaW5jZSBpdCdzIHVzaW5nIHNwaW5sb2NrIAo+IGludGVybmFsbHk6CgpD
b3JyZWN0LCBJIGhhZCB0aGUgc2FtZSB0aG91Z2h0LgoKPgo+IGh0dHBzOi8vZWxpeGlyLmJvb3Rs
aW4uY29tL2xpbnV4L3Y2LjYtcmM3L3NvdXJjZS9hcmNoL2FyYy9pbmNsdWRlL2FzbS9jbXB4Y2hn
LmgjTDYwOiAKPgo+IMKgwqDCoMKgQlVJTERfQlVHX09OKHNpemVvZihfcF8pICE9IDQpO8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKPiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKPiDC
oMKgwqDCoC8qwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgXAo+IMKgwqDCoMKgICogc3BpbiBsb2NrL3VubG9jayBwcm92aWRlIHRo
ZSBuZWVkZWQgc21wX21iKCkgYmVmb3JlL2FmdGVywqDCoMKgIFwKPiDCoMKgwqDCoCAqL8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IFwKPiDCoMKgwqDCoGF0b21pY19vcHNfbG9jayhfX2ZsYWdzKTvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4gwqDCoMKgwqBfcHJldl8gPSAqX3BfO8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcCj4gwqDCoMKgwqBp
ZiAoX3ByZXZfID09IF9vXynCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIFwKPiDCoMKgwqDCoMKgwqDCoCAqX3BfID0gX25fO8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXAo+IMKgwqDCoMKgYXRvbWljX29wc191bmxvY2so
X19mbGFncyk7CgpDYW4geW91IGRvIHRoYXQgZml4IGluIHNhbWUgcGF0Y2ggYXMgd2VsbCA/Cgo+
IEFub3RoZXIgcXVlc3Rpb24gYWJvdXQgdGhlIG5hbWluZzogYXJjaF9jbXB4Y2hnX3JlbGF4ZWQo
KSBpbXBsZW1lbnRlZCBpZgo+IENPTkZJR19BUkNfSEFTX0xMU0MgaXMgY29uZmlndXJlZCBhbmQg
YXJjaF9jbXB4Y2hnKCkgZGVmaW5lZCBmb3IgdGhlIAo+IHJlc3QuCj4gQXJlIHRoZXJlIGFueSBy
ZWFzb25zIGZvciBkaWZmZXJlbmNlIG5hbWVzID8KClllcyB0aGUgYXRvbWljcyBBUEkgY29uc2lz
dHMgb2YgX3JlbGF4ZWQsIF9hY3F1aXJlLCBfcmVsZWFzZSBhbmQgdW5hZG9ybmVkLgpfcmVsYXhl
ZCBpcyB0aGUgbW9zdCBlZmZpY2llbnQsIHdpdGggcmVzdCBoYXZpbmcgc29tZSBleHRyYSBiYXJy
aWVycy4KSWYgYXJjaCBwcm92aWRlcyBfcmVsYXhlZCwgZ2VuZXJpYyBjb2RlIGNhbiBjcmVhdGUg
dGhlIHJlc3QgLSBhc3N1bWluZyAKYXJjaCBoYXJkd2FyZSBjYW4gc3VwcG9ydCB0aGUgcmVsYXhl
ZCBvbmVzLgpUaGF0IGlzIHRydWUgZm9yIExMU0MuCgpIb3dldmVyIGZvciAhTExTQywgc3Bpbmxv
Y2sgdmVyc2lvbnMgYWxyZWFkeSBoYXZlIGZ1bGwgYmFycmllcnMgZHVlIHRvIApzcGlubG9jaywg
c28gcmVsYXhlZCB2YXJpYW50IGRvZXNuJ3QgbWFrZSBzZW5zZS4KCj4KPiBBcyBJIGNoZWNrZWQs
IFN5bm9wc3lzIGhhcyByZWxlYXNlZCA2NGJpdCBBUkMgcHJvY2Vzc29ycyAoSFM2Ni9IUzY4KSwg
YnV0Cj4gSSBkb24ndCBrbm93IHRoZSBzdGF0dXMgb2YgTGludXgga2VybmVsIHN1cHBvcnQuCgpZ
ZXMgdGhlcmUncyBhbiBpbnRlcm5hbCBBUkM2NCBwb3J0IHJ1bm5pbmcgYnV0IGl0IGlzIG5vdCBy
ZWFkeSBmb3IgCnVwc3RyZWFtaW5nIHlldC4KCi1WaW5lZXQKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdAps
aW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1hcmMK
