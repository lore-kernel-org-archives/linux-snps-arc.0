Return-Path: <SRS0=YOVA=CL=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 353E1C433E6
	for <linux-snps-arc@archiver.kernel.org>; Wed,  2 Sep 2020 03:50:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00ABC206EB
	for <linux-snps-arc@archiver.kernel.org>; Wed,  2 Sep 2020 03:50:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dPqdabGH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 00ABC206EB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	To:Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3MJOPmRRI+CgN/7JZ5VzbKe8idoVkj4oAot045uSOno=; b=dPqdabGHqK69wCawJ0d8cMHGx
	HPqlw6bQA5shhmF6KNJt2V0cKc3fU4N5bKeDkIfXYiKChO/FhhZa+BIlKx7RFg5tZ+Zo+a0VlyF65
	cuCd26WIvEM3rskzGnssVR6NC36xkEdQu2U5g++kFYN2dPy7F3OO+Xr0U0s1H+zq92bf3jhw6x0h4
	iXZDnTKIBGF/CZsixv9PV2EcuX0DAJ3zIof6ZmmmcW3Js3MereovGeJAft9Orbkf9IauwqCfKgoTt
	QLgnGHGxDM/6cF6LVux1Hefav1o8Z4zMx08mQxAIfmmj7TDUqYK2AYuiEA4Fw/hC2hxGlNLSOndwz
	c+g2zsNRg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDJmq-0000TN-91; Wed, 02 Sep 2020 03:50:16 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDJml-0000Rd-Gq; Wed, 02 Sep 2020 03:50:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 033D3D6E;
 Tue,  1 Sep 2020 20:50:10 -0700 (PDT)
Received: from [192.168.0.130] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 200CE3F66F;
 Tue,  1 Sep 2020 20:50:04 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH v3 13/13] mm/debug_vm_pgtable: populate a pte entry before
 fetching it
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <20200827080438.315345-1-aneesh.kumar@linux.ibm.com>
 <20200827080438.315345-14-aneesh.kumar@linux.ibm.com>
 <edc68223-7f8a-13df-68eb-9682f585adb8@arm.com>
 <abef1791-8779-6b34-3178-3bf3ab36d42b@linux.ibm.com>
 <e3140b44-993e-aa4b-130d-ee2230eff2b5@arm.com>
 <7ef7c302-e7e6-570e-3100-5dd1bf9551be@linux.ibm.com>
Message-ID: <4ba15b8f-ac90-17ec-9b95-0451e2a38e98@arm.com>
Date: Wed, 2 Sep 2020 09:19:28 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <7ef7c302-e7e6-570e-3100-5dd1bf9551be@linux.ibm.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200901_235011_782144_4F56C512 
X-CRM114-Status: GOOD (  21.45  )
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

CgpPbiAwOS8wMS8yMDIwIDAzOjI4IFBNLCBBbmVlc2ggS3VtYXIgSy5WIHdyb3RlOgo+IE9uIDkv
MS8yMCAxOjA4IFBNLCBBbnNodW1hbiBLaGFuZHVhbCB3cm90ZToKPj4KPj4KPj4gT24gMDkvMDEv
MjAyMCAxMjowNyBQTSwgQW5lZXNoIEt1bWFyIEsuViB3cm90ZToKPj4+IE9uIDkvMS8yMCA4OjU1
IEFNLCBBbnNodW1hbiBLaGFuZHVhbCB3cm90ZToKPj4+Pgo+Pj4+Cj4+Pj4gT24gMDgvMjcvMjAy
MCAwMTozNCBQTSwgQW5lZXNoIEt1bWFyIEsuViB3cm90ZToKPj4+Pj4gcHRlX2NsZWFyX3Rlc3Rz
IG9wZXJhdGUgb24gYW4gZXhpc3RpbmcgcHRlIGVudHJ5LiBNYWtlIHN1cmUgdGhhdCBpcyBub3Qg
YSBub25lCj4+Pj4+IHB0ZSBlbnRyeS4KPj4+Pj4KPj4+Pj4gU2lnbmVkLW9mZi1ieTogQW5lZXNo
IEt1bWFyIEsuViA8YW5lZXNoLmt1bWFyQGxpbnV4LmlibS5jb20+Cj4+Pj4+IC0tLQo+Pj4+PiDC
oMKgIG1tL2RlYnVnX3ZtX3BndGFibGUuYyB8IDYgKysrKy0tCj4+Pj4+IMKgwqAgMSBmaWxlIGNo
YW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPj4+Pj4KPj4+Pj4gZGlmZiAt
LWdpdCBhL21tL2RlYnVnX3ZtX3BndGFibGUuYyBiL21tL2RlYnVnX3ZtX3BndGFibGUuYwo+Pj4+
PiBpbmRleCAyMTMyOWM3ZDY3MmYuLjg1MjdlYmI3NWYyYyAxMDA2NDQKPj4+Pj4gLS0tIGEvbW0v
ZGVidWdfdm1fcGd0YWJsZS5jCj4+Pj4+ICsrKyBiL21tL2RlYnVnX3ZtX3BndGFibGUuYwo+Pj4+
PiBAQCAtNTQ2LDcgKzU0Niw3IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBwZ2RfcG9wdWxhdGVfdGVz
dHMoc3RydWN0IG1tX3N0cnVjdCAqbW0sIHBnZF90ICpwZ2RwLAo+Pj4+PiDCoMKgIHN0YXRpYyB2
b2lkIF9faW5pdCBwdGVfY2xlYXJfdGVzdHMoc3RydWN0IG1tX3N0cnVjdCAqbW0sIHB0ZV90ICpw
dGVwLAo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdW5z
aWduZWQgbG9uZyB2YWRkcikKPj4+Pj4gwqDCoCB7Cj4+Pj4+IC3CoMKgwqAgcHRlX3QgcHRlID0g
cHRlcF9nZXQocHRlcCk7Cj4+Pj4+ICvCoMKgwqAgcHRlX3QgcHRlID3CoCBwdGVwX2dldF9hbmRf
Y2xlYXIobW0sIHZhZGRyLCBwdGVwKTsKPj4+Pgo+Pj4+IFNlZW1zIGxpa2UgcHRlcF9nZXRfYW5k
X2NsZWFyKCkgaGVyZSBqdXN0IGNsZWFycyB0aGUgZW50cnkgaW4gcHJlcGFyYXRpb24KPj4+PiBm
b3IgYSBmb2xsb3dpbmcgc2V0X3B0ZV9hdCgpIHdoaWNoIG90aGVyd2lzZSB3b3VsZCBoYXZlIGJl
ZW4gYSBwcm9ibGVtIG9uCj4+Pj4gcHBjNjQgYXMgeW91IGhhZCBwb2ludGVkIG91dCBlYXJsaWVy
IGkuZSBzZXRfcHRlX2F0KCkgc2hvdWxkIG5vdCB1cGRhdGUgYW4KPj4+PiBleGlzdGluZyB2YWxp
ZCBlbnRyeS4gU28gdGhlIGNvbW1pdCBtZXNzYWdlIGhlcmUgaXMgYml0IG1pc2xlYWRpbmcuCj4+
Pj4KPj4+Cj4+PiBhbmQgYWxzbyBmZXRjaCB0aGUgcHRlIHZhbHVlIHdoaWNoIGlzIHVzZWQgZnVy
dGhlci4KPj4+Cj4+Pgo+Pj4+PiDCoMKgIMKgwqDCoMKgwqAgcHJfZGVidWcoIlZhbGlkYXRpbmcg
UFRFIGNsZWFyXG4iKTsKPj4+Pj4gwqDCoMKgwqDCoMKgIHB0ZSA9IF9fcHRlKHB0ZV92YWwocHRl
KSB8IFJBTkRPTV9PUlZBTFVFKTsKPj4+Pj4gQEAgLTk0NCw3ICs5NDQsNyBAQCBzdGF0aWMgaW50
IF9faW5pdCBkZWJ1Z192bV9wZ3RhYmxlKHZvaWQpCj4+Pj4+IMKgwqDCoMKgwqDCoCBwNGRfdCAq
cDRkcCwgKnNhdmVkX3A0ZHA7Cj4+Pj4+IMKgwqDCoMKgwqDCoCBwdWRfdCAqcHVkcCwgKnNhdmVk
X3B1ZHA7Cj4+Pj4+IMKgwqDCoMKgwqDCoCBwbWRfdCAqcG1kcCwgKnNhdmVkX3BtZHAsIHBtZDsK
Pj4+Pj4gLcKgwqDCoCBwdGVfdCAqcHRlcDsKPj4+Pj4gK8KgwqDCoCBwdGVfdCAqcHRlcCwgcHRl
Owo+Pj4+PiDCoMKgwqDCoMKgwqAgcGd0YWJsZV90IHNhdmVkX3B0ZXA7Cj4+Pj4+IMKgwqDCoMKg
wqDCoCBwZ3Byb3RfdCBwcm90LCBwcm90bm9uZTsKPj4+Pj4gwqDCoMKgwqDCoMKgIHBoeXNfYWRk
cl90IHBhZGRyOwo+Pj4+PiBAQCAtMTA0OSw2ICsxMDQ5LDggQEAgc3RhdGljIGludCBfX2luaXQg
ZGVidWdfdm1fcGd0YWJsZSh2b2lkKQo+Pj4+PiDCoMKgwqDCoMKgwqDCoCAqLwo+Pj4+PiDCoMKg
IMKgwqDCoMKgwqAgcHRlcCA9IHB0ZV9hbGxvY19tYXBfbG9jayhtbSwgcG1kcCwgdmFkZHIsICZw
dGwpOwo+Pj4+PiArwqDCoMKgIHB0ZSA9IHBmbl9wdGUocHRlX2FsaWduZWQsIHByb3QpOwo+Pj4+
PiArwqDCoMKgIHNldF9wdGVfYXQobW0sIHZhZGRyLCBwdGVwLCBwdGUpOwo+Pj4+Cj4+Pj4gTm90
IGhlcmUsIGNyZWF0aW5nIGFuZCBwb3B1bGF0aW5nIGFuIGVudHJ5IG11c3QgYmUgZG9uZSBpbiBy
ZXNwZWN0aXZlCj4+Pj4gdGVzdCBmdW5jdGlvbnMgaXRzZWxmLiBCZXNpZGVzLCB0aGlzIHNlZW1z
IGJpdCByZWR1bmRhbnQgYXMgd2VsbC4gVGhlCj4+Pj4gdGVzdCBwdGVfY2xlYXJfdGVzdHMoKSB3
aXRoIHRoZSBhYm92ZSBjaGFuZ2UgYWRkZWQsIGFscmVhZHkKPj4+Pgo+Pj4+IC0gQ2xlYXJzIHRo
ZSBQVEVQIGVudHJ5IHdpdGggcHRlcF9nZXRfYW5kX2NsZWFyKCkKPj4+Cj4+PiBhbmQgZmV0Y2gg
dGhlIG9sZCB2YWx1ZSBzZXQgcHJldmlvdXNseS4KPj4KPj4gSW4gdGhhdCBjYXNlLCBwbGVhc2Ug
bW92ZSBhYm92ZSB0d28gbGluZXMgaS5lCj4+Cj4+IHB0ZSA9IHBmbl9wdGUocHRlX2FsaWduZWQs
IHByb3QpOwo+PiBzZXRfcHRlX2F0KG1tLCB2YWRkciwgcHRlcCwgcHRlKTsKPj4KPj4gZnJvbSBk
ZWJ1Z192bV9wZ3RhYmxlKCkgdG8gcHRlX2NsZWFyX3Rlc3RzKCkgYW5kIHVwZGF0ZSBpdCdzIGFy
Z3VtZW50cwo+PiBhcyByZXF1aXJlZC4KPj4KPiAKPiBGcmFua2x5LCBJIGRvbid0IHVuZGVyc3Rh
bmQgd2hhdCB0aGVzZSB0ZXN0cyBhcmUgdGVzdGluZy4gSXQgYWxsIGxvb2tzIGxpa2Ugc29tZSBy
YW5kb20gY2xlYXIgYW5kIHNldC4KClRoZSBpZGVhIGhlcmUgaXMgdG8gaGF2ZSBzb21lIHZhbHVl
IHdpdGggc29tZSByYW5kb21uZXNzIHByZWZlcmFibHksIGluCmEgZ2l2ZW4gUFRFUCBiZWZvcmUg
YXR0ZW1wdGluZyB0byBjbGVhciB0aGUgZW50cnksIGluIG9yZGVyIHRvIG1ha2Ugc3VyZQp0aGF0
IHB0ZV9jbGVhcigpIGlzIGluZGVlZCBjbGVhcmluZyBzb21ldGhpbmcgb2Ygbm9uLXplcm8gdmFs
dWUuCgo+IAo+IHN0YXRpYyB2b2lkIF9faW5pdCBwdGVfY2xlYXJfdGVzdHMoc3RydWN0IG1tX3N0
cnVjdCAqbW0sIHB0ZV90ICpwdGVwLAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB1bnNpZ25lZCBsb25nIHZhZGRyLCB1bnNpZ25lZCBsb25nIHBmbiwKPiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcGdwcm90X3QgcHJvdCkKPiB7Cj4gCj4gwqDCoMKg
wqBwdGVfdCBwdGUgPSBwZm5fcHRlKHBmbiwgcHJvdCk7Cj4gwqDCoMKgwqBzZXRfcHRlX2F0KG1t
LCB2YWRkciwgcHRlcCwgcHRlKTsKPiAKPiDCoMKgwqDCoHB0ZSA9wqAgcHRlcF9nZXRfYW5kX2Ns
ZWFyKG1tLCB2YWRkciwgcHRlcCk7CgpMb29raW5nIGF0IHRoaXMgYWdhaW4sIHRoaXMgcHJlY2Vk
aW5nIHBmbl9wdGUoKSBmb2xsb3dlZCBieSBzZXRfcHRlX2F0KCkKaXMgbm90IHJlYWxseSByZXF1
aXJlZC4gSXRzIHJlYXNvbmFibGUgdG8gc3RhcnQgd2l0aCB3aGF0IGV2ZXIgd2FzIHRoZXJlCmlu
IHRoZSBQVEVQIGFzIGEgc2VlZCB2YWx1ZSB3aGljaCBhbnl3YXkgZ2V0cyBhZGRlZCB3aXRoIFJB
TkRPTV9PUlZBTFVFLgpzL3B0ZXBfZ2V0L3B0ZXBfZ2V0X2FuZF9jbGVhciBpcyBzdWZmaWNpZW50
IHRvIHRha2UgY2FyZSBvZiB0aGUgcG93ZXJwYwpzZXRfcHRlX2F0KCkgY29uc3RyYWludC4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXNucHMt
YXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1hcmMK
