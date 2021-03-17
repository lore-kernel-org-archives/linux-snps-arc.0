Return-Path: <SRS0=ISwX=IP=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 975B3C433E0
	for <linux-snps-arc@archiver.kernel.org>; Wed, 17 Mar 2021 05:58:29 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BC6364FAB
	for <linux-snps-arc@archiver.kernel.org>; Wed, 17 Mar 2021 05:58:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2BC6364FAB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pfrFQNSYLVbWbelUzZoN864k+8Q97HayoqVsvZoxjvY=; b=j3DRPRA+Taa13fQvZAN8Q9uWN
	4iWWV+ZdPu/dzt0sFRKRevA0cTOW7y4W5Z1sOEJWyjWj44TblwqI9v+7dL5iWNvzwn9ZqmH8yAAiK
	oH9c0FPUNBmYwwgSOHPJHJDXZmdsR/NdnYdljzPx+r2uaB+vYWRB6RlJx9T44Ck1OCBhkTxoXGkcQ
	vvPzUx1hxomC18LLLH7VJQAdJGwvO4JwXmAi1GleYjQd9camtldVhYtBMt6V8TY65tcBoI0IW1QdN
	Z2sWkdA8l1iBZyNcFCarGuJTXtV6Hvl0VsWD4DdhEAj2d7CZaiDCavQg5kpr46eKERk/J/8cDRApb
	f3nLWpOtQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMPCN-002WDG-JH; Wed, 17 Mar 2021 05:58:27 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMPCA-002WBD-NU; Wed, 17 Mar 2021 05:58:17 +0000
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4F0fXm6M3nz17M4p;
 Wed, 17 Mar 2021 13:56:08 +0800 (CST)
Received: from [10.174.177.244] (10.174.177.244) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.498.0; Wed, 17 Mar 2021 13:57:58 +0800
Subject: Re: [PATCH v2] mm: Move mem_init_print_info() into mm_init()
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>
CC: <linux-ia64@vger.kernel.org>, <linux-sh@vger.kernel.org>, Peter Zijlstra
 <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, "Dave
 Hansen" <dave.hansen@linux.intel.com>, <linux-mm@kvack.org>, Guo Ren
 <guoren@kernel.org>, <sparclinux@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, Jonas Bonn <jonas@southpole.se>,
 <linux-s390@vger.kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 <linux-hexagon@vger.kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 "Russell King" <linux@armlinux.org.uk>, <linux-csky@vger.kernel.org>, Ingo
 Molnar <mingo@redhat.com>, <linux-snps-arc@lists.infradead.org>,
 <linux-xtensa@linux-xtensa.org>, Heiko Carstens <hca@linux.ibm.com>,
 <linux-um@lists.infradead.org>, <linux-m68k@lists.linux-m68k.org>,
 <openrisc@lists.librecores.org>, <linux-arm-kernel@lists.infradead.org>,
 Richard Henderson <rth@twiddle.net>, <linux-parisc@vger.kernel.org>,
 <linux-mips@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 <linux-alpha@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>, "David S.
 Miller" <davem@davemloft.net>
References: <4d488195-7281-9238-b30d-9f89a6100fb9@csgroup.eu>
 <20210317015210.33641-1-wangkefeng.wang@huawei.com>
 <3f6959d6-1f37-8baf-a12e-3fbda6a17c7d@csgroup.eu>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
Message-ID: <fef8ca3b-97ae-5c19-69ea-bb1dfe88cf9c@huawei.com>
Date: Wed, 17 Mar 2021 13:57:57 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <3f6959d6-1f37-8baf-a12e-3fbda6a17c7d@csgroup.eu>
Content-Language: en-US
X-Originating-IP: [10.174.177.244]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210317_055815_507831_04975B88 
X-CRM114-Status: GOOD (  15.56  )
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

Ck9uIDIwMjEvMy8xNyAxMzo0OCwgQ2hyaXN0b3BoZSBMZXJveSB3cm90ZToKPgo+Cj4gTGUgMTcv
MDMvMjAyMSDDoCAwMjo1MiwgS2VmZW5nIFdhbmcgYSDDqWNyaXTCoDoKPj4gbWVtX2luaXRfcHJp
bnRfaW5mbygpIGlzIGNhbGxlZCBpbiBtZW1faW5pdCgpIG9uIGVhY2ggYXJjaGl0ZWN0dXJlLAo+
PiBhbmQgcGFzcyBOVUxMIGFyZ3VtZW50LCBzbyB1c2luZyB2b2lkIGFyZ3VtZW50IGFuZCBtb3Zl
IGl0IGludG8gCj4+IG1tX2luaXQoKS4KPj4KPj4gQWNrZWQtYnk6IERhdmUgSGFuc2VuIDxkYXZl
LmhhbnNlbkBsaW51eC5pbnRlbC5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IEtlZmVuZyBXYW5nIDx3
YW5na2VmZW5nLndhbmdAaHVhd2VpLmNvbT4KPj4gLS0tCj4+IHYyOgo+PiAtIENsZWFudXAgJ3N0
cicgbGluZSBzdWdnZXN0ZWQgYnkgQ2hyaXN0b3BoZSBhbmQgQUNLCj4+Cj4+IMKgIGFyY2gvYWxw
aGEvbW0vaW5pdC5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAxIC0KPj4gwqAgYXJjaC9h
cmMvbW0vaW5pdC5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMSAtCj4+IMKgIGFy
Y2gvYXJtL21tL2luaXQuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDIgLS0KPj4g
wqAgYXJjaC9hcm02NC9tbS9pbml0LmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDIgLS0K
Pj4gwqAgYXJjaC9jc2t5L21tL2luaXQuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAx
IC0KPj4gwqAgYXJjaC9oODMwMC9tbS9pbml0LmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKg
IDIgLS0KPj4gwqAgYXJjaC9oZXhhZ29uL21tL2luaXQuY8KgwqDCoMKgwqDCoMKgwqDCoMKgIHzC
oCAxIC0KPj4gwqAgYXJjaC9pYTY0L21tL2luaXQuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHzCoCAxIC0KPj4gwqAgYXJjaC9tNjhrL21tL2luaXQuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHzCoCAxIC0KPj4gwqAgYXJjaC9taWNyb2JsYXplL21tL2luaXQuY8KgwqDCoMKgwqDCoMKg
IHzCoCAxIC0KPj4gwqAgYXJjaC9taXBzL2xvb25nc29uNjQvbnVtYS5jwqDCoMKgwqDCoCB8wqAg
MSAtCj4+IMKgIGFyY2gvbWlwcy9tbS9pbml0LmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8
wqAgMSAtCj4+IMKgIGFyY2gvbWlwcy9zZ2ktaXAyNy9pcDI3LW1lbW9yeS5jIHzCoCAxIC0KPj4g
wqAgYXJjaC9uZHMzMi9tbS9pbml0LmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDEgLQo+
PiDCoCBhcmNoL25pb3MyL21tL2luaXQuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMSAt
Cj4+IMKgIGFyY2gvb3BlbnJpc2MvbW0vaW5pdC5jwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAyIC0t
Cj4+IMKgIGFyY2gvcGFyaXNjL21tL2luaXQuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDIg
LS0KPj4gwqAgYXJjaC9wb3dlcnBjL21tL21lbS5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAg
MSAtCj4+IMKgIGFyY2gvcmlzY3YvbW0vaW5pdC5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzC
oCAxIC0KPj4gwqAgYXJjaC9zMzkwL21tL2luaXQuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHzCoCAyIC0tCj4+IMKgIGFyY2gvc2gvbW0vaW5pdC5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHzCoCAxIC0KPj4gwqAgYXJjaC9zcGFyYy9tbS9pbml0XzMyLmPCoMKgwqDCoMKgwqDC
oMKgwqAgfMKgIDIgLS0KPj4gwqAgYXJjaC9zcGFyYy9tbS9pbml0XzY0LmPCoMKgwqDCoMKgwqDC
oMKgwqAgfMKgIDEgLQo+PiDCoCBhcmNoL3VtL2tlcm5lbC9tZW0uY8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB8wqAgMSAtCj4+IMKgIGFyY2gveDg2L21tL2luaXRfMzIuY8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgfMKgIDIgLS0KPj4gwqAgYXJjaC94ODYvbW0vaW5pdF82NC5jwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCB8wqAgMiAtLQo+PiDCoCBhcmNoL3h0ZW5zYS9tbS9pbml0LmPCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHzCoCAxIC0KPj4gwqAgaW5jbHVkZS9saW51eC9tbS5owqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB8wqAgMiArLQo+PiDCoCBpbml0L21haW4uY8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMSArCj4+IMKgIG1tL3BhZ2VfYWxsb2Mu
Y8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAxMCArKysrKy0tLS0tCj4+IMKg
IDMwIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNDIgZGVsZXRpb25zKC0pCj4+Cj4K
Pj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvbW0uaCBiL2luY2x1ZGUvbGludXgvbW0uaAo+
PiBpbmRleCA4OTMxNDY1MWRkNjIuLmMyZTBiMzQ5NWM1YSAxMDA2NDQKPj4gLS0tIGEvaW5jbHVk
ZS9saW51eC9tbS5oCj4+ICsrKyBiL2luY2x1ZGUvbGludXgvbW0uaAo+PiBAQCAtMjM3Myw3ICsy
MzczLDcgQEAgZXh0ZXJuIHVuc2lnbmVkIGxvbmcgZnJlZV9yZXNlcnZlZF9hcmVhKHZvaWQgCj4+
ICpzdGFydCwgdm9pZCAqZW5kLAo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgaW50IHBvaXNvbiwgY29uc3QgY2hhciAqcyk7Cj4+IMKgIMKgIGV4dGVybiB2b2lk
IGFkanVzdF9tYW5hZ2VkX3BhZ2VfY291bnQoc3RydWN0IHBhZ2UgKnBhZ2UsIGxvbmcgCj4+IGNv
dW50KTsKPj4gLWV4dGVybiB2b2lkIG1lbV9pbml0X3ByaW50X2luZm8oY29uc3QgY2hhciAqc3Ry
KTsKPj4gK2V4dGVybiB2b2lkIG1lbV9pbml0X3ByaW50X2luZm8odm9pZCk7Cj4KPiBTb3JyeSBJ
IGRpZG4ndCBzZWUgdGhhdCBpbiBwcmV2aW91cyBwYXRjaC4KPgo+ICdleHRlcm4nIGtleXdvcmQg
aXMgcG9pbnRsZXNzIGZvciBmdW5jdGlvbiBwcm90b3R5cGVzIGFuZCBpcyAKPiBkZXByZWNhdGVk
LCB5b3Ugc2hvdWxkIHJlbW92ZSBpdC4KPgo+IFRoYXQgc2FpZCwKPgo+IFJldmlld2VkLWJ5OiBD
aHJpc3RvcGhlIExlcm95IDxjaHJpc3RvcGhlLmxlcm95QGMtcy5mcj4gIyBmb2N1c3NlZCBvbiAK
PiBwb3dlcnBjClRoYW5rcywgbGV0J3Mgd2FpdCBmb3IgbW9yZSBmZWVkYmFjayBmcm9tIG90aGVy
IGFyY2hpdGVjdHVyZXMsIGlmIApuZWNlc3NhcnkswqAgd2lsbCBzZW5kIGEgbmV3IG9uZS4KPgo+
PiDCoCDCoCBleHRlcm4gdm9pZCByZXNlcnZlX2Jvb3RtZW1fcmVnaW9uKHBoeXNfYWRkcl90IHN0
YXJ0LCBwaHlzX2FkZHJfdCAKPj4gZW5kKTsKPiAuCj4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51
eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1hcmMK
