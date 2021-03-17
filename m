Return-Path: <SRS0=ISwX=IP=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37DEAC433DB
	for <linux-snps-arc@archiver.kernel.org>; Wed, 17 Mar 2021 05:48:53 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CBC4D64F2A
	for <linux-snps-arc@archiver.kernel.org>; Wed, 17 Mar 2021 05:48:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CBC4D64F2A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=csgroup.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rRCZKL04oXrRQYqNmX0aQjTKHsWHA5g7iuzgK+YZjBY=; b=byrJN1Xybid9XIpdirfQMBgyU
	AGK4SMByaV72ekaVievnL2iw2mGytfNY3+ruYwZGGY4Ql+M5VTnV//mtTOsydqAyYA0wdX+5T60J6
	LFIRHswIf0seCbkmRROkg2vmKsvkeJGtyyk+m/ASBJzBwprsxd3ufaoYZO4kckVqyyGrfpOrh1/v9
	jTRflpYHsZsU4wBvtWnOvQY7bfxeH1SZARCVF/Pl6Ka2aq8gtJEb/bFXyBMwNf1WNbfYe9UrH6UaV
	HRvf+EoEg2gxuNUuSz6MxKZrmbZ3QNs9Vyi1jVR+qI/aijgM25kPQ5dktMVUyT4e5avX9mbpuhKZ8
	JX4KbZjlw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMP35-002VKi-8z; Wed, 17 Mar 2021 05:48:51 +0000
Received: from pegase1.c-s.fr ([93.17.236.30])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMP2o-002VID-8X; Wed, 17 Mar 2021 05:48:37 +0000
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4F0fMz3RQ5z9vBLs;
 Wed, 17 Mar 2021 06:48:31 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 5HAfcpzaS9zh; Wed, 17 Mar 2021 06:48:31 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4F0fMz2JZBz9vBLr;
 Wed, 17 Mar 2021 06:48:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 434728B7F7;
 Wed, 17 Mar 2021 06:48:31 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id G8uQhGY3jGja; Wed, 17 Mar 2021 06:48:30 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 82F468B768;
 Wed, 17 Mar 2021 06:48:18 +0100 (CET)
Subject: Re: [PATCH v2] mm: Move mem_init_print_info() into mm_init()
To: Kefeng Wang <wangkefeng.wang@huawei.com>, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org,
 Guo Ren <guoren@kernel.org>, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, Jonas Bonn <jonas@southpole.se>,
 linux-s390@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 linux-hexagon@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, linux-snps-arc@lists.infradead.org,
 linux-xtensa@linux-xtensa.org, Heiko Carstens <hca@linux.ibm.com>,
 linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, linux-arm-kernel@lists.infradead.org,
 Richard Henderson <rth@twiddle.net>, linux-parisc@vger.kernel.org,
 linux-mips@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-alpha@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
References: <4d488195-7281-9238-b30d-9f89a6100fb9@csgroup.eu>
 <20210317015210.33641-1-wangkefeng.wang@huawei.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <3f6959d6-1f37-8baf-a12e-3fbda6a17c7d@csgroup.eu>
Date: Wed, 17 Mar 2021 06:48:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210317015210.33641-1-wangkefeng.wang@huawei.com>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210317_054834_625931_7A2C10A6 
X-CRM114-Status: GOOD (  12.78  )
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

CgpMZSAxNy8wMy8yMDIxIMOgIDAyOjUyLCBLZWZlbmcgV2FuZyBhIMOpY3JpdMKgOgo+IG1lbV9p
bml0X3ByaW50X2luZm8oKSBpcyBjYWxsZWQgaW4gbWVtX2luaXQoKSBvbiBlYWNoIGFyY2hpdGVj
dHVyZSwKPiBhbmQgcGFzcyBOVUxMIGFyZ3VtZW50LCBzbyB1c2luZyB2b2lkIGFyZ3VtZW50IGFu
ZCBtb3ZlIGl0IGludG8gbW1faW5pdCgpLgo+IAo+IEFja2VkLWJ5OiBEYXZlIEhhbnNlbiA8ZGF2
ZS5oYW5zZW5AbGludXguaW50ZWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEtlZmVuZyBXYW5nIDx3
YW5na2VmZW5nLndhbmdAaHVhd2VpLmNvbT4KPiAtLS0KPiB2MjoKPiAtIENsZWFudXAgJ3N0cicg
bGluZSBzdWdnZXN0ZWQgYnkgQ2hyaXN0b3BoZSBhbmQgQUNLCj4gCj4gICBhcmNoL2FscGhhL21t
L2luaXQuYyAgICAgICAgICAgICB8ICAxIC0KPiAgIGFyY2gvYXJjL21tL2luaXQuYyAgICAgICAg
ICAgICAgIHwgIDEgLQo+ICAgYXJjaC9hcm0vbW0vaW5pdC5jICAgICAgICAgICAgICAgfCAgMiAt
LQo+ICAgYXJjaC9hcm02NC9tbS9pbml0LmMgICAgICAgICAgICAgfCAgMiAtLQo+ICAgYXJjaC9j
c2t5L21tL2luaXQuYyAgICAgICAgICAgICAgfCAgMSAtCj4gICBhcmNoL2g4MzAwL21tL2luaXQu
YyAgICAgICAgICAgICB8ICAyIC0tCj4gICBhcmNoL2hleGFnb24vbW0vaW5pdC5jICAgICAgICAg
ICB8ICAxIC0KPiAgIGFyY2gvaWE2NC9tbS9pbml0LmMgICAgICAgICAgICAgIHwgIDEgLQo+ICAg
YXJjaC9tNjhrL21tL2luaXQuYyAgICAgICAgICAgICAgfCAgMSAtCj4gICBhcmNoL21pY3JvYmxh
emUvbW0vaW5pdC5jICAgICAgICB8ICAxIC0KPiAgIGFyY2gvbWlwcy9sb29uZ3NvbjY0L251bWEu
YyAgICAgIHwgIDEgLQo+ICAgYXJjaC9taXBzL21tL2luaXQuYyAgICAgICAgICAgICAgfCAgMSAt
Cj4gICBhcmNoL21pcHMvc2dpLWlwMjcvaXAyNy1tZW1vcnkuYyB8ICAxIC0KPiAgIGFyY2gvbmRz
MzIvbW0vaW5pdC5jICAgICAgICAgICAgIHwgIDEgLQo+ICAgYXJjaC9uaW9zMi9tbS9pbml0LmMg
ICAgICAgICAgICAgfCAgMSAtCj4gICBhcmNoL29wZW5yaXNjL21tL2luaXQuYyAgICAgICAgICB8
ICAyIC0tCj4gICBhcmNoL3BhcmlzYy9tbS9pbml0LmMgICAgICAgICAgICB8ICAyIC0tCj4gICBh
cmNoL3Bvd2VycGMvbW0vbWVtLmMgICAgICAgICAgICB8ICAxIC0KPiAgIGFyY2gvcmlzY3YvbW0v
aW5pdC5jICAgICAgICAgICAgIHwgIDEgLQo+ICAgYXJjaC9zMzkwL21tL2luaXQuYyAgICAgICAg
ICAgICAgfCAgMiAtLQo+ICAgYXJjaC9zaC9tbS9pbml0LmMgICAgICAgICAgICAgICAgfCAgMSAt
Cj4gICBhcmNoL3NwYXJjL21tL2luaXRfMzIuYyAgICAgICAgICB8ICAyIC0tCj4gICBhcmNoL3Nw
YXJjL21tL2luaXRfNjQuYyAgICAgICAgICB8ICAxIC0KPiAgIGFyY2gvdW0va2VybmVsL21lbS5j
ICAgICAgICAgICAgIHwgIDEgLQo+ICAgYXJjaC94ODYvbW0vaW5pdF8zMi5jICAgICAgICAgICAg
fCAgMiAtLQo+ICAgYXJjaC94ODYvbW0vaW5pdF82NC5jICAgICAgICAgICAgfCAgMiAtLQo+ICAg
YXJjaC94dGVuc2EvbW0vaW5pdC5jICAgICAgICAgICAgfCAgMSAtCj4gICBpbmNsdWRlL2xpbnV4
L21tLmggICAgICAgICAgICAgICB8ICAyICstCj4gICBpbml0L21haW4uYyAgICAgICAgICAgICAg
ICAgICAgICB8ICAxICsKPiAgIG1tL3BhZ2VfYWxsb2MuYyAgICAgICAgICAgICAgICAgIHwgMTAg
KysrKystLS0tLQo+ICAgMzAgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA0MiBkZWxl
dGlvbnMoLSkKPiAKCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvbW0uaCBiL2luY2x1ZGUv
bGludXgvbW0uaAo+IGluZGV4IDg5MzE0NjUxZGQ2Mi4uYzJlMGIzNDk1YzVhIDEwMDY0NAo+IC0t
LSBhL2luY2x1ZGUvbGludXgvbW0uaAo+ICsrKyBiL2luY2x1ZGUvbGludXgvbW0uaAo+IEBAIC0y
MzczLDcgKzIzNzMsNyBAQCBleHRlcm4gdW5zaWduZWQgbG9uZyBmcmVlX3Jlc2VydmVkX2FyZWEo
dm9pZCAqc3RhcnQsIHZvaWQgKmVuZCwKPiAgIAkJCQkJaW50IHBvaXNvbiwgY29uc3QgY2hhciAq
cyk7Cj4gICAKPiAgIGV4dGVybiB2b2lkIGFkanVzdF9tYW5hZ2VkX3BhZ2VfY291bnQoc3RydWN0
IHBhZ2UgKnBhZ2UsIGxvbmcgY291bnQpOwo+IC1leHRlcm4gdm9pZCBtZW1faW5pdF9wcmludF9p
bmZvKGNvbnN0IGNoYXIgKnN0cik7Cj4gK2V4dGVybiB2b2lkIG1lbV9pbml0X3ByaW50X2luZm8o
dm9pZCk7CgpTb3JyeSBJIGRpZG4ndCBzZWUgdGhhdCBpbiBwcmV2aW91cyBwYXRjaC4KCidleHRl
cm4nIGtleXdvcmQgaXMgcG9pbnRsZXNzIGZvciBmdW5jdGlvbiBwcm90b3R5cGVzIGFuZCBpcyBk
ZXByZWNhdGVkLCB5b3Ugc2hvdWxkIHJlbW92ZSBpdC4KClRoYXQgc2FpZCwKClJldmlld2VkLWJ5
OiBDaHJpc3RvcGhlIExlcm95IDxjaHJpc3RvcGhlLmxlcm95QGMtcy5mcj4gIyBmb2N1c3NlZCBv
biBwb3dlcnBjCgo+ICAgCj4gICBleHRlcm4gdm9pZCByZXNlcnZlX2Jvb3RtZW1fcmVnaW9uKHBo
eXNfYWRkcl90IHN0YXJ0LCBwaHlzX2FkZHJfdCBlbmQpOwo+ICAgCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxp
c3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
