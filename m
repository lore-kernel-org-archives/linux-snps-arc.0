Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D888CF31B7
	for <linux-snps-arc@archiver.kernel.org>; Wed, 19 Nov 2025 12:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B0jPsxZpB014FfpL04+vigLvYKcDotvnAh81ZUxK6aY=; b=cvgSXyp1Pz2Sc3
	DZWXyRx2lm8rQw1+ra5Tv7GXfU75l825XCSvgXqtEHndIGlnQKpR/D1A+334dhQSJink8yEWQmjwk
	gPE3rL2jk+C4C16mKOOYAhlwJQx78egfTRiAplwspxlfWI93hZooW5+3S4kPVIvoQH6/YAoCsKy7x
	PAp/46JUJ2fEuTVZ9DDsDz75q+DsYOuYWDYLqrIgrka6i2h9102nbA/sGjdvEsJNl3n/WNj1ngNL9
	uKIPI0FekHNzxm6Ion/3IX4vmkSTKXN1H7Ie+AJAPPXFGKPbwsauuDNYK9MBspn9kSK8ygvxIvgk/
	A62Q7xUztibgp1wfeEXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLhEy-000000037b0-1jI9;
	Wed, 19 Nov 2025 12:24:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLhEq-000000037T9-3IUb;
	Wed, 19 Nov 2025 12:24:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0EAD8432FE;
	Wed, 19 Nov 2025 12:24:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21EBCC116D0;
	Wed, 19 Nov 2025 12:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763555083;
	bh=iBiJTRsmPeT8yT7z7CbiOkAhObefLKlCnyqgtKvMuCk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OBSgFKD3+2NvaYtuKw/QdLvJ4kd1qTjKiTeRyHWtELBx2sa2VxIWisexyF7jgJgeD
	 8/7qcHogwMEYULif7/zT0Blo6SdqmJfDDkjOtqvhR34sRQy8h5rR4W7ewalVmRGYey
	 Jc1bz1eKKmip3Nhp5EEVKNnH4+TcAvXMYIX4DJVlFe1cnT7kWo4T2BMafaaKj6W0QE
	 tksi9TyyDvEnpbaBkBecgBzphpzgjI0aD0eMgPZ+3ODv+MpVNh0XNg8xSfrSSBC/HP
	 tX3pn90oDkV+9B6k4FD+XGPRfz+Fs8u7hySZerofnUkosVm2LUZ1/W1me0CAQMB7jS
	 lCDTRg/6ptIBg==
Message-ID: <7160b6ec-4da5-4273-be91-1339bd00d009@kernel.org>
Date: Wed, 19 Nov 2025 13:24:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] mm: make PT_RECLAIM depend on
 MMU_GATHER_RCU_TABLE_FREE && 64BIT
To: Qi Zheng <qi.zheng@linux.dev>, will@kernel.org, aneesh.kumar@kernel.org,
 npiggin@gmail.com, peterz@infradead.org, dev.jain@arm.com,
 akpm@linux-foundation.org, ioworker0@gmail.com
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-alpha@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-um@lists.infradead.org, Qi Zheng <zhengqi.arch@bytedance.com>
References: <cover.1763117269.git.zhengqi.arch@bytedance.com>
 <0a4d1e6f0bf299cafd1fc624f965bd1ca542cea8.1763117269.git.zhengqi.arch@bytedance.com>
 <355d3bf3-c6bc-403e-9f19-89259d868611@kernel.org>
 <195baf7c-1f4e-46a4-a4aa-e68e7d00c0f9@linux.dev>
 <9386032c-9840-49da-83f9-74b112f3e752@kernel.org>
 <956c7ca1-bce8-4eed-8a86-bc8adfc708b8@linux.dev>
 <6a22ff95-28c1-4c1d-a1a8-6a391bcc8c86@kernel.org>
 <479b0409-335f-4450-8eb2-5270a5847f5e@linux.dev>
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <479b0409-335f-4450-8eb2-5270a5847f5e@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_042444_898920_FEBD5260 
X-CRM114-Status: GOOD (  24.74  )
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

T24gMTkuMTEuMjUgMTM6MTMsIFFpIFpoZW5nIHdyb3RlOgo+IAo+IAo+IE9uIDExLzE5LzI1IDc6
MzUgUE0sIERhdmlkIEhpbGRlbmJyYW5kIChSZWQgSGF0KSB3cm90ZToKPj4gT24gMTkuMTEuMjUg
MTI6MDIsIFFpIFpoZW5nIHdyb3RlOgo+Pj4gSGkgRGF2aWQsCj4+Pgo+Pj4gT24gMTEvMTkvMjUg
NjoxOSBQTSwgRGF2aWQgSGlsZGVuYnJhbmQgKFJlZCBIYXQpIHdyb3RlOgo+Pj4+IE9uIDE4LjEx
LjI1IDEzOjAyLCBRaSBaaGVuZyB3cm90ZToKPj4+Pj4KPj4+Pj4KPj4+Pj4gT24gMTEvMTgvMjUg
MTI6NTcgQU0sIERhdmlkIEhpbGRlbmJyYW5kIChSZWQgSGF0KSB3cm90ZToKPj4+Pj4+IE9uIDE0
LjExLjI1IDEyOjExLCBRaSBaaGVuZyB3cm90ZToKPj4+Pj4+PiBGcm9tOiBRaSBaaGVuZyA8emhl
bmdxaS5hcmNoQGJ5dGVkYW5jZS5jb20+Cj4+Pj4+Pgo+Pj4+Pj4gU3ViamVjdDogcy8mJi8mLwo+
Pj4+Pgo+Pj4+PiB3aWxsIGRvLgo+Pj4+Pgo+Pj4+Pj4KPj4+Pj4+Pgo+Pj4+Pj4+IE1ha2UgUFRf
UkVDTEFJTSBkZXBlbmQgb24gTU1VX0dBVEhFUl9SQ1VfVEFCTEVfRlJFRSBzbyB0aGF0Cj4+Pj4+
Pj4gUFRfUkVDTEFJTQo+Pj4+Pj4+IGNhbgo+Pj4+Pj4+IGJlIGVuYWJsZWQgYnkgZGVmYXVsdCBv
biBhbGwgYXJjaGl0ZWN0dXJlcyB0aGF0IHN1cHBvcnQKPj4+Pj4+PiBNTVVfR0FUSEVSX1JDVV9U
QUJMRV9GUkVFLgo+Pj4+Pj4+Cj4+Pj4+Pj4gQ29uc2lkZXJpbmcgdGhhdCBhIGxhcmdlIG51bWJl
ciBvZiBQVEUgcGFnZSB0YWJsZSBwYWdlcyAoc3VjaCBhcwo+Pj4+Pj4+IDEwMEdCKykKPj4+Pj4+
PiBjYW4gb25seSBiZSBjYXVzZWQgb24gYSA2NC1iaXQgc3lzdGVtLCBsZXQgUFRfUkVDTEFJTSBh
bHNvIGRlcGVuZCBvbgo+Pj4+Pj4+IDY0QklULgo+Pj4+Pj4+Cj4+Pj4+Pj4gU2lnbmVkLW9mZi1i
eTogUWkgWmhlbmcgPHpoZW5ncWkuYXJjaEBieXRlZGFuY2UuY29tPgo+Pj4+Pj4+IC0tLQo+Pj4+
Pj4+ICDCoMKgwqAgYXJjaC94ODYvS2NvbmZpZyB8IDEgLQo+Pj4+Pj4+ICDCoMKgwqAgbW0vS2Nv
bmZpZ8KgwqDCoMKgwqDCoCB8IDYgKy0tLS0tCj4+Pj4+Pj4gIMKgwqDCoCAyIGZpbGVzIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCA2IGRlbGV0aW9ucygtKQo+Pj4+Pj4+Cj4+Pj4+Pj4gZGlmZiAt
LWdpdCBhL2FyY2gveDg2L0tjb25maWcgYi9hcmNoL3g4Ni9LY29uZmlnCj4+Pj4+Pj4gaW5kZXgg
ZWFjMmU4NjA1NjkwMi4uOTZiZmY4MWZkNDc4NyAxMDA2NDQKPj4+Pj4+PiAtLS0gYS9hcmNoL3g4
Ni9LY29uZmlnCj4+Pj4+Pj4gKysrIGIvYXJjaC94ODYvS2NvbmZpZwo+Pj4+Pj4+IEBAIC0zMzAs
NyArMzMwLDYgQEAgY29uZmlnIFg4Ngo+Pj4+Pj4+ICDCoMKgwqDCoMKgwqDCoCBzZWxlY3QgRlVO
Q1RJT05fQUxJR05NRU5UXzRCCj4+Pj4+Pj4gIMKgwqDCoMKgwqDCoMKgIGltcGx5IElNQV9TRUNV
UkVfQU5EX09SX1RSVVNURURfQk9PVMKgwqDCoCBpZiBFRkkKPj4+Pj4+PiAgwqDCoMKgwqDCoMKg
wqAgc2VsZWN0IEhBVkVfRFlOQU1JQ19GVFJBQ0VfTk9fUEFUQ0hBQkxFCj4+Pj4+Pj4gLcKgwqDC
oCBzZWxlY3QgQVJDSF9TVVBQT1JUU19QVF9SRUNMQUlNwqDCoMKgwqDCoMKgwqAgaWYgWDg2XzY0
Cj4+Pj4+Pj4gIMKgwqDCoMKgwqDCoMKgIHNlbGVjdCBBUkNIX1NVUFBPUlRTX1NDSEVEX1NNVMKg
wqDCoMKgwqDCoMKgIGlmIFNNUAo+Pj4+Pj4+ICDCoMKgwqDCoMKgwqDCoCBzZWxlY3QgU0NIRURf
U01UwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiBTTVAKPj4+Pj4+PiAgwqDCoMKgwqDCoMKgwqAg
c2VsZWN0IEFSQ0hfU1VQUE9SVFNfU0NIRURfQ0xVU1RFUsKgwqDCoCBpZiBTTVAKPj4+Pj4+PiBk
aWZmIC0tZ2l0IGEvbW0vS2NvbmZpZyBiL21tL0tjb25maWcKPj4+Pj4+PiBpbmRleCBhNWE5MGIx
Njk0MzVkLi5lNzk1ZmJkNjllNTBjIDEwMDY0NAo+Pj4+Pj4+IC0tLSBhL21tL0tjb25maWcKPj4+
Pj4+PiArKysgYi9tbS9LY29uZmlnCj4+Pj4+Pj4gQEAgLTE0NDAsMTQgKzE0NDAsMTAgQEAgY29u
ZmlnIEFSQ0hfSEFTX1VTRVJfU0hBRE9XX1NUQUNLCj4+Pj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDC
oCBUaGUgYXJjaGl0ZWN0dXJlIGhhcyBoYXJkd2FyZSBzdXBwb3J0IGZvciB1c2Vyc3BhY2Ugc2hh
ZG93Cj4+Pj4+Pj4gY2FsbAo+Pj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdGFj
a3MgKGVnLCB4ODYgQ0VULCBhcm02NCBHQ1Mgb3IgUklTQy1WIFppY2Zpc3MpLgo+Pj4+Pj4+IC1j
b25maWcgQVJDSF9TVVBQT1JUU19QVF9SRUNMQUlNCj4+Pj4+Pj4gLcKgwqDCoCBkZWZfYm9vbCBu
Cj4+Pj4+Pj4gLQo+Pj4+Pj4+ICDCoMKgwqAgY29uZmlnIFBUX1JFQ0xBSU0KPj4+Pj4+PiAgwqDC
oMKgwqDCoMKgwqAgYm9vbCAicmVjbGFpbSBlbXB0eSB1c2VyIHBhZ2UgdGFibGUgcGFnZXMiCj4+
Pj4+Pj4gIMKgwqDCoMKgwqDCoMKgIGRlZmF1bHQgeQo+Pj4+Pj4+IC3CoMKgwqAgZGVwZW5kcyBv
biBBUkNIX1NVUFBPUlRTX1BUX1JFQ0xBSU0gJiYgTU1VICYmIFNNUAo+Pj4+Pj4+IC3CoMKgwqAg
c2VsZWN0IE1NVV9HQVRIRVJfUkNVX1RBQkxFX0ZSRUUKPj4+Pj4+PiArwqDCoMKgIGRlcGVuZHMg
b24gTU1VX0dBVEhFUl9SQ1VfVEFCTEVfRlJFRSAmJiBNTVUgJiYgU01QICYmIDY0QklUCj4+Pj4+
Pgo+Pj4+Pj4gV2hvIHdvdWxkIHdlIGhhdmUgTU1VX0dBVEhFUl9SQ1VfVEFCTEVfRlJFRSB3aXRo
b3V0IE1NVT8gKGNhbiB3ZSBkcm9wCj4+Pj4+PiB0aGUgTU1VIHBhcnQpCj4+Pj4+Cj4+Pj4+IE9L
Lgo+Pj4+Pgo+Pj4+Pj4KPj4+Pj4+IFdoeSBkbyB3ZSBjYXJlIGFib3V0IFNNUCBpbiB0aGUgZmly
c3QgcGxhY2U/IChjYW4gd2UgZnJvcCBTTVApCj4+Pj4+Cj4+Pj4+IE9LLgo+Pj4+Pgo+Pj4+Pj4K
Pj4+Pj4+IEJ1dCBJIGFsc28gd29uZGVyIHdoeSB3ZSBuZWVkICJNTVVfR0FUSEVSX1JDVV9UQUJM
RV9GUkVFICYmIDY0QklUIjoKPj4+Pj4+Cj4+Pj4+PiBXb3VsZCBpdCBiZSBoYXJtZnVsIG9uIDMy
Yml0IChzdXJlLCB3ZSBtaWdodCBub3QgcmVjbGFpbSBhcyBtdWNoLCBidXQKPj4+Pj4+IHN0aWxs
IHRoZXJlIGlzIG1lbW9yeSB0byBiZSByZWNsYWltZWQ/KT8KPj4+Pj4KPj4+Pj4gVGhpcyBpcyBh
bHNvIGZpbmUgb24gMzJiaXQsIGJ1dCB0aGUgYmVuZWZpdHMgYXJlIG5vdCBzaWduaWZpY2FudCwg
U28gSQo+Pj4+PiBjaG9zZSB0byBlbmFibGUgaXQgb25seSBvbiA2NC1iaXQuCj4+Pj4KPj4+PiBS
aWdodC4gQWRkcmVzcyBzcGFjZSBpcyBzbWFsbGVyLCBidXQgYWxzbyBtZW1vcnkgaXMgc21hbGxl
ci4gTm90IHRoYXQgSQo+Pj4+IHRoaW5rIHdlIHN0cmljdGx5ICptdXN0KiB0byBzdXBwb3J0IDMy
Yml0LCBJIG1lcmVseSB3b25kZXIgd2h5IHdlCj4+Pj4gd291bGRuJ3QganVzdCBlbmFibGUgaXQg
aGVyZS4KPj4+Pgo+Pj4+IE9UT0gsIGlmIHRoZXJlIGlzIGEgZ29vZCByZWFzb24gd2UgY2Fubm90
IGVuYWJsZSBpdCwgd2UgY2FuIGRlZmluaXRlbHkKPj4+PiBqdXN0IGtlZXAgaXQgNjRiaXQgb25s
eS4KPj4+Cj4+PiBUaGUgb25seSBkaWZmaWN1bHR5IGlzIHRoaXM6Cj4+Pgo+Pj4+Cj4+Pj4+Cj4+
Pj4+IEkgYWN0dWFsbHkgdHJpZWQgZW5hYmxpbmcgTU1VX0dBVEhFUl9SQ1VfVEFCTEVfRlJFRSBv
biBhbGwKPj4+Pj4gYXJjaGl0ZWN0dXJlcywgYW5kIGFwYXJ0IGZyb20gc3BhcmMzMiBiZWluZyBh
IGJpdCB0cm91Ymxlc29tZSAoYmVjYXVzZQo+Pj4+PiBpdCB1c2VzIG1tLT5wYWdlX3RhYmxlX2xv
Y2sgZm9yIHN5bmNocm9uaXphdGlvbiB3aXRoaW4KPj4+Pj4gX19wdGVfZnJlZV90bGIoKSksIHRo
ZSBtb2RpZmljYXRpb25zIHdlcmUgcmVsYXRpdmVseSBzaW1wbGUuCj4+Pgo+Pj4gaW4gc3BhcmMz
MjoKPj4+Cj4+PiB2b2lkIHB0ZV9mcmVlKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLCBwZ3RhYmxlX3Qg
cHRlcCkKPj4+IHsKPj4+ICDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IHBhZ2UgKnBhZ2U7Cj4+
Pgo+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoCBwYWdlID0gcGZuX3RvX3BhZ2UoX19ub2NhY2hlX3Bh
KCh1bnNpZ25lZCBsb25nKXB0ZXApID4+Cj4+PiBQQUdFX1NISUZUKTsKPj4+ICDCoMKgwqDCoMKg
wqDCoMKgwqAgc3Bpbl9sb2NrKCZtbS0+cGFnZV90YWJsZV9sb2NrKTsKPj4+ICDCoMKgwqDCoMKg
wqDCoMKgwqAgaWYgKHBhZ2VfcmVmX2RlY19yZXR1cm4ocGFnZSkgPT0gMSkKPj4+ICDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHBhZ2V0YWJsZV9kdG9yKHBhZ2VfcHRkZXNjKHBh
Z2UpKTsKPj4+ICDCoMKgwqDCoMKgwqDCoMKgwqAgc3Bpbl91bmxvY2soJm1tLT5wYWdlX3RhYmxl
X2xvY2spOwo+Pj4KPj4+ICDCoMKgwqDCoMKgwqDCoMKgwqAgc3JtbXVfZnJlZV9ub2NhY2hlKHB0
ZXAsIFNSTU1VX1BURV9UQUJMRV9TSVpFKTsKPj4+IH0KPj4+Cj4+PiAjZGVmaW5lIF9fcHRlX2Zy
ZWVfdGxiKHRsYiwgcHRlLCBhZGRyKcKgIHB0ZV9mcmVlKCh0bGIpLT5tbSwgcHRlKQo+Pj4KPj4+
IFRvIGVuYWJsZSBNTVVfR0FUSEVSX1JDVV9UQUJMRV9GUkVFIG9uIHNwYXJjMzIsIHdlIG5lZWQg
dG8gaW1wbGVtZW50Cj4+PiBfX3RsYl9yZW1vdmVfdGFibGUoKSwgYW5kIGNhbGwgdGhlIHB0ZV9m
cmVlKCkgYWJvdmUgaW4KPj4+IF9fdGxiX3JlbW92ZV90YWJsZSgpLgo+Pj4KPj4+IEhvd2V2ZXIs
IHRoZSBfX3RsYl9yZW1vdmVfdGFibGUoKSBkb2VzIG5vdCBoYXZlIGFuIG1tIHBhcmFtZXRlcjoK
Pj4+Cj4+PiB2b2lkIF9fdGxiX3JlbW92ZV90YWJsZSh2b2lkICpfdGFibGUpCj4+Pgo+Pj4gc28g
d2UgbmVlZCB0byB1c2UgYW5vdGhlciBsb2NrIGluc3RlYWQgb2YgbW0tPnBhZ2VfdGFibGVfbG9j
ay4KPj4+Cj4+PiBJIGhhdmUgYWxyZWFkeSBzZW50IHRoZSB2MiBbMV0sIGFuZCBwZXJoYXBzIGFm
dGVyIHRoYXQgSSBjYW4gZW5hYmxlCj4+PiBQVF9SRUNMQUlNIG9uIGFsbCAzMi1iaXQgYXJjaGl0
ZWN0dXJlcyBhcyB3ZWxsLgo+Pj4KPj4KPj4gSSBndWVzcyBpZiB3ZSBqdXN0IG1ha2UgaXQgZGVw
ZW5kIG9uIE1NVV9HQVRIRVJfUkNVX1RBQkxFX0ZSRUUgdGhhdCB3aWxsCj4+IGJlIGZpbmUuCj4+
Cj4+PiBbMV0uCj4+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvCj4+PiBjb3Zlci4xNzYz
NTM3MDA3LmdpdC56aGVuZ3FpLmFyY2hAYnl0ZWRhbmNlLmNvbS8KPj4+Cj4+Pj4+Cj4+Pj4+Pgo+
Pj4+Pj4gSWYgYWxsIDY0QklUIHN1cHBvcnQgTU1VX0dBVEhFUl9SQ1VfVEFCTEVfRlJFRSAoYXMg
eW91IHByZXZpb3VzbHkKPj4+Pj4+IHN0YXRlKSwgd2h5IGNhbid0IHdlIG9ubHkgY2hlY2sgZm9y
IDY0QklUPwo+Pj4+Pgo+Pj4+PiBPSywgd2lsbCBkby4KPj4+Pgo+Pj4+IFRoaXMgd2FzIGFsc28g
bW9yZSBvZiBhIHF1ZXN0aW9uIGZvciBkaXNjdXNzaW9uOgo+Pj4+Cj4+Pj4gV291bGQgaXQgbWFr
ZSBzZW5zZSB0byBoYXZlCj4+Pj4KPj4+PiBjb25maWcgUFRfUkVDTEFJTQo+Pj4+ICDCoCDCoMKg
wqDCoGRlZl9ib29sIHkKPj4+PiAgwqAgwqDCoMKgwqBkZXBlbmRzIG9uIE1NVV9HQVRIRVJfUkNV
X1RBQkxFX0ZSRUUKPj4+Cj4+PiBtYWtlIHNlbnNlLgo+Pj4KPj4+Pgo+Pj4+IChhKSBXb3VsZCB3
ZSB3YW50IHRvIG1ha2UgaXQgY29uZmlndXJhYmxlICh3aHk/KQo+Pj4KPj4+IE5vLCBpdCB3YXMg
anVzdCBvdXQgb2YgY2F1dGlvbiBiZWZvcmUuCj4+Pgo+Pj4+IChiKSBEbyB3ZSByZWFsbHkgY2Fy
ZSBhYm91dCBTTVAgKHdoeT8pCj4+Pgo+Pj4gTm8uIFNpbXBseSBiZWNhdXNlIHRoZSBmb2xsb3dp
bmcgc2l0dWF0aW9uIGlzIGltcG9zc2libGUgdG8gb2NjdXI6Cj4+Pgo+Pj4gcHRlX29mZnNldF9t
YXAKPj4+IHRyYXZlcnNpbmcgdGhlIFBURSBwYWdlIHRhYmxlCj4+Pgo+Pj4gPHByZWVtcHRpb24g
b3IgaGFyZGlycT4KPj4+Cj4+PiBjYWxsIG1hZHZpc2UoTUFEVl9ET05UTkVFRCkKPj4+Cj4+PiBz
byB0aGVyZSdzIG5vIG5lZWQgdG8gZnJlZSBQVEUgcGFnZSB2aWEgUkNVLgo+Pj4KPj4+PiAoYykg
RG8gd2Ugd2FudCB0byBsaW1pdCB0byA2NGJpdCAod2h5PykKPj4+Cj4+PiBObywganVzdCBiZWNh
dXNlIHRoZSBwcm9maXQgaXMgZ3JlYXRlciBhdCA2NC1CSVQuCj4+Cj4+IEkgd2FzIGJyaWVmbHkg
d29uZGVyaW5nIGlmIG9uIDMyYml0IChidXQgbWF5YmUgYWxzbyBvbiA2NGJpdCB3aXRoCj4+IGNv
bmZpZ3VyYWJsZSB1c2VyIHBhZ2UgdGFibGUgbGV2ZWxzPykgd2UgY291bGQgaGF2ZSB0aGUgc2Nl
bmFyaW8gdGhhdCB3ZQo+PiBvbmx5IGhhdmUgdHdvIHBhZ2UgdGFibGUgbGV2ZWxzLgo+Pgo+PiBT
byByZWNsYWltaW5nIHRoZSBQTUQgbGV2ZWwgKGNvcnJlc3BvbmRpbmcgdG8gdGhlIGhpZ2hlc3Qg
bGV2ZWwpIHdvdWxkCj4gCj4gcmVjbGFpbWluZyB0aGUgUE1EIGxldmVsPyBUaGUgUFRfUkVDTEFJ
TSBvbmx5IHJlY2xhaW0gUFRFIHBhZ2VzLCBub3QgUE1ECj4gcGFnZXMsIGFtIEkgbWlzdW5kZXJz
dGFuZGluZyBzb21ldGhpbmc/CgpTb3JyeSwgSSBsb29rZWQgdG9vIG11Y2ggaW50byBQTUQgdGFi
bGUgc2hhcmluZyB0aGUgbGFzdCBkYXlzIDpECgpZb3UncmUgcmlnaHQsIGl0IHdvdWxkIHdvcmsg
aW4gYW55IGNhc2UgZXZlbiB3aXRoIG9ubHkgMiBsZXZlbHMgb2YgYXBnZSAKdGFibGVzLgoKLS0g
CkNoZWVycwoKRGF2aWQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtc25wcy1hcmMK
