Return-Path: <SRS0=vI3k=CK=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4C05C433E2
	for <linux-snps-arc@archiver.kernel.org>; Tue,  1 Sep 2020 09:59:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8CF32206A5
	for <linux-snps-arc@archiver.kernel.org>; Tue,  1 Sep 2020 09:59:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jea9tmJS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8CF32206A5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	To:Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ty6pMQJ8FTUuYpm043yCl/xMBSvJwPk2BlBFfHt68oI=; b=jea9tmJSEylTCVJc6Gbg2YvBC
	MUi1014gD6sG0zubt78eERvkDXQL+kl3qUg/BVXnsUSHF0PQIkeKSRHG5iXk17NP6aUjmEqD5Oe8G
	3z9UdGBO8wPKVZWd0M+FHiR6cSiO5lUFw1iQYKKNYzhF70U62fOQbD4sqh+uA7V+pfbORIZJNJucq
	/s9JDu522THhttVJFgdxTgtRoJjBrARWRoa2zIOqtkw0G/0KY1iN7R2PemcyuVrwAjMyxNHV0R5SA
	egRongd1T0nKIyR+PwA/bhaEZ8EbOnolcEyvVOHJj49oJl8OM+1lacSDiQdwwV9yq82kGs80Y57To
	58dhBsy6A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kD34S-0002RH-S5; Tue, 01 Sep 2020 09:59:20 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kD34O-0002Pl-7X; Tue, 01 Sep 2020 09:59:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DC11630E;
 Tue,  1 Sep 2020 02:59:09 -0700 (PDT)
Received: from [10.163.69.134] (unknown [10.163.69.134])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1711B3F71F;
 Tue,  1 Sep 2020 02:59:04 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH v3 09/13] mm/debug_vm_pgtable/locks: Move non page table
 modifying test together
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <20200827080438.315345-1-aneesh.kumar@linux.ibm.com>
 <20200827080438.315345-10-aneesh.kumar@linux.ibm.com>
 <d0a0a50c-702b-c63a-edf2-263e4e7bd4a5@arm.com>
 <b6240372-4554-8c17-186a-cdc0b0a9089c@linux.ibm.com>
 <9b75b175-f319-d40e-a95e-b323b3db654a@arm.com>
 <58a5280f-4882-4a36-c52d-15ad879209d6@linux.ibm.com>
Message-ID: <4fad7c4b-14ca-b558-504b-6b20a6c85ec3@arm.com>
Date: Tue, 1 Sep 2020 15:28:32 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <58a5280f-4882-4a36-c52d-15ad879209d6@linux.ibm.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200901_055916_358119_DE237769 
X-CRM114-Status: GOOD (  12.70  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Christophe Leroy <christophe.leroy@c-s.fr>, mpe@ellerman.id.au, x86@kernel.org,
 Mike Rapoport <rppt@linux.ibm.com>, Qian Cai <cai@lca.pw>,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 Vineet Gupta <vgupta@synopsys.com>, linux-snps-arc@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

CgpPbiAwOS8wMS8yMDIwIDAzOjA2IFBNLCBBbmVlc2ggS3VtYXIgSy5WIHdyb3RlOgo+IAo+Pj4+
Cj4+Pj4gW8KgwqAgMTcuMDgwNjQ0XSAtLS0tLS0tLS0tLS1bIGN1dCBoZXJlIF0tLS0tLS0tLS0t
LS0KPj4+PiBbwqDCoCAxNy4wODEzNDJdIGtlcm5lbCBCVUcgYXQgbW0vcGd0YWJsZS1nZW5lcmlj
LmM6MTY0IQo+Pj4+IFvCoMKgIDE3LjA4MjA5MV0gSW50ZXJuYWwgZXJyb3I6IE9vcHMgLSBCVUc6
IDAgWyMxXSBQUkVFTVBUIFNNUAo+Pj4+IFvCoMKgIDE3LjA4Mjk3N10gTW9kdWxlcyBsaW5rZWQg
aW46Cj4+Pj4gW8KgwqAgMTcuMDgzNDgxXSBDUFU6IDc5IFBJRDogMSBDb21tOiBzd2FwcGVyLzAg
VGFpbnRlZDogR8KgwqDCoMKgwqDCoMKgIFfCoMKgwqDCoMKgwqDCoMKgIDUuOS4wLXJjMi0wMDEw
NS1nNzQwZTcyY2Q2NzE3ICMxNAo+Pj4+IFvCoMKgIDE3LjA4NDk5OF0gSGFyZHdhcmUgbmFtZTog
bGludXgsZHVtbXktdmlydCAoRFQpCj4+Pj4gW8KgwqAgMTcuMDg1NzQ1XSBwc3RhdGU6IDYwNDAw
MDA1IChuWkN2IGRhaWYgK1BBTiAtVUFPIEJUWVBFPS0tKQo+Pj4+IFvCoMKgIDE3LjA4NjY0NV0g
cGMgOiBwZ3RhYmxlX3RyYW5zX2h1Z2VfZGVwb3NpdCsweDU4LzB4NjAKPj4+PiBbwqDCoCAxNy4w
ODc0NjJdIGxyIDogZGVidWdfdm1fcGd0YWJsZSsweDRkYy8weDhmMAo+Pj4+IFvCoMKgIDE3LjA4
ODE2OF0gc3AgOiBmZmZmODAwMDEyMTliY2YwCj4+Pj4gW8KgwqAgMTcuMDg4NzEwXSB4Mjk6IGZm
ZmY4MDAwMTIxOWJjZjAgeDI4OiBmZmZmODAwMDExNGFjMDAwCj4+Pj4gW8KgwqAgMTcuMDg5NTc0
XSB4Mjc6IGZmZmY4MDAwMTE0YWMwMDAgeDI2OiAwMDIwMDAwMDAwMDAwZmQzCj4+Pj4gW8KgwqAg
MTcuMDkwNDMxXSB4MjU6IDAwMjAwMDAwODE0MDBmZDMgeDI0OiBmZmZmZmUwMDE3NWMxMmMwCj4+
Pj4gW8KgwqAgMTcuMDkxMjg2XSB4MjM6IGZmZmYwMDA1ZGYwNGQxYTggeDIyOiAwMDAwZjE4ZDZl
MDM1MDAwCj4+Pj4gW8KgwqAgMTcuMDkyMTQzXSB4MjE6IGZmZmYwMDA1ZGQ3OTAwMDAgeDIwOiBm
ZmZmMDAwNWRmMThlMWE4Cj4+Pj4gW8KgwqAgMTcuMDkzMDAzXSB4MTk6IGZmZmYwMDA1ZGYwNGNi
ODAgeDE4OiAwMDAwMDAwMDAwMDAwMDE0Cj4+Pj4gW8KgwqAgMTcuMDkzODU5XSB4MTc6IDAwMDAw
MDAwYjc2NjY3ZDAgeDE2OiAwMDAwMDAwMGZkNGU2NjExCj4+Pj4gW8KgwqAgMTcuMDk0NzE2XSB4
MTU6IDAwMDAwMDAwMDAwMDAwMDEgeDE0OiAwMDAwMDAwMDAwMDAwMDAyCj4+Pj4gW8KgwqAgMTcu
MDk1NTcyXSB4MTM6IDAwMDAwMDAwMDA1NWQ5NjYgeDEyOiBmZmZmZmUwMDE3NTVlNDAwCj4+Pj4g
W8KgwqAgMTcuMDk2NDI5XSB4MTE6IDAwMDAwMDAwMDAwMDAwMDggeDEwOiBmZmZmMDAwNWZjYjZl
MjEwCj4+Pj4gW8KgwqAgMTcuMDk3MjkyXSB4OSA6IGZmZmYwMDA1ZmNiNmUyMTAgeDggOiAwMDIw
MDAwMDgxNTkwZmQzCj4+Pj4gW8KgwqAgMTcuMDk4MTQ5XSB4NyA6IGZmZmYwMDA1ZGQ3MWUwYzAg
eDYgOiBmZmZmMDAwNWRmMThlMWE4Cj4+Pj4gW8KgwqAgMTcuMDk5MDA2XSB4NSA6IDAwMjAwMDAw
ODE1OTBmZDMgeDQgOiAwMDIwMDAwMDgxNTkwZmQzCj4+Pj4gW8KgwqAgMTcuMDk5ODYyXSB4MyA6
IGZmZmYwMDA1ZGYxOGUxYTggeDIgOiBmZmZmZmUwMDE3NWMxMmMwCj4+Pj4gW8KgwqAgMTcuMTAw
NzE4XSB4MSA6IGZmZmZmZTAwMTc1YzEzMDAgeDAgOiAwMDAwMDAwMDAwMDAwMDAwCj4+Pj4gW8Kg
wqAgMTcuMTAxNTgzXSBDYWxsIHRyYWNlOgo+Pj4+IFvCoMKgIDE3LjEwMTk5M13CoCBwZ3RhYmxl
X3RyYW5zX2h1Z2VfZGVwb3NpdCsweDU4LzB4NjAKPj4+PiBbwqDCoCAxNy4xMDI3NTRdwqAgZG9f
b25lX2luaXRjYWxsKzB4NzQvMHgxY2MKPj4+PiBbwqDCoCAxNy4xMDMzODFdwqAga2VybmVsX2lu
aXRfZnJlZWFibGUrMHgxZDAvMHgyMzgKPj4+PiBbwqDCoCAxNy4xMDQwODldwqAga2VybmVsX2lu
aXQrMHgxNC8weDExOAo+Pj4+IFvCoMKgIDE3LjEwNDY1OF3CoCByZXRfZnJvbV9mb3JrKzB4MTAv
MHgzNAo+Pj4+IFvCoMKgIDE3LjEwNTI1MV0gQ29kZTogZjkwMDA0NDMgZjkwMDA4NDMgZjkwMDA4
MjIgZDY1ZjAzYzAgKGQ0MjEwMDAwKQo+Pj4+IFvCoMKgIDE3LjEwNjMwM10gLS0tWyBlbmQgdHJh
Y2UgZTYzNDcxZTAwZjhjMTQ3ZiBdLS0tCj4+Pj4KPj4+Cj4+PiBJSVVDLCB0aGlzIHNob3VsZCBo
YXBwZW4gZXZlbiB3aXRob3V0IHRoZSBzZXJpZXMgcmlnaHQ/IFRoaXMgaXMKPj4+Cj4+PiDCoMKg
wqDCoMKgYXNzZXJ0X3NwaW5fbG9ja2VkKHBtZF9sb2NrcHRyKG1tLCBwbWRwKSk7Cj4+Cj4+IENy
YXNoIGRvZXMgbm90IGhhcHBlbiB3aXRob3V0IHRoaXMgc2VyaWVzLiBBIHByZXZpb3VzIHBhdGNo
IFtQQVRDSCB2MyAwOC8xM10KPj4gYWRkZWQgcGd0YWJsZV90cmFuc19odWdlX2RlcG9zaXQvd2l0
aGRyYXcoKSBpbiBwbWRfYWR2YW5jZWRfdGVzdHMoKS4gYXJtNjQKPj4gZG9lcyBub3QgZGVmaW5l
IF9fSEFWRV9BUkNIX1BHVEFCTEVfREVQT1NJVCBhbmQgaGVuY2UgZmFsbHMgYmFjayBvbiBnZW5l
cmljCj4+IHBndGFibGVfdHJhbnNfaHVnZV9kZXBvc2l0KCkgd2hpY2ggdGhlIGFzc2VydHMgdGhl
IGxvY2suCj4+Cj4gCj4gCj4gSSBmaXhlZCB0aGF0IGJ5IG1vdmluZyB0aGUgcGd0YWJsZSBkZXBv
c2l0IGFmdGVyIGFkZGluZyB0aGUgcG1kIGxvY2tzIGNvcnJlY3RseS4KPiAKPiBtbS9kZWJ1Z192
bV9wZ3RhYmxlL2xvY2tzOiBNb3ZlIG5vbiBwYWdlIHRhYmxlIG1vZGlmeWluZyB0ZXN0IHRvZ2V0
aGVyCj4gbW0vZGVidWdfdm1fcGd0YWJsZS9sb2NrczogVGFrZSBjb3JyZWN0IHBhZ2UgdGFibGUg
bG9jawo+IG1tL2RlYnVnX3ZtX3BndGFibGUvdGhwOiBVc2UgcGFnZSB0YWJsZSBkZXBvc3Qvd2l0
aGRyYXcgd2l0aCBUSFAKClJpZ2h0LCBpdCBkb2VzIGZpeC4gQnV0IHRoZW4gYm90aCB0aG9zZSBw
YXRjaGVzIHNob3VsZCBiZSBmb2xkZWQvbWVyZ2VkIGluCm9yZGVyIHRvIHByZXNlcnZlIGdpdCBi
aXNlY3QgYWJpbGl0eSwgYmVzaWRlcyB0ZXN0IGNsYXNzaWZpY2F0aW9uIHJlYXNvbnMKYXMgbWVu
dGlvbmVkIGluIGEgcHJldmlvdXMgcmVzcG9uc2UgYW5kIGEgcG9zc2libGUgcmVkdW5kYW50IG1v
dmVtZW50IG9mCmh1Z2V0bGJfYmFzaWNfdGVzdHMoKS4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51
eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1hcmMK
