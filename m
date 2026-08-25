Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5838C5DF9C
	for <linux-snps-arc@archiver.kernel.org>; Tue, 25 Aug 2026 03:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H3tgpcacJ04bjqZSA/nEIrwjXHpXFXCcWgBht61wiWU=; b=QlumfQwgBzg5lS
	Dqf6CiymkqTTN66Bw88azXOBvw5MIC/MQ0yqTlDbfSdPyPgHyEFNJoZkVQcBSsylfCKkwKN6bpZWu
	VjellVIjgf9VAc/LZkuK15mI7BC+NRvHJbmh1AtX3wejSNRHu4hf9UCZcy91GrvC4hJG5c8oarkD3
	3E+ObkQg7pQkOsiXt/rhghrmVKntBmoHcsdIId33TMih1iCF5G5TVzWpGlR2L+HW/shllfbMetAQx
	vkbT/znrQ3pVTNnh+srKH3RfZoIkfcOHeuqUXWI2+xDARieDdMjhRfd3OZtUyWQmX3XUprPXtekJG
	4m8rsYdKYJxrTZWkBOsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyhOp-000000004nP-252A;
	Tue, 25 Aug 2026 03:00:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyhOo-000000004nJ-2Tcx
	for linux-snps-arc@lists.infradead.org;
	Tue, 25 Aug 2026 03:00:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0FBF440F08;
	Tue, 25 Aug 2026 03:00:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C164F1F000E9;
	Tue, 25 Aug 2026 03:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787626829;
	bh=cPAE4cVboM5hv9hjOhe0T85AlNSvm0KsZadonc2+Dfg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=h9YL+qjt+Wq5n552AwwSzONHhIDT989J4+zgs+Gbk8zxo7E7B+auwiDDqD3rKDTSc
	 nGHrAf8u62MTlQYE+YLo2xUHnesKV4DUmED5YFNYn3XKcZoffGixwmRmbfG+vqGFGs
	 y3DOzxZuO5xpWn7/g4U/tRd+FxcJleyeKPTXG+uCG1/rvkgQBDvhz19q/kxUdNcGe7
	 YFY8XlAUbLcnitanNtDyQXwEMM9rAi6ha1hJBJuvxD05Z5DOil25fjEgPGqacJVGdr
	 OujmiWdSE8M7ATCxpUcRHVtsbGVr4cyk1FlbNoMjkaVIMe1U5Cmhm9Jw9XNSGID4lb
	 aNhuRy/VE2fSg==
Message-ID: <0b3af924-6e87-484c-be0e-11279e28d77b@kernel.org>
Date: Mon, 24 Aug 2026 20:00:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARC: check user addresses in unaligned access emulation
To: =?UTF-8?B?SsOpcsOpbXkgSmVhbg==?= <Jeremy.Jean@oss.cyber.gouv.fr>,
 Vineet Gupta <vgupta@kernel.org>
Cc: linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260824203740.3689400-2-Jeremy.Jean@oss.cyber.gouv.fr>
From: Vineet Gupta <vgupta@kernel.org>
Content-Language: en-US
In-Reply-To: <20260824203740.3689400-2-Jeremy.Jean@oss.cyber.gouv.fr>
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

T24gOC8yNC8yNiAxMzozNywgSsOpcsOpbXkgSmVhbiB3cm90ZToKPiBBUkM3MDAgcmFpc2VzIGFu
IGFsaWdubWVudCBleGNlcHRpb24gYmVmb3JlIGNoZWNraW5nIGFjY2VzcyBwZXJtaXNzaW9ucy4K
PiBDb25zZXF1ZW50bHksIGEgdXNlcnNwYWNlIGxvYWQgb3Igc3RvcmUgdXNpbmcgYSBtaXNhbGln
bmVkIGtlcm5lbCBhZGRyZXNzCj4gcmVhY2hlcyBtaXNhbGlnbmVkX2ZpeHVwKCkgYmVmb3JlIHRo
ZSBwcm9jZXNzb3IgcmVqZWN0cyBpdC4KCkhvdyBkbyB5b3Uga25vdyB0aGlzIGZvciBzdXJlLiBE
aWQgeW91IHJ1biBpbnRvIHRoaXMgaXNzdWUgeW91cnNlbGYgYW5kIAp3ZXJlIGFibGUgdG8gcHJv
dmUgdGhpcyBvcmRlcmluZy4KCkFuZCBldmVuIGlmIHlvdSBmb3VuZCBzb21lIGRvY3VtZW50YXRp
b24gY2FuIHlvdSBjb25maXJtIHRoaXMgdG8gYmUgCmhhcHBlbmluZyBvbiByZWFsIEFSQzcwMCBo
YXJkd2FyZS4KSSd2ZSBiZWVuIG1haW50YWluaW5nIEFSQyBmb3JldmVyIGFuZCBldmVuIGRvIEkg
ZG9uJ3QgaGF2ZSBhY2Nlc3MgdG8gCndvcmtpbmcgQVJDNzAwIHNpbGljb24uCgpJIGNhbiBzeW1w
YXRoaXplIHdpdGggeW91ciBuZWVkIHRvIHNlbmQgYSBmaXggYW5kIGl0IG1pZ2h0IGFjdHVhbGx5
IGJlIApjb3JyZWN0LgpCdXQgSSBjYW4ndCB0YWtlIGEgZml4IHRoYXQgdGhlb3JldGljYWxseSBm
aXhlcyBzb21ldGhpbmcgdy9vIApkZW1vbnN0cmF0aW5nIHdoYXQgcmVhbCBsaWZlIGNhc2UgaXQg
Y2F0ZXJzIHNvLgoKU28gTmFjaywgdW5sZXNzIHlvdSBoYXZlIG9uZSBvZiB0aGUgdmFsaWQgcmVh
c29ucyBhYm92ZS4KCi1WaW5lZXQKCj4gbWlzYWxpZ25lZF9maXh1cCgpIGRlY29kZXMgdGhlIGlu
c3RydWN0aW9uIGFuZCByZXBlYXRzIHRoZSBhY2Nlc3MgdXNpbmcKPiBieXRlIGxvYWRzIG9yIHN0
b3Jlcy4gVGhlc2UgYWNjZXNzZXMgcnVuIGluIGtlcm5lbCBtb2RlLCBhbmQgZXhjZXB0aW9uCj4g
dGFibGVzIG9ubHkgaGFuZGxlIGFjY2Vzc2VzIHRoYXQgZmF1bHQuIEEgbWFwcGVkIGtlcm5lbCBh
ZGRyZXNzIGlzCj4gdGhlcmVmb3JlIHJlYWQgb3Igd3JpdHRlbiB3aXRoIHN1cGVydmlzb3IgcGVy
bWlzc2lvbnMuCj4KPiBVc2UgYWNjZXNzX29rKCkgdG8gcmVqZWN0IGFkZHJlc3NlcyBvdXRzaWRl
IHRoZSB1c2VyIHJhbmdlIGJlZm9yZSBjYWxsaW5nCj4gdGhlIGhlbHBlcnMuIENoZWNrIHRoZSB3
aG9sZSAyLSBvciA0LWJ5dGUgcmFuZ2UgYW5kIHVzZSB0aGUgY2hlY2tlZCBhZGRyZXNzCj4gZm9y
IHRoZSBlbXVsYXRlZCBvcGVyYXRpb24uCj4KPiBGaXhlczogMmU2NTFlYTE1OTZiICgiQVJDOiBV
bmFsaWduZWQgYWNjZXNzIGVtdWxhdGlvbiIpCj4gQXNzaXN0ZWQtYnk6IENvZGV4OmdwdC1kYXli
cmVhay1ibHVlCj4gU2lnbmVkLW9mZi1ieTogSsOpcsOpbXkgSmVhbiA8SmVyZW15LkplYW5Ab3Nz
LmN5YmVyLmdvdXYuZnI+Cj4gLS0tCj4gICBhcmNoL2FyYy9rZXJuZWwvdW5hbGlnbmVkLmMgfCAy
MyArKysrKysrKysrKysrKysrKysrLS0tLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDE5IGluc2VydGlv
bnMoKyksIDQgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcmMva2VybmVsL3Vu
YWxpZ25lZC5jIGIvYXJjaC9hcmMva2VybmVsL3VuYWxpZ25lZC5jCj4gaW5kZXggM2IyZDhiMWJk
MjcxLi5mNjA3OWRjODlhNmQgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9hcmMva2VybmVsL3VuYWxpZ25l
ZC5jCj4gKysrIGIvYXJjaC9hcmMva2VybmVsL3VuYWxpZ25lZC5jCj4gQEAgLTEzMyw2ICsxMzMs
OCBAQCBpbnQgbm9fdW5hbGlnbmVkX3dhcm5pbmcgX19yZWFkX21vc3RseSA9IDE7CS8qIE9ubHkg
MSB3YXJuaW5nIGJ5IGRlZmF1bHQgKi8KPiAgIHN0YXRpYyB2b2lkIGZpeHVwX2xvYWQoc3RydWN0
IGRpc2FzbV9zdGF0ZSAqc3RhdGUsIHN0cnVjdCBwdF9yZWdzICpyZWdzLAo+ICAgCQkJc3RydWN0
IGNhbGxlZV9yZWdzICpjcmVncykKPiAgIHsKPiArCXVuc2lnbmVkIGxvbmcgYWRkcmVzczsKPiAr
CXVuc2lnbmVkIGludCBzaXplOwo+ICAgCWludCB2YWw7Cj4gICAKPiAgIAkvKiByZWdpc3RlciB3
cml0ZSBiYWNrICovCj4gQEAgLTE0MywxMCArMTQ1LDE1IEBAIHN0YXRpYyB2b2lkIGZpeHVwX2xv
YWQoc3RydWN0IGRpc2FzbV9zdGF0ZSAqc3RhdGUsIHN0cnVjdCBwdF9yZWdzICpyZWdzLAo+ICAg
CQkJc3RhdGUtPnNyYzIgPSAwOwo+ICAgCX0KPiAgIAo+ICsJYWRkcmVzcyA9IHN0YXRlLT5zcmMx
ICsgc3RhdGUtPnNyYzI7Cj4gKwlzaXplID0gc3RhdGUtPnp6ID8gMiA6IDQ7Cj4gKwlpZiAoIWFj
Y2Vzc19vaygodm9pZCBfX3VzZXIgKilhZGRyZXNzLCBzaXplKSkKPiArCQlnb3RvIGZhdWx0Owo+
ICsKPiAgIAlpZiAoc3RhdGUtPnp6ID09IDApIHsKPiAtCQlnZXQzMl91bmFsaWduZWRfY2hlY2so
dmFsLCBzdGF0ZS0+c3JjMSArIHN0YXRlLT5zcmMyKTsKPiArCQlnZXQzMl91bmFsaWduZWRfY2hl
Y2sodmFsLCBhZGRyZXNzKTsKPiAgIAl9IGVsc2Ugewo+IC0JCWdldDE2X3VuYWxpZ25lZF9jaGVj
ayh2YWwsIHN0YXRlLT5zcmMxICsgc3RhdGUtPnNyYzIpOwo+ICsJCWdldDE2X3VuYWxpZ25lZF9j
aGVjayh2YWwsIGFkZHJlc3MpOwo+ICAgCj4gICAJCWlmIChzdGF0ZS0+eCkKPiAgIAkJCXZhbCA9
ICh2YWwgPDwgMTYpID4+IDE2Owo+IEBAIC0xNjMsNiArMTcwLDkgQEAgZmF1bHQ6CXN0YXRlLT5m
YXVsdCA9IDE7Cj4gICBzdGF0aWMgdm9pZCBmaXh1cF9zdG9yZShzdHJ1Y3QgZGlzYXNtX3N0YXRl
ICpzdGF0ZSwgc3RydWN0IHB0X3JlZ3MgKnJlZ3MsCj4gICAJCQlzdHJ1Y3QgY2FsbGVlX3JlZ3Mg
KmNyZWdzKQo+ICAgewo+ICsJdW5zaWduZWQgbG9uZyBhZGRyZXNzOwo+ICsJdW5zaWduZWQgaW50
IHNpemU7Cj4gKwo+ICAgCS8qIHJlZ2lzdGVyIHdyaXRlIGJhY2sgKi8KPiAgIAlpZiAoKHN0YXRl
LT5hYSA9PSAxKSB8fCAoc3RhdGUtPmFhID09IDIpKSB7Cj4gICAJCXNldF9yZWcoc3RhdGUtPndi
X3JlZywgc3RhdGUtPnNyYzIgKyBzdGF0ZS0+c3JjMywgcmVncywgY3JlZ3MpOwo+IEBAIC0xODEs
MTEgKzE5MSwxNiBAQCBzdGF0aWMgdm9pZCBmaXh1cF9zdG9yZShzdHJ1Y3QgZGlzYXNtX3N0YXRl
ICpzdGF0ZSwgc3RydWN0IHB0X3JlZ3MgKnJlZ3MsCj4gICAJCX0KPiAgIAl9Cj4gICAKPiArCWFk
ZHJlc3MgPSBzdGF0ZS0+c3JjMiArIHN0YXRlLT5zcmMzOwo+ICsJc2l6ZSA9IHN0YXRlLT56eiA/
IDIgOiA0Owo+ICsJaWYgKCFhY2Nlc3Nfb2soKHZvaWQgX191c2VyICopYWRkcmVzcywgc2l6ZSkp
Cj4gKwkJZ290byBmYXVsdDsKPiArCj4gICAJLyogd3JpdGUgZml4LXVwICovCj4gICAJaWYgKCFz
dGF0ZS0+enopCj4gLQkJcHV0MzJfdW5hbGlnbmVkX2NoZWNrKHN0YXRlLT5zcmMxLCBzdGF0ZS0+
c3JjMiArIHN0YXRlLT5zcmMzKTsKPiArCQlwdXQzMl91bmFsaWduZWRfY2hlY2soc3RhdGUtPnNy
YzEsIGFkZHJlc3MpOwo+ICAgCWVsc2UKPiAtCQlwdXQxNl91bmFsaWduZWRfY2hlY2soc3RhdGUt
PnNyYzEsIHN0YXRlLT5zcmMyICsgc3RhdGUtPnNyYzMpOwo+ICsJCXB1dDE2X3VuYWxpZ25lZF9j
aGVjayhzdGF0ZS0+c3JjMSwgYWRkcmVzcyk7Cj4gICAKPiAgIAlyZXR1cm47Cj4gICAKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1zbnBzLWFy
YyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
