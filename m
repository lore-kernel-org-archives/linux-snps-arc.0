Return-Path: <SRS0=NhYn=JL=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03162C433ED
	for <linux-snps-arc@archiver.kernel.org>; Wed, 14 Apr 2021 05:59:32 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5EA3960240
	for <linux-snps-arc@archiver.kernel.org>; Wed, 14 Apr 2021 05:59:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5EA3960240
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=i/GhnOeRhQLoc0gzjT6GOB/s5c4DcgC9YG+WxcuKhcg=; b=RAyTzWUc4YLaoe5e9YF/TXIBa
	zVGS0NO6uxTbkRTrOj2LjbGWM53VifbbTtdfiZKMQWsygTM0HSOV4ORQYv1NCv92ouIV+XF9Qo5Ug
	I1SRRFiEUDxodtAi/zHrxnJCvdbYzNMbev7VWr7caFUgrDjGY0F2TzKeCfPTUU7CcupZsKFLvWYsV
	vutGvikZLnLneyUQVCS5OTmbtGSk/ptvWU3gNMgxnMgLbRJm/+robbFXxiaNk6y5XEeZH//2a+aCM
	Z/F1ZaTjfwq5CM/UPMnjYjgySd+elci4MVPls9c1g49HfX8g6X2xFnbGj9sTz+CZdXQp0qeVcRF3w
	SgGRa1q3g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWYYj-00BbMH-Dd; Wed, 14 Apr 2021 05:59:29 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWYYO-00BbIT-EF; Wed, 14 Apr 2021 05:59:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=1d0aSoe9a2jPxCdgUE/FZrTTuOj38+fjPPB5G6gZmiM=; b=LfLoPZcx7rEqtfdDYwXr7sftc8
 moIgq18vzI42uzfEYLDuYhSBrHlf3LxXwtjAdUTcHL5NrGU+N2nOR+8Tmzg5VQJ353AhwZaBrTN8w
 XDASxNuqsldcFM1UgZrq4hmoCmAkOB6jbXygakPohsYHLO04/yKCSvrzJ95G6akDHiHSmB0fSRfpD
 jlL3OBVPpimjuDxvIPhSa2WZsfHYe+FQXYsqsGdSNIaNiPuyiZUewmEHwwRKE6oNXgbp5UhnXvsMj
 OSclogJqNFo9HWOjNaoFG7h4BvbGMvLmvkxb7wsdb9suv5x5dmfp3TMaJ/PJUnA8rEW6DtREUKP6e
 CRaMLF8Q==;
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lWYYL-007Vjn-ED; Wed, 14 Apr 2021 05:59:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A4E4B106F;
 Tue, 13 Apr 2021 22:58:57 -0700 (PDT)
Received: from [10.163.72.181] (unknown [10.163.72.181])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E76123F694;
 Tue, 13 Apr 2021 22:58:50 -0700 (PDT)
Subject: Re: [PATCH] mm: Define ARCH_HAS_FIRST_USER_ADDRESS
To: Christophe Leroy <christophe.leroy@csgroup.eu>, linux-mm@kvack.org,
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
 <f29ba8e2-3071-c963-1e9f-e8c88526ed8d@csgroup.eu>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <6d24d3cc-b2df-f0d7-f4bf-f505f679c77e@arm.com>
Date: Wed, 14 Apr 2021 11:29:40 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <f29ba8e2-3071-c963-1e9f-e8c88526ed8d@csgroup.eu>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210413_225905_580988_9164F0FF 
X-CRM114-Status: GOOD (  15.96  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

CgpPbiA0LzE0LzIxIDEwOjUyIEFNLCBDaHJpc3RvcGhlIExlcm95IHdyb3RlOgo+IAo+IAo+IExl
IDE0LzA0LzIwMjEgw6AgMDQ6NTQsIEFuc2h1bWFuIEtoYW5kdWFsIGEgw6ljcml0wqA6Cj4+IEN1
cnJlbnRseSBtb3N0IHBsYXRmb3JtcyBkZWZpbmUgRklSU1RfVVNFUl9BRERSRVNTIGFzIDBVTCBk
dXBsaWNhdGluZyB0aGUKPj4gc2FtZSBjb2RlIGFsbCBvdmVyLiBJbnN0ZWFkIGRlZmluZSBhIG5l
dyBvcHRpb24gQVJDSF9IQVNfRklSU1RfVVNFUl9BRERSRVNTCj4+IGZvciB0aG9zZSBwbGF0Zm9y
bXMgd2hpY2ggd291bGQgb3ZlcnJpZGUgZ2VuZXJpYyBkZWZhdWx0IEZJUlNUX1VTRVJfQUREUkVT
Uwo+PiB2YWx1ZSAwVUwuIFRoaXMgbWFrZXMgaXQgbXVjaCBjbGVhbmVyIHdpdGggcmVkdWNlZCBj
b2RlLgo+Pgo+PiBDYzogbGludXgtYWxwaGFAdmdlci5rZXJuZWwub3JnCj4+IENjOiBsaW51eC1z
bnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCj4+IENjOiBsaW51eC1hcm0ta2VybmVsQGxpc3Rz
LmluZnJhZGVhZC5vcmcKPj4gQ2M6IGxpbnV4LWNza3lAdmdlci5rZXJuZWwub3JnCj4+IENjOiBs
aW51eC1oZXhhZ29uQHZnZXIua2VybmVsLm9yZwo+PiBDYzogbGludXgtaWE2NEB2Z2VyLmtlcm5l
bC5vcmcKPj4gQ2M6IGxpbnV4LW02OGtAbGlzdHMubGludXgtbTY4ay5vcmcKPj4gQ2M6IGxpbnV4
LW1pcHNAdmdlci5rZXJuZWwub3JnCj4+IENjOiBvcGVucmlzY0BsaXN0cy5saWJyZWNvcmVzLm9y
Zwo+PiBDYzogbGludXgtcGFyaXNjQHZnZXIua2VybmVsLm9yZwo+PiBDYzogbGludXhwcGMtZGV2
QGxpc3RzLm96bGFicy5vcmcKPj4gQ2M6IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
Pj4gQ2M6IGxpbnV4LXMzOTBAdmdlci5rZXJuZWwub3JnCj4+IENjOiBsaW51eC1zaEB2Z2VyLmtl
cm5lbC5vcmcKPj4gQ2M6IHNwYXJjbGludXhAdmdlci5rZXJuZWwub3JnCj4+IENjOiBsaW51eC11
bUBsaXN0cy5pbmZyYWRlYWQub3JnCj4+IENjOiBsaW51eC14dGVuc2FAbGludXgteHRlbnNhLm9y
Zwo+PiBDYzogeDg2QGtlcm5lbC5vcmcKPj4gQ2M6IGxpbnV4LW1tQGt2YWNrLm9yZwo+PiBDYzog
bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZwo+PiBTaWduZWQtb2ZmLWJ5OiBBbnNodW1hbiBL
aGFuZHVhbCA8YW5zaHVtYW4ua2hhbmR1YWxAYXJtLmNvbT4KPj4gLS0tCj4+IMKgIGFyY2gvYWxw
aGEvaW5jbHVkZS9hc20vcGd0YWJsZS5owqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMSAtCj4+
IMKgIGFyY2gvYXJjL2luY2x1ZGUvYXNtL3BndGFibGUuaMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgfCA2IC0tLS0tLQo+PiDCoCBhcmNoL2FybS9LY29uZmlnwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAxICsKPj4gwqAgYXJjaC9h
cm02NC9pbmNsdWRlL2FzbS9wZ3RhYmxlLmjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAyIC0t
Cj4+IMKgIGFyY2gvY3NreS9pbmNsdWRlL2FzbS9wZ3RhYmxlLmjCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB8IDEgLQo+PiDCoCBhcmNoL2hleGFnb24vaW5jbHVkZS9hc20vcGd0YWJsZS5owqDC
oMKgwqDCoMKgwqDCoMKgwqAgfCAzIC0tLQo+PiDCoCBhcmNoL2lhNjQvaW5jbHVkZS9hc20vcGd0
YWJsZS5owqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAxIC0KPj4gwqAgYXJjaC9tNjhrL2lu
Y2x1ZGUvYXNtL3BndGFibGVfbW0uaMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMSAtCj4+IMKgIGFy
Y2gvbWljcm9ibGF6ZS9pbmNsdWRlL2FzbS9wZ3RhYmxlLmjCoMKgwqDCoMKgwqDCoCB8IDIgLS0K
Pj4gwqAgYXJjaC9taXBzL2luY2x1ZGUvYXNtL3BndGFibGUtMzIuaMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHwgMSAtCj4+IMKgIGFyY2gvbWlwcy9pbmNsdWRlL2FzbS9wZ3RhYmxlLTY0LmjCoMKgwqDC
oMKgwqDCoMKgwqDCoCB8IDEgLQo+PiDCoCBhcmNoL25kczMyL0tjb25maWfCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMSArCj4+IMKgIGFyY2gv
bmlvczIvaW5jbHVkZS9hc20vcGd0YWJsZS5owqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMiAt
LQo+PiDCoCBhcmNoL29wZW5yaXNjL2luY2x1ZGUvYXNtL3BndGFibGUuaMKgwqDCoMKgwqDCoMKg
wqDCoCB8IDEgLQo+PiDCoCBhcmNoL3BhcmlzYy9pbmNsdWRlL2FzbS9wZ3RhYmxlLmjCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHwgMiAtLQo+PiDCoCBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYm9v
azNzL3BndGFibGUuaMKgwqDCoCB8IDEgLQo+PiDCoCBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20v
bm9oYXNoLzMyL3BndGFibGUuaCB8IDEgLQo+PiDCoCBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20v
bm9oYXNoLzY0L3BndGFibGUuaCB8IDIgLS0KPj4gwqAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9w
Z3RhYmxlLmjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAyIC0tCj4+IMKgIGFyY2gvczM5MC9p
bmNsdWRlL2FzbS9wZ3RhYmxlLmjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDIgLS0KPj4g
wqAgYXJjaC9zaC9pbmNsdWRlL2FzbS9wZ3RhYmxlLmjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgfCAyIC0tCj4+IMKgIGFyY2gvc3BhcmMvaW5jbHVkZS9hc20vcGd0YWJsZV8zMi5owqDC
oMKgwqDCoMKgwqDCoMKgIHwgMSAtCj4+IMKgIGFyY2gvc3BhcmMvaW5jbHVkZS9hc20vcGd0YWJs
ZV82NC5owqDCoMKgwqDCoMKgwqDCoMKgIHwgMyAtLS0KPj4gwqAgYXJjaC91bS9pbmNsdWRlL2Fz
bS9wZ3RhYmxlLTJsZXZlbC5owqDCoMKgwqDCoMKgwqDCoCB8IDEgLQo+PiDCoCBhcmNoL3VtL2lu
Y2x1ZGUvYXNtL3BndGFibGUtM2xldmVsLmjCoMKgwqDCoMKgwqDCoMKgIHwgMSAtCj4+IMKgIGFy
Y2gveDg2L2luY2x1ZGUvYXNtL3BndGFibGVfdHlwZXMuaMKgwqDCoMKgwqDCoMKgwqAgfCAyIC0t
Cj4+IMKgIGFyY2gveHRlbnNhL2luY2x1ZGUvYXNtL3BndGFibGUuaMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgfCAxIC0KPj4gwqAgaW5jbHVkZS9saW51eC9tbS5owqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDQgKysrKwo+PiDCoCBtbS9LY29uZmln
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgfCA0ICsrKysKPj4gwqAgMjkgZmlsZXMgY2hhbmdlZCwgMTAgaW5zZXJ0aW9u
cygrKSwgNDMgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L21t
LmggYi9pbmNsdWRlL2xpbnV4L21tLmgKPj4gaW5kZXggOGJhNDM0Mjg3Mzg3Li40NzA5OGNjZDcx
NWUgMTAwNjQ0Cj4+IC0tLSBhL2luY2x1ZGUvbGludXgvbW0uaAo+PiArKysgYi9pbmNsdWRlL2xp
bnV4L21tLmgKPj4gQEAgLTQ2LDYgKzQ2LDEwIEBAIGV4dGVybiBpbnQgc3lzY3RsX3BhZ2VfbG9j
a191bmZhaXJuZXNzOwo+PiDCoCDCoCB2b2lkIGluaXRfbW1faW50ZXJuYWxzKHZvaWQpOwo+PiDC
oCArI2lmbmRlZiBBUkNIX0hBU19GSVJTVF9VU0VSX0FERFJFU1MKPiAKPiBJIGd1ZXNzIHlvdSBk
aWRuJ3QgdGVzdCBpdCAuLi4uLiA6KQoKSW4gZmFjdCBJIGRpZCA6KSBUaG91Z2gganVzdCBib290
ZWQgaXQgb24gYXJtNjQgYW5kIGNyb3NzIGNvbXBpbGVkIG9uCm11bHRpcGxlIG90aGVycyBwbGF0
Zm9ybXMuCgo+IAo+IHNob3VsZCBiZSAjaWZuZGVmIENPTkZJR19BUkNIX0hBU19GSVJTVF9VU0VS
X0FERFJFU1MKClJpZ2h0LCBtZWFudCB0aGF0IGluc3RlYWQuCgo+IAo+PiArI2RlZmluZSBGSVJT
VF9VU0VSX0FERFJFU1PCoMKgwqAgMFVMCj4+ICsjZW5kaWYKPiAKPiBCdXQgd2h5IGRvIHdlIG5l
ZWQgYSBjb25maWcgb3B0aW9uIGF0IGFsbCBmb3IgdGhhdCA/Cj4gCj4gV2h5IG5vdCBqdXN0Ogo+
IAo+ICNpZm5kZWYgRklSU1RfVVNFUl9BRERSRVNTCj4gI2RlZmluZSBGSVJTVF9VU0VSX0FERFJF
U1PCoMKgwqAgMFVMCj4gI2VuZGlmCgpUaGlzIHNvdW5kcyBzaW1wbGVyLiBCdXQganVzdCB3b25k
ZXJpbmcsIHdvdWxkIG5vdCB0aGVyZSBiZSBhbnkgcG9zc2liaWxpdHkKb2YgYnVpbGQgcHJvYmxl
bXMgZHVlIHRvIGNvbXBpbGF0aW9uIHNlcXVlbmNlIGJldHdlZW4gYXJjaCBhbmQgZ2VuZXJpYyBj
b2RlID8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtc25w
cy1hcmMK
