Return-Path: <SRS0=wMnh=IO=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7545FC433DB
	for <linux-snps-arc@archiver.kernel.org>; Tue, 16 Mar 2021 15:45:55 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24045650F2
	for <linux-snps-arc@archiver.kernel.org>; Tue, 16 Mar 2021 15:45:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 24045650F2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=csgroup.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=M73uu66kPg7NUSblCAJHFuKe+vM34QIlPgxRf8FLFK0=; b=Wnds+AXsbhg00xqZb5NQIIl/H
	FC6yQkB/H+WeFUUIfwLkYXTZwi8VMIw9JTGjxMfoY7ExrBfqnY7phAOfv9IucS3bGFW7G34TQFYiv
	J7/lCfq4lyH4ydUqnokqTq9UXYTf7l+E3rRpFuKRYGglPxbOAwDeHvYOmBgLzendfeiW3E05EWkTh
	Jj9m05U/IXmKgvP/ztzoTYb1yvbZplb4Z8LWfWOAEFphvhX7FUDtJnVFvMEnlv5UwCOtwNJvbxI/G
	Qfa+1KN1uL9EaH/FFnIaYoc0TtMMeI+isUQeXCfu7kQEGEJWzyIoAmpVvdQmNmr24ro3A3cZGBOG9
	7sauD+gpA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMBtJ-0017Mg-GU; Tue, 16 Mar 2021 15:45:53 +0000
Received: from pegase1.c-s.fr ([93.17.236.30])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMBt0-0017HG-N1; Tue, 16 Mar 2021 15:45:38 +0000
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4F0HgF01dsz9v0XB;
 Tue, 16 Mar 2021 16:45:29 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id sg5k9CghU-Mi; Tue, 16 Mar 2021 16:45:28 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4F0HgD5LfFz9v0X9;
 Tue, 16 Mar 2021 16:45:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 331988B7E6;
 Tue, 16 Mar 2021 16:45:30 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id uxDOopJyTEv9; Tue, 16 Mar 2021 16:45:30 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6A6858B7E1;
 Tue, 16 Mar 2021 16:45:28 +0100 (CET)
Subject: Re: [PATCH RESEND] mm: Move mem_init_print_info() into mm_init()
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
References: <20210316142637.92193-1-wangkefeng.wang@huawei.com>
 <20210316152901.70662-1-wangkefeng.wang@huawei.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <4d488195-7281-9238-b30d-9f89a6100fb9@csgroup.eu>
Date: Tue, 16 Mar 2021 16:45:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210316152901.70662-1-wangkefeng.wang@huawei.com>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210316_154534_970940_9B2A61C7 
X-CRM114-Status: GOOD (  14.83  )
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

CgpMZSAxNi8wMy8yMDIxIMOgIDE2OjI5LCBLZWZlbmcgV2FuZyBhIMOpY3JpdMKgOgo+IG1lbV9p
bml0X3ByaW50X2luZm8oKSBpcyBjYWxsZWQgaW4gbWVtX2luaXQoKSBvbiBlYWNoIGFyY2hpdGVj
dHVyZSwKPiBhbmQgcGFzcyBOVUxMIGFyZ3VtZW50LCBzbyB1c2luZyB2b2lkIGFyZ3VtZW50IGFu
ZCBtb3ZlIGl0IGludG8gbW1faW5pdCgpLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEtlZmVuZyBXYW5n
IDx3YW5na2VmZW5nLndhbmdAaHVhd2VpLmNvbT4KPiAtLS0KPiAKPiBSZXNlbmQgd2l0aCAnc3Ry
JyBsaW5lIGNsZWFudXAsIGFuZCBvbmx5IHRlc3Qgb24gQVJNNjQgcWVtdS4KPiAKPiAgIGFyY2gv
YWxwaGEvbW0vaW5pdC5jICAgICAgICAgICAgIHwgMSAtCj4gICBhcmNoL2FyYy9tbS9pbml0LmMg
ICAgICAgICAgICAgICB8IDEgLQo+ICAgYXJjaC9hcm0vbW0vaW5pdC5jICAgICAgICAgICAgICAg
fCAyIC0tCj4gICBhcmNoL2FybTY0L21tL2luaXQuYyAgICAgICAgICAgICB8IDIgLS0KPiAgIGFy
Y2gvY3NreS9tbS9pbml0LmMgICAgICAgICAgICAgIHwgMSAtCj4gICBhcmNoL2g4MzAwL21tL2lu
aXQuYyAgICAgICAgICAgICB8IDIgLS0KPiAgIGFyY2gvaGV4YWdvbi9tbS9pbml0LmMgICAgICAg
ICAgIHwgMSAtCj4gICBhcmNoL2lhNjQvbW0vaW5pdC5jICAgICAgICAgICAgICB8IDEgLQo+ICAg
YXJjaC9tNjhrL21tL2luaXQuYyAgICAgICAgICAgICAgfCAxIC0KPiAgIGFyY2gvbWljcm9ibGF6
ZS9tbS9pbml0LmMgICAgICAgIHwgMSAtCj4gICBhcmNoL21pcHMvbG9vbmdzb242NC9udW1hLmMg
ICAgICB8IDEgLQo+ICAgYXJjaC9taXBzL21tL2luaXQuYyAgICAgICAgICAgICAgfCAxIC0KPiAg
IGFyY2gvbWlwcy9zZ2ktaXAyNy9pcDI3LW1lbW9yeS5jIHwgMSAtCj4gICBhcmNoL25kczMyL21t
L2luaXQuYyAgICAgICAgICAgICB8IDEgLQo+ICAgYXJjaC9uaW9zMi9tbS9pbml0LmMgICAgICAg
ICAgICAgfCAxIC0KPiAgIGFyY2gvb3BlbnJpc2MvbW0vaW5pdC5jICAgICAgICAgIHwgMiAtLQo+
ICAgYXJjaC9wYXJpc2MvbW0vaW5pdC5jICAgICAgICAgICAgfCAyIC0tCj4gICBhcmNoL3Bvd2Vy
cGMvbW0vbWVtLmMgICAgICAgICAgICB8IDEgLQo+ICAgYXJjaC9yaXNjdi9tbS9pbml0LmMgICAg
ICAgICAgICAgfCAxIC0KPiAgIGFyY2gvczM5MC9tbS9pbml0LmMgICAgICAgICAgICAgIHwgMiAt
LQo+ICAgYXJjaC9zaC9tbS9pbml0LmMgICAgICAgICAgICAgICAgfCAxIC0KPiAgIGFyY2gvc3Bh
cmMvbW0vaW5pdF8zMi5jICAgICAgICAgIHwgMiAtLQo+ICAgYXJjaC9zcGFyYy9tbS9pbml0XzY0
LmMgICAgICAgICAgfCAxIC0KPiAgIGFyY2gvdW0va2VybmVsL21lbS5jICAgICAgICAgICAgIHwg
MSAtCj4gICBhcmNoL3g4Ni9tbS9pbml0XzMyLmMgICAgICAgICAgICB8IDIgLS0KPiAgIGFyY2gv
eDg2L21tL2luaXRfNjQuYyAgICAgICAgICAgIHwgMiAtLQo+ICAgYXJjaC94dGVuc2EvbW0vaW5p
dC5jICAgICAgICAgICAgfCAxIC0KPiAgIGluY2x1ZGUvbGludXgvbW0uaCAgICAgICAgICAgICAg
IHwgMiArLQo+ICAgaW5pdC9tYWluLmMgICAgICAgICAgICAgICAgICAgICAgfCAxICsKPiAgIG1t
L3BhZ2VfYWxsb2MuYyAgICAgICAgICAgICAgICAgIHwgNiArKystLS0KPiAgIDMwIGZpbGVzIGNo
YW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNDAgZGVsZXRpb25zKC0pCj4gCgo+IGRpZmYgLS1naXQg
YS9tbS9wYWdlX2FsbG9jLmMgYi9tbS9wYWdlX2FsbG9jLmMKPiBpbmRleCA1NWQ5MzgyOTdjZTYu
LmNmNWEyMTE0YzZkNCAxMDA2NDQKPiAtLS0gYS9tbS9wYWdlX2FsbG9jLmMKPiArKysgYi9tbS9w
YWdlX2FsbG9jLmMKPiBAQCAtNzcyOCw3ICs3NzI4LDcgQEAgdW5zaWduZWQgbG9uZyBmcmVlX3Jl
c2VydmVkX2FyZWEodm9pZCAqc3RhcnQsIHZvaWQgKmVuZCwgaW50IHBvaXNvbiwgY29uc3QgY2hh
cgo+ICAgCXJldHVybiBwYWdlczsKPiAgIH0KPiAgIAo+IC12b2lkIF9faW5pdCBtZW1faW5pdF9w
cmludF9pbmZvKGNvbnN0IGNoYXIgKnN0cikKPiArdm9pZCBfX2luaXQgbWVtX2luaXRfcHJpbnRf
aW5mbyh2b2lkKQo+ICAgewo+ICAgCXVuc2lnbmVkIGxvbmcgcGh5c3BhZ2VzLCBjb2Rlc2l6ZSwg
ZGF0YXNpemUsIHJvc2l6ZSwgYnNzX3NpemU7Cj4gICAJdW5zaWduZWQgbG9uZyBpbml0X2NvZGVf
c2l6ZSwgaW5pdF9kYXRhX3NpemU7Cj4gQEAgLTc3NjcsNyArNzc2Nyw3IEBAIHZvaWQgX19pbml0
IG1lbV9pbml0X3ByaW50X2luZm8oY29uc3QgY2hhciAqc3RyKQo+ICAgI2lmZGVmCUNPTkZJR19I
SUdITUVNCj4gICAJCSIsICVsdUsgaGlnaG1lbSIKPiAgICNlbmRpZgo+IC0JCSIlcyVzKVxuIiwK
PiArCQkiJXMpXG4iLAo+ICAgCQlucl9mcmVlX3BhZ2VzKCkgPDwgKFBBR0VfU0hJRlQgLSAxMCks
Cj4gICAJCXBoeXNwYWdlcyA8PCAoUEFHRV9TSElGVCAtIDEwKSwKPiAgIAkJY29kZXNpemUgPj4g
MTAsIGRhdGFzaXplID4+IDEwLCByb3NpemUgPj4gMTAsCj4gQEAgLTc3NzcsNyArNzc3Nyw3IEBA
IHZvaWQgX19pbml0IG1lbV9pbml0X3ByaW50X2luZm8oY29uc3QgY2hhciAqc3RyKQo+ICAgI2lm
ZGVmCUNPTkZJR19ISUdITUVNCj4gICAJCXRvdGFsaGlnaF9wYWdlcygpIDw8IChQQUdFX1NISUZU
IC0gMTApLAo+ICAgI2VuZGlmCj4gLQkJc3RyID8gIiwgIiA6ICIiLCBzdHIgPyBzdHIgOiAiIik7
Cj4gKwkJIiIpOwo+ICAgfQo+ICAgCj4gICAvKioKPiAKCldoYXQgaXMgdGhlIGJlbmVmaXQgb2Yg
YSAlcyB0byBwcmludCBhIGNvbnN0YW50ICIiID8KCllvdSBzaG91bGQgdGlkeSB1cCBjb21wbGV0
ZWx5LgoKQ2hyaXN0b3BoZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtc25wcy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1zbnBzLWFyYwo=
