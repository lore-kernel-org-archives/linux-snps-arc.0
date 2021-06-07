Return-Path: <SRS0=8BTh=LB=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA6E7C4743D
	for <linux-snps-arc@archiver.kernel.org>; Mon,  7 Jun 2021 00:56:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90558613BC
	for <linux-snps-arc@archiver.kernel.org>; Mon,  7 Jun 2021 00:56:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 90558613BC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lwpTigAQgRcNGItKoy07dZRRZa/2I2vNJcW210FRVtU=; b=bFs0RDlw8CcyHzLO59gJcTh2sI
	coXimMyAxnn8rgzK01awvG3z6y1AutUn32Q2K82aqTl/aCCcyqqBuPoUqd4h02ek2OWZ4lhKHAJiP
	mr4bomUXSdvOYMdXGTa+7i70yTNFR79M2d7FsYs5TQ6GB4mHgsTmGsiXlEg+Ti78BwJTrmfB35S7A
	PzISGUWkq2/N7J+n3o6zhQ19G96hD4h/O2yd3VTFEIGY/GwB5vlP9giAHGo31WmSfVvCHDHDMyKVg
	GGKCsOOjc9Idwe0IXHnVM5tmgCcDBOCHiclyhTYUQz1Y17k6xY008HeIs9cWtjlaBXYmfvlCF4bO0
	vMp/N8og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lq3Z6-0018pB-2J; Mon, 07 Jun 2021 00:56:28 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lq3Yq-0018mM-QC; Mon, 07 Jun 2021 00:56:14 +0000
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Fyvtz02SLzWnwv;
 Mon,  7 Jun 2021 08:51:07 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 7 Jun 2021 08:55:55 +0800
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 7 Jun 2021 08:55:55 +0800
Subject: Re: [PATCH v2 00/15] init_mm: cleanup ARCH's text/data/brk setup code
To: Mike Rapoport <rppt@kernel.org>
CC: Andrew Morton <akpm@linux-foundation.org>, <linux-kernel@vger.kernel.org>, 
 <linux-mm@kvack.org>, <linux-snps-arc@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-csky@vger.kernel.org>,
 <uclinux-h8-devel@lists.sourceforge.jp>, <linux-m68k@lists.linux-m68k.org>,
 <openrisc@lists.librecores.org>, <linuxppc-dev@lists.ozlabs.org>,
 <linux-riscv@lists.infradead.org>, <linux-sh@vger.kernel.org>,
 <linux-s390@vger.kernel.org>
References: <20210604070633.32363-1-wangkefeng.wang@huawei.com>
 <YL0+Jargm+y9aqx1@kernel.org>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
Message-ID: <481056ab-686e-9f42-3b8a-b31941f58af6@huawei.com>
Date: Mon, 7 Jun 2021 08:55:54 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <YL0+Jargm+y9aqx1@kernel.org>
Content-Language: en-US
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210606_175613_276842_0A2A0E61 
X-CRM114-Status: GOOD (  13.65  )
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

Ck9uIDIwMjEvNi83IDU6MjksIE1pa2UgUmFwb3BvcnQgd3JvdGU6Cj4gSGVsbG8gS2VmZW5nLAo+
Cj4gT24gRnJpLCBKdW4gMDQsIDIwMjEgYXQgMDM6MDY6MThQTSArMDgwMCwgS2VmZW5nIFdhbmcg
d3JvdGU6Cj4+IEFkZCBzZXR1cF9pbml0aWFsX2luaXRfbW0oKSBoZWxwZXIsIHRoZW4gdXNlIGl0
Cj4+IHRvIGNsZWFudXAgdGhlIHRleHQsIGRhdGEgYW5kIGJyayBzZXR1cCBjb2RlLgo+Pgo+PiB2
MjoKPj4gLSBjaGFuZ2UgYXJndW1lbnQgZnJvbSAiY2hhciAqIiB0byAidm9pZCAqIiBzZXR1cF9p
bml0aWFsX2luaXRfbW0oKQo+PiAgICBzdWdnZXN0ZWQgYnkgR2VlcnQgVXl0dGVyaG9ldmVuCj4+
IC0gdXNlIE5VTEwgaW5zdGVhZCBvZiAodm9pZCAqKTAgb24gaDgzMDAgYW5kIG02OGsKPj4gLSBj
b2xsZWN0IEFDS3MKPj4KPj4gQ2M6IGxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcK
Pj4gQ2M6IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwo+PiBDYzogbGludXgt
Y3NreUB2Z2VyLmtlcm5lbC5vcmcKPj4gQ2M6IHVjbGludXgtaDgtZGV2ZWxAbGlzdHMuc291cmNl
Zm9yZ2UuanAKPj4gQ2M6IGxpbnV4LW02OGtAbGlzdHMubGludXgtbTY4ay5vcmcKPj4gQ2M6IG9w
ZW5yaXNjQGxpc3RzLmxpYnJlY29yZXMub3JnCj4+IENjOiBsaW51eHBwYy1kZXZAbGlzdHMub3ps
YWJzLm9yZwo+PiBDYzogbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+PiBDYzogbGlu
dXgtc2hAdmdlci5rZXJuZWwub3JnCj4+IENjOiBsaW51eC1zMzkwQHZnZXIua2VybmVsLm9yZwo+
PiBLZWZlbmcgV2FuZyAoMTUpOgo+PiAgICBtbTogYWRkIHNldHVwX2luaXRpYWxfaW5pdF9tbSgp
IGhlbHBlcgo+PiAgICBhcmM6IGNvbnZlcnQgdG8gc2V0dXBfaW5pdGlhbF9pbml0X21tKCkKPj4g
ICAgYXJtOiBjb252ZXJ0IHRvIHNldHVwX2luaXRpYWxfaW5pdF9tbSgpCj4+ICAgIGFybTY0OiBj
b252ZXJ0IHRvIHNldHVwX2luaXRpYWxfaW5pdF9tbSgpCj4+ICAgIGNza3k6IGNvbnZlcnQgdG8g
c2V0dXBfaW5pdGlhbF9pbml0X21tKCkKPj4gICAgaDgzMDA6IGNvbnZlcnQgdG8gc2V0dXBfaW5p
dGlhbF9pbml0X21tKCkKPj4gICAgbTY4azogY29udmVydCB0byBzZXR1cF9pbml0aWFsX2luaXRf
bW0oKQo+PiAgICBuZHMzMjogY29udmVydCB0byBzZXR1cF9pbml0aWFsX2luaXRfbW0oKQo+PiAg
ICBuaW9zMjogY29udmVydCB0byBzZXR1cF9pbml0aWFsX2luaXRfbW0oKQo+PiAgICBvcGVucmlz
YzogY29udmVydCB0byBzZXR1cF9pbml0aWFsX2luaXRfbW0oKQo+PiAgICBwb3dlcnBjOiBjb252
ZXJ0IHRvIHNldHVwX2luaXRpYWxfaW5pdF9tbSgpCj4+ICAgIHJpc2N2OiBjb252ZXJ0IHRvIHNl
dHVwX2luaXRpYWxfaW5pdF9tbSgpCj4+ICAgIHMzOTA6IGNvbnZlcnQgdG8gc2V0dXBfaW5pdGlh
bF9pbml0X21tKCkKPj4gICAgc2g6IGNvbnZlcnQgdG8gc2V0dXBfaW5pdGlhbF9pbml0X21tKCkK
Pj4gICAgeDg2OiBjb252ZXJ0IHRvIHNldHVwX2luaXRpYWxfaW5pdF9tbSgpCj4gSSBtaWdodCBi
ZSBtaXNzaW5nIHNvbWV0aGluZywgYnV0IEFGQUlVIHRoZSBpbml0X21tLnN0YXJ0X2NvZGUgYW5k
IG90aGVyCj4gZmllbGRzIGFyZSBub3QgdXNlZCByZWFsbHkgZWFybHkgc28gdGhlIG5ldyBzZXR1
cF9pbml0aWFsX2luaXRfbW0oKQo+IGZ1bmN0aW9uIGNhbiBiZSBjYWxsZWQgaW4gdGhlIGdlbmVy
aWMgY29kZSBvdXRzaWRlIHNldHVwX2FyY2goKSwgZS5nIGluCj4gbW1faW5pdCgpLgoKSGkgTWlr
Ze+8jCBlYWNoIGFyY2hpdGVjdHVyZSBoYXMgdGhlaXIgb3duIHZhbHVlLCBub3QgdGhlIHNhbWUs
IGVnIG02OEsgYW5kCgpoODMwMCwgYWxzbyB0aGUgbmFtZSBvZiB0aGUgdGV4dC9jb2RlL2JyayBp
cyBkaWZmZXJlbnQgaW4gc29tZSBhcmNoLCBzbyAKSSBrZWVwCgp1bmNoYW5nZWQuCgo+ICAgCj4+
ICAgYXJjaC9hcmMvbW0vaW5pdC5jICAgICAgICAgICAgICAgICB8IDUgKy0tLS0KPj4gICBhcmNo
L2FybS9rZXJuZWwvc2V0dXAuYyAgICAgICAgICAgIHwgNSArLS0tLQo+PiAgIGFyY2gvYXJtNjQv
a2VybmVsL3NldHVwLmMgICAgICAgICAgfCA1ICstLS0tCj4+ICAgYXJjaC9jc2t5L2tlcm5lbC9z
ZXR1cC5jICAgICAgICAgICB8IDUgKy0tLS0KPj4gICBhcmNoL2g4MzAwL2tlcm5lbC9zZXR1cC5j
ICAgICAgICAgIHwgNSArLS0tLQo+PiAgIGFyY2gvbTY4ay9rZXJuZWwvc2V0dXBfbW0uYyAgICAg
ICAgfCA1ICstLS0tCj4+ICAgYXJjaC9tNjhrL2tlcm5lbC9zZXR1cF9uby5jICAgICAgICB8IDUg
Ky0tLS0KPj4gICBhcmNoL25kczMyL2tlcm5lbC9zZXR1cC5jICAgICAgICAgIHwgNSArLS0tLQo+
PiAgIGFyY2gvbmlvczIva2VybmVsL3NldHVwLmMgICAgICAgICAgfCA1ICstLS0tCj4+ICAgYXJj
aC9vcGVucmlzYy9rZXJuZWwvc2V0dXAuYyAgICAgICB8IDUgKy0tLS0KPj4gICBhcmNoL3Bvd2Vy
cGMva2VybmVsL3NldHVwLWNvbW1vbi5jIHwgNSArLS0tLQo+PiAgIGFyY2gvcmlzY3Yva2VybmVs
L3NldHVwLmMgICAgICAgICAgfCA1ICstLS0tCj4+ICAgYXJjaC9zMzkwL2tlcm5lbC9zZXR1cC5j
ICAgICAgICAgICB8IDUgKy0tLS0KPj4gICBhcmNoL3NoL2tlcm5lbC9zZXR1cC5jICAgICAgICAg
ICAgIHwgNSArLS0tLQo+PiAgIGFyY2gveDg2L2tlcm5lbC9zZXR1cC5jICAgICAgICAgICAgfCA1
ICstLS0tCj4+ICAgaW5jbHVkZS9saW51eC9tbV90eXBlcy5oICAgICAgICAgICB8IDggKysrKysr
KysKPj4gICAxNiBmaWxlcyBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspLCA2MCBkZWxldGlvbnMo
LSkKPj4KPj4gLS0gCj4+IDIuMjYuMgo+Pgo+Pgo+PiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwo+PiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPj4gbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+PiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgt
c25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
