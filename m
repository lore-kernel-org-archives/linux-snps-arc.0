Return-Path: <SRS0=XnSr=ON=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ADF2C4332F
	for <linux-snps-arc@archiver.kernel.org>; Thu, 23 Sep 2021 09:48:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9C6F6121F
	for <linux-snps-arc@archiver.kernel.org>; Thu, 23 Sep 2021 09:48:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E9C6F6121F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=csgroup.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Iq4YwgW03Fiotxe8WkIJx/zinjwknO9E767fpnFo2rc=; b=3hXT63J5OLsCZ7jViBT0x7srjD
	rZ+lsvtnslRrBe20E1QcZ4jMGw0OAq5NFKaDHfa3KBtF8DVRst1U08HdEf9e4StQAVXHp2Fu3DeN5
	h0zHMbxWA4RPys/zt/e73NuyvyjJzNznoczFFnbfEyJfN1Oc81JNXsnBDNsmjx65Aq3QthE1+gEcd
	GflOGBjQijB2LtsImsRB3BtRcPL08Z9Fe3hUgwARpw5ElsKXskeRznYXgwzWCmg3h0nqztl47zSM9
	t17pHBiu2UvOaWTLoJcTGjYv5VRgOoUPguIlW4DzEAFCumdnf2Yoam+lmRrxxcbmGuAGEva1A6RJj
	uz8TBxbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTLKx-00ApqZ-F8; Thu, 23 Sep 2021 09:48:15 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTLKi-00Apmp-BU; Thu, 23 Sep 2021 09:48:02 +0000
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4HFVhS1HTcz9sTZ;
 Thu, 23 Sep 2021 11:47:52 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N2iojAvTUjrW; Thu, 23 Sep 2021 11:47:52 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4HFVhS0G8Vz9sTX;
 Thu, 23 Sep 2021 11:47:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E65698B775;
 Thu, 23 Sep 2021 11:47:51 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id HEg50hnqH7U5; Thu, 23 Sep 2021 11:47:51 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.202.200])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 224928B763;
 Thu, 23 Sep 2021 11:47:50 +0200 (CEST)
Subject: Re: [PATCH 3/3] memblock: cleanup memblock_free interface
To: Mike Rapoport <rppt@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Cc: devicetree@vger.kernel.org, linux-efi@vger.kernel.org,
 Mike Rapoport <rppt@linux.ibm.com>, kvm@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-um@lists.infradead.org, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-mips@vger.kernel.org, linux-mm@kvack.org,
 iommu@lists.linux-foundation.org, linux-usb@vger.kernel.org,
 linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org,
 xen-devel@lists.xenproject.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20210923074335.12583-1-rppt@kernel.org>
 <20210923074335.12583-4-rppt@kernel.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <1101e3c7-fcb7-a632-8e22-47f4a01ea02e@csgroup.eu>
Date: Thu, 23 Sep 2021 11:47:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210923074335.12583-4-rppt@kernel.org>
Content-Language: fr-FR
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210923_024800_608965_E73A9627 
X-CRM114-Status: GOOD (  18.04  )
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

CgpMZSAyMy8wOS8yMDIxIMOgIDA5OjQzLCBNaWtlIFJhcG9wb3J0IGEgw6ljcml0wqA6Cj4gRnJv
bTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgo+IAo+IEZvciBhZ2VzIG1lbWJs
b2NrX2ZyZWUoKSBpbnRlcmZhY2UgZGVhbHQgd2l0aCBwaHlzaWNhbCBhZGRyZXNzZXMgZXZlbgo+
IGRlc3BpdGUgdGhlIGV4aXN0ZW5jZSBvZiBtZW1ibG9ja19hbGxvY194eCgpIGZ1bmN0aW9ucyB0
aGF0IHJldHVybiBhCj4gdmlydHVhbCBwb2ludGVyLgo+IAo+IEludHJvZHVjZSBtZW1ibG9ja19w
aHlzX2ZyZWUoKSBmb3IgZnJlZWluZyBwaHlzaWNhbCByYW5nZXMgYW5kIHJlcHVycG9zZQo+IG1l
bWJsb2NrX2ZyZWUoKSB0byBmcmVlIHZpcnR1YWwgcG9pbnRlcnMgdG8gbWFrZSB0aGUgZm9sbG93
aW5nIHBhaXJpbmcKPiBhYnVuZGFudGx5IGNsZWFyOgo+IAo+IAlpbnQgbWVtYmxvY2tfcGh5c19m
cmVlKHBoeXNfYWRkcl90IGJhc2UsIHBoeXNfYWRkcl90IHNpemUpOwo+IAlwaHlzX2FkZHJfdCBt
ZW1ibG9ja19waHlzX2FsbG9jKHBoeXNfYWRkcl90IGJhc2UsIHBoeXNfYWRkcl90IHNpemUpOwo+
IAo+IAl2b2lkICptZW1ibG9ja19hbGxvYyhwaHlzX2FkZHJfdCBzaXplLCBwaHlzX2FkZHJfdCBh
bGlnbik7Cj4gCXZvaWQgbWVtYmxvY2tfZnJlZSh2b2lkICpwdHIsIHNpemVfdCBzaXplKTsKPiAK
PiBSZXBsYWNlIGludGVybWVkaWF0ZSBtZW1ibG9ja19mcmVlX3B0cigpIHdpdGggbWVtYmxvY2tf
ZnJlZSgpIGFuZCBkcm9wCj4gdW5uZWNlc3NhcnkgYWxpYXNlcyBtZW1ibG9ja19mcmVlX2Vhcmx5
KCkgYW5kIG1lbWJsb2NrX2ZyZWVfZWFybHlfbmlkKCkuCj4gCj4gU3VnZ2VzdGVkLWJ5OiBMaW51
cyBUb3J2YWxkcyA8dG9ydmFsZHNAbGludXgtZm91bmRhdGlvbi5vcmc+Cj4gU2lnbmVkLW9mZi1i
eTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgo+IC0tLQoKPiBkaWZmIC0tZ2l0
IGEvYXJjaC9zMzkwL2tlcm5lbC9zbXAuYyBiL2FyY2gvczM5MC9rZXJuZWwvc21wLmMKPiBpbmRl
eCAxYTA0ZTViZGY2NTUuLjM3ODI2ZDhjNGY3NCAxMDA2NDQKPiAtLS0gYS9hcmNoL3MzOTAva2Vy
bmVsL3NtcC5jCj4gKysrIGIvYXJjaC9zMzkwL2tlcm5lbC9zbXAuYwo+IEBAIC03MjMsNyArNzIz
LDcgQEAgdm9pZCBfX2luaXQgc21wX3NhdmVfZHVtcF9jcHVzKHZvaWQpCj4gICAJCQkvKiBHZXQg
dGhlIENQVSByZWdpc3RlcnMgKi8KPiAgIAkJCXNtcF9zYXZlX2NwdV9yZWdzKHNhLCBhZGRyLCBp
c19ib290X2NwdSwgcGFnZSk7Cj4gICAJfQo+IC0JbWVtYmxvY2tfZnJlZShwYWdlLCBQQUdFX1NJ
WkUpOwo+ICsJbWVtYmxvY2tfcGh5c19mcmVlKHBhZ2UsIFBBR0VfU0laRSk7Cj4gICAJZGlhZ19h
bW9kZTMxX29wcy5kaWFnMzA4X3Jlc2V0KCk7Cj4gICAJcGNwdV9zZXRfc210KDApOwo+ICAgfQo+
IEBAIC04ODAsNyArODgwLDcgQEAgdm9pZCBfX2luaXQgc21wX2RldGVjdF9jcHVzKHZvaWQpCj4g
ICAKPiAgIAkvKiBBZGQgQ1BVcyBwcmVzZW50IGF0IGJvb3QgKi8KPiAgIAlfX3NtcF9yZXNjYW5f
Y3B1cyhpbmZvLCB0cnVlKTsKPiAtCW1lbWJsb2NrX2ZyZWVfZWFybHkoKHVuc2lnbmVkIGxvbmcp
aW5mbywgc2l6ZW9mKCppbmZvKSk7Cj4gKwltZW1ibG9ja19mcmVlKGluZm8sIHNpemVvZigqaW5m
bykpOwo+ICAgfQo+ICAgCj4gICAvKgoKSSdtIGEgYml0IGxvc3QuIElJVUMgbWVtYmxvY2tfZnJl
ZV9lYXJseSgpIGFuZCBtZW1ibG9ja19mcmVlKCkgd2hlcmUgCmlkZW50aWNhbC4KCkluIHRoZSBm
aXJzdCBodW5rIG1lbWJsb2NrX2ZyZWUoKSBnZXRzIHJlcGxhY2VkIGJ5IG1lbWJsb2NrX3BoeXNf
ZnJlZSgpCkluIHRoZSBzZWNvbmQgaHVuayBtZW1ibG9ja19mcmVlX2Vhcmx5KCkgZ2V0cyByZXBs
YWNlZCBieSBtZW1ibG9ja19mcmVlKCkKCkkgdGhpbmsgaXQgd291bGQgYmUgZWFzaWVyIHRvIGZv
bGxvdyBpZiB5b3UgY291bGQgc3BsaXQgaXQgaW4gc2V2ZXJhbCAKcGF0Y2hlczoKLSBGaXJzdCBw
YXRjaDogQ3JlYXRlIG1lbWJsb2NrX3BoeXNfZnJlZSgpIGFuZCBjaGFuZ2UgYWxsIHJlbGV2YW50
IAptZW1ibG9ja19mcmVlKCkgdG8gbWVtYmxvY2tfcGh5c19mcmVlKCkgLSBPciBjaGFuZ2UgbWVt
YmxvY2tfZnJlZSgpIHRvIAptZW1ibG9ja19waHlzX2ZyZWUoKSBhbmQgbWFrZSBtZW1ibG9ja19m
cmVlKCkgYW4gYWxpYXMgb2YgaXQuCi0gU2Vjb25kIHBhdGNoOiBNYWtlIG1lbWJsb2NrX2ZyZWVf
cHRyKCkgYmVjb21lIG1lbWJsb2NrX2ZyZWUoKSBhbmQgCmNoYW5nZSBhbGwgcmVtYWluaW5nIGNh
bGxlcnMgdG8gdGhlIG5ldyBzZW1hbnRpY3MgKElJVUMgCm1lbWJsb2NrX2ZyZWUoX19wYShwdHIp
KSBiZWNvbWVzIG1lbWJsb2NrX2ZyZWUocHRyKSBhbmQgbWFrZSAKbWVtYmxvY2tfZnJlZV9wdHIo
KSBhbiBhbGlhcyBvZiBtZW1ibG9ja19mcmVlKCkKLSBGb3VydGggcGF0Y2g6IFJlcGxhY2UgYW5k
IGRyb3AgbWVtYmxvY2tfZnJlZV9wdHIoKQotIEZpZnRoIHBhdGNoOiBEcm9wIG1lbWJsb2NrX2Zy
ZWVfZWFybHkoKSBhbmQgbWVtYmxvY2tfZnJlZV9lYXJseV9uaWQoKSAKKEFsbCB1c2VycyBzaG91
bGQgaGF2ZSBiZWVuIHVwZ3JhZGVkIHRvIG1lbWJsb2NrX2ZyZWVfcGh5cygpIGluIHBhdGNoIDEg
Cm9yIG1lbWJsb2NrX2ZyZWUoKSBpbiBwYXRjaCAyKQoKQ2hyaXN0b3BoZQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtc25wcy1hcmMgbWFpbGlu
ZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBzLWFyYwo=
