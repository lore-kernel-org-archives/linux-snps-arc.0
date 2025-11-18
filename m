Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B35ECED631
	for <linux-snps-arc@archiver.kernel.org>; Tue, 18 Nov 2025 12:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i9gYNQS9Hmi/HcM83famtqkIqvhfaVB2WBhQlUDs3Wo=; b=g6AiJckrKTn4R2
	VO3iapUsmKaCp6zhvOrWaokVdwc+sbd5NPGAYFYBuELoZR4WZ95xieIrTS/xVJ8skmAL/x12qjwSI
	sOFvlJZpKoyO3gpdtRLtBKEOFx0XhPQMV0nF6ivQDB8EAekFi61y9fdYslZTPq1XHGFLwDe3pBdP0
	HbVDvr+TcMdwp0+tDhdrGabL7hom0HsNl5xgGH53OPKOkK3OjyL0BdPmCKTyNyY18znSCjzOhYsxN
	ElIP7idNiK3t+L/Wkzu7xGNi43f3RuTr98yRhUt3PeHT+WMid5DmWJpgiRFC6s/W3Cizc5iUGCw2t
	oy6PoMFcImEup5CRe7HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLKR9-00000000NRw-0hP8;
	Tue, 18 Nov 2025 12:03:55 +0000
Received: from out-174.mta1.migadu.com ([2001:41d0:203:375::ae])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLKR6-00000000NQl-0bwT
	for linux-snps-arc@lists.infradead.org;
	Tue, 18 Nov 2025 12:03:53 +0000
Message-ID: <195baf7c-1f4e-46a4-a4aa-e68e7d00c0f9@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1763467417;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YSfDkQJHByC5W64S3r1RZBfV7l+QzHRtZt5IkHkWjXM=;
	b=Z9Rbcq7i2Y1LGHCoUGuTi6ppSLunSulmRKUQ4pjayjy42viyJ+DcXrTYmImrfSRJw+UKR4
	UVTRGLFHLTlNdVaXnjT3ixLkagqhNZyq0Aqov/I7FCpMijq/fe4cVtkKv+q+YaHP5txxbN
	qqqQe//KpgfJbRYA+2BGf/imvJ4aYQ4=
Date: Tue, 18 Nov 2025 20:02:30 +0800
MIME-Version: 1.0
Subject: Re: [PATCH 7/7] mm: make PT_RECLAIM depend on
 MMU_GATHER_RCU_TABLE_FREE && 64BIT
To: "David Hildenbrand (Red Hat)" <david@kernel.org>, will@kernel.org,
 aneesh.kumar@kernel.org, npiggin@gmail.com, peterz@infradead.org,
 dev.jain@arm.com, akpm@linux-foundation.org, ioworker0@gmail.com
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-alpha@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-um@lists.infradead.org, Qi Zheng <zhengqi.arch@bytedance.com>
References: <cover.1763117269.git.zhengqi.arch@bytedance.com>
 <0a4d1e6f0bf299cafd1fc624f965bd1ca542cea8.1763117269.git.zhengqi.arch@bytedance.com>
 <355d3bf3-c6bc-403e-9f19-89259d868611@kernel.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Qi Zheng <qi.zheng@linux.dev>
In-Reply-To: <355d3bf3-c6bc-403e-9f19-89259d868611@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_040352_415362_ABCB53C2 
X-CRM114-Status: GOOD (  17.75  )
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

CgpPbiAxMS8xOC8yNSAxMjo1NyBBTSwgRGF2aWQgSGlsZGVuYnJhbmQgKFJlZCBIYXQpIHdyb3Rl
Ogo+IE9uIDE0LjExLjI1IDEyOjExLCBRaSBaaGVuZyB3cm90ZToKPj4gRnJvbTogUWkgWmhlbmcg
PHpoZW5ncWkuYXJjaEBieXRlZGFuY2UuY29tPgo+IAo+IFN1YmplY3Q6IHMvJiYvJi8KCndpbGwg
ZG8uCgo+IAo+Pgo+PiBNYWtlIFBUX1JFQ0xBSU0gZGVwZW5kIG9uIE1NVV9HQVRIRVJfUkNVX1RB
QkxFX0ZSRUUgc28gdGhhdCBQVF9SRUNMQUlNIAo+PiBjYW4KPj4gYmUgZW5hYmxlZCBieSBkZWZh
dWx0IG9uIGFsbCBhcmNoaXRlY3R1cmVzIHRoYXQgc3VwcG9ydAo+PiBNTVVfR0FUSEVSX1JDVV9U
QUJMRV9GUkVFLgo+Pgo+PiBDb25zaWRlcmluZyB0aGF0IGEgbGFyZ2UgbnVtYmVyIG9mIFBURSBw
YWdlIHRhYmxlIHBhZ2VzIChzdWNoIGFzIDEwMEdCKykKPj4gY2FuIG9ubHkgYmUgY2F1c2VkIG9u
IGEgNjQtYml0IHN5c3RlbSwgbGV0IFBUX1JFQ0xBSU0gYWxzbyBkZXBlbmQgb24KPj4gNjRCSVQu
Cj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFFpIFpoZW5nIDx6aGVuZ3FpLmFyY2hAYnl0ZWRhbmNlLmNv
bT4KPj4gLS0tCj4+IMKgIGFyY2gveDg2L0tjb25maWcgfCAxIC0KPj4gwqAgbW0vS2NvbmZpZ8Kg
wqDCoMKgwqDCoCB8IDYgKy0tLS0tCj4+IMKgIDIgZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDYgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9hcmNoL3g4Ni9LY29uZmlnIGIv
YXJjaC94ODYvS2NvbmZpZwo+PiBpbmRleCBlYWMyZTg2MDU2OTAyLi45NmJmZjgxZmQ0Nzg3IDEw
MDY0NAo+PiAtLS0gYS9hcmNoL3g4Ni9LY29uZmlnCj4+ICsrKyBiL2FyY2gveDg2L0tjb25maWcK
Pj4gQEAgLTMzMCw3ICszMzAsNiBAQCBjb25maWcgWDg2Cj4+IMKgwqDCoMKgwqAgc2VsZWN0IEZV
TkNUSU9OX0FMSUdOTUVOVF80Qgo+PiDCoMKgwqDCoMKgIGltcGx5IElNQV9TRUNVUkVfQU5EX09S
X1RSVVNURURfQk9PVMKgwqDCoCBpZiBFRkkKPj4gwqDCoMKgwqDCoCBzZWxlY3QgSEFWRV9EWU5B
TUlDX0ZUUkFDRV9OT19QQVRDSEFCTEUKPj4gLcKgwqDCoCBzZWxlY3QgQVJDSF9TVVBQT1JUU19Q
VF9SRUNMQUlNwqDCoMKgwqDCoMKgwqAgaWYgWDg2XzY0Cj4+IMKgwqDCoMKgwqAgc2VsZWN0IEFS
Q0hfU1VQUE9SVFNfU0NIRURfU01UwqDCoMKgwqDCoMKgwqAgaWYgU01QCj4+IMKgwqDCoMKgwqAg
c2VsZWN0IFNDSEVEX1NNVMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgU01QCj4+IMKgwqDCoMKg
wqAgc2VsZWN0IEFSQ0hfU1VQUE9SVFNfU0NIRURfQ0xVU1RFUsKgwqDCoCBpZiBTTVAKPj4gZGlm
ZiAtLWdpdCBhL21tL0tjb25maWcgYi9tbS9LY29uZmlnCj4+IGluZGV4IGE1YTkwYjE2OTQzNWQu
LmU3OTVmYmQ2OWU1MGMgMTAwNjQ0Cj4+IC0tLSBhL21tL0tjb25maWcKPj4gKysrIGIvbW0vS2Nv
bmZpZwo+PiBAQCAtMTQ0MCwxNCArMTQ0MCwxMCBAQCBjb25maWcgQVJDSF9IQVNfVVNFUl9TSEFE
T1dfU1RBQ0sKPj4gwqDCoMKgwqDCoMKgwqAgVGhlIGFyY2hpdGVjdHVyZSBoYXMgaGFyZHdhcmUg
c3VwcG9ydCBmb3IgdXNlcnNwYWNlIHNoYWRvdyBjYWxsCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgc3RhY2tzIChlZywgeDg2IENFVCwgYXJtNjQgR0NTIG9yIFJJU0MtViBaaWNmaXNzKS4KPj4g
LWNvbmZpZyBBUkNIX1NVUFBPUlRTX1BUX1JFQ0xBSU0KPj4gLcKgwqDCoCBkZWZfYm9vbCBuCj4+
IC0KPj4gwqAgY29uZmlnIFBUX1JFQ0xBSU0KPj4gwqDCoMKgwqDCoCBib29sICJyZWNsYWltIGVt
cHR5IHVzZXIgcGFnZSB0YWJsZSBwYWdlcyIKPj4gwqDCoMKgwqDCoCBkZWZhdWx0IHkKPj4gLcKg
wqDCoCBkZXBlbmRzIG9uIEFSQ0hfU1VQUE9SVFNfUFRfUkVDTEFJTSAmJiBNTVUgJiYgU01QCj4+
IC3CoMKgwqAgc2VsZWN0IE1NVV9HQVRIRVJfUkNVX1RBQkxFX0ZSRUUKPj4gK8KgwqDCoCBkZXBl
bmRzIG9uIE1NVV9HQVRIRVJfUkNVX1RBQkxFX0ZSRUUgJiYgTU1VICYmIFNNUCAmJiA2NEJJVAo+
IAo+IFdobyB3b3VsZCB3ZSBoYXZlIE1NVV9HQVRIRVJfUkNVX1RBQkxFX0ZSRUUgd2l0aG91dCBN
TVU/IChjYW4gd2UgZHJvcCAKPiB0aGUgTU1VIHBhcnQpCgpPSy4KCj4gCj4gV2h5IGRvIHdlIGNh
cmUgYWJvdXQgU01QIGluIHRoZSBmaXJzdCBwbGFjZT8gKGNhbiB3ZSBmcm9wIFNNUCkKCk9LLgoK
PiAKPiBCdXQgSSBhbHNvIHdvbmRlciB3aHkgd2UgbmVlZCAiTU1VX0dBVEhFUl9SQ1VfVEFCTEVf
RlJFRSAmJiA2NEJJVCI6Cj4gCj4gV291bGQgaXQgYmUgaGFybWZ1bCBvbiAzMmJpdCAoc3VyZSwg
d2UgbWlnaHQgbm90IHJlY2xhaW0gYXMgbXVjaCwgYnV0IAo+IHN0aWxsIHRoZXJlIGlzIG1lbW9y
eSB0byBiZSByZWNsYWltZWQ/KT8KClRoaXMgaXMgYWxzbyBmaW5lIG9uIDMyYml0LCBidXQgdGhl
IGJlbmVmaXRzIGFyZSBub3Qgc2lnbmlmaWNhbnQsIFNvIEkKY2hvc2UgdG8gZW5hYmxlIGl0IG9u
bHkgb24gNjQtYml0LgoKSSBhY3R1YWxseSB0cmllZCBlbmFibGluZyBNTVVfR0FUSEVSX1JDVV9U
QUJMRV9GUkVFIG9uIGFsbAphcmNoaXRlY3R1cmVzLCBhbmQgYXBhcnQgZnJvbSBzcGFyYzMyIGJl
aW5nIGEgYml0IHRyb3VibGVzb21lIChiZWNhdXNlCml0IHVzZXMgbW0tPnBhZ2VfdGFibGVfbG9j
ayBmb3Igc3luY2hyb25pemF0aW9uIHdpdGhpbgpfX3B0ZV9mcmVlX3RsYigpKSwgdGhlIG1vZGlm
aWNhdGlvbnMgd2VyZSByZWxhdGl2ZWx5IHNpbXBsZS4KCj4gCj4gSWYgYWxsIDY0QklUIHN1cHBv
cnQgTU1VX0dBVEhFUl9SQ1VfVEFCTEVfRlJFRSAoYXMgeW91IHByZXZpb3VzbHkgCj4gc3RhdGUp
LCB3aHkgY2FuJ3Qgd2Ugb25seSBjaGVjayBmb3IgNjRCSVQ/CgpPSywgd2lsbCBkby4KClRoYW5r
cywKUWkKCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtc25wcy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1zbnBzLWFyYwo=
