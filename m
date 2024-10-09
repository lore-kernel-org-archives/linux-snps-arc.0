Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03B92CEDDA4
	for <linux-snps-arc@archiver.kernel.org>; Wed,  9 Oct 2024 14:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OW4HxnDItrKiXQpnpIMcyYuG10q6wPOpWKADuwipm+8=; b=w44dVRGwRv/9mX
	ed3XXb8TU9neOU0Es7DYeMB5Psi+jiyLvcAsnMPrK96r1INoN8VoyYBFTGOoRMPnIoShUQJGWCnv/
	BjTCkBo4wBO7CkZ5D36zKQbP9toLPI7UrHds0741IFbYoXG6HZHhb4KaZkcq8WaayyHduTMSvLPJ9
	N5rUln+rEx2Jx6VY91k2OpI7EyQ07Mcu5zFxWvMhNHrPrfFFBsnrDlKe2jjBbwqom3XGuA82CUA6l
	AohE938q50LL5qKHg5qPX9kFe28ZJsl1H0+s7x48xF+DZXVqTHEi5s+Wo3mSrQJkOYiZcHm78Qt6E
	NIpT264AmCUtLlcFb9dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syY2D-00000009fMT-2sH6;
	Wed, 09 Oct 2024 14:51:29 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syY0s-00000009fEF-31d1;
	Wed, 09 Oct 2024 14:50:07 +0000
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4XNwTw0tTFz9sPd;
	Wed,  9 Oct 2024 16:37:56 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VPYRDQSqjFFY; Wed,  9 Oct 2024 16:37:56 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4XNwTw03Cdz9rvV;
	Wed,  9 Oct 2024 16:37:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id E33838B77C;
	Wed,  9 Oct 2024 16:37:55 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 5YCo0KwYOorb; Wed,  9 Oct 2024 16:37:55 +0200 (CEST)
Received: from [192.168.233.133] (unknown [192.168.233.133])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 33B378B770;
	Wed,  9 Oct 2024 16:37:54 +0200 (CEST)
Message-ID: <f9693d48-1018-460f-a1ff-5990bcf92b66@csgroup.eu>
Date: Wed, 9 Oct 2024 16:37:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] asm-generic: provide generic page_to_phys and
 phys_to_page implementations
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
References: <20241009114334.558004-1-hch@lst.de>
 <20241009114334.558004-2-hch@lst.de>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20241009114334.558004-2-hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_075006_956870_3BAD9395 
X-CRM114-Status: UNSURE (   9.17  )
X-CRM114-Notice: Please train this message.
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

CgpMZSAwOS8xMC8yMDI0IMOgIDEzOjQzLCBDaHJpc3RvcGggSGVsbHdpZyBhIMOpY3JpdMKgOgo+
IHBhZ2VfdG9fcGh5cyBpcyBkdXBsaWNhdGVkIGJ5IGFsbCBhcmNoaXRlY3R1cmVzLCBhbmQgZnJv
bSBzb21lIHN0cmFuZ2UKPiByZWFzb24gcGxhY2VkIGluIDxhc20vaW8uaD4gd2hlcmUgaXQgZG9l
c24ndCBmaXQgYXQgYWxsLgo+IAo+IHBoeXNfdG9fcGFnZSBpcyBvbmx5IHByb3ZpZGVkIGJ5IGEg
ZmV3IGFyY2hpdGVjdHVyZXMgZGVzcGl0ZSBoYXZpbmcgYSBsb3QKPiBvZiBvcGVuIGNvZGVkIHVz
ZXJzLgo+IAo+IFByb3ZpZGUgZ2VuZXJpYyB2ZXJzaW9ucyBpbiA8YXNtLWdlbmVyaWMvbWVtb3J5
X21vZGVsLmg+IHRvIG1ha2UgdGhlc2UKPiBoZWxwZXJzIG1vcmUgZWFzaWx5IHVzYWJsZS4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KPiAtLS0KPiAg
IGFyY2gvYWxwaGEvaW5jbHVkZS9hc20vaW8uaCAgICAgICAgIHwgIDEgLQo+ICAgYXJjaC9hcmMv
aW5jbHVkZS9hc20vaW8uaCAgICAgICAgICAgfCAgMyAtLS0KPiAgIGFyY2gvYXJtL2luY2x1ZGUv
YXNtL21lbW9yeS5oICAgICAgIHwgIDYgLS0tLS0tCj4gICBhcmNoL2FybTY0L2luY2x1ZGUvYXNt
L21lbW9yeS5oICAgICB8ICA2IC0tLS0tLQo+ICAgYXJjaC9jc2t5L2luY2x1ZGUvYXNtL3BhZ2Uu
aCAgICAgICAgfCAgMyAtLS0KPiAgIGFyY2gvaGV4YWdvbi9pbmNsdWRlL2FzbS9wYWdlLmggICAg
IHwgIDYgLS0tLS0tCj4gICBhcmNoL2xvb25nYXJjaC9pbmNsdWRlL2FzbS9wYWdlLmggICB8ICAz
IC0tLQo+ICAgYXJjaC9tNjhrL2luY2x1ZGUvYXNtL3ZpcnRjb252ZXJ0LmggfCAgMyAtLS0KPiAg
IGFyY2gvbWljcm9ibGF6ZS9pbmNsdWRlL2FzbS9wYWdlLmggIHwgIDEgLQo+ICAgYXJjaC9taXBz
L2luY2x1ZGUvYXNtL2lvLmggICAgICAgICAgfCAgNSAtLS0tLQo+ICAgYXJjaC9uaW9zMi9pbmNs
dWRlL2FzbS9pby5oICAgICAgICAgfCAgMyAtLS0KPiAgIGFyY2gvb3BlbnJpc2MvaW5jbHVkZS9h
c20vcGFnZS5oICAgIHwgIDIgLS0KPiAgIGFyY2gvcGFyaXNjL2luY2x1ZGUvYXNtL3BhZ2UuaCAg
ICAgIHwgIDEgLQo+ICAgYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2lvLmggICAgICAgfCAxMiAt
LS0tLS0tLS0tLS0KCkFzIGZhciBhcyBJIHVuZGVyc3RhbmQsIHRoaXMgcGF0Y2ggc2lsZW50bHkg
ZHJvcHMgcGFydCBvZiBjb21taXQgCjZiZjc1MmRhY2EwNyAoInBvd2VycGM6IGltcGxlbWVudCBD
T05GSUdfREVCVUdfVklSVFVBTCIpLgoKQ2FuIHlvdSBwbGVhc2UgY2xhcmlmeSA/CgpDaHJpc3Rv
cGhlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMt
YXJjCg==
