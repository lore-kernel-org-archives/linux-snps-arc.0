Return-Path: <SRS0=NhYn=JL=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6099FC433ED
	for <linux-snps-arc@archiver.kernel.org>; Wed, 14 Apr 2021 05:50:38 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D45A5611C9
	for <linux-snps-arc@archiver.kernel.org>; Wed, 14 Apr 2021 05:50:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D45A5611C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=csgroup.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ICgH2ZEDg++LIt43+4fcC5wYcS+BgxTcP6daxi0pVAc=; b=kDPwtJ4tVI/Vvs8prQqdB3VTq
	uzz9uaqC5H/RCB5CYGj4KVxgx4Ww+9KMZyrnMJIbNlV/cAbUMWzSwBBu4hK2i48kI4w8zeUKi0YRv
	QRwcn5WDi9rqK68EcDOIV/+7AiI0KBrI4/YxW7anVFpeAoSQrBpfXK1QswX7PSs9+iJeRNpykG6U/
	LyvONQxCWHLZp37F3NSj4ndfwCRCrcuJsFoITOmLeJZtznH2cYDSs6iuAmbb/CYtp4ahtqCPn4DAH
	/kUFjmuohgCYXCLn4PnJiH3KmE91StFCD7FduM5pfSkrgPXJ3RN/4fqQnEJgE2nRXOfFL/3XkUpeI
	76ukHclYw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWYQ8-00BZsl-7d; Wed, 14 Apr 2021 05:50:36 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWYPs-00BZrP-Ln; Wed, 14 Apr 2021 05:50:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=TYCF+GYKbk3J3/3732akpKf1UatOxRstAtJHWLuOJMc=; b=ExIkGO8iQD9UWXENmFoRyDUItr
 wjs4oHygntVvrc7BfFCQDtU6+14iviEmeWGFV2rtWEskAO+IRRDSa0yYnoKQKgfXtOIXwEyeU+E3o
 z9UJ6keiNjLUyTaIhLORFwo/d3O8BeP4LZRXluqJYc3gGvM6QAkfGRJC+dlLHA0yP8Xkx1F6fgT89
 25LwzTqlj2Jd/EiXV3aH9jzVTT9iOAY33VpDgZlj+Q9ARms5bizCSKTRW+vKQzRrCRX7a12cLEtQ3
 sMWkCME1Hy0vKSMsdKefjLt4efe1K36kKMO8YiCfUXCXedosVaUNacwu0dtpBj4C5/+j53N4xOvkv
 eMtg3pcg==;
Received: from pegase1.c-s.fr ([93.17.236.30])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWYPp-007VOI-1c; Wed, 14 Apr 2021 05:50:19 +0000
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FKrSZ3r2Lz9tvhy;
 Wed, 14 Apr 2021 07:22:06 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id QQLegraZ5N-Q; Wed, 14 Apr 2021 07:22:06 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FKrSZ0tq1z9tvg5;
 Wed, 14 Apr 2021 07:22:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E4B348B7B6;
 Wed, 14 Apr 2021 07:22:06 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id yJq5yeVH30mK; Wed, 14 Apr 2021 07:22:06 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9D7878B75F;
 Wed, 14 Apr 2021 07:22:05 +0200 (CEST)
Subject: Re: [PATCH] mm: Define ARCH_HAS_FIRST_USER_ADDRESS
To: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
Cc: linux-s390@vger.kernel.org, x86@kernel.org, linux-ia64@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, linux-sh@vger.kernel.org,
 linux-um@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org,
 linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-snps-arc@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
References: <1618368899-20311-1-git-send-email-anshuman.khandual@arm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <f29ba8e2-3071-c963-1e9f-e8c88526ed8d@csgroup.eu>
Date: Wed, 14 Apr 2021 07:22:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <1618368899-20311-1-git-send-email-anshuman.khandual@arm.com>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210413_225017_414479_085D78C5 
X-CRM114-Status: GOOD (  15.42  )
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

CgpMZSAxNC8wNC8yMDIxIMOgIDA0OjU0LCBBbnNodW1hbiBLaGFuZHVhbCBhIMOpY3JpdMKgOgo+
IEN1cnJlbnRseSBtb3N0IHBsYXRmb3JtcyBkZWZpbmUgRklSU1RfVVNFUl9BRERSRVNTIGFzIDBV
TCBkdXBsaWNhdGluZyB0aGUKPiBzYW1lIGNvZGUgYWxsIG92ZXIuIEluc3RlYWQgZGVmaW5lIGEg
bmV3IG9wdGlvbiBBUkNIX0hBU19GSVJTVF9VU0VSX0FERFJFU1MKPiBmb3IgdGhvc2UgcGxhdGZv
cm1zIHdoaWNoIHdvdWxkIG92ZXJyaWRlIGdlbmVyaWMgZGVmYXVsdCBGSVJTVF9VU0VSX0FERFJF
U1MKPiB2YWx1ZSAwVUwuIFRoaXMgbWFrZXMgaXQgbXVjaCBjbGVhbmVyIHdpdGggcmVkdWNlZCBj
b2RlLgo+IAo+IENjOiBsaW51eC1hbHBoYUB2Z2VyLmtlcm5lbC5vcmcKPiBDYzogbGludXgtc25w
cy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IENjOiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKPiBDYzogbGludXgtY3NreUB2Z2VyLmtlcm5lbC5vcmcKPiBDYzogbGludXgt
aGV4YWdvbkB2Z2VyLmtlcm5lbC5vcmcKPiBDYzogbGludXgtaWE2NEB2Z2VyLmtlcm5lbC5vcmcK
PiBDYzogbGludXgtbTY4a0BsaXN0cy5saW51eC1tNjhrLm9yZwo+IENjOiBsaW51eC1taXBzQHZn
ZXIua2VybmVsLm9yZwo+IENjOiBvcGVucmlzY0BsaXN0cy5saWJyZWNvcmVzLm9yZwo+IENjOiBs
aW51eC1wYXJpc2NAdmdlci5rZXJuZWwub3JnCj4gQ2M6IGxpbnV4cHBjLWRldkBsaXN0cy5vemxh
YnMub3JnCj4gQ2M6IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiBDYzogbGludXgt
czM5MEB2Z2VyLmtlcm5lbC5vcmcKPiBDYzogbGludXgtc2hAdmdlci5rZXJuZWwub3JnCj4gQ2M6
IHNwYXJjbGludXhAdmdlci5rZXJuZWwub3JnCj4gQ2M6IGxpbnV4LXVtQGxpc3RzLmluZnJhZGVh
ZC5vcmcKPiBDYzogbGludXgteHRlbnNhQGxpbnV4LXh0ZW5zYS5vcmcKPiBDYzogeDg2QGtlcm5l
bC5vcmcKPiBDYzogbGludXgtbW1Aa3ZhY2sub3JnCj4gQ2M6IGxpbnV4LWtlcm5lbEB2Z2VyLmtl
cm5lbC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBBbnNodW1hbiBLaGFuZHVhbCA8YW5zaHVtYW4ua2hh
bmR1YWxAYXJtLmNvbT4KPiAtLS0KPiAgIGFyY2gvYWxwaGEvaW5jbHVkZS9hc20vcGd0YWJsZS5o
ICAgICAgICAgICAgIHwgMSAtCj4gICBhcmNoL2FyYy9pbmNsdWRlL2FzbS9wZ3RhYmxlLmggICAg
ICAgICAgICAgICB8IDYgLS0tLS0tCj4gICBhcmNoL2FybS9LY29uZmlnICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB8IDEgKwo+ICAgYXJjaC9hcm02NC9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgg
ICAgICAgICAgICAgfCAyIC0tCj4gICBhcmNoL2Nza3kvaW5jbHVkZS9hc20vcGd0YWJsZS5oICAg
ICAgICAgICAgICB8IDEgLQo+ICAgYXJjaC9oZXhhZ29uL2luY2x1ZGUvYXNtL3BndGFibGUuaCAg
ICAgICAgICAgfCAzIC0tLQo+ICAgYXJjaC9pYTY0L2luY2x1ZGUvYXNtL3BndGFibGUuaCAgICAg
ICAgICAgICAgfCAxIC0KPiAgIGFyY2gvbTY4ay9pbmNsdWRlL2FzbS9wZ3RhYmxlX21tLmggICAg
ICAgICAgIHwgMSAtCj4gICBhcmNoL21pY3JvYmxhemUvaW5jbHVkZS9hc20vcGd0YWJsZS5oICAg
ICAgICB8IDIgLS0KPiAgIGFyY2gvbWlwcy9pbmNsdWRlL2FzbS9wZ3RhYmxlLTMyLmggICAgICAg
ICAgIHwgMSAtCj4gICBhcmNoL21pcHMvaW5jbHVkZS9hc20vcGd0YWJsZS02NC5oICAgICAgICAg
ICB8IDEgLQo+ICAgYXJjaC9uZHMzMi9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAgICAg
fCAxICsKPiAgIGFyY2gvbmlvczIvaW5jbHVkZS9hc20vcGd0YWJsZS5oICAgICAgICAgICAgIHwg
MiAtLQo+ICAgYXJjaC9vcGVucmlzYy9pbmNsdWRlL2FzbS9wZ3RhYmxlLmggICAgICAgICAgfCAx
IC0KPiAgIGFyY2gvcGFyaXNjL2luY2x1ZGUvYXNtL3BndGFibGUuaCAgICAgICAgICAgIHwgMiAt
LQo+ICAgYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Jvb2szcy9wZ3RhYmxlLmggICAgfCAxIC0K
PiAgIGFyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ub2hhc2gvMzIvcGd0YWJsZS5oIHwgMSAtCj4g
ICBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vbm9oYXNoLzY0L3BndGFibGUuaCB8IDIgLS0KPiAg
IGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oICAgICAgICAgICAgIHwgMiAtLQo+ICAg
YXJjaC9zMzkwL2luY2x1ZGUvYXNtL3BndGFibGUuaCAgICAgICAgICAgICAgfCAyIC0tCj4gICBh
cmNoL3NoL2luY2x1ZGUvYXNtL3BndGFibGUuaCAgICAgICAgICAgICAgICB8IDIgLS0KPiAgIGFy
Y2gvc3BhcmMvaW5jbHVkZS9hc20vcGd0YWJsZV8zMi5oICAgICAgICAgIHwgMSAtCj4gICBhcmNo
L3NwYXJjL2luY2x1ZGUvYXNtL3BndGFibGVfNjQuaCAgICAgICAgICB8IDMgLS0tCj4gICBhcmNo
L3VtL2luY2x1ZGUvYXNtL3BndGFibGUtMmxldmVsLmggICAgICAgICB8IDEgLQo+ICAgYXJjaC91
bS9pbmNsdWRlL2FzbS9wZ3RhYmxlLTNsZXZlbC5oICAgICAgICAgfCAxIC0KPiAgIGFyY2gveDg2
L2luY2x1ZGUvYXNtL3BndGFibGVfdHlwZXMuaCAgICAgICAgIHwgMiAtLQo+ICAgYXJjaC94dGVu
c2EvaW5jbHVkZS9hc20vcGd0YWJsZS5oICAgICAgICAgICAgfCAxIC0KPiAgIGluY2x1ZGUvbGlu
dXgvbW0uaCAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgNCArKysrCj4gICBtbS9LY29uZmln
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDQgKysrKwo+ICAgMjkgZmlsZXMg
Y2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgNDMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdp
dCBhL2luY2x1ZGUvbGludXgvbW0uaCBiL2luY2x1ZGUvbGludXgvbW0uaAo+IGluZGV4IDhiYTQz
NDI4NzM4Ny4uNDcwOThjY2Q3MTVlIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvbGludXgvbW0uaAo+
ICsrKyBiL2luY2x1ZGUvbGludXgvbW0uaAo+IEBAIC00Niw2ICs0NiwxMCBAQCBleHRlcm4gaW50
IHN5c2N0bF9wYWdlX2xvY2tfdW5mYWlybmVzczsKPiAgIAo+ICAgdm9pZCBpbml0X21tX2ludGVy
bmFscyh2b2lkKTsKPiAgIAo+ICsjaWZuZGVmIEFSQ0hfSEFTX0ZJUlNUX1VTRVJfQUREUkVTUwoK
SSBndWVzcyB5b3UgZGlkbid0IHRlc3QgaXQgLi4uLi4gOikKCnNob3VsZCBiZSAjaWZuZGVmIENP
TkZJR19BUkNIX0hBU19GSVJTVF9VU0VSX0FERFJFU1MKCj4gKyNkZWZpbmUgRklSU1RfVVNFUl9B
RERSRVNTCTBVTAo+ICsjZW5kaWYKCkJ1dCB3aHkgZG8gd2UgbmVlZCBhIGNvbmZpZyBvcHRpb24g
YXQgYWxsIGZvciB0aGF0ID8KCldoeSBub3QganVzdDoKCiNpZm5kZWYgRklSU1RfVVNFUl9BRERS
RVNTCiNkZWZpbmUgRklSU1RfVVNFUl9BRERSRVNTCTBVTAojZW5kaWYKCj4gKwo+ICAgI2lmbmRl
ZiBDT05GSUdfTkVFRF9NVUxUSVBMRV9OT0RFUwkvKiBEb24ndCB1c2UgbWFwbnJzLCBkbyBpdCBw
cm9wZXJseSAqLwo+ICAgZXh0ZXJuIHVuc2lnbmVkIGxvbmcgbWF4X21hcG5yOwo+ICAgCj4gZGlm
ZiAtLWdpdCBhL21tL0tjb25maWcgYi9tbS9LY29uZmlnCj4gaW5kZXggMjRjMDQ1YjI0Yjk1Li4z
NzNmYmUzNzcwNzUgMTAwNjQ0Cj4gLS0tIGEvbW0vS2NvbmZpZwo+ICsrKyBiL21tL0tjb25maWcK
PiBAQCAtODA2LDYgKzgwNiwxMCBAQCBjb25maWcgVk1BUF9QRk4KPiAgIAo+ICAgY29uZmlnIEFS
Q0hfVVNFU19ISUdIX1ZNQV9GTEFHUwo+ICAgCWJvb2wKPiArCj4gK2NvbmZpZyBBUkNIX0hBU19G
SVJTVF9VU0VSX0FERFJFU1MKPiArCWJvb2wKPiArCj4gICBjb25maWcgQVJDSF9IQVNfUEtFWVMK
PiAgIAlib29sCj4gICAKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtc25wcy1hcmMK
