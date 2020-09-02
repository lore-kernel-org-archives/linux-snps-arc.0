Return-Path: <SRS0=YOVA=CL=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A404DC433E6
	for <linux-snps-arc@archiver.kernel.org>; Wed,  2 Sep 2020 03:46:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E479206EB
	for <linux-snps-arc@archiver.kernel.org>; Wed,  2 Sep 2020 03:46:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vOV2gXKb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E479206EB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	To:Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gYkZT4CueXiMik3CdDn5uZJfeeItkN1kAlC+vXFqZZ8=; b=vOV2gXKb/tvMaGkX1FmiWP0hR
	Yq8RchO3KwSu9OzRVPlPm+/MNT6Eohu7sgl+I1rmH1W6OiJwgN6qRD/iRv2XOnsAGeT2J8PYj+W+D
	ShAZGGXGVA5/2dcI6SWTYHjxoT+xl2bBCiGxTqqhzvtAnZDiKPvkUuVHjXPN1syRmZgX9QQPDlySF
	fPwNpNZ90aCs9nDwywaKYAU4GYOEtLgEmgINOUBYgphQEfBal/EIUXHHk8UPyLQcJiccHenYML0b/
	OefegYX55QPqjuTPiCVIM/P4N+QFqTtFf6H6NcI+FOYzhGeWpdmduYi5oeypJKKNPA5ys6EIRPN8V
	BFVIS9ufw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDJiq-0008K6-L8; Wed, 02 Sep 2020 03:46:08 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDJik-0008Ie-L1; Wed, 02 Sep 2020 03:46:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 370CDD6E;
 Tue,  1 Sep 2020 20:45:59 -0700 (PDT)
Received: from [192.168.0.130] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 382A73F66F;
 Tue,  1 Sep 2020 20:45:54 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH v3 03/13] mm/debug_vm_pgtable/ppc64: Avoid setting top
 bits in radom value
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <20200827080438.315345-1-aneesh.kumar@linux.ibm.com>
 <20200827080438.315345-4-aneesh.kumar@linux.ibm.com>
 <3a0b0101-e6ec-26c5-e104-5b0bb95c3e51@arm.com>
 <1a8abe92-032b-f60f-1df1-52bb409b35a3@linux.ibm.com>
 <75771782-734b-69f6-4a07-2d3542458319@arm.com>
 <e5d32d12-d904-ed8c-8963-d43d2c3744d9@linux.ibm.com>
 <c371e316-7533-62c7-a1c6-9b6745d8d1ea@arm.com>
 <3f20130a-f9fc-db9d-50a9-76aca5a1a6d7@linux.ibm.com>
Message-ID: <2f6f2e26-5c77-d9cb-667c-0f7d35923e31@arm.com>
Date: Wed, 2 Sep 2020 09:15:12 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <3f20130a-f9fc-db9d-50a9-76aca5a1a6d7@linux.ibm.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200901_234602_798159_7671E8AC 
X-CRM114-Status: GOOD (  18.62  )
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

CgpPbiAwOS8wMS8yMDIwIDAxOjI1IFBNLCBBbmVlc2ggS3VtYXIgSy5WIHdyb3RlOgo+IE9uIDkv
MS8yMCAxOjE2IFBNLCBBbnNodW1hbiBLaGFuZHVhbCB3cm90ZToKPj4KPj4KPj4gT24gMDkvMDEv
MjAyMCAwMTowNiBQTSwgQW5lZXNoIEt1bWFyIEsuViB3cm90ZToKPj4+IE9uIDkvMS8yMCAxOjAy
IFBNLCBBbnNodW1hbiBLaGFuZHVhbCB3cm90ZToKPj4+Pgo+Pj4+Cj4+Pj4gT24gMDkvMDEvMjAy
MCAxMTo1MSBBTSwgQW5lZXNoIEt1bWFyIEsuViB3cm90ZToKPj4+Pj4gT24gOS8xLzIwIDg6NDUg
QU0sIEFuc2h1bWFuIEtoYW5kdWFsIHdyb3RlOgo+Pj4+Pj4KPj4+Pj4+Cj4+Pj4+PiBPbiAwOC8y
Ny8yMDIwIDAxOjM0IFBNLCBBbmVlc2ggS3VtYXIgSy5WIHdyb3RlOgo+Pj4+Pj4+IHBwYzY0IHVz
ZSBiaXQgNjIgdG8gaW5kaWNhdGUgYSBwdGUgZW50cnkgKF9QQUdFX1BURSkuIEF2b2lkIHNldHRp
bmcgdGhhdCBiaXQgaW4KPj4+Pj4+PiByYW5kb20gdmFsdWUuCj4+Pj4+Pj4KPj4+Pj4+PiBTaWdu
ZWQtb2ZmLWJ5OiBBbmVlc2ggS3VtYXIgSy5WIDxhbmVlc2gua3VtYXJAbGludXguaWJtLmNvbT4K
Pj4+Pj4+PiAtLS0KPj4+Pj4+PiDCoMKgwqAgbW0vZGVidWdfdm1fcGd0YWJsZS5jIHwgMTMgKysr
KysrKysrKy0tLQo+Pj4+Pj4+IMKgwqDCoCAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygr
KSwgMyBkZWxldGlvbnMoLSkKPj4+Pj4+Pgo+Pj4+Pj4+IGRpZmYgLS1naXQgYS9tbS9kZWJ1Z192
bV9wZ3RhYmxlLmMgYi9tbS9kZWJ1Z192bV9wZ3RhYmxlLmMKPj4+Pj4+PiBpbmRleCAwODYzMDlm
YjliNmYuLmJiZjlkZjBlNjRjNiAxMDA2NDQKPj4+Pj4+PiAtLS0gYS9tbS9kZWJ1Z192bV9wZ3Rh
YmxlLmMKPj4+Pj4+PiArKysgYi9tbS9kZWJ1Z192bV9wZ3RhYmxlLmMKPj4+Pj4+PiBAQCAtNDQs
MTAgKzQ0LDE3IEBACj4+Pj4+Pj4gwqDCoMKgwqAgKiBlbnRyeSB0eXBlLiBCdXQgdGhlc2UgYml0
cyBtaWdodCBhZmZlY3QgdGhlIGFiaWxpdHkgdG8gY2xlYXIgZW50cmllcyB3aXRoCj4+Pj4+Pj4g
wqDCoMKgwqAgKiBweHhfY2xlYXIoKSBiZWNhdXNlIG9mIGhvdyBkeW5hbWljIHBhZ2UgdGFibGUg
Zm9sZGluZyB3b3JrcyBvbiBzMzkwLiBTbwo+Pj4+Pj4+IMKgwqDCoMKgICogd2hpbGUgbG9hZGlu
ZyB1cCB0aGUgZW50cmllcyBkbyBub3QgY2hhbmdlIHRoZSBsb3dlciA0IGJpdHMuIEl0IGRvZXMg
bm90Cj4+Pj4+Pj4gLSAqIGhhdmUgYWZmZWN0IGFueSBvdGhlciBwbGF0Zm9ybS4KPj4+Pj4+PiAr
ICogaGF2ZSBhZmZlY3QgYW55IG90aGVyIHBsYXRmb3JtLiBBbHNvIGF2b2lkIHRoZSA2Mm5kIGJp
dCBvbiBwcGM2NCB0aGF0IGlzCj4+Pj4+Pj4gKyAqIHVzZWQgdG8gbWFyayBhIHB0ZSBlbnRyeS4K
Pj4+Pj4+PiDCoMKgwqDCoCAqLwo+Pj4+Pj4+IC0jZGVmaW5lIFMzOTBfTUFTS19CSVRTwqDCoMKg
IDQKPj4+Pj4+PiAtI2RlZmluZSBSQU5ET01fT1JWQUxVRcKgwqDCoCBHRU5NQVNLKEJJVFNfUEVS
X0xPTkcgLSAxLCBTMzkwX01BU0tfQklUUykKPj4+Pj4+PiArI2RlZmluZSBTMzkwX1NLSVBfTUFT
S8KgwqDCoMKgwqDCoMKgIEdFTk1BU0soMywgMCkKPj4+Pj4+PiArI2lmZGVmIENPTkZJR19QUENf
Qk9PSzNTXzY0Cj4+Pj4+Pj4gKyNkZWZpbmUgUFBDNjRfU0tJUF9NQVNLwqDCoMKgwqDCoMKgwqAg
R0VOTUFTSyg2MiwgNjIpCj4+Pj4+Pj4gKyNlbHNlCj4+Pj4+Pj4gKyNkZWZpbmUgUFBDNjRfU0tJ
UF9NQVNLwqDCoMKgwqDCoMKgwqAgMHgwCj4+Pj4+Pj4gKyNlbmRpZgo+Pj4+Pj4KPj4+Pj4+IFBs
ZWFzZSBkcm9wIHRoZSAjaWZkZWYgQ09ORklHX1BQQ19CT09LM1NfNjQgaGVyZS4gV2UgYWxyZWFk
eSBhY2NvbW1vZGF0ZSBza2lwCj4+Pj4+PiBiaXRzIGZvciBhIHMzOTAgcGxhdGZvcm0gcmVxdWly
ZW1lbnQgYW5kIGNhbiBhbHNvIGRvIHNvIGZvciBwcGM2NCBhcyB3ZWxsLiBBcwo+Pj4+Pj4gbWVu
dGlvbmVkIGJlZm9yZSwgcGxlYXNlIGF2b2lkIGFkZGluZyBhbnkgcGxhdGZvcm0gc3BlY2lmaWMg
Y29uc3RydWN0cyBpbiB0aGUKPj4+Pj4+IHRlc3QuCj4+Pj4+Pgo+Pj4+Pgo+Pj4+Pgo+Pj4+PiB0
aGF0IGlzIG5lZWRlZCBzbyB0aGF0IGl0IGNhbiBiZSBidWlsdCBvbiAzMiBiaXQgYXJjaGl0ZWN0
dXJlcy5JIGRpZCBmYWNlIGJ1aWxkIGVycm9ycyB3aXRoIGFyY2gtbGludXgKPj4+Pgo+Pj4+IENv
dWxkIG5vdCAoI2lmIF9fQklUU19QRVJfTE9ORyA9PSAzMikgYmUgdXNlZCBpbnN0ZWFkIG9yIHNv
bWV0aGluZyBsaWtlCj4+Pj4gdGhhdC4gQnV0IHNob3VsZCBiZSBhIGdlbmVyaWMgY29uZGl0aW9u
YWwgY2hlY2sgaWRlbnRpZnlpbmcgMzIgYml0IGFyY2gKPj4+PiBub3QgYW55dGhpbmcgcGxhdGZv
cm0gc3BlY2lmaWMuCj4+Pj4KPj4+Cj4+PiB0aGF0IF9QQUdFX1BURSBiaXQgaXMgcHJldHR5IG11
Y2ggc3BlY2lmaWMgdG8gUFBDIEJPT0szU182NC7CoCBOb3Qgc3VyZSB3aHkgb3RoZXIgYXJjaGl0
ZWN0dXJlcyBuZWVkIHRvIGJvdGhlcmVkIGFib3V0IGlnbm9yaW5nIGJpdCA2Mi4KPj4KPj4gVGhh
dHMgb2theSBhcyBsb25nIGl0IGRvZXMgbm90IGFkdmVyc2VseSBhZmZlY3Qgb3RoZXIgYXJjaGl0
ZWN0dXJlcywgaWdub3JpbmcKPj4gc29tZSBtb3JlIGJpdHMgaXMgYWNjZXB0YWJsZS4gTGlrZSBl
eGlzdGluZyBTMzkwX01BU0tfQklUUyBnZXRzIGlnbm9yZWQgb24gYWxsCj4+IG90aGVyIHBsYXRm
b3JtcyBldmVuIGlmIGl0IGlzIGEgczM5MCBzcGVjaWZpYyBjb25zdHJhaW50LiBOb3QgaGF2aW5n
IHBsYXRmb3JtCj4+IHNwZWNpZmljICNpZmRlZiBoZXJlLCBpcyBlc3NlbnRpYWwuCj4+Cj4gCj4g
V2h5IGlzIGl0IGVzc2VudGlhbD8KSUlSQywgSSBtaWdodCBoYXZlIGFscmVhZHkgcmVwbGllZCBv
biB0aGlzIGNvdXBsZSBvZiB0aW1lcy4gQnV0IGxldCBtZSB0cnkgb25jZSBtb3JlLgpJdCBpcyBh
IGdlbmVyaWMgdGVzdCBhaW1lZCBhdCBmaW5kaW5nIGluY29uc2lzdGVuY2llcyBiZXR3ZWVuIGRp
ZmZlcmVudCBhcmNoaXRlY3R1cmVzCmluIHRlcm1zIG9mIHRoZSBwYWdlIHRhYmxlIGhlbHBlciBz
ZW1hbnRpY3MuIEFueSBwbGF0Zm9ybSBzcGVjaWZpYyBjb25zdHJ1Y3QgaGVyZSwgdG8KJ21ha2Ug
dGhpbmdzIHdvcmsnIGhhcyB0aGUgcG90ZW50aWFsIHRvIGhpZGUgc3VjaCBpbmNvbnNpc3RlbmNp
ZXMgYW5kIGRlZmVhdCB0aGUgdmVyeQpwdXJwb3NlLiBUaGUgdGVzdC9maWxlIGhlcmUgZm9sbG93
cyB0aGlzIHJ1bGUgY29uc2lzdGVudGx5IGkuZSB0aGVyZSBpcyBub3QgYSBzaW5nbGUKcGxhdGZv
cm0gc3BlY2lmaWMgI2lmZGVmIHJpZ2h0IG5vdyBhbmQgd291bGQgcmVhbGx5IGxpa2UgdG8gY29u
dGludWUgbWFpbnRhaW5pbmcgdGhpcwpwcm9wZXJ0eSwgdW5sZXNzIHVudGlsIGFic29sdXRlbHkg
bmVjZXNzYXJ5LiBDdXJyZW50IHNpdHVhdGlvbiBoZXJlIHdydCAzMiBiaXQgYXJjaHMKY2FuIGVh
c2lseSBiZSBhY2NvbW1vZGF0ZWQgd2l0aCBhIGdlbmVyaWMgY2hlY2sgc3VjaCBhcyBfX0JJVFNf
UEVSX0xPTkcuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXNucHMtYXJjCg==
