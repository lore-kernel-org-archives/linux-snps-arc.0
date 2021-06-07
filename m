Return-Path: <SRS0=8BTh=LB=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EB27C47082
	for <linux-snps-arc@archiver.kernel.org>; Mon,  7 Jun 2021 08:38:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B0D260233
	for <linux-snps-arc@archiver.kernel.org>; Mon,  7 Jun 2021 08:38:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B0D260233
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NUdPeGvaNFlStwOVNDluIXIAx5yUepOC7bKGUVo+z8I=; b=rBfQEtLlPZvNTDHsY7/Jsvv8zh
	En6M5qE+zjgsa3GnD44Nb08nnkQeeEmBKvh7K1OC9RWEzK72KK7Wa7MD74uApkw++baDniGzV6GbN
	s2939nogvjVNrnEohULunOhv4Dxv2E5dnPOr4L1/cRiQcWdc4IYwX+69etxQUM5Kjl3pYJgvGM9Gb
	joUU98/dgcoLWe2FNLRxFWDw2mjmLgBMCSxYDG3KLUO3m59wYB/Z2zjiUg7rC+ibdsujj7NwCpyki
	cwGkSQ1QDTZ2+c1OOjnHvi4K9pFTS6NO5spjVLszbMKqkkaG/hp5hvTyY2/M3cTEWrMTcJ64A1sTP
	3ETamHrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqAln-002LuZ-IA; Mon, 07 Jun 2021 08:38:03 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqAek-002JP3-Q1; Mon, 07 Jun 2021 08:30:51 +0000
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Fz61l5hvdz6wPm;
 Mon,  7 Jun 2021 16:27:39 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 7 Jun 2021 16:30:41 +0800
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 7 Jun 2021 16:30:40 +0800
Subject: Re: [PATCH v2 00/15] init_mm: cleanup ARCH's text/data/brk setup code
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Mike Rapoport
 <rppt@kernel.org>
CC: <uclinux-h8-devel@lists.sourceforge.jp>, <linux-s390@vger.kernel.org>,
 <linux-sh@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-csky@vger.kernel.org>, <linux-mm@kvack.org>,
 <linux-m68k@lists.linux-m68k.org>, <openrisc@lists.librecores.org>, "Andrew
 Morton" <akpm@linux-foundation.org>, <linux-snps-arc@lists.infradead.org>,
 <linuxppc-dev@lists.ozlabs.org>, <linux-riscv@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>
References: <20210604070633.32363-1-wangkefeng.wang@huawei.com>
 <YL0+Jargm+y9aqx1@kernel.org>
 <481056ab-686e-9f42-3b8a-b31941f58af6@huawei.com>
 <006eb573-5a20-1ac7-6234-338d11346a08@csgroup.eu>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
Message-ID: <f6051a1c-f7c3-6665-2d0a-5a3bf872fdb1@huawei.com>
Date: Mon, 7 Jun 2021 16:30:40 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <006eb573-5a20-1ac7-6234-338d11346a08@csgroup.eu>
Content-Language: en-US
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210607_013047_221760_F3888DFF 
X-CRM114-Status: GOOD (  17.60  )
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

Ck9uIDIwMjEvNi83IDEzOjQ4LCBDaHJpc3RvcGhlIExlcm95IHdyb3RlOgo+IEhpIEtlZmVuZywK
Pgo+IExlIDA3LzA2LzIwMjEgw6AgMDI6NTUsIEtlZmVuZyBXYW5nIGEgw6ljcml0wqA6Cj4+Cj4+
IE9uIDIwMjEvNi83IDU6MjksIE1pa2UgUmFwb3BvcnQgd3JvdGU6Cj4+PiBIZWxsbyBLZWZlbmcs
Cj4+Pgo+Pj4gT24gRnJpLCBKdW4gMDQsIDIwMjEgYXQgMDM6MDY6MThQTSArMDgwMCwgS2VmZW5n
IFdhbmcgd3JvdGU6Cj4+Pj4gQWRkIHNldHVwX2luaXRpYWxfaW5pdF9tbSgpIGhlbHBlciwgdGhl
biB1c2UgaXQKPj4+PiB0byBjbGVhbnVwIHRoZSB0ZXh0LCBkYXRhIGFuZCBicmsgc2V0dXAgY29k
ZS4KPj4+Pgo+Pj4+IHYyOgo+Pj4+IC0gY2hhbmdlIGFyZ3VtZW50IGZyb20gImNoYXIgKiIgdG8g
InZvaWQgKiIgc2V0dXBfaW5pdGlhbF9pbml0X21tKCkKPj4+PiDCoMKgIHN1Z2dlc3RlZCBieSBH
ZWVydCBVeXR0ZXJob2V2ZW4KPj4+PiAtIHVzZSBOVUxMIGluc3RlYWQgb2YgKHZvaWQgKikwIG9u
IGg4MzAwIGFuZCBtNjhrCj4+Pj4gLSBjb2xsZWN0IEFDS3MKPj4+Pgo+Pj4+IENjOiBsaW51eC1z
bnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCj4+Pj4gQ2M6IGxpbnV4LWFybS1rZXJuZWxAbGlz
dHMuaW5mcmFkZWFkLm9yZwo+Pj4+IENjOiBsaW51eC1jc2t5QHZnZXIua2VybmVsLm9yZwo+Pj4+
IENjOiB1Y2xpbnV4LWg4LWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLmpwCj4+Pj4gQ2M6IGxpbnV4
LW02OGtAbGlzdHMubGludXgtbTY4ay5vcmcKPj4+PiBDYzogb3BlbnJpc2NAbGlzdHMubGlicmVj
b3Jlcy5vcmcKPj4+PiBDYzogbGludXhwcGMtZGV2QGxpc3RzLm96bGFicy5vcmcKPj4+PiBDYzog
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+Pj4+IENjOiBsaW51eC1zaEB2Z2VyLmtl
cm5lbC5vcmcKPj4+PiBDYzogbGludXgtczM5MEB2Z2VyLmtlcm5lbC5vcmcKPj4+PiBLZWZlbmcg
V2FuZyAoMTUpOgo+Pj4+IMKgwqAgbW06IGFkZCBzZXR1cF9pbml0aWFsX2luaXRfbW0oKSBoZWxw
ZXIKPj4+PiDCoMKgIGFyYzogY29udmVydCB0byBzZXR1cF9pbml0aWFsX2luaXRfbW0oKQo+Pj4+
IMKgwqAgYXJtOiBjb252ZXJ0IHRvIHNldHVwX2luaXRpYWxfaW5pdF9tbSgpCj4+Pj4gwqDCoCBh
cm02NDogY29udmVydCB0byBzZXR1cF9pbml0aWFsX2luaXRfbW0oKQo+Pj4+IMKgwqAgY3NreTog
Y29udmVydCB0byBzZXR1cF9pbml0aWFsX2luaXRfbW0oKQo+Pj4+IMKgwqAgaDgzMDA6IGNvbnZl
cnQgdG8gc2V0dXBfaW5pdGlhbF9pbml0X21tKCkKPj4+PiDCoMKgIG02OGs6IGNvbnZlcnQgdG8g
c2V0dXBfaW5pdGlhbF9pbml0X21tKCkKPj4+PiDCoMKgIG5kczMyOiBjb252ZXJ0IHRvIHNldHVw
X2luaXRpYWxfaW5pdF9tbSgpCj4+Pj4gwqDCoCBuaW9zMjogY29udmVydCB0byBzZXR1cF9pbml0
aWFsX2luaXRfbW0oKQo+Pj4+IMKgwqAgb3BlbnJpc2M6IGNvbnZlcnQgdG8gc2V0dXBfaW5pdGlh
bF9pbml0X21tKCkKPj4+PiDCoMKgIHBvd2VycGM6IGNvbnZlcnQgdG8gc2V0dXBfaW5pdGlhbF9p
bml0X21tKCkKPj4+PiDCoMKgIHJpc2N2OiBjb252ZXJ0IHRvIHNldHVwX2luaXRpYWxfaW5pdF9t
bSgpCj4+Pj4gwqDCoCBzMzkwOiBjb252ZXJ0IHRvIHNldHVwX2luaXRpYWxfaW5pdF9tbSgpCj4+
Pj4gwqDCoCBzaDogY29udmVydCB0byBzZXR1cF9pbml0aWFsX2luaXRfbW0oKQo+Pj4+IMKgwqAg
eDg2OiBjb252ZXJ0IHRvIHNldHVwX2luaXRpYWxfaW5pdF9tbSgpCj4+PiBJIG1pZ2h0IGJlIG1p
c3Npbmcgc29tZXRoaW5nLCBidXQgQUZBSVUgdGhlIGluaXRfbW0uc3RhcnRfY29kZSBhbmQgCj4+
PiBvdGhlcgo+Pj4gZmllbGRzIGFyZSBub3QgdXNlZCByZWFsbHkgZWFybHkgc28gdGhlIG5ldyBz
ZXR1cF9pbml0aWFsX2luaXRfbW0oKQo+Pj4gZnVuY3Rpb24gY2FuIGJlIGNhbGxlZCBpbiB0aGUg
Z2VuZXJpYyBjb2RlIG91dHNpZGUgc2V0dXBfYXJjaCgpLCBlLmcgaW4KPj4+IG1tX2luaXQoKS4K
Pj4KPj4gSGkgTWlrZe+8jCBlYWNoIGFyY2hpdGVjdHVyZSBoYXMgdGhlaXIgb3duIHZhbHVlLCBu
b3QgdGhlIHNhbWUsIGVnIG02OEsgCj4+IGFuZAo+Pgo+PiBoODMwMCwgYWxzbyB0aGUgbmFtZSBv
ZiB0aGUgdGV4dC9jb2RlL2JyayBpcyBkaWZmZXJlbnQgaW4gc29tZSBhcmNoLCAKPj4gc28gSSBr
ZWVwCj4+Cj4+IHVuY2hhbmdlZC4KPgo+IFdoYXQgeW91IGNvdWxkIGRvIGlzIHRvIGRlZmluZSBh
IF9fd2VhayBmdW5jdGlvbiB0aGF0IGFyY2hpdGVjdHVyZXMgCj4gY2FuIG92ZXJyaWRlIGFuZCBj
YWxsIHRoYXQgZnVuY3Rpb24gZnJvbSBtbV9pbml0KCkgYXMgc3VnZ2VzdGVkIGJ5IE1pa2UsCj4K
PiBTb21ldGhpbmcgbGlrZToKPgo+IHZvaWQgX193ZWFrIHNldHVwX2luaXRpYWxfaW5pdF9tbSh2
b2lkKQo+IHsKPiDCoMKgwqDCoGluaXRfbW0uc3RhcnRfY29kZSA9ICh1bnNpZ25lZCBsb25nKV9z
dGV4dDsKPiDCoMKgwqDCoGluaXRfbW0uZW5kX2NvZGUgPSAodW5zaWduZWQgbG9uZylfZXRleHQ7
Cj4gwqDCoMKgwqBpbml0X21tLmVuZF9kYXRhID0gKHVuc2lnbmVkIGxvbmcpX2VkYXRhOwo+IMKg
wqDCoMKgaW5pdF9tbS5icmsgPSAodW5zaWduZWQgbG9uZylfZW5kOwo+IH0KPgo+IFRoZW4gb25s
eSB0aGUgZmV3IGFyY2hpdGVjdHVyZSB0aGF0IGFyZSBkaWZmZXJlbnQgd291bGQgb3ZlcnJpZGUg
aXQuCj4KPiBJIHNlZSBhIGZldyBhcmNoaWN0ZWN0dXJlcyBhcmUgdXNpZ25lIFBBR0VfT0ZGU0VU
IHRvIHNldCAuc3RhcnRfY29kZSwgCj4gYnV0IGl0IGlzIGxpa2VseSB0aGF0IHRoaXMgaXMgZXF1
aXZhbGVudCB0byBfc3RleHQuCgoKWWVzLMKgIHRoZSBfX3dlYWsgZnVuY3Rpb24gaXMgb3B0aW9u
LCBidXQgdGhlIGNoYW5nZSBpcyBvbmx5IGNvdmVyZWQgMTQgCmFyY2hzLCB0aGVyZSBhcmUgNyBv
dGhlciBhcmNoc++8iGFscGhhwqAgaGV4YWdvbsKgIGlhNjQKCm1pY3JvYmxhemXCoCBtaXBzIHNw
YXJjwqAgdW0geHRlbnNh77yJd2l0aG91dCByZWxhdGVkIHNldHVwIGNvZGUuIEFsc28gbGlrZSAK
eDg2LCBpdCBoYXMgb3duIGJyayAsIG1heWJlIHRoZXJlIGFyZSBzb21lCgpvdGhlciBkaWZmZXJl
bnQgaW4gc29tZSBhcmNoLCBzbyBJIHRoaW5rIGxldCdzIGtlZXAgdW5jaGFuZ2VkIGZvciBub3cs
wqAgCnRoYW5rcy4KCj4KPiBDaHJpc3RvcGhlCj4gLgo+CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGlu
dXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
