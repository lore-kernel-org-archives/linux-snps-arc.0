Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88073D12676
	for <linux-snps-arc@archiver.kernel.org>; Tue,  5 Nov 2024 09:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8sn7bflwCkOsaN+jC8nk0/0L6hjk6dPzORFQEA2retE=; b=U4RAV+V7NP10pb
	TvHZp1QltBCC+vJPDyk9uDg/yfFhzoalTW+1Z2qyus71GYmWEElZKrrRkzPlFe1Ki1zSQrJWlZR15
	wfqPtFynAxaLGlkBe5McWh7uCgDyhaCWHQEJ60CHUAHd8XdKXZTkB4aX3Y+4QGrbAoS9GJrjDYzqh
	KCBAuw5zbK504OlXazoz2/qZyqJmba4zRMqrQ6k78MmG7MWc4gsoeB798KVKj9KfiKZr27TsgmHwg
	NAE/s+kivlLSWpeqj50ERGgJCanFUGFo/3zX4gz5q/sVGLeUd/JKPHcs2thKbsoYDv/vBxK5xpeD1
	OU9U3DfKkrzlHPiakZOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8GKe-0000000GbIA-0u7H;
	Tue, 05 Nov 2024 09:58:40 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8GIp-0000000Gas2-1vhx;
	Tue, 05 Nov 2024 09:56:49 +0000
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4XjNyz319Qz9sPd;
	Tue,  5 Nov 2024 10:56:43 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CpEO93zW8bQ7; Tue,  5 Nov 2024 10:56:43 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4XjNyz27jdz9rvV;
	Tue,  5 Nov 2024 10:56:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 346688B770;
	Tue,  5 Nov 2024 10:56:43 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id BXNslob-hZDZ; Tue,  5 Nov 2024 10:56:43 +0100 (CET)
Received: from [192.168.232.44] (unknown [192.168.232.44])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 9E0918B763;
	Tue,  5 Nov 2024 10:56:42 +0100 (CET)
Message-ID: <9ee9c21b-179f-49aa-8c65-304c8ef2c9a7@csgroup.eu>
Date: Tue, 5 Nov 2024 10:56:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] asm-generic: add an optional pfn_valid check to
 page_to_phys
To: Christoph Hellwig <hch@lst.de>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-um@lists.infradead.org, linux-arch@vger.kernel.org
References: <20241023053644.311692-1-hch@lst.de>
 <20241023053644.311692-3-hch@lst.de>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20241023053644.311692-3-hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_015647_680459_520A55CC 
X-CRM114-Status: GOOD (  14.31  )
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

CgpMZSAyMy8xMC8yMDI0IMOgIDA3OjM2LCBDaHJpc3RvcGggSGVsbHdpZyBhIMOpY3JpdMKgOgo+
IHBhZ2VfdG9fcGZuIGlzIHVzdWFsbHkgaW1wbGVtZW50ZWQgYnkgcG9pbnRlciBhcml0aG1ldGlj
cyBvbiB0aGUgbWVtb3J5Cj4gbWFwLCB3aGljaCBtZWFucyB0aGF0IGJvZ3VzIGlucHV0IGNhbiBs
ZWFkIHRvIGV2ZW4gbW9yZSBib2d1cyBvdXRwdXQuCj4gCj4gUG93ZXJwYyBoYWQgYSBwZm5fdmFs
aWQgY2hlY2sgb24gdGhlIGludGVybWVkaWF0ZSBwZm4gaW4gdGhlIHBhZ2VfdG9fcGh5cwo+IGlt
cGxlbWVudGF0aW9uIHdoZW4gQ09ORklHX0RFQlVHX1ZJUlRVQUwgaXMgZGVmaW5lZCwgd2hpY2gg
c2VlbXMKPiBnZW5lcmFsbHkgdXNlZnVsLCBzbyBhZGQgdGhhdCB0byB0aGUgZ2VuZXJpYyB2ZXJz
aW9uLgo+IAo+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgo+
IC0tLQo+ICAgaW5jbHVkZS9hc20tZ2VuZXJpYy9tZW1vcnlfbW9kZWwuaCB8IDEwICsrKysrKysr
KysKPiAgIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBh
L2luY2x1ZGUvYXNtLWdlbmVyaWMvbWVtb3J5X21vZGVsLmggYi9pbmNsdWRlL2FzbS1nZW5lcmlj
L21lbW9yeV9tb2RlbC5oCj4gaW5kZXggYTczYTE0MGNiZWNkLi42ZDFmYjYxNjJhYzEgMTAwNjQ0
Cj4gLS0tIGEvaW5jbHVkZS9hc20tZ2VuZXJpYy9tZW1vcnlfbW9kZWwuaAo+ICsrKyBiL2luY2x1
ZGUvYXNtLWdlbmVyaWMvbWVtb3J5X21vZGVsLmgKPiBAQCAtNjQsNyArNjQsMTcgQEAgc3RhdGlj
IGlubGluZSBpbnQgcGZuX3ZhbGlkKHVuc2lnbmVkIGxvbmcgcGZuKQo+ICAgI2RlZmluZSBwYWdl
X3RvX3BmbiBfX3BhZ2VfdG9fcGZuCj4gICAjZGVmaW5lIHBmbl90b19wYWdlIF9fcGZuX3RvX3Bh
Z2UKPiAgIAo+ICsjaWZkZWYgQ09ORklHX0RFQlVHX1ZJUlRVQUwKPiArI2RlZmluZSBwYWdlX3Rv
X3BoeXMocGFnZSkJCQkJCQlcCj4gKyh7CQkJCQkJCQkJXAo+ICsJdW5zaWduZWQgbG9uZyBfX3Bm
biA9IHBhZ2VfdG9fcGZuKHBhZ2UpOwkJCVwKPiArCQkJCQkJCQkJXAo+ICsJV0FSTl9PTl9PTkNF
KCFwZm5fdmFsaWQoX19wZm4pKTsJCQkJXAoKT24gcG93ZXJwYyBJIHRoaW5rIGl0IHdhcyBhIFdB
Uk5fT04oKS4KCldpbGwgYSBXQVJOX09OX09OQ0UoKSBiZSBlbm91Z2ggPwoKPiArCVBGTl9QSFlT
KF9fcGZuKTsJCQkJCQlcCj4gK30pCj4gKyNlbHNlCj4gICAjZGVmaW5lIHBhZ2VfdG9fcGh5cyhw
YWdlKQlQRk5fUEhZUyhwYWdlX3RvX3BmbihwYWdlKSkKPiArI2VuZGlmIC8qIENPTkZJR19ERUJV
R19WSVJUVUFMICovCj4gICAjZGVmaW5lIHBoeXNfdG9fcGFnZShwaHlzKQlwZm5fdG9fcGFnZShQ
SFlTX1BGTihwaHlzKSkKPiAgIAo+ICAgI2VuZGlmIC8qIF9fQVNTRU1CTFlfXyAqLwoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtc25wcy1hcmMg
bWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBzLWFyYwo=
