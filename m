Return-Path: <SRS0=vI3k=CK=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38F00C433E7
	for <linux-snps-arc@archiver.kernel.org>; Tue,  1 Sep 2020 07:32:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF23921534
	for <linux-snps-arc@archiver.kernel.org>; Tue,  1 Sep 2020 07:32:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jK/lQ7fi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF23921534
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	To:Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GgXamLBCoO93dCLS5jC2PvtJensyrqZi7NXQg5fJWJ0=; b=jK/lQ7fi+vRY28DiloYFdATDQ
	aRq/rurx8ZZN4zkIK2DnZJbplFvKDuxAx2gW7qnfo2ruAEXviznm1loaPgfGIVGpqMIIzCBwuLAZO
	CodOHSXgkS4QydM5mDH5K0ddVp1PEgmc0matvDcxhwA/XlAi6pt7OHsNfjK94Gf6WBGzQXsIBU+Aa
	VUcfbvUejPQsc1XFvIj0/UsZKOGqLG0FHnyi3GFaB6cPj+WJVf9jLEoVwskfZWdNMsxsnUzbMiWuB
	k+hl9M8TjziJj59yoC+ZhtaZyeFjV5SotJTbf52cdvcPZnhiRyhir+cp7Zo76s5xfwdsf71r9F2sw
	aI8eG76VQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kD0mf-000338-8R; Tue, 01 Sep 2020 07:32:49 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kD0ma-0002z8-8Y; Tue, 01 Sep 2020 07:32:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8002A1FB;
 Tue,  1 Sep 2020 00:32:41 -0700 (PDT)
Received: from [10.163.69.134] (unknown [10.163.69.134])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3DFC33F71F;
 Tue,  1 Sep 2020 00:32:36 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH v3 03/13] mm/debug_vm_pgtable/ppc64: Avoid setting top
 bits in radom value
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <20200827080438.315345-1-aneesh.kumar@linux.ibm.com>
 <20200827080438.315345-4-aneesh.kumar@linux.ibm.com>
 <3a0b0101-e6ec-26c5-e104-5b0bb95c3e51@arm.com>
 <1a8abe92-032b-f60f-1df1-52bb409b35a3@linux.ibm.com>
Message-ID: <75771782-734b-69f6-4a07-2d3542458319@arm.com>
Date: Tue, 1 Sep 2020 13:02:04 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1a8abe92-032b-f60f-1df1-52bb409b35a3@linux.ibm.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200901_033244_368526_DCAB7AB3 
X-CRM114-Status: GOOD (  16.58  )
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

CgpPbiAwOS8wMS8yMDIwIDExOjUxIEFNLCBBbmVlc2ggS3VtYXIgSy5WIHdyb3RlOgo+IE9uIDkv
MS8yMCA4OjQ1IEFNLCBBbnNodW1hbiBLaGFuZHVhbCB3cm90ZToKPj4KPj4KPj4gT24gMDgvMjcv
MjAyMCAwMTozNCBQTSwgQW5lZXNoIEt1bWFyIEsuViB3cm90ZToKPj4+IHBwYzY0IHVzZSBiaXQg
NjIgdG8gaW5kaWNhdGUgYSBwdGUgZW50cnkgKF9QQUdFX1BURSkuIEF2b2lkIHNldHRpbmcgdGhh
dCBiaXQgaW4KPj4+IHJhbmRvbSB2YWx1ZS4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBBbmVlc2gg
S3VtYXIgSy5WIDxhbmVlc2gua3VtYXJAbGludXguaWJtLmNvbT4KPj4+IC0tLQo+Pj4gwqAgbW0v
ZGVidWdfdm1fcGd0YWJsZS5jIHwgMTMgKysrKysrKysrKy0tLQo+Pj4gwqAgMSBmaWxlIGNoYW5n
ZWQsIDEwIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBh
L21tL2RlYnVnX3ZtX3BndGFibGUuYyBiL21tL2RlYnVnX3ZtX3BndGFibGUuYwo+Pj4gaW5kZXgg
MDg2MzA5ZmI5YjZmLi5iYmY5ZGYwZTY0YzYgMTAwNjQ0Cj4+PiAtLS0gYS9tbS9kZWJ1Z192bV9w
Z3RhYmxlLmMKPj4+ICsrKyBiL21tL2RlYnVnX3ZtX3BndGFibGUuYwo+Pj4gQEAgLTQ0LDEwICs0
NCwxNyBAQAo+Pj4gwqDCoCAqIGVudHJ5IHR5cGUuIEJ1dCB0aGVzZSBiaXRzIG1pZ2h0IGFmZmVj
dCB0aGUgYWJpbGl0eSB0byBjbGVhciBlbnRyaWVzIHdpdGgKPj4+IMKgwqAgKiBweHhfY2xlYXIo
KSBiZWNhdXNlIG9mIGhvdyBkeW5hbWljIHBhZ2UgdGFibGUgZm9sZGluZyB3b3JrcyBvbiBzMzkw
LiBTbwo+Pj4gwqDCoCAqIHdoaWxlIGxvYWRpbmcgdXAgdGhlIGVudHJpZXMgZG8gbm90IGNoYW5n
ZSB0aGUgbG93ZXIgNCBiaXRzLiBJdCBkb2VzIG5vdAo+Pj4gLSAqIGhhdmUgYWZmZWN0IGFueSBv
dGhlciBwbGF0Zm9ybS4KPj4+ICsgKiBoYXZlIGFmZmVjdCBhbnkgb3RoZXIgcGxhdGZvcm0uIEFs
c28gYXZvaWQgdGhlIDYybmQgYml0IG9uIHBwYzY0IHRoYXQgaXMKPj4+ICsgKiB1c2VkIHRvIG1h
cmsgYSBwdGUgZW50cnkuCj4+PiDCoMKgICovCj4+PiAtI2RlZmluZSBTMzkwX01BU0tfQklUU8Kg
wqDCoCA0Cj4+PiAtI2RlZmluZSBSQU5ET01fT1JWQUxVRcKgwqDCoCBHRU5NQVNLKEJJVFNfUEVS
X0xPTkcgLSAxLCBTMzkwX01BU0tfQklUUykKPj4+ICsjZGVmaW5lIFMzOTBfU0tJUF9NQVNLwqDC
oMKgwqDCoMKgwqAgR0VOTUFTSygzLCAwKQo+Pj4gKyNpZmRlZiBDT05GSUdfUFBDX0JPT0szU182
NAo+Pj4gKyNkZWZpbmUgUFBDNjRfU0tJUF9NQVNLwqDCoMKgwqDCoMKgwqAgR0VOTUFTSyg2Miwg
NjIpCj4+PiArI2Vsc2UKPj4+ICsjZGVmaW5lIFBQQzY0X1NLSVBfTUFTS8KgwqDCoMKgwqDCoMKg
IDB4MAo+Pj4gKyNlbmRpZgo+Pgo+PiBQbGVhc2UgZHJvcCB0aGUgI2lmZGVmIENPTkZJR19QUENf
Qk9PSzNTXzY0IGhlcmUuIFdlIGFscmVhZHkgYWNjb21tb2RhdGUgc2tpcAo+PiBiaXRzIGZvciBh
IHMzOTAgcGxhdGZvcm0gcmVxdWlyZW1lbnQgYW5kIGNhbiBhbHNvIGRvIHNvIGZvciBwcGM2NCBh
cyB3ZWxsLiBBcwo+PiBtZW50aW9uZWQgYmVmb3JlLCBwbGVhc2UgYXZvaWQgYWRkaW5nIGFueSBw
bGF0Zm9ybSBzcGVjaWZpYyBjb25zdHJ1Y3RzIGluIHRoZQo+PiB0ZXN0Lgo+Pgo+IAo+IAo+IHRo
YXQgaXMgbmVlZGVkIHNvIHRoYXQgaXQgY2FuIGJlIGJ1aWx0IG9uIDMyIGJpdCBhcmNoaXRlY3R1
cmVzLkkgZGlkIGZhY2UgYnVpbGQgZXJyb3JzIHdpdGggYXJjaC1saW51eAoKQ291bGQgbm90ICgj
aWYgX19CSVRTX1BFUl9MT05HID09IDMyKSBiZSB1c2VkIGluc3RlYWQgb3Igc29tZXRoaW5nIGxp
a2UKdGhhdC4gQnV0IHNob3VsZCBiZSBhIGdlbmVyaWMgY29uZGl0aW9uYWwgY2hlY2sgaWRlbnRp
ZnlpbmcgMzIgYml0IGFyY2gKbm90IGFueXRoaW5nIHBsYXRmb3JtIHNwZWNpZmljLgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtc25wcy1hcmMg
bWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBzLWFyYwo=
