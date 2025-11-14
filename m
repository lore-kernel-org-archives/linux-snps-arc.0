Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41F46CE8D4B
	for <linux-snps-arc@archiver.kernel.org>; Fri, 14 Nov 2025 15:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jumfp8C0fB1nHdQT/K1INLLeVklZzianGoZXFclv8wU=; b=BDFExvbMEUllHL
	x//GeOky0xl2vF73tS81hkIYSqcTT4hqb01E9PHm29DAv7HKxkCGSVBUr4GOaxrO0wZCICAkNTJj+
	JJYMmldyFhCjbXGrT5hp5NpzFn803KzaqLmM1b0UPHkQ9wOoq+9rfVCCiHfx8jWHrzrFHaduXZwQZ
	vbUubRYvc61kCcIOlawfOJJS6QK43k3kxLz0C2ax1uBWtRpqOEnRAa13YbDqxpItJMbpZUiV2M6Oa
	8WZRlnFYCf+tUXwbdRwQd97sPUu7b9CgMoHX7iSRPsHb6FK3XIogxHgn3MmCczvL3qa4INGR14XtB
	iucOpRfK6caBSsTSotdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJwA2-0000000CdPQ-3mDy;
	Fri, 14 Nov 2025 15:56:30 +0000
Received: from out-188.mta0.migadu.com ([91.218.175.188])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJwA1-0000000CdNb-05OE
	for linux-snps-arc@lists.infradead.org;
	Fri, 14 Nov 2025 15:56:30 +0000
Message-ID: <fc08c1a8-f469-43f1-93c0-7fcd2b1c477c@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1763135775;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CKysolUqeVjYcgMrPs/ejmALi8P8XvxL85H5NRIJlY8=;
	b=g/B/dUgxQJEHGDks1FfISlakIsod43sd1FWkLD53noWx1K51GzX035cGzeBE8Edv7rjSas
	eRoApfQqE5kMQiTGhq6jTv0fxdja6UCOlpRx6Wco9NKN4CqyYrziO6a9K/p051HV0WDT14
	Mhzi2WwkSotO4sbe8SdPRtkBrzsJI8U=
Date: Fri, 14 Nov 2025 23:55:11 +0800
MIME-Version: 1.0
Subject: Re: [PATCH 3/7] loongarch: mm: enable MMU_GATHER_RCU_TABLE_FREE
To: Huacai Chen <chenhuacai@kernel.org>
Cc: will@kernel.org, aneesh.kumar@kernel.org, npiggin@gmail.com,
 peterz@infradead.org, dev.jain@arm.com, akpm@linux-foundation.org,
 david@redhat.com, ioworker0@gmail.com, linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-um@lists.infradead.org,
 Qi Zheng <zhengqi.arch@bytedance.com>, WANG Xuerui <kernel@xen0n.name>
References: <cover.1763117269.git.zhengqi.arch@bytedance.com>
 <146b5a0207052b38d04caac6b20756a61c2189b3.1763117269.git.zhengqi.arch@bytedance.com>
 <CAAhV-H6HL+mXeuLqgo5BOVBB0_GHTUmn7_7NTzdUpLX7NbuQ5w@mail.gmail.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Qi Zheng <qi.zheng@linux.dev>
In-Reply-To: <CAAhV-H6HL+mXeuLqgo5BOVBB0_GHTUmn7_7NTzdUpLX7NbuQ5w@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_075629_233878_EA1AC296 
X-CRM114-Status: GOOD (  16.08  )
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

SGkgSHVhY2FpLAoKT24gMTEvMTQvMjUgMTA6MTcgUE0sIEh1YWNhaSBDaGVuIHdyb3RlOgo+IEhp
LCBRaSBaaGVuZywKPiAKPiBXZSB1c3VhbGx5IHVzZSBMb29uZ0FyY2ggcmF0aGVyIHRoYW4gbG9v
bmdhcmNoLCBidXQgaWYgeW91IHdhbnQgdG8KPiBrZWVwIGNvbnNpc3RlbmN5IGZvciBhbGwgcGF0
Y2hlcywganVzdCBkbyBpdC4KCk9LLCB3aWxsIGNoYW5nZSB0byB1c2UgTG9vbmdBcmNoLgoKPiAK
PiBPbiBGcmksIE5vdiAxNCwgMjAyNSBhdCA3OjEz4oCvUE0gUWkgWmhlbmcgPHFpLnpoZW5nQGxp
bnV4LmRldj4gd3JvdGU6Cj4+Cj4+IEZyb206IFFpIFpoZW5nIDx6aGVuZ3FpLmFyY2hAYnl0ZWRh
bmNlLmNvbT4KPj4KPj4gT24gYSA2NC1iaXQgc3lzdGVtLCBtYWR2aXNlKE1BRFZfRE9OVE5FRUQp
IG1heSBjYXVzZSBhIGxhcmdlIG51bWJlciBvZgo+PiBlbXB0eSBQVEUgcGFnZSB0YWJsZSBwYWdl
cyAoc3VjaCBhcyAxMDBHQispLiBUbyByZXNvbHZlIHRoaXMgcHJvYmxlbSwKPj4gZmlyc3QgZW5h
YmxlIE1NVV9HQVRIRVJfUkNVX1RBQkxFX0ZSRUUgdG8gcHJlcGFyZSBmb3IgZW5hYmxpbmcgdGhl
Cj4+IFBUX1JFQ0xBSU0gZmVhdHVyZSwgd2hpY2ggcmVzb2x2ZXMgdGhpcyBwcm9ibGVtLgo+Pgo+
PiBTaWduZWQtb2ZmLWJ5OiBRaSBaaGVuZyA8emhlbmdxaS5hcmNoQGJ5dGVkYW5jZS5jb20+Cj4+
IENjOiBIdWFjYWkgQ2hlbiA8Y2hlbmh1YWNhaUBrZXJuZWwub3JnPgo+PiBDYzogV0FORyBYdWVy
dWkgPGtlcm5lbEB4ZW4wbi5uYW1lPgo+PiAtLS0KPj4gICBhcmNoL2xvb25nYXJjaC9LY29uZmln
ICAgICAgICAgICAgICAgfCAxICsKPj4gICBhcmNoL2xvb25nYXJjaC9pbmNsdWRlL2FzbS9wZ2Fs
bG9jLmggfCA2ICsrKystLQo+PiAgIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9sb29uZ2FyY2gvS2NvbmZpZyBi
L2FyY2gvbG9vbmdhcmNoL0tjb25maWcKPj4gaW5kZXggNWIxMTE2NzMzZDg4MS4uM2JmMmYyYTlj
ZDY0NyAxMDA2NDQKPj4gLS0tIGEvYXJjaC9sb29uZ2FyY2gvS2NvbmZpZwo+PiArKysgYi9hcmNo
L2xvb25nYXJjaC9LY29uZmlnCj4+IEBAIC0yMTAsNiArMjEwLDcgQEAgY29uZmlnIExPT05HQVJD
SAo+PiAgICAgICAgICBzZWxlY3QgVVNFUl9TVEFDS1RSQUNFX1NVUFBPUlQKPj4gICAgICAgICAg
c2VsZWN0IFZEU09fR0VUUkFORE9NCj4+ICAgICAgICAgIHNlbGVjdCBaT05FX0RNQTMyCj4+ICsg
ICAgICAgc2VsZWN0IE1NVV9HQVRIRVJfUkNVX1RBQkxFX0ZSRUUKPiBQbGVhc2UgdXNlIGFscGhh
LWJldGljYWwgb3JkZXIuCgpPSywgd2lsbCBkby4KCj4gCj4+Cj4+ICAgY29uZmlnIDMyQklUCj4+
ICAgICAgICAgIGJvb2wKPj4gZGlmZiAtLWdpdCBhL2FyY2gvbG9vbmdhcmNoL2luY2x1ZGUvYXNt
L3BnYWxsb2MuaCBiL2FyY2gvbG9vbmdhcmNoL2luY2x1ZGUvYXNtL3BnYWxsb2MuaAo+PiBpbmRl
eCAxYzYzYTlkOWE2ZDM1Li4wNTM5ZDA0YmYxNTI1IDEwMDY0NAo+PiAtLS0gYS9hcmNoL2xvb25n
YXJjaC9pbmNsdWRlL2FzbS9wZ2FsbG9jLmgKPj4gKysrIGIvYXJjaC9sb29uZ2FyY2gvaW5jbHVk
ZS9hc20vcGdhbGxvYy5oCj4+IEBAIC03OSw3ICs3OSw4IEBAIHN0YXRpYyBpbmxpbmUgcG1kX3Qg
KnBtZF9hbGxvY19vbmUoc3RydWN0IG1tX3N0cnVjdCAqbW0sIHVuc2lnbmVkIGxvbmcgYWRkcmVz
cykKPj4gICAgICAgICAgcmV0dXJuIHBtZDsKPj4gICB9Cj4+Cj4+IC0jZGVmaW5lIF9fcG1kX2Zy
ZWVfdGxiKHRsYiwgeCwgYWRkcikgICBwbWRfZnJlZSgodGxiKS0+bW0sIHgpCj4+ICsjZGVmaW5l
IF9fcG1kX2ZyZWVfdGxiKHRsYiwgeCwgYWRkcikgICBcCj4+ICsgICAgICAgdGxiX3JlbW92ZV9w
dGRlc2MoKHRsYiksIHZpcnRfdG9fcHRkZXNjKHgpKQo+IEkgdGhpbmsgd2UgY2FuIGRlZmluZSBp
dCBpbiBvbmUgbGluZS4KCndpbGwgZG8uCgo+IAo+Pgo+PiAgICNlbmRpZgo+Pgo+PiBAQCAtOTks
NyArMTAwLDggQEAgc3RhdGljIGlubGluZSBwdWRfdCAqcHVkX2FsbG9jX29uZShzdHJ1Y3QgbW1f
c3RydWN0ICptbSwgdW5zaWduZWQgbG9uZyBhZGRyZXNzKQo+PiAgICAgICAgICByZXR1cm4gcHVk
Owo+PiAgIH0KPj4KPj4gLSNkZWZpbmUgX19wdWRfZnJlZV90bGIodGxiLCB4LCBhZGRyKSAgIHB1
ZF9mcmVlKCh0bGIpLT5tbSwgeCkKPj4gKyNkZWZpbmUgX19wdWRfZnJlZV90bGIodGxiLCB4LCBh
ZGRyKSAgIFwKPj4gKyAgICAgICB0bGJfcmVtb3ZlX3B0ZGVzYygodGxiKSwgdmlydF90b19wdGRl
c2MoeCkpCj4gVGhlIHNhbWUuCj4gCj4gT3RoZXIgcGF0Y2hlcyBoYXZlIHRoZSBzYW1lIHByb2Js
ZW0uCgpHb3QgaXQsIHdpbGwgY29udmVydCB0aGVtIGFsbCB0byB0aGUgb25lLWxpbmUgdHlwZS4K
ClRoYW5rcywKUWkKCj4gCj4gSHVhY2FpCj4gCj4+Cj4+ICAgI2VuZGlmIC8qIF9fUEFHRVRBQkxF
X1BVRF9GT0xERUQgKi8KPj4KPj4gLS0KPj4gMi4yMC4xCj4+CgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtc25wcy1hcmMgbWFpbGluZyBsaXN0
CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBzLWFyYwo=
