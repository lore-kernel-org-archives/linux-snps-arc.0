Return-Path: <SRS0=NhYn=JL=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A884C433ED
	for <linux-snps-arc@archiver.kernel.org>; Wed, 14 Apr 2021 06:11:22 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDAAD611C9
	for <linux-snps-arc@archiver.kernel.org>; Wed, 14 Apr 2021 06:11:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CDAAD611C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=csgroup.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aUJFHPzdMLi1Ru37jXYzFLvTm9s3c3BSMM7yEfPDMzQ=; b=JjATgq2WZ7Txh03jfpKem0AeU
	BtLK0bMLTgsJ3kJn0ugsyoXWKum8dBsEX6+8rHR2hG5JaSGsJJO91/zRi3dSNuDjBB08Cc0IAqcDN
	PMfum47A/ARyh9Pfjmtmo9q3iWbUMcBdedeQFS72LBu7W4gjfcwNapfjdTMO45+EW64yZdQPc6NN0
	6SzFd5frCMW4Y6VW7YTDfOrzQ8v96ibJz1t5FtrJHmO9c3V9321MFgr3i+BUtBXJY4lrK23BNwCg0
	4wy3XBLyLcCYQjVWqgqxmJuoozEQwo+bZzezITUd3cBUGTGuznhXnwK8tW2832fVJbPT5V8YIv6jM
	PF1fkg9QA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWYkB-00Bcxx-Td; Wed, 14 Apr 2021 06:11:20 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWYjr-00Bcvh-OI; Wed, 14 Apr 2021 06:11:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=BMwYhnpeSJdmL8t4yYLZj10Q698T6zZOZ1DirFpXKQc=; b=eQhdAVhmsIyxdQykkbictTV8of
 F1yJM84JJA4iSRPoMyc3h2MSpDOoa0qQgNGyoI37q4vYtSCUeztuJE7HVL5VeiQvlrq2fmthkST3S
 7bCqn5B5ILhEE1JlRKhYF2DrnNgiD0yu3nuGpNc10G1HcsfYwIFgXEYPLwzZl+9p4SnZHuzo/8Ayb
 uxhZ1LITkx5b3i0aS0BcO4XWdDFW2t/oAG60ntC1cd73YlLby3I3+9NUwyP+PxuwvZ0mt1spmYYOH
 4aIPWPyJ0e34ZBXBzQk+wGTFzEru8KFmZDHfk4o8MMCo633fWdujlplL6MbFOfG2F+RNDDZ8m1eSJ
 AH6k2ENw==;
Received: from pegase1.c-s.fr ([93.17.236.30])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWYjo-007W5c-DM; Wed, 14 Apr 2021 06:10:58 +0000
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FKsXp6CPzzB09bD;
 Wed, 14 Apr 2021 08:10:50 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id bgEX-Y99N3ka; Wed, 14 Apr 2021 08:10:50 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FKsXp513xzB09bB;
 Wed, 14 Apr 2021 08:10:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8F6CC8B7B6;
 Wed, 14 Apr 2021 08:10:51 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 8t_hMitD6rsU; Wed, 14 Apr 2021 08:10:51 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 62A328B75F;
 Wed, 14 Apr 2021 08:10:50 +0200 (CEST)
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
 <f29ba8e2-3071-c963-1e9f-e8c88526ed8d@csgroup.eu>
 <6d24d3cc-b2df-f0d7-f4bf-f505f679c77e@arm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <ec7bbb30-dbbd-197b-4d65-eb3600fe6413@csgroup.eu>
Date: Wed, 14 Apr 2021 08:10:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <6d24d3cc-b2df-f0d7-f4bf-f505f679c77e@arm.com>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210413_231056_772650_7C2A0164 
X-CRM114-Status: GOOD (  16.45  )
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

CgpMZSAxNC8wNC8yMDIxIMOgIDA3OjU5LCBBbnNodW1hbiBLaGFuZHVhbCBhIMOpY3JpdMKgOgo+
IAo+IAo+IE9uIDQvMTQvMjEgMTA6NTIgQU0sIENocmlzdG9waGUgTGVyb3kgd3JvdGU6Cj4+Cj4+
Cj4+IExlIDE0LzA0LzIwMjEgw6AgMDQ6NTQsIEFuc2h1bWFuIEtoYW5kdWFsIGEgw6ljcml0wqA6
Cj4+PiBDdXJyZW50bHkgbW9zdCBwbGF0Zm9ybXMgZGVmaW5lIEZJUlNUX1VTRVJfQUREUkVTUyBh
cyAwVUwgZHVwbGljYXRpbmcgdGhlCj4+PiBzYW1lIGNvZGUgYWxsIG92ZXIuIEluc3RlYWQgZGVm
aW5lIGEgbmV3IG9wdGlvbiBBUkNIX0hBU19GSVJTVF9VU0VSX0FERFJFU1MKPj4+IGZvciB0aG9z
ZSBwbGF0Zm9ybXMgd2hpY2ggd291bGQgb3ZlcnJpZGUgZ2VuZXJpYyBkZWZhdWx0IEZJUlNUX1VT
RVJfQUREUkVTUwo+Pj4gdmFsdWUgMFVMLiBUaGlzIG1ha2VzIGl0IG11Y2ggY2xlYW5lciB3aXRo
IHJlZHVjZWQgY29kZS4KPj4+Cj4+PiBDYzogbGludXgtYWxwaGFAdmdlci5rZXJuZWwub3JnCj4+
PiBDYzogbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwo+Pj4gQ2M6IGxpbnV4LWFy
bS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwo+Pj4gQ2M6IGxpbnV4LWNza3lAdmdlci5rZXJu
ZWwub3JnCj4+PiBDYzogbGludXgtaGV4YWdvbkB2Z2VyLmtlcm5lbC5vcmcKPj4+IENjOiBsaW51
eC1pYTY0QHZnZXIua2VybmVsLm9yZwo+Pj4gQ2M6IGxpbnV4LW02OGtAbGlzdHMubGludXgtbTY4
ay5vcmcKPj4+IENjOiBsaW51eC1taXBzQHZnZXIua2VybmVsLm9yZwo+Pj4gQ2M6IG9wZW5yaXNj
QGxpc3RzLmxpYnJlY29yZXMub3JnCj4+PiBDYzogbGludXgtcGFyaXNjQHZnZXIua2VybmVsLm9y
Zwo+Pj4gQ2M6IGxpbnV4cHBjLWRldkBsaXN0cy5vemxhYnMub3JnCj4+PiBDYzogbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+Pj4gQ2M6IGxpbnV4LXMzOTBAdmdlci5rZXJuZWwub3Jn
Cj4+PiBDYzogbGludXgtc2hAdmdlci5rZXJuZWwub3JnCj4+PiBDYzogc3BhcmNsaW51eEB2Z2Vy
Lmtlcm5lbC5vcmcKPj4+IENjOiBsaW51eC11bUBsaXN0cy5pbmZyYWRlYWQub3JnCj4+PiBDYzog
bGludXgteHRlbnNhQGxpbnV4LXh0ZW5zYS5vcmcKPj4+IENjOiB4ODZAa2VybmVsLm9yZwo+Pj4g
Q2M6IGxpbnV4LW1tQGt2YWNrLm9yZwo+Pj4gQ2M6IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5v
cmcKPj4+IFNpZ25lZC1vZmYtYnk6IEFuc2h1bWFuIEtoYW5kdWFsIDxhbnNodW1hbi5raGFuZHVh
bEBhcm0uY29tPgo+Pj4gLS0tCj4+PiAgwqAgYXJjaC9hbHBoYS9pbmNsdWRlL2FzbS9wZ3RhYmxl
LmjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAxIC0KPj4+ICDCoCBhcmNoL2FyYy9pbmNsdWRl
L2FzbS9wZ3RhYmxlLmjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgNiAtLS0tLS0KPj4+
ICDCoCBhcmNoL2FybS9LY29uZmlnwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAxICsKPj4+ICDCoCBhcmNoL2FybTY0L2luY2x1ZGUvYXNt
L3BndGFibGUuaMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDIgLS0KPj4+ICDCoCBhcmNoL2Nz
a3kvaW5jbHVkZS9hc20vcGd0YWJsZS5owqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAxIC0K
Pj4+ICDCoCBhcmNoL2hleGFnb24vaW5jbHVkZS9hc20vcGd0YWJsZS5owqDCoMKgwqDCoMKgwqDC
oMKgwqAgfCAzIC0tLQo+Pj4gIMKgIGFyY2gvaWE2NC9pbmNsdWRlL2FzbS9wZ3RhYmxlLmjCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDEgLQo+Pj4gIMKgIGFyY2gvbTY4ay9pbmNsdWRlL2Fz
bS9wZ3RhYmxlX21tLmjCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDEgLQo+Pj4gIMKgIGFyY2gvbWlj
cm9ibGF6ZS9pbmNsdWRlL2FzbS9wZ3RhYmxlLmjCoMKgwqDCoMKgwqDCoCB8IDIgLS0KPj4+ICDC
oCBhcmNoL21pcHMvaW5jbHVkZS9hc20vcGd0YWJsZS0zMi5owqDCoMKgwqDCoMKgwqDCoMKgwqAg
fCAxIC0KPj4+ICDCoCBhcmNoL21pcHMvaW5jbHVkZS9hc20vcGd0YWJsZS02NC5owqDCoMKgwqDC
oMKgwqDCoMKgwqAgfCAxIC0KPj4+ICDCoCBhcmNoL25kczMyL0tjb25maWfCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMSArCj4+PiAgwqAgYXJj
aC9uaW9zMi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAy
IC0tCj4+PiAgwqAgYXJjaC9vcGVucmlzYy9pbmNsdWRlL2FzbS9wZ3RhYmxlLmjCoMKgwqDCoMKg
wqDCoMKgwqAgfCAxIC0KPj4+ICDCoCBhcmNoL3BhcmlzYy9pbmNsdWRlL2FzbS9wZ3RhYmxlLmjC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMiAtLQo+Pj4gIMKgIGFyY2gvcG93ZXJwYy9pbmNsdWRl
L2FzbS9ib29rM3MvcGd0YWJsZS5owqDCoMKgIHwgMSAtCj4+PiAgwqAgYXJjaC9wb3dlcnBjL2lu
Y2x1ZGUvYXNtL25vaGFzaC8zMi9wZ3RhYmxlLmggfCAxIC0KPj4+ICDCoCBhcmNoL3Bvd2VycGMv
aW5jbHVkZS9hc20vbm9oYXNoLzY0L3BndGFibGUuaCB8IDIgLS0KPj4+ICDCoCBhcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL3BndGFibGUuaMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDIgLS0KPj4+
ICDCoCBhcmNoL3MzOTAvaW5jbHVkZS9hc20vcGd0YWJsZS5owqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgfCAyIC0tCj4+PiAgwqAgYXJjaC9zaC9pbmNsdWRlL2FzbS9wZ3RhYmxlLmjCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAyIC0tCj4+PiAgwqAgYXJjaC9zcGFyYy9pbmNsdWRl
L2FzbS9wZ3RhYmxlXzMyLmjCoMKgwqDCoMKgwqDCoMKgwqAgfCAxIC0KPj4+ICDCoCBhcmNoL3Nw
YXJjL2luY2x1ZGUvYXNtL3BndGFibGVfNjQuaMKgwqDCoMKgwqDCoMKgwqDCoCB8IDMgLS0tCj4+
PiAgwqAgYXJjaC91bS9pbmNsdWRlL2FzbS9wZ3RhYmxlLTJsZXZlbC5owqDCoMKgwqDCoMKgwqDC
oCB8IDEgLQo+Pj4gIMKgIGFyY2gvdW0vaW5jbHVkZS9hc20vcGd0YWJsZS0zbGV2ZWwuaMKgwqDC
oMKgwqDCoMKgwqAgfCAxIC0KPj4+ICDCoCBhcmNoL3g4Ni9pbmNsdWRlL2FzbS9wZ3RhYmxlX3R5
cGVzLmjCoMKgwqDCoMKgwqDCoMKgIHwgMiAtLQo+Pj4gIMKgIGFyY2gveHRlbnNhL2luY2x1ZGUv
YXNtL3BndGFibGUuaMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAxIC0KPj4+ICDCoCBpbmNsdWRl
L2xpbnV4L21tLmjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHwgNCArKysrCj4+PiAgwqAgbW0vS2NvbmZpZ8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgNCArKysrCj4+
PiAgwqAgMjkgZmlsZXMgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgNDMgZGVsZXRpb25zKC0p
Cj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvbW0uaCBiL2luY2x1ZGUvbGludXgv
bW0uaAo+Pj4gaW5kZXggOGJhNDM0Mjg3Mzg3Li40NzA5OGNjZDcxNWUgMTAwNjQ0Cj4+PiAtLS0g
YS9pbmNsdWRlL2xpbnV4L21tLmgKPj4+ICsrKyBiL2luY2x1ZGUvbGludXgvbW0uaAo+Pj4gQEAg
LTQ2LDYgKzQ2LDEwIEBAIGV4dGVybiBpbnQgc3lzY3RsX3BhZ2VfbG9ja191bmZhaXJuZXNzOwo+
Pj4gIMKgIMKgIHZvaWQgaW5pdF9tbV9pbnRlcm5hbHModm9pZCk7Cj4+PiAgwqAgKyNpZm5kZWYg
QVJDSF9IQVNfRklSU1RfVVNFUl9BRERSRVNTCj4+Cj4+IEkgZ3Vlc3MgeW91IGRpZG4ndCB0ZXN0
IGl0IC4uLi4uIDopCj4gCj4gSW4gZmFjdCBJIGRpZCA6KSBUaG91Z2gganVzdCBib290ZWQgaXQg
b24gYXJtNjQgYW5kIGNyb3NzIGNvbXBpbGVkIG9uCj4gbXVsdGlwbGUgb3RoZXJzIHBsYXRmb3Jt
cy4KPiAKPj4KPj4gc2hvdWxkIGJlICNpZm5kZWYgQ09ORklHX0FSQ0hfSEFTX0ZJUlNUX1VTRVJf
QUREUkVTUwo+IAo+IFJpZ2h0LCBtZWFudCB0aGF0IGluc3RlYWQuCj4gCj4+Cj4+PiArI2RlZmlu
ZSBGSVJTVF9VU0VSX0FERFJFU1PCoMKgwqAgMFVMCj4+PiArI2VuZGlmCj4+Cj4+IEJ1dCB3aHkg
ZG8gd2UgbmVlZCBhIGNvbmZpZyBvcHRpb24gYXQgYWxsIGZvciB0aGF0ID8KPj4KPj4gV2h5IG5v
dCBqdXN0Ogo+Pgo+PiAjaWZuZGVmIEZJUlNUX1VTRVJfQUREUkVTUwo+PiAjZGVmaW5lIEZJUlNU
X1VTRVJfQUREUkVTU8KgwqDCoCAwVUwKPj4gI2VuZGlmCj4gCj4gVGhpcyBzb3VuZHMgc2ltcGxl
ci4gQnV0IGp1c3Qgd29uZGVyaW5nLCB3b3VsZCBub3QgdGhlcmUgYmUgYW55IHBvc3NpYmlsaXR5
Cj4gb2YgYnVpbGQgcHJvYmxlbXMgZHVlIHRvIGNvbXBpbGF0aW9uIHNlcXVlbmNlIGJldHdlZW4g
YXJjaCBhbmQgZ2VuZXJpYyBjb2RlID8KPiAKCkZvciBzdXJlIGl0IGhhcyB0byBiZSBhZGRyZXNz
ZXMgY2FyZWZ1bGx5LCBidXQgdGhlcmUgYXJlIGFscmVhZHkgYSBsb3Qgb2Ygc3R1ZmYgbGlrZSB0
aGF0IGFyb3VuZCAKcGd0YWJsZXMuaAoKRm9yIGluc3RhbmNlLCBwdGVfb2Zmc2V0X2tlcm5lbCgp
IGhhcyBhIGdlbmVyaWMgZGVmaW5pdGlvbiBpbiBsaW51eC9wZ3RhYmxlcy5oIGJhc2VkIG9uIHdo
ZXRoZXIgaXQgCmlzIGFscmVhZHkgZGVmaW5lZCBvciBub3QuCgpUYWtpbmcgaW50byBhY2NvdW50
IHRoYXQgRklSU1RfVVNFUl9BRERSRVNTIGlzIHRvZGF5IGluIHRoZSBhcmNoaXRlY3R1cmVzJ3Mg
YXNtL3BndGFibGVzLmgsIEkgdGhpbmsgCnB1dHRpbmcgdGhlIGZhbGxiYWNrIGRlZmluaXRpb24g
aW4gbGludXgvcGd0YWJsZS5oIHdvdWxkIGRvIHRoZSB0cmljay4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlz
dApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1hcmMK
