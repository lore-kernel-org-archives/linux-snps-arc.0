Return-Path: <SRS0=wMnh=IO=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A88CC433E0
	for <linux-snps-arc@archiver.kernel.org>; Tue, 16 Mar 2021 15:04:30 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD3D36508A
	for <linux-snps-arc@archiver.kernel.org>; Tue, 16 Mar 2021 15:04:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD3D36508A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XovzfXU0VxbKzKFO+Otzvh7v7Bu0Ok1dapE3AVnZtuI=; b=QD5IuZjbHAR/1ytIPwV5q2uo6
	SpoL1RBga8lu3ew5S5RMuVXBctoVPzmT4al0FLKp8bRFlFMzX3EQ4HSmTRN708bVQJnk688AAjoSD
	sat6Q5ntWpSU/du4HY7mYPidTYv+2xipNs0ygdwzpvo3qLIvz7K/DKAHMv4fEEMqwTfVdQ6x/Gzi0
	EN2KsB8U6DXq6zQ1aGsqMuXPVZ9Lgv1YVYopG2l4YTkVdJz0oaqBRYejtcyHrfbQN5k09D3tTgmqZ
	Hn9PsavsjrPfhvJyT3ftv118EIeWhURvbL3pyMAggz+4RW0BBsQ8RR/3etTOrQQ+ossBwo1UdzSAI
	RykbpNqBQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMBFE-0010Gu-Bj; Tue, 16 Mar 2021 15:04:28 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMBEy-0010Eh-V7; Tue, 16 Mar 2021 15:04:16 +0000
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4F0GjJ5s2vz8ydQ;
 Tue, 16 Mar 2021 23:02:12 +0800 (CST)
Received: from [10.174.177.244] (10.174.177.244) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.498.0; Tue, 16 Mar 2021 23:04:03 +0800
Subject: Re: [PATCH] mm: Move mem_init_print_info() into mm_init()
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
References: <20210316142637.92193-1-wangkefeng.wang@huawei.com>
 <26cca1c0-bd38-3d5b-5ca4-44081c444396@csgroup.eu>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
Message-ID: <c4bac0d9-d61f-afcd-0ea1-d8bc65993706@huawei.com>
Date: Tue, 16 Mar 2021 23:04:01 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <26cca1c0-bd38-3d5b-5ca4-44081c444396@csgroup.eu>
Content-Language: en-US
X-Originating-IP: [10.174.177.244]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210316_150413_864894_94575070 
X-CRM114-Status: GOOD (  15.63  )
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

Ck9uIDIwMjEvMy8xNiAyMjo0NywgQ2hyaXN0b3BoZSBMZXJveSB3cm90ZToKPgo+Cj4gTGUgMTYv
MDMvMjAyMSDDoCAxNToyNiwgS2VmZW5nIFdhbmcgYSDDqWNyaXTCoDoKPj4gbWVtX2luaXRfcHJp
bnRfaW5mbygpIGlzIGNhbGxlZCBpbiBtZW1faW5pdCgpIG9uIGVhY2ggYXJjaGl0ZWN0dXJlLAo+
PiBhbmQgcGFzcyBOVUxMIGFyZ3VtZW50LCBjbGVhbnVwIGl0IGJ5IHVzaW5nIHZvaWQgYXJndW1l
bnQgYW5kIG1vdmUKPj4gaXQgaW50byBtbV9pbml0KCkuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEtl
ZmVuZyBXYW5nIDx3YW5na2VmZW5nLndhbmdAaHVhd2VpLmNvbT4KPj4gLS0tCj4+IMKgIGFyY2gv
YWxwaGEvbW0vaW5pdC5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMSAtCj4+IMKgIGFyY2gv
YXJjL21tL2luaXQuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAxIC0KPj4gwqAgYXJj
aC9hcm0vbW0vaW5pdC5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDIgLS0KPj4gwqAg
YXJjaC9hcm02NC9tbS9pbml0LmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAyIC0tCj4+IMKg
IGFyY2gvY3NreS9tbS9pbml0LmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDEgLQo+PiDC
oCBhcmNoL2g4MzAwL21tL2luaXQuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDIgLS0KPj4g
wqAgYXJjaC9oZXhhZ29uL21tL2luaXQuY8KgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMSAtCj4+IMKg
IGFyY2gvaWE2NC9tbS9pbml0LmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDEgLQo+PiDC
oCBhcmNoL202OGsvbW0vaW5pdC5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAxIC0KPj4g
wqAgYXJjaC9taWNyb2JsYXplL21tL2luaXQuY8KgwqDCoMKgwqDCoMKgIHwgMSAtCj4+IMKgIGFy
Y2gvbWlwcy9sb29uZ3NvbjY0L251bWEuY8KgwqDCoMKgwqAgfCAxIC0KPj4gwqAgYXJjaC9taXBz
L21tL2luaXQuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMSAtCj4+IMKgIGFyY2gvbWlw
cy9zZ2ktaXAyNy9pcDI3LW1lbW9yeS5jIHwgMSAtCj4+IMKgIGFyY2gvbmRzMzIvbW0vaW5pdC5j
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMSAtCj4+IMKgIGFyY2gvbmlvczIvbW0vaW5pdC5j
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMSAtCj4+IMKgIGFyY2gvb3BlbnJpc2MvbW0vaW5p
dC5jwqDCoMKgwqDCoMKgwqDCoMKgIHwgMiAtLQo+PiDCoCBhcmNoL3BhcmlzYy9tbS9pbml0LmPC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMiAtLQo+PiDCoCBhcmNoL3Bvd2VycGMvbW0vbWVtLmPC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMSAtCj4+IMKgIGFyY2gvcmlzY3YvbW0vaW5pdC5jwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMSAtCj4+IMKgIGFyY2gvczM5MC9tbS9pbml0LmPCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDIgLS0KPj4gwqAgYXJjaC9zaC9tbS9pbml0LmPCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAxIC0KPj4gwqAgYXJjaC9zcGFyYy9tbS9pbml0
XzMyLmPCoMKgwqDCoMKgwqDCoMKgwqAgfCAyIC0tCj4+IMKgIGFyY2gvc3BhcmMvbW0vaW5pdF82
NC5jwqDCoMKgwqDCoMKgwqDCoMKgIHwgMSAtCj4+IMKgIGFyY2gvdW0va2VybmVsL21lbS5jwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMSAtCj4+IMKgIGFyY2gveDg2L21tL2luaXRfMzIuY8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAyIC0tCj4+IMKgIGFyY2gveDg2L21tL2luaXRfNjQuY8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAyIC0tCj4+IMKgIGFyY2gveHRlbnNhL21tL2luaXQuY8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAxIC0KPj4gwqAgaW5jbHVkZS9saW51eC9tbS5owqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDIgKy0KPj4gwqAgaW5pdC9tYWluLmPCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAxICsKPj4gwqAgbW0vcGFnZV9hbGxv
Yy5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDIgKy0KPj4gwqAgMzAgZmls
ZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzOCBkZWxldGlvbnMoLSkKPj4KPgo+PiBkaWZm
IC0tZ2l0IGEvbW0vcGFnZV9hbGxvYy5jIGIvbW0vcGFnZV9hbGxvYy5jCj4+IGluZGV4IDU1ZDkz
ODI5N2NlNi4uZTRhNmJmNjljODA2IDEwMDY0NAo+PiAtLS0gYS9tbS9wYWdlX2FsbG9jLmMKPj4g
KysrIGIvbW0vcGFnZV9hbGxvYy5jCj4+IEBAIC03NzI4LDcgKzc3MjgsNyBAQCB1bnNpZ25lZCBs
b25nIGZyZWVfcmVzZXJ2ZWRfYXJlYSh2b2lkICpzdGFydCwgCj4+IHZvaWQgKmVuZCwgaW50IHBv
aXNvbiwgY29uc3QgY2hhcgo+PiDCoMKgwqDCoMKgIHJldHVybiBwYWdlczsKPj4gwqAgfQo+PiDC
oCAtdm9pZCBfX2luaXQgbWVtX2luaXRfcHJpbnRfaW5mbyhjb25zdCBjaGFyICpzdHIpCj4+ICt2
b2lkIF9faW5pdCBtZW1faW5pdF9wcmludF9pbmZvKHZvaWQpCj4+IMKgIHsKPj4gwqDCoMKgwqDC
oCB1bnNpZ25lZCBsb25nIHBoeXNwYWdlcywgY29kZXNpemUsIGRhdGFzaXplLCByb3NpemUsIGJz
c19zaXplOwo+PiDCoMKgwqDCoMKgIHVuc2lnbmVkIGxvbmcgaW5pdF9jb2RlX3NpemUsIGluaXRf
ZGF0YV9zaXplOwo+Pgo+Cj4gQW5kIHdoYXQgYWJvdXQgdGhlICdzdHInIGluIHRoZSBsYXN0IGxp
bmUgb2YgdGhlIGZ1bmN0aW9uID8KPgo+IMKgwqDCoMKgcHJfaW5mbygiTWVtb3J5OiAlbHVLLyVs
dUsgYXZhaWxhYmxlICglbHVLIGtlcm5lbCBjb2RlLCAlbHVLIAo+IHJ3ZGF0YSwgJWx1SyByb2Rh
dGEsICVsdUsgaW5pdCwgJWx1SyBic3MsICVsdUsgcmVzZXJ2ZWQsICVsdUsgCj4gY21hLXJlc2Vy
dmVkIgo+ICNpZmRlZsKgwqDCoCBDT05GSUdfSElHSE1FTQo+IMKgwqDCoMKgwqDCoMKgICIsICVs
dUsgaGlnaG1lbSIKPiAjZW5kaWYKPiDCoMKgwqDCoMKgwqDCoCAiJXMlcylcbiIsCj4gwqDCoMKg
wqDCoMKgwqAgbnJfZnJlZV9wYWdlcygpIDw8IChQQUdFX1NISUZUIC0gMTApLAo+IMKgwqDCoMKg
wqDCoMKgIHBoeXNwYWdlcyA8PCAoUEFHRV9TSElGVCAtIDEwKSwKPiDCoMKgwqDCoMKgwqDCoCBj
b2Rlc2l6ZSA+PiAxMCwgZGF0YXNpemUgPj4gMTAsIHJvc2l6ZSA+PiAxMCwKPiDCoMKgwqDCoMKg
wqDCoCAoaW5pdF9kYXRhX3NpemUgKyBpbml0X2NvZGVfc2l6ZSkgPj4gMTAsIGJzc19zaXplID4+
IDEwLAo+IMKgwqDCoMKgwqDCoMKgIChwaHlzcGFnZXMgLSB0b3RhbHJhbV9wYWdlcygpIC0gdG90
YWxjbWFfcGFnZXMpIDw8IChQQUdFX1NISUZUIAo+IC0gMTApLAo+IMKgwqDCoMKgwqDCoMKgIHRv
dGFsY21hX3BhZ2VzIDw8IChQQUdFX1NISUZUIC0gMTApLAo+ICNpZmRlZsKgwqDCoCBDT05GSUdf
SElHSE1FTQo+IMKgwqDCoMKgwqDCoMKgIHRvdGFsaGlnaF9wYWdlcygpIDw8IChQQUdFX1NISUZU
IC0gMTApLAo+ICNlbmRpZgo+IMKgwqDCoMKgwqDCoMKgIHN0ciA/ICIsICIgOiAiIiwgc3RyID8g
c3RyIDogIiIpOwoKb2gswqDCoCBJIHNlbmQgYSBiYWQgdmVyc2lvbu+8jGZpcnN0bHkgSSB3YW50
IHRvIHNwbGl0IHR3byBwYXRjaGVzLCBvbmUgZm9yIApmdW5jdGlvbiBtb3ZlLCBvbmUgZm9yIGZ1
bmN0aW9uIGNoYW5nZS4KCnNvcnJ5LCBwbGVhc2UgaWdub3JlIGl077yMIHRoYW5rcyBmb3IgeW91
ciByZW1pbmQuCgo+Cj4KPiBDaHJpc3RvcGhlCj4gLgo+CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGlu
dXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
