Return-Path: <SRS0=wMnh=IO=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41708C433DB
	for <linux-snps-arc@archiver.kernel.org>; Tue, 16 Mar 2021 14:47:30 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CEC4E64F44
	for <linux-snps-arc@archiver.kernel.org>; Tue, 16 Mar 2021 14:47:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CEC4E64F44
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=csgroup.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=64NsyAX1MKlAFcAJnQIopEcUox3r/FDiQC/G+dzAXMo=; b=gU0noBdJ2cHHjf9YhxqQFY2Ni
	ivOPdZcPT9WkxyMJClZgjdfKvclrUadCpTlw/CUODpAK5xZT5rYxFdv3E5J36mSCzTporxYvNhuo+
	R7uRkZXL2G4yGX9tOGZ5rTnQobSHPzNnmiTE6wrntuFXXKy7U+8wutpawatDO338ZSZzRaSz6PbR6
	O0sNodH+F1TF+OYWnQ01Jqb8OKov+MhfHkuMz9DDbN3CoimQn9Ltu9FMItcFnFIZ1a5teFNiK5+up
	wE3hyVkCyNOICUPVaj7T2FQEWigCvgKzRRaEX/iXS7aC0SuDbAUr3v5nz5Po75BGKcl6cxW4SBKzj
	UjY75Gwhw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMAym-000ykX-CI; Tue, 16 Mar 2021 14:47:28 +0000
Received: from pegase1.c-s.fr ([93.17.236.30])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMAyW-000yiB-O0; Tue, 16 Mar 2021 14:47:15 +0000
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4F0GMx4VXtz9v0Wx;
 Tue, 16 Mar 2021 15:47:09 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id vzRrRUF_FtQC; Tue, 16 Mar 2021 15:47:09 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4F0GMx3F8vz9v0Ww;
 Tue, 16 Mar 2021 15:47:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 56A228B7E3;
 Tue, 16 Mar 2021 15:47:11 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id TZSbbu2JPpo4; Tue, 16 Mar 2021 15:47:11 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8C1248B7E1;
 Tue, 16 Mar 2021 15:47:09 +0100 (CET)
Subject: Re: [PATCH] mm: Move mem_init_print_info() into mm_init()
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
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <26cca1c0-bd38-3d5b-5ca4-44081c444396@csgroup.eu>
Date: Tue, 16 Mar 2021 15:47:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210316142637.92193-1-wangkefeng.wang@huawei.com>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210316_144713_287553_96B4CD2E 
X-CRM114-Status: GOOD (  14.47  )
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

CgpMZSAxNi8wMy8yMDIxIMOgIDE1OjI2LCBLZWZlbmcgV2FuZyBhIMOpY3JpdMKgOgo+IG1lbV9p
bml0X3ByaW50X2luZm8oKSBpcyBjYWxsZWQgaW4gbWVtX2luaXQoKSBvbiBlYWNoIGFyY2hpdGVj
dHVyZSwKPiBhbmQgcGFzcyBOVUxMIGFyZ3VtZW50LCBjbGVhbnVwIGl0IGJ5IHVzaW5nIHZvaWQg
YXJndW1lbnQgYW5kIG1vdmUKPiBpdCBpbnRvIG1tX2luaXQoKS4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBLZWZlbmcgV2FuZyA8d2FuZ2tlZmVuZy53YW5nQGh1YXdlaS5jb20+Cj4gLS0tCj4gICBhcmNo
L2FscGhhL21tL2luaXQuYyAgICAgICAgICAgICB8IDEgLQo+ICAgYXJjaC9hcmMvbW0vaW5pdC5j
ICAgICAgICAgICAgICAgfCAxIC0KPiAgIGFyY2gvYXJtL21tL2luaXQuYyAgICAgICAgICAgICAg
IHwgMiAtLQo+ICAgYXJjaC9hcm02NC9tbS9pbml0LmMgICAgICAgICAgICAgfCAyIC0tCj4gICBh
cmNoL2Nza3kvbW0vaW5pdC5jICAgICAgICAgICAgICB8IDEgLQo+ICAgYXJjaC9oODMwMC9tbS9p
bml0LmMgICAgICAgICAgICAgfCAyIC0tCj4gICBhcmNoL2hleGFnb24vbW0vaW5pdC5jICAgICAg
ICAgICB8IDEgLQo+ICAgYXJjaC9pYTY0L21tL2luaXQuYyAgICAgICAgICAgICAgfCAxIC0KPiAg
IGFyY2gvbTY4ay9tbS9pbml0LmMgICAgICAgICAgICAgIHwgMSAtCj4gICBhcmNoL21pY3JvYmxh
emUvbW0vaW5pdC5jICAgICAgICB8IDEgLQo+ICAgYXJjaC9taXBzL2xvb25nc29uNjQvbnVtYS5j
ICAgICAgfCAxIC0KPiAgIGFyY2gvbWlwcy9tbS9pbml0LmMgICAgICAgICAgICAgIHwgMSAtCj4g
ICBhcmNoL21pcHMvc2dpLWlwMjcvaXAyNy1tZW1vcnkuYyB8IDEgLQo+ICAgYXJjaC9uZHMzMi9t
bS9pbml0LmMgICAgICAgICAgICAgfCAxIC0KPiAgIGFyY2gvbmlvczIvbW0vaW5pdC5jICAgICAg
ICAgICAgIHwgMSAtCj4gICBhcmNoL29wZW5yaXNjL21tL2luaXQuYyAgICAgICAgICB8IDIgLS0K
PiAgIGFyY2gvcGFyaXNjL21tL2luaXQuYyAgICAgICAgICAgIHwgMiAtLQo+ICAgYXJjaC9wb3dl
cnBjL21tL21lbS5jICAgICAgICAgICAgfCAxIC0KPiAgIGFyY2gvcmlzY3YvbW0vaW5pdC5jICAg
ICAgICAgICAgIHwgMSAtCj4gICBhcmNoL3MzOTAvbW0vaW5pdC5jICAgICAgICAgICAgICB8IDIg
LS0KPiAgIGFyY2gvc2gvbW0vaW5pdC5jICAgICAgICAgICAgICAgIHwgMSAtCj4gICBhcmNoL3Nw
YXJjL21tL2luaXRfMzIuYyAgICAgICAgICB8IDIgLS0KPiAgIGFyY2gvc3BhcmMvbW0vaW5pdF82
NC5jICAgICAgICAgIHwgMSAtCj4gICBhcmNoL3VtL2tlcm5lbC9tZW0uYyAgICAgICAgICAgICB8
IDEgLQo+ICAgYXJjaC94ODYvbW0vaW5pdF8zMi5jICAgICAgICAgICAgfCAyIC0tCj4gICBhcmNo
L3g4Ni9tbS9pbml0XzY0LmMgICAgICAgICAgICB8IDIgLS0KPiAgIGFyY2gveHRlbnNhL21tL2lu
aXQuYyAgICAgICAgICAgIHwgMSAtCj4gICBpbmNsdWRlL2xpbnV4L21tLmggICAgICAgICAgICAg
ICB8IDIgKy0KPiAgIGluaXQvbWFpbi5jICAgICAgICAgICAgICAgICAgICAgIHwgMSArCj4gICBt
bS9wYWdlX2FsbG9jLmMgICAgICAgICAgICAgICAgICB8IDIgKy0KPiAgIDMwIGZpbGVzIGNoYW5n
ZWQsIDMgaW5zZXJ0aW9ucygrKSwgMzggZGVsZXRpb25zKC0pCj4gCgo+IGRpZmYgLS1naXQgYS9t
bS9wYWdlX2FsbG9jLmMgYi9tbS9wYWdlX2FsbG9jLmMKPiBpbmRleCA1NWQ5MzgyOTdjZTYuLmU0
YTZiZjY5YzgwNiAxMDA2NDQKPiAtLS0gYS9tbS9wYWdlX2FsbG9jLmMKPiArKysgYi9tbS9wYWdl
X2FsbG9jLmMKPiBAQCAtNzcyOCw3ICs3NzI4LDcgQEAgdW5zaWduZWQgbG9uZyBmcmVlX3Jlc2Vy
dmVkX2FyZWEodm9pZCAqc3RhcnQsIHZvaWQgKmVuZCwgaW50IHBvaXNvbiwgY29uc3QgY2hhcgo+
ICAgCXJldHVybiBwYWdlczsKPiAgIH0KPiAgIAo+IC12b2lkIF9faW5pdCBtZW1faW5pdF9wcmlu
dF9pbmZvKGNvbnN0IGNoYXIgKnN0cikKPiArdm9pZCBfX2luaXQgbWVtX2luaXRfcHJpbnRfaW5m
byh2b2lkKQo+ICAgewo+ICAgCXVuc2lnbmVkIGxvbmcgcGh5c3BhZ2VzLCBjb2Rlc2l6ZSwgZGF0
YXNpemUsIHJvc2l6ZSwgYnNzX3NpemU7Cj4gICAJdW5zaWduZWQgbG9uZyBpbml0X2NvZGVfc2l6
ZSwgaW5pdF9kYXRhX3NpemU7Cj4gCgpBbmQgd2hhdCBhYm91dCB0aGUgJ3N0cicgaW4gdGhlIGxh
c3QgbGluZSBvZiB0aGUgZnVuY3Rpb24gPwoKCXByX2luZm8oIk1lbW9yeTogJWx1Sy8lbHVLIGF2
YWlsYWJsZSAoJWx1SyBrZXJuZWwgY29kZSwgJWx1SyByd2RhdGEsICVsdUsgcm9kYXRhLCAlbHVL
IGluaXQsICVsdUsgCmJzcywgJWx1SyByZXNlcnZlZCwgJWx1SyBjbWEtcmVzZXJ2ZWQiCiNpZmRl
ZglDT05GSUdfSElHSE1FTQoJCSIsICVsdUsgaGlnaG1lbSIKI2VuZGlmCgkJIiVzJXMpXG4iLAoJ
CW5yX2ZyZWVfcGFnZXMoKSA8PCAoUEFHRV9TSElGVCAtIDEwKSwKCQlwaHlzcGFnZXMgPDwgKFBB
R0VfU0hJRlQgLSAxMCksCgkJY29kZXNpemUgPj4gMTAsIGRhdGFzaXplID4+IDEwLCByb3NpemUg
Pj4gMTAsCgkJKGluaXRfZGF0YV9zaXplICsgaW5pdF9jb2RlX3NpemUpID4+IDEwLCBic3Nfc2l6
ZSA+PiAxMCwKCQkocGh5c3BhZ2VzIC0gdG90YWxyYW1fcGFnZXMoKSAtIHRvdGFsY21hX3BhZ2Vz
KSA8PCAoUEFHRV9TSElGVCAtIDEwKSwKCQl0b3RhbGNtYV9wYWdlcyA8PCAoUEFHRV9TSElGVCAt
IDEwKSwKI2lmZGVmCUNPTkZJR19ISUdITUVNCgkJdG90YWxoaWdoX3BhZ2VzKCkgPDwgKFBBR0Vf
U0hJRlQgLSAxMCksCiNlbmRpZgoJCXN0ciA/ICIsICIgOiAiIiwgc3RyID8gc3RyIDogIiIpOwoK
CkNocmlzdG9waGUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtc25wcy1hcmMK
