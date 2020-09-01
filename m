Return-Path: <SRS0=vI3k=CK=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD046C433E6
	for <linux-snps-arc@archiver.kernel.org>; Tue,  1 Sep 2020 07:38:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 737E4206CD
	for <linux-snps-arc@archiver.kernel.org>; Tue,  1 Sep 2020 07:38:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fUvOeC+c"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 737E4206CD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dlhEwCckslLe8v2tXYamrrIMoM6z3czIZJohVDC/lgU=; b=fUvOeC+c5VnT6umEj22+pRcMJ
	K3e5cvso7JUitddqFFMq1GRWOlndDYE+LiHR6nfM8J+scJWpQbHNU4PspAMXePBz9AmGB6pm6FIeh
	6n8zrpRL5RhACygMUMsbM1mwKKQEcusOmaqlrbjJjMeJfIzYW/wOrMWK6Ko4cxJpDAI34Ps1qF0rw
	R1FN55CRFJ37qfBrzBzwlnil8diVdfkcR3e/bPv1Yzh3mf9x7kMIzT/DSSO98r4ry3Ze0FnL6GMJT
	auGbsDqDggnOnylsjkOP9jBu2oAGi3MeVGIiz8V/wNa3upp8Y2jbBICI5a5S++vDrc9K857YsNVdV
	swUpYsMqA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kD0sU-0003ox-OY; Tue, 01 Sep 2020 07:38:50 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kD0sQ-0003nZ-U0; Tue, 01 Sep 2020 07:38:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D8F5A1FB;
 Tue,  1 Sep 2020 00:38:44 -0700 (PDT)
Received: from [10.163.69.134] (unknown [10.163.69.134])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9A3663F71F;
 Tue,  1 Sep 2020 00:38:40 -0700 (PDT)
Subject: Re: [PATCH v3 13/13] mm/debug_vm_pgtable: populate a pte entry before
 fetching it
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <20200827080438.315345-1-aneesh.kumar@linux.ibm.com>
 <20200827080438.315345-14-aneesh.kumar@linux.ibm.com>
 <edc68223-7f8a-13df-68eb-9682f585adb8@arm.com>
 <abef1791-8779-6b34-3178-3bf3ab36d42b@linux.ibm.com>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <e3140b44-993e-aa4b-130d-ee2230eff2b5@arm.com>
Date: Tue, 1 Sep 2020 13:08:08 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <abef1791-8779-6b34-3178-3bf3ab36d42b@linux.ibm.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200901_033847_074834_5DB7E723 
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

CgpPbiAwOS8wMS8yMDIwIDEyOjA3IFBNLCBBbmVlc2ggS3VtYXIgSy5WIHdyb3RlOgo+IE9uIDkv
MS8yMCA4OjU1IEFNLCBBbnNodW1hbiBLaGFuZHVhbCB3cm90ZToKPj4KPj4KPj4gT24gMDgvMjcv
MjAyMCAwMTozNCBQTSwgQW5lZXNoIEt1bWFyIEsuViB3cm90ZToKPj4+IHB0ZV9jbGVhcl90ZXN0
cyBvcGVyYXRlIG9uIGFuIGV4aXN0aW5nIHB0ZSBlbnRyeS4gTWFrZSBzdXJlIHRoYXQgaXMgbm90
IGEgbm9uZQo+Pj4gcHRlIGVudHJ5Lgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IEFuZWVzaCBLdW1h
ciBLLlYgPGFuZWVzaC5rdW1hckBsaW51eC5pYm0uY29tPgo+Pj4gLS0tCj4+PiDCoCBtbS9kZWJ1
Z192bV9wZ3RhYmxlLmMgfCA2ICsrKystLQo+Pj4gwqAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvbW0vZGVidWdfdm1f
cGd0YWJsZS5jIGIvbW0vZGVidWdfdm1fcGd0YWJsZS5jCj4+PiBpbmRleCAyMTMyOWM3ZDY3MmYu
Ljg1MjdlYmI3NWYyYyAxMDA2NDQKPj4+IC0tLSBhL21tL2RlYnVnX3ZtX3BndGFibGUuYwo+Pj4g
KysrIGIvbW0vZGVidWdfdm1fcGd0YWJsZS5jCj4+PiBAQCAtNTQ2LDcgKzU0Niw3IEBAIHN0YXRp
YyB2b2lkIF9faW5pdCBwZ2RfcG9wdWxhdGVfdGVzdHMoc3RydWN0IG1tX3N0cnVjdCAqbW0sIHBn
ZF90ICpwZ2RwLAo+Pj4gwqAgc3RhdGljIHZvaWQgX19pbml0IHB0ZV9jbGVhcl90ZXN0cyhzdHJ1
Y3QgbW1fc3RydWN0ICptbSwgcHRlX3QgKnB0ZXAsCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHVuc2lnbmVkIGxvbmcgdmFkZHIpCj4+PiDCoCB7Cj4+PiAtwqDC
oMKgIHB0ZV90IHB0ZSA9IHB0ZXBfZ2V0KHB0ZXApOwo+Pj4gK8KgwqDCoCBwdGVfdCBwdGUgPcKg
IHB0ZXBfZ2V0X2FuZF9jbGVhcihtbSwgdmFkZHIsIHB0ZXApOwo+Pgo+PiBTZWVtcyBsaWtlIHB0
ZXBfZ2V0X2FuZF9jbGVhcigpIGhlcmUganVzdCBjbGVhcnMgdGhlIGVudHJ5IGluIHByZXBhcmF0
aW9uCj4+IGZvciBhIGZvbGxvd2luZyBzZXRfcHRlX2F0KCkgd2hpY2ggb3RoZXJ3aXNlIHdvdWxk
IGhhdmUgYmVlbiBhIHByb2JsZW0gb24KPj4gcHBjNjQgYXMgeW91IGhhZCBwb2ludGVkIG91dCBl
YXJsaWVyIGkuZSBzZXRfcHRlX2F0KCkgc2hvdWxkIG5vdCB1cGRhdGUgYW4KPj4gZXhpc3Rpbmcg
dmFsaWQgZW50cnkuIFNvIHRoZSBjb21taXQgbWVzc2FnZSBoZXJlIGlzIGJpdCBtaXNsZWFkaW5n
Lgo+Pgo+IAo+IGFuZCBhbHNvIGZldGNoIHRoZSBwdGUgdmFsdWUgd2hpY2ggaXMgdXNlZCBmdXJ0
aGVyLgo+IAo+IAo+Pj4gwqAgwqDCoMKgwqDCoCBwcl9kZWJ1ZygiVmFsaWRhdGluZyBQVEUgY2xl
YXJcbiIpOwo+Pj4gwqDCoMKgwqDCoCBwdGUgPSBfX3B0ZShwdGVfdmFsKHB0ZSkgfCBSQU5ET01f
T1JWQUxVRSk7Cj4+PiBAQCAtOTQ0LDcgKzk0NCw3IEBAIHN0YXRpYyBpbnQgX19pbml0IGRlYnVn
X3ZtX3BndGFibGUodm9pZCkKPj4+IMKgwqDCoMKgwqAgcDRkX3QgKnA0ZHAsICpzYXZlZF9wNGRw
Owo+Pj4gwqDCoMKgwqDCoCBwdWRfdCAqcHVkcCwgKnNhdmVkX3B1ZHA7Cj4+PiDCoMKgwqDCoMKg
IHBtZF90ICpwbWRwLCAqc2F2ZWRfcG1kcCwgcG1kOwo+Pj4gLcKgwqDCoCBwdGVfdCAqcHRlcDsK
Pj4+ICvCoMKgwqAgcHRlX3QgKnB0ZXAsIHB0ZTsKPj4+IMKgwqDCoMKgwqAgcGd0YWJsZV90IHNh
dmVkX3B0ZXA7Cj4+PiDCoMKgwqDCoMKgIHBncHJvdF90IHByb3QsIHByb3Rub25lOwo+Pj4gwqDC
oMKgwqDCoCBwaHlzX2FkZHJfdCBwYWRkcjsKPj4+IEBAIC0xMDQ5LDYgKzEwNDksOCBAQCBzdGF0
aWMgaW50IF9faW5pdCBkZWJ1Z192bV9wZ3RhYmxlKHZvaWQpCj4+PiDCoMKgwqDCoMKgwqAgKi8K
Pj4+IMKgIMKgwqDCoMKgwqAgcHRlcCA9IHB0ZV9hbGxvY19tYXBfbG9jayhtbSwgcG1kcCwgdmFk
ZHIsICZwdGwpOwo+Pj4gK8KgwqDCoCBwdGUgPSBwZm5fcHRlKHB0ZV9hbGlnbmVkLCBwcm90KTsK
Pj4+ICvCoMKgwqAgc2V0X3B0ZV9hdChtbSwgdmFkZHIsIHB0ZXAsIHB0ZSk7Cj4+Cj4+IE5vdCBo
ZXJlLCBjcmVhdGluZyBhbmQgcG9wdWxhdGluZyBhbiBlbnRyeSBtdXN0IGJlIGRvbmUgaW4gcmVz
cGVjdGl2ZQo+PiB0ZXN0IGZ1bmN0aW9ucyBpdHNlbGYuIEJlc2lkZXMsIHRoaXMgc2VlbXMgYml0
IHJlZHVuZGFudCBhcyB3ZWxsLiBUaGUKPj4gdGVzdCBwdGVfY2xlYXJfdGVzdHMoKSB3aXRoIHRo
ZSBhYm92ZSBjaGFuZ2UgYWRkZWQsIGFscmVhZHkKPj4KPj4gLSBDbGVhcnMgdGhlIFBURVAgZW50
cnkgd2l0aCBwdGVwX2dldF9hbmRfY2xlYXIoKQo+IAo+IGFuZCBmZXRjaCB0aGUgb2xkIHZhbHVl
IHNldCBwcmV2aW91c2x5LgoKSW4gdGhhdCBjYXNlLCBwbGVhc2UgbW92ZSBhYm92ZSB0d28gbGlu
ZXMgaS5lCgpwdGUgPSBwZm5fcHRlKHB0ZV9hbGlnbmVkLCBwcm90KTsKc2V0X3B0ZV9hdChtbSwg
dmFkZHIsIHB0ZXAsIHB0ZSk7Cgpmcm9tIGRlYnVnX3ZtX3BndGFibGUoKSB0byBwdGVfY2xlYXJf
dGVzdHMoKSBhbmQgdXBkYXRlIGl0J3MgYXJndW1lbnRzCmFzIHJlcXVpcmVkLgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtc25wcy1hcmMgbWFp
bGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBzLWFyYwo=
