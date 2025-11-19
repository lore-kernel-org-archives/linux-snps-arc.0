Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D84E6CF3187
	for <linux-snps-arc@archiver.kernel.org>; Wed, 19 Nov 2025 10:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PbU7I+dgAhq/h+4s1TXbGovhsGrxgR/KRQE5OchU+BE=; b=mJFPgFvmMZ/fQF
	1NzR2+qq3Mv1aAH3cLglwed+XEgqHo5/dpb/9QZzfnzBc0hscluw4k3KKFJbwt8FH6KMOEr7pqv8M
	6trC0V9IFfGpe16FNG36fQUmCk4kVgDiUvEx9yo79RUcA95L4jZ4hLdyC1Pu8jIiKfTgYBYC7RjXi
	YWKjHZVdch4ulYlR4/Q476vWlyh+ba3I3S1GKCkhftoMaAXf1SJcNS9XLbx+soIN/8FIYjlrJglLz
	nNkGklA4RIrykDrcZg+32gQeWeScufAnkztOjCBHGEomANfFgoRKte8AUGXx+ITeKbfcgXYZwwWGO
	zUHO+hatehLKAAa4DTmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLfIA-00000002x0H-2IYw;
	Wed, 19 Nov 2025 10:20:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLfI8-00000002wza-1HY2;
	Wed, 19 Nov 2025 10:20:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9C94044412;
	Wed, 19 Nov 2025 10:19:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED579C113D0;
	Wed, 19 Nov 2025 10:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763547599;
	bh=8gID8BLUqz27ftdyuyVystLlDDq4KdFYCustoOe54RY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XKzsfyaktYk1NfN18S9hccOsNg6wsjdvBDLtH0msz229ZMI3K2CpzJjlq9zogKst2
	 IpRt8Vacn6bPvhAXJdPHwvnVsyk6/LZ60Qv8L+fBjOvTfDozVL9UROfYk950jLCsWS
	 z34Iocb3hYkWz25pZf8wW4+AEb0QYUxLALyXcNTRJvEqAW1in4xBVuLd65R+AO4LmD
	 3mR3cklLqI+9GQ2KEyAt9BlaxeG6te4kJv7JSGHicczEifcPTgrsoQEfXUbh9/ck8O
	 H/mZ5W6d8h1ftYMiR98ZlqQUntxOjDHk0Ldf3QsAumi71SRiq5wve77UId9Sr0YPuj
	 rsuuFhSqOdrMg==
Message-ID: <9386032c-9840-49da-83f9-74b112f3e752@kernel.org>
Date: Wed, 19 Nov 2025 11:19:51 +0100
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
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <195baf7c-1f4e-46a4-a4aa-e68e7d00c0f9@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_022000_389663_5771483D 
X-CRM114-Status: GOOD (  23.93  )
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

T24gMTguMTEuMjUgMTM6MDIsIFFpIFpoZW5nIHdyb3RlOgo+IAo+IAo+IE9uIDExLzE4LzI1IDEy
OjU3IEFNLCBEYXZpZCBIaWxkZW5icmFuZCAoUmVkIEhhdCkgd3JvdGU6Cj4+IE9uIDE0LjExLjI1
IDEyOjExLCBRaSBaaGVuZyB3cm90ZToKPj4+IEZyb206IFFpIFpoZW5nIDx6aGVuZ3FpLmFyY2hA
Ynl0ZWRhbmNlLmNvbT4KPj4KPj4gU3ViamVjdDogcy8mJi8mLwo+IAo+IHdpbGwgZG8uCj4gCj4+
Cj4+Pgo+Pj4gTWFrZSBQVF9SRUNMQUlNIGRlcGVuZCBvbiBNTVVfR0FUSEVSX1JDVV9UQUJMRV9G
UkVFIHNvIHRoYXQgUFRfUkVDTEFJTQo+Pj4gY2FuCj4+PiBiZSBlbmFibGVkIGJ5IGRlZmF1bHQg
b24gYWxsIGFyY2hpdGVjdHVyZXMgdGhhdCBzdXBwb3J0Cj4+PiBNTVVfR0FUSEVSX1JDVV9UQUJM
RV9GUkVFLgo+Pj4KPj4+IENvbnNpZGVyaW5nIHRoYXQgYSBsYXJnZSBudW1iZXIgb2YgUFRFIHBh
Z2UgdGFibGUgcGFnZXMgKHN1Y2ggYXMgMTAwR0IrKQo+Pj4gY2FuIG9ubHkgYmUgY2F1c2VkIG9u
IGEgNjQtYml0IHN5c3RlbSwgbGV0IFBUX1JFQ0xBSU0gYWxzbyBkZXBlbmQgb24KPj4+IDY0QklU
Lgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IFFpIFpoZW5nIDx6aGVuZ3FpLmFyY2hAYnl0ZWRhbmNl
LmNvbT4KPj4+IC0tLQo+Pj4gIMKgIGFyY2gveDg2L0tjb25maWcgfCAxIC0KPj4+ICDCoCBtbS9L
Y29uZmlnwqDCoMKgwqDCoMKgIHwgNiArLS0tLS0KPj4+ICDCoCAyIGZpbGVzIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCA2IGRlbGV0aW9ucygtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9hcmNoL3g4
Ni9LY29uZmlnIGIvYXJjaC94ODYvS2NvbmZpZwo+Pj4gaW5kZXggZWFjMmU4NjA1NjkwMi4uOTZi
ZmY4MWZkNDc4NyAxMDA2NDQKPj4+IC0tLSBhL2FyY2gveDg2L0tjb25maWcKPj4+ICsrKyBiL2Fy
Y2gveDg2L0tjb25maWcKPj4+IEBAIC0zMzAsNyArMzMwLDYgQEAgY29uZmlnIFg4Ngo+Pj4gIMKg
wqDCoMKgwqAgc2VsZWN0IEZVTkNUSU9OX0FMSUdOTUVOVF80Qgo+Pj4gIMKgwqDCoMKgwqAgaW1w
bHkgSU1BX1NFQ1VSRV9BTkRfT1JfVFJVU1RFRF9CT09UwqDCoMKgIGlmIEVGSQo+Pj4gIMKgwqDC
oMKgwqAgc2VsZWN0IEhBVkVfRFlOQU1JQ19GVFJBQ0VfTk9fUEFUQ0hBQkxFCj4+PiAtwqDCoMKg
IHNlbGVjdCBBUkNIX1NVUFBPUlRTX1BUX1JFQ0xBSU3CoMKgwqDCoMKgwqDCoCBpZiBYODZfNjQK
Pj4+ICDCoMKgwqDCoMKgIHNlbGVjdCBBUkNIX1NVUFBPUlRTX1NDSEVEX1NNVMKgwqDCoMKgwqDC
oMKgIGlmIFNNUAo+Pj4gIMKgwqDCoMKgwqAgc2VsZWN0IFNDSEVEX1NNVMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgaWYgU01QCj4+PiAgwqDCoMKgwqDCoCBzZWxlY3QgQVJDSF9TVVBQT1JUU19TQ0hF
RF9DTFVTVEVSwqDCoMKgIGlmIFNNUAo+Pj4gZGlmZiAtLWdpdCBhL21tL0tjb25maWcgYi9tbS9L
Y29uZmlnCj4+PiBpbmRleCBhNWE5MGIxNjk0MzVkLi5lNzk1ZmJkNjllNTBjIDEwMDY0NAo+Pj4g
LS0tIGEvbW0vS2NvbmZpZwo+Pj4gKysrIGIvbW0vS2NvbmZpZwo+Pj4gQEAgLTE0NDAsMTQgKzE0
NDAsMTAgQEAgY29uZmlnIEFSQ0hfSEFTX1VTRVJfU0hBRE9XX1NUQUNLCj4+PiAgwqDCoMKgwqDC
oMKgwqAgVGhlIGFyY2hpdGVjdHVyZSBoYXMgaGFyZHdhcmUgc3VwcG9ydCBmb3IgdXNlcnNwYWNl
IHNoYWRvdyBjYWxsCj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdGFja3MgKGVnLCB4ODYg
Q0VULCBhcm02NCBHQ1Mgb3IgUklTQy1WIFppY2Zpc3MpLgo+Pj4gLWNvbmZpZyBBUkNIX1NVUFBP
UlRTX1BUX1JFQ0xBSU0KPj4+IC3CoMKgwqAgZGVmX2Jvb2wgbgo+Pj4gLQo+Pj4gIMKgIGNvbmZp
ZyBQVF9SRUNMQUlNCj4+PiAgwqDCoMKgwqDCoCBib29sICJyZWNsYWltIGVtcHR5IHVzZXIgcGFn
ZSB0YWJsZSBwYWdlcyIKPj4+ICDCoMKgwqDCoMKgIGRlZmF1bHQgeQo+Pj4gLcKgwqDCoCBkZXBl
bmRzIG9uIEFSQ0hfU1VQUE9SVFNfUFRfUkVDTEFJTSAmJiBNTVUgJiYgU01QCj4+PiAtwqDCoMKg
IHNlbGVjdCBNTVVfR0FUSEVSX1JDVV9UQUJMRV9GUkVFCj4+PiArwqDCoMKgIGRlcGVuZHMgb24g
TU1VX0dBVEhFUl9SQ1VfVEFCTEVfRlJFRSAmJiBNTVUgJiYgU01QICYmIDY0QklUCj4+Cj4+IFdo
byB3b3VsZCB3ZSBoYXZlIE1NVV9HQVRIRVJfUkNVX1RBQkxFX0ZSRUUgd2l0aG91dCBNTVU/IChj
YW4gd2UgZHJvcAo+PiB0aGUgTU1VIHBhcnQpCj4gCj4gT0suCj4gCj4+Cj4+IFdoeSBkbyB3ZSBj
YXJlIGFib3V0IFNNUCBpbiB0aGUgZmlyc3QgcGxhY2U/IChjYW4gd2UgZnJvcCBTTVApCj4gCj4g
T0suCj4gCj4+Cj4+IEJ1dCBJIGFsc28gd29uZGVyIHdoeSB3ZSBuZWVkICJNTVVfR0FUSEVSX1JD
VV9UQUJMRV9GUkVFICYmIDY0QklUIjoKPj4KPj4gV291bGQgaXQgYmUgaGFybWZ1bCBvbiAzMmJp
dCAoc3VyZSwgd2UgbWlnaHQgbm90IHJlY2xhaW0gYXMgbXVjaCwgYnV0Cj4+IHN0aWxsIHRoZXJl
IGlzIG1lbW9yeSB0byBiZSByZWNsYWltZWQ/KT8KPiAKPiBUaGlzIGlzIGFsc28gZmluZSBvbiAz
MmJpdCwgYnV0IHRoZSBiZW5lZml0cyBhcmUgbm90IHNpZ25pZmljYW50LCBTbyBJCj4gY2hvc2Ug
dG8gZW5hYmxlIGl0IG9ubHkgb24gNjQtYml0LgoKUmlnaHQuIEFkZHJlc3Mgc3BhY2UgaXMgc21h
bGxlciwgYnV0IGFsc28gbWVtb3J5IGlzIHNtYWxsZXIuIE5vdCB0aGF0IEkgCnRoaW5rIHdlIHN0
cmljdGx5ICptdXN0KiB0byBzdXBwb3J0IDMyYml0LCBJIG1lcmVseSB3b25kZXIgd2h5IHdlIAp3
b3VsZG4ndCBqdXN0IGVuYWJsZSBpdCBoZXJlLgoKT1RPSCwgaWYgdGhlcmUgaXMgYSBnb29kIHJl
YXNvbiB3ZSBjYW5ub3QgZW5hYmxlIGl0LCB3ZSBjYW4gZGVmaW5pdGVseSAKanVzdCBrZWVwIGl0
IDY0Yml0IG9ubHkuCgo+IAo+IEkgYWN0dWFsbHkgdHJpZWQgZW5hYmxpbmcgTU1VX0dBVEhFUl9S
Q1VfVEFCTEVfRlJFRSBvbiBhbGwKPiBhcmNoaXRlY3R1cmVzLCBhbmQgYXBhcnQgZnJvbSBzcGFy
YzMyIGJlaW5nIGEgYml0IHRyb3VibGVzb21lIChiZWNhdXNlCj4gaXQgdXNlcyBtbS0+cGFnZV90
YWJsZV9sb2NrIGZvciBzeW5jaHJvbml6YXRpb24gd2l0aGluCj4gX19wdGVfZnJlZV90bGIoKSks
IHRoZSBtb2RpZmljYXRpb25zIHdlcmUgcmVsYXRpdmVseSBzaW1wbGUuCj4gCj4+Cj4+IElmIGFs
bCA2NEJJVCBzdXBwb3J0IE1NVV9HQVRIRVJfUkNVX1RBQkxFX0ZSRUUgKGFzIHlvdSBwcmV2aW91
c2x5Cj4+IHN0YXRlKSwgd2h5IGNhbid0IHdlIG9ubHkgY2hlY2sgZm9yIDY0QklUPwo+IAo+IE9L
LCB3aWxsIGRvLgoKVGhpcyB3YXMgYWxzbyBtb3JlIG9mIGEgcXVlc3Rpb24gZm9yIGRpc2N1c3Np
b246CgpXb3VsZCBpdCBtYWtlIHNlbnNlIHRvIGhhdmUKCmNvbmZpZyBQVF9SRUNMQUlNCglkZWZf
Ym9vbCB5CglkZXBlbmRzIG9uIE1NVV9HQVRIRVJfUkNVX1RBQkxFX0ZSRUUKCihhKSBXb3VsZCB3
ZSB3YW50IHRvIG1ha2UgaXQgY29uZmlndXJhYmxlICh3aHk/KQooYikgRG8gd2UgcmVhbGx5IGNh
cmUgYWJvdXQgU01QICh3aHk/KQooYykgRG8gd2Ugd2FudCB0byBsaW1pdCB0byA2NGJpdCAod2h5
PykKKGQpIERvIHdlIHJlYWxseSBuZWVkIHRoZSBNTVUgY2hlY2sgaW4gYWRkaXRpb24gdG8KICAg
ICBNTVVfR0FUSEVSX1JDVV9UQUJMRV9GUkVFCgoKLS0gCkNoZWVycwoKRGF2aWQKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1h
aWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1hcmMK
