Return-Path: <SRS0=vI3k=CK=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2F9EC433E6
	for <linux-snps-arc@archiver.kernel.org>; Tue,  1 Sep 2020 07:46:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 877DB2068E
	for <linux-snps-arc@archiver.kernel.org>; Tue,  1 Sep 2020 07:46:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bHUrLhgm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 877DB2068E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+YhzrZnJG3wfMVZfoCK3Sc8+TvRormRBnCs+n9UB430=; b=bHUrLhgmHPB0eqrgbe2JJL8SV
	epey4PJ/PLf82hwKKaCjQ2xN0Ma6r2M/yzLg4EKYesvUYaF3R0QbTn72DO3f6acCMiZB33r4S3r1I
	nLhFNoKBtjitmXIpW+ZImvxpWU0XNzx6KKmGMokx8kYZNAQnUvXoDjZl+8DO5rmY5nYuOmY3c2d6A
	+XVd/KDlNqmwe0n5YxUMFLhtgSanUzeJD9OM7X9bDmD8QA18ZzcPpmxkNlRcM3HLBO/gyNMkNORRd
	qrEOddwVh76MwWmHzMHMFZgYklio3BOpqWBoEInFugOvmvu9AXXqv0AuSfSshpeY+kLr5/03hk9Tq
	fcgE3KYeQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kD10E-0005Wq-Qp; Tue, 01 Sep 2020 07:46:50 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kD10A-0005VN-Bk; Tue, 01 Sep 2020 07:46:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A67F51FB;
 Tue,  1 Sep 2020 00:46:41 -0700 (PDT)
Received: from [10.163.69.134] (unknown [10.163.69.134])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 587ED3F71F;
 Tue,  1 Sep 2020 00:46:37 -0700 (PDT)
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
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <c371e316-7533-62c7-a1c6-9b6745d8d1ea@arm.com>
Date: Tue, 1 Sep 2020 13:16:05 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <e5d32d12-d904-ed8c-8963-d43d2c3744d9@linux.ibm.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200901_034646_493661_DECF73B4 
X-CRM114-Status: GOOD (  18.05  )
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

CgpPbiAwOS8wMS8yMDIwIDAxOjA2IFBNLCBBbmVlc2ggS3VtYXIgSy5WIHdyb3RlOgo+IE9uIDkv
MS8yMCAxOjAyIFBNLCBBbnNodW1hbiBLaGFuZHVhbCB3cm90ZToKPj4KPj4KPj4gT24gMDkvMDEv
MjAyMCAxMTo1MSBBTSwgQW5lZXNoIEt1bWFyIEsuViB3cm90ZToKPj4+IE9uIDkvMS8yMCA4OjQ1
IEFNLCBBbnNodW1hbiBLaGFuZHVhbCB3cm90ZToKPj4+Pgo+Pj4+Cj4+Pj4gT24gMDgvMjcvMjAy
MCAwMTozNCBQTSwgQW5lZXNoIEt1bWFyIEsuViB3cm90ZToKPj4+Pj4gcHBjNjQgdXNlIGJpdCA2
MiB0byBpbmRpY2F0ZSBhIHB0ZSBlbnRyeSAoX1BBR0VfUFRFKS4gQXZvaWQgc2V0dGluZyB0aGF0
IGJpdCBpbgo+Pj4+PiByYW5kb20gdmFsdWUuCj4+Pj4+Cj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEFu
ZWVzaCBLdW1hciBLLlYgPGFuZWVzaC5rdW1hckBsaW51eC5pYm0uY29tPgo+Pj4+PiAtLS0KPj4+
Pj4gwqDCoCBtbS9kZWJ1Z192bV9wZ3RhYmxlLmMgfCAxMyArKysrKysrKysrLS0tCj4+Pj4+IMKg
wqAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4+Pj4+
Cj4+Pj4+IGRpZmYgLS1naXQgYS9tbS9kZWJ1Z192bV9wZ3RhYmxlLmMgYi9tbS9kZWJ1Z192bV9w
Z3RhYmxlLmMKPj4+Pj4gaW5kZXggMDg2MzA5ZmI5YjZmLi5iYmY5ZGYwZTY0YzYgMTAwNjQ0Cj4+
Pj4+IC0tLSBhL21tL2RlYnVnX3ZtX3BndGFibGUuYwo+Pj4+PiArKysgYi9tbS9kZWJ1Z192bV9w
Z3RhYmxlLmMKPj4+Pj4gQEAgLTQ0LDEwICs0NCwxNyBAQAo+Pj4+PiDCoMKgwqAgKiBlbnRyeSB0
eXBlLiBCdXQgdGhlc2UgYml0cyBtaWdodCBhZmZlY3QgdGhlIGFiaWxpdHkgdG8gY2xlYXIgZW50
cmllcyB3aXRoCj4+Pj4+IMKgwqDCoCAqIHB4eF9jbGVhcigpIGJlY2F1c2Ugb2YgaG93IGR5bmFt
aWMgcGFnZSB0YWJsZSBmb2xkaW5nIHdvcmtzIG9uIHMzOTAuIFNvCj4+Pj4+IMKgwqDCoCAqIHdo
aWxlIGxvYWRpbmcgdXAgdGhlIGVudHJpZXMgZG8gbm90IGNoYW5nZSB0aGUgbG93ZXIgNCBiaXRz
LiBJdCBkb2VzIG5vdAo+Pj4+PiAtICogaGF2ZSBhZmZlY3QgYW55IG90aGVyIHBsYXRmb3JtLgo+
Pj4+PiArICogaGF2ZSBhZmZlY3QgYW55IG90aGVyIHBsYXRmb3JtLiBBbHNvIGF2b2lkIHRoZSA2
Mm5kIGJpdCBvbiBwcGM2NCB0aGF0IGlzCj4+Pj4+ICsgKiB1c2VkIHRvIG1hcmsgYSBwdGUgZW50
cnkuCj4+Pj4+IMKgwqDCoCAqLwo+Pj4+PiAtI2RlZmluZSBTMzkwX01BU0tfQklUU8KgwqDCoCA0
Cj4+Pj4+IC0jZGVmaW5lIFJBTkRPTV9PUlZBTFVFwqDCoMKgIEdFTk1BU0soQklUU19QRVJfTE9O
RyAtIDEsIFMzOTBfTUFTS19CSVRTKQo+Pj4+PiArI2RlZmluZSBTMzkwX1NLSVBfTUFTS8KgwqDC
oMKgwqDCoMKgIEdFTk1BU0soMywgMCkKPj4+Pj4gKyNpZmRlZiBDT05GSUdfUFBDX0JPT0szU182
NAo+Pj4+PiArI2RlZmluZSBQUEM2NF9TS0lQX01BU0vCoMKgwqDCoMKgwqDCoCBHRU5NQVNLKDYy
LCA2MikKPj4+Pj4gKyNlbHNlCj4+Pj4+ICsjZGVmaW5lIFBQQzY0X1NLSVBfTUFTS8KgwqDCoMKg
wqDCoMKgIDB4MAo+Pj4+PiArI2VuZGlmCj4+Pj4KPj4+PiBQbGVhc2UgZHJvcCB0aGUgI2lmZGVm
IENPTkZJR19QUENfQk9PSzNTXzY0IGhlcmUuIFdlIGFscmVhZHkgYWNjb21tb2RhdGUgc2tpcAo+
Pj4+IGJpdHMgZm9yIGEgczM5MCBwbGF0Zm9ybSByZXF1aXJlbWVudCBhbmQgY2FuIGFsc28gZG8g
c28gZm9yIHBwYzY0IGFzIHdlbGwuIEFzCj4+Pj4gbWVudGlvbmVkIGJlZm9yZSwgcGxlYXNlIGF2
b2lkIGFkZGluZyBhbnkgcGxhdGZvcm0gc3BlY2lmaWMgY29uc3RydWN0cyBpbiB0aGUKPj4+PiB0
ZXN0Lgo+Pj4+Cj4+Pgo+Pj4KPj4+IHRoYXQgaXMgbmVlZGVkIHNvIHRoYXQgaXQgY2FuIGJlIGJ1
aWx0IG9uIDMyIGJpdCBhcmNoaXRlY3R1cmVzLkkgZGlkIGZhY2UgYnVpbGQgZXJyb3JzIHdpdGgg
YXJjaC1saW51eAo+Pgo+PiBDb3VsZCBub3QgKCNpZiBfX0JJVFNfUEVSX0xPTkcgPT0gMzIpIGJl
IHVzZWQgaW5zdGVhZCBvciBzb21ldGhpbmcgbGlrZQo+PiB0aGF0LiBCdXQgc2hvdWxkIGJlIGEg
Z2VuZXJpYyBjb25kaXRpb25hbCBjaGVjayBpZGVudGlmeWluZyAzMiBiaXQgYXJjaAo+PiBub3Qg
YW55dGhpbmcgcGxhdGZvcm0gc3BlY2lmaWMuCj4+Cj4gCj4gdGhhdCBfUEFHRV9QVEUgYml0IGlz
IHByZXR0eSBtdWNoIHNwZWNpZmljIHRvIFBQQyBCT09LM1NfNjQuwqAgTm90IHN1cmUgd2h5IG90
aGVyIGFyY2hpdGVjdHVyZXMgbmVlZCB0byBib3RoZXJlZCBhYm91dCBpZ25vcmluZyBiaXQgNjIu
CgpUaGF0cyBva2F5IGFzIGxvbmcgaXQgZG9lcyBub3QgYWR2ZXJzZWx5IGFmZmVjdCBvdGhlciBh
cmNoaXRlY3R1cmVzLCBpZ25vcmluZwpzb21lIG1vcmUgYml0cyBpcyBhY2NlcHRhYmxlLiBMaWtl
IGV4aXN0aW5nIFMzOTBfTUFTS19CSVRTIGdldHMgaWdub3JlZCBvbiBhbGwKb3RoZXIgcGxhdGZv
cm1zIGV2ZW4gaWYgaXQgaXMgYSBzMzkwIHNwZWNpZmljIGNvbnN0cmFpbnQuIE5vdCBoYXZpbmcg
cGxhdGZvcm0Kc3BlY2lmaWMgI2lmZGVmIGhlcmUsIGlzIGVzc2VudGlhbC4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxp
bmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1hcmMK
