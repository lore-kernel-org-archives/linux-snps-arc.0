Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7025BC98318
	for <linux-snps-arc@archiver.kernel.org>; Thu, 24 Sep 2026 21:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AtkONB7By6QcfRTCK81uVS4/wON++6r0uEd65UhoQAc=; b=QwBp/6q3o9FYNp
	aFOj+Zy3UVn3B9L/KjCXBuD2N+LkfgaJXeOSD1+S/W1RC+xK5sud5LIOKYJobQ1beTOp+m3K6bQop
	n5t8ciBQrd1zLSrgMvfYM0ud0zA9AKLKWH56uMfOI4P7EQeV7v4Va7jCrUsQmn6iTbs936njiXoD6
	bsVIrqFkNfuiXRtLhHrScQdDRhVsQp2+JosSpBRb429VhJPR+eniL3DfMH4iX11xJvcJZiGpmAXSe
	AD2SEddzrNnBlq/dkRmH+Y8PXVARur1+AnQS9nr1gkDB+46EURyVFKeCUNw3/WHRhzNpEH+ntWBPC
	mhrzbPkFsP51JmabFMmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9qyW-0000000CDaY-06LO;
	Thu, 24 Sep 2026 21:27:28 +0000
Received: from out-48.mta0.migadu.com ([2001:41d0:1004:224b::30] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9qyT-0000000CDZz-1rmw
	for linux-snps-arc@lists.infradead.org;
	Thu, 24 Sep 2026 21:27:27 +0000
X-Envelope-To: linux-snps-arc@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=J0Nw9TWXU+lYkeRoVC9OVQhSfSX6DIvUl0Vxf3ijfro=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790285238; v=1; x=1790890038;
 b=r8bfV5wR/SgiankkGzMof3sOcjX1VDl3QL37mmoP6dBrNDpbbbcJUXavC/KV9KILv87GJaqC
 8J+QmFJIQIGrVm6AhzoNjGEIy/YMH/lvJTAJ9UTbaVO1zmt+MwjQNKT+eoBtbC7gGpMAkgcAbg1
 +45Qi4LCShHkCVniqZI38pxg=
X-Envelope-To: linux-snps-arc@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 3a331c7e9b5d616d;
	Thu, 24 Sep 2026 21:27:18 +0000
X-Mizu-Trace-ID: 3a331c7e9b5d616d
X-Migadu-Flow: FLOW_OUT
Message-ID: <d7a78ebb-8b5e-42e9-9560-bd731724c9f8@linux.dev>
Date: Thu, 24 Sep 2026 14:27:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [paulmckrcu:cmpxchg2.2026.09.22a 25/28]
 arch/arc/include/asm/cmpxchg.h:46:58: error: pointer type mismatch in
 conditional expression
To: Bradley Morgan <brads@mainlining.org>, Vineet Gupta <vgupta@kernel.org>,
 kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-snps-arc@lists.infradead.org,
 "Paul E. McKenney" <paulmck@kernel.org>
References: <202609241517.SSV1Goz3-lkp@intel.com>
 <3cbe5de8-d04b-4afe-b19f-ad755d4ea320@kernel.org>
 <7CB37192-1AE6-4392-8D7B-89F401214C02@mainlining.org>
Content-Language: en-US
From: Vineet Gupta <vineet.gupta@linux.dev>
In-Reply-To: <7CB37192-1AE6-4392-8D7B-89F401214C02@mainlining.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_142725_641835_EB2E1086 
X-CRM114-Status: GOOD (  13.74  )
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

T24gOS8yNC8yNiAxMzo1OCwgQnJhZGxleSBNb3JnYW4gd3JvdGU6Cj4gT24gMjQgU2VwdGVtYmVy
IDIwMjYgMjE6NTI6NTUgQlNULCBWaW5lZXQgR3VwdGEgPHZndXB0YUBrZXJuZWwub3JnPiB3cm90
ZToKPj4gT24gOS8yNC8yNiAwMDo1MSwga2VybmVsIHRlc3Qgcm9ib3Qgd3JvdGU6Cj4+PiB0cmVl
OiAgIGh0dHBzOi8vZ2l0aHViLmNvbS9wYXVsbWNrcmN1L2xpbnV4IGNtcHhjaGcyLjIwMjYuMDku
MjJhCj4+PiBoZWFkOiAgIDU0YzI4MmMxNTQ3NWViZmFlNDcxMmZlM2FiNjM3YzlkMTljNzIzZDYK
Pj4+IGNvbW1pdDogYjZkNGY2YWYzOGY4NWU3OTQ4ZmQ2NGY5YmYwOWNiYjg1OGI0ZGFkZSBbMjUv
MjhdIEFSQzogRW11bGF0ZQo+PiB0d28tYnl0ZSBjbXB4Y2hnCj4+PiBjb25maWc6IGFyYy1hbGx5
ZXNjb25maWcKPj4gKGh0dHBzOi8vZG93bmxvYWQuMDEub3JnLzBkYXktY2kvYXJjaGl2ZS8yMDI2
MDkyNC8yMDI2MDkyNDE1MTcuU1NWMUdvejMtbGtwQGludGVsLmNvbS9jb25maWcpCj4+PiBjb21w
aWxlcjogYXJjLWxpbnV4LWdjYyAoR0NDKSAxNi4xLjAKPj4+IHJlcHJvZHVjZSAodGhpcyBpcyBh
IFc9MSBidWlsZCk6Cj4+IChodHRwczovL2Rvd25sb2FkLjAxLm9yZy8wZGF5LWNpL2FyY2hpdmUv
MjAyNjA5MjQvMjAyNjA5MjQxNTE3LlNTVjFHb3ozLWxrcEBpbnRlbC5jb20vcmVwcm9kdWNlKQo+
Pj4gSWYgeW91IGZpeCB0aGUgaXNzdWUgaW4gYSBzZXBhcmF0ZSBwYXRjaC9jb21taXQgKGkuZS4g
bm90IGp1c3QgYSBuZXcKPj4gdmVyc2lvbiBvZgo+Pj4gdGhlIHNhbWUgcGF0Y2gvY29tbWl0KSwg
a2luZGx5IGFkZCBmb2xsb3dpbmcgdGFncwo+Pj4gfCBSZXBvcnRlZC1ieToga2VybmVsIHRlc3Qg
cm9ib3QgPGxrcEBpbnRlbC5jb20+Cj4+PiB8IENsb3NlczoKPj4gaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvb2Uta2J1aWxkLWFsbC8yMDI2MDkyNDE1MTcuU1NWMUdvejMtbGtwQGludGVsLmNvbS8K
Pj4+IEFsbCBlcnJvcnMgKG5ldyBvbmVzIHByZWZpeGVkIGJ5ID4+KToKPj4+Cj4+PiAgICAgIElu
IGZpbGUgaW5jbHVkZWQgZnJvbSBhcmNoL2FyYy9pbmNsdWRlL2FzbS9hdG9taWMuaDoxMywKPj4+
ICAgICAgICAgICAgICAgICAgICAgICBmcm9tIGluY2x1ZGUvbGludXgvYXRvbWljLmg6NywKPj4+
ICAgICAgICAgICAgICAgICAgICAgICBmcm9tIGluY2x1ZGUvYXNtLWdlbmVyaWMvYml0b3BzL2xv
Y2suaDo1LAo+Pj4gICAgICAgICAgICAgICAgICAgICAgIGZyb20gYXJjaC9hcmMvaW5jbHVkZS9h
c20vYml0b3BzLmg6MTkwLAo+Pj4gICAgICAgICAgICAgICAgICAgICAgIGZyb20gaW5jbHVkZS9s
aW51eC9iaXRvcHMuaDo2NywKPj4+ICAgICAgICAgICAgICAgICAgICAgICBmcm9tIGluY2x1ZGUv
bGludXgvbG9nMi5oOjEyLAo+Pj4gICAgICAgICAgICAgICAgICAgICAgIGZyb20gaW5jbHVkZS9h
c20tZ2VuZXJpYy9kaXY2NC5oOjU1LAo+Pj4gICAgICAgICAgICAgICAgICAgICAgIGZyb20gLi9h
cmNoL2FyYy9pbmNsdWRlL2dlbmVyYXRlZC9hc20vZGl2NjQuaDoxLAo+Pj4gICAgICAgICAgICAg
ICAgICAgICAgIGZyb20gaW5jbHVkZS9saW51eC9tYXRoLmg6NiwKPj4+ICAgICAgICAgICAgICAg
ICAgICAgICBmcm9tIGluY2x1ZGUvbGludXgvbWF0aDY0Lmg6NiwKPj4+ICAgICAgICAgICAgICAg
ICAgICAgICBmcm9tIGluY2x1ZGUvbGludXgvdGltZS5oOjYsCj4+PiAgICAgICAgICAgICAgICAg
ICAgICAgZnJvbSBpbmNsdWRlL2xpbnV4L3N0YXQuaDoxOSwKPj4+ICAgICAgICAgICAgICAgICAg
ICAgICBmcm9tIGluY2x1ZGUvbGludXgvZnNfZGlyZW50Lmg6NSwKPj4+ICAgICAgICAgICAgICAg
ICAgICAgICBmcm9tIGluY2x1ZGUvbGludXgvZnMvc3VwZXJfdHlwZXMuaDo1LAo+Pj4gICAgICAg
ICAgICAgICAgICAgICAgIGZyb20gaW5jbHVkZS9saW51eC9mcy9zdXBlci5oOjUsCj4+PiAgICAg
ICAgICAgICAgICAgICAgICAgZnJvbSBpbmNsdWRlL2xpbnV4L2ZzLmg6NSwKPj4+ICAgICAgICAg
ICAgICAgICAgICAgICBmcm9tIGluY2x1ZGUvbGludXgvZnNjcnlwdC5oOjE2LAo+Pj4gICAgICAg
ICAgICAgICAgICAgICAgIGZyb20gZnMvY3J5cHRvL2ZzY3J5cHRfcHJpdmF0ZS5oOjE1LAo+Pj4g
ICAgICAgICAgICAgICAgICAgICAgIGZyb20gZnMvY3J5cHRvL2hvb2tzLmM6MTA6Cj4+PiAgICAg
IGZzL2NyeXB0by9ob29rcy5jOiBJbiBmdW5jdGlvbiAnZnNjcnlwdF9nZXRfc3ltbGluayc6Cj4+
Pj4+IGFyY2gvYXJjL2luY2x1ZGUvYXNtL2NtcHhjaGcuaDo0Njo1ODogZXJyb3I6IHBvaW50ZXIg
dHlwZSBtaXNtYXRjaCBpbgo+PiBjb25kaXRpb25hbCBleHByZXNzaW9uIFstV2luY29tcGF0aWJs
ZS1wb2ludGVyLXR5cGVzXQo+Pj4gICAgICAgICA0NiB8ICAgICAgICAgdW5zaWduZWQgbG9uZyBf
bmV3XyA9ICh1bnNpZ25lZCBsb25nKSgwID8gKihfcF8pIDoKPj4gKG5ldykpOyAgICAgICAgICAg
ICAgXAo+Pgo+PiBJc3N1ZSBpcyBpbsKgIGZzL2NyeXB0by9ob29rcy5jIGRvaW5nIGNtcHhjaGdf
cmVsZWFzZSgmaW5vZGUtPmlfbGluaywgTlVMTCwKPj4gcHN0ci5uYW1lKQo+PiB3aGVyZSBpX2xp
bmsgaXMgY2hhciAqIGFuZCBwc3RyLm5hbWUgaXMgdW5zaWduZWQgY2hhciAqKSwKPj4KPj4gVGhl
IHByb2JsZW0gaXMgd2hlbiBwb2ludGVyIHR5cGVzIGFyZSBpbmNvbXBhdGlibGUgYW5kIHRoYXQn
cyBleGFjdGx5IHRoZQo+PiBXIHRvZ2dsZSBhYm92ZS4KPj4KPj4gU28gQnJhZGxleSdzIHBhdGNo
IG5lZWRzIHRoaXMgZml4dXAKPj4KPj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJjL2luY2x1ZGUvYXNt
L2NtcHhjaGcuaCBiL2FyY2gvYXJjL2luY2x1ZGUvYXNtL2NtcHhjaGcuaAo+PiBpbmRleCA0NTk2
ZWRmZWZhOTUuLjkwNTMwOThiYjE1MiAxMDA2NDQKPj4gLS0tIGEvYXJjaC9hcmMvaW5jbHVkZS9h
c20vY21weGNoZy5oCj4+ICsrKyBiL2FyY2gvYXJjL2luY2x1ZGUvYXNtL2NtcHhjaGcuaAo+PiBA
QCAtNDIsOCArNDIsMTAgQEAKPj4gIMKgI2RlZmluZSBhcmNoX2NtcHhjaGdfcmVsYXhlZChwdHIs
IG9sZCwgbmV3KSDCoCDCoCBcCj4+ICDCoCh7IMKgIMKgXAo+PiAgwqAgwqAgwqAgwqAgX190eXBl
b2ZfXyhwdHIpIF9wXyA9IChwdHIpOyDCoCDCoCBcCj4+IC3CoCDCoCDCoCDCoHVuc2lnbmVkIGxv
bmcgX29sZF8gPSAodW5zaWduZWQgbG9uZykoMCA/ICooX3BfKSA6IChvbGQpKTsgwqAgwqAgwqAg
wqAgwqAgwqAgXAo+PiAtwqAgwqAgwqAgwqB1bnNpZ25lZCBsb25nIF9uZXdfID0gKHVuc2lnbmVk
IGxvbmcpKDAgPyAqKF9wXykgOiAobmV3KSk7IMKgIMKgIMKgIMKgIMKgIMKgIFwKPj4gK8KgIMKg
IMKgIMKgX190eXBlb2ZfXygqKHB0cikpIF9vXyA9IChvbGQpOyDCoCDCoFwKPj4gK8KgIMKgIMKg
IMKgX190eXBlb2ZfXygqKHB0cikpIF9uXyA9IChuZXcpOyDCoCDCoFwKPj4gK8KgIMKgIMKgIMKg
dW5zaWduZWQgbG9uZyBfb2xkXyA9ICh1bnNpZ25lZCBsb25nKV9vXzsgwqAgwqAgwqAgwqAgwqAg
wqBcCj4+ICvCoCDCoCDCoCDCoHVuc2lnbmVkIGxvbmcgX25ld18gPSAodW5zaWduZWQgbG9uZylf
bl87IMKgIMKgIMKgIMKgIMKgIMKgXAo+Pgo+PiBQLlM6IEZvciBhcmNoIGNoYW5nZXMgc2hvdWxk
bid0IHRoZSBzdWJtaXR0ZXIgYmUgcmVxdWlyZWQgdG8gYXQgbGVhc3QgdGVzdAo+PiB0aGUgYnVp
bGRpbmcsIHNwZWNpYWxseSB3aGVuIHRoaXMgaW52b2x2ZXMgdGhlIG1hY3JvIG1hemUuIEl0cyBy
ZWFsbHkgZWFzeQo+PiB3aXRoIGNyb3NzdG9vbCBob3N0aW5nIGFsbCB0aGUgY3Jvc3MtY29tcGls
ZXJzIFsxXSAtIGp1c3QgZG93bmxvYWQgYW5kCj4+IHVudGFyLgo+Pgo+PiBbMV0KPj4gaHR0cHM6
Ly9taXJyb3JzLmVkZ2Uua2VybmVsLm9yZy9wdWIvdG9vbHMvY3Jvc3N0b29sL2ZpbGVzL2Jpbi94
ODZfNjQvMTYuMi4wLwo+IFdlbGwgdGhhbmtzIGJ1dCBJIGRpZG4ndCBoYXZlIGEgcHJvcGVyIHNl
cnZlciB0aWxsIHllc3RlcmRheS4KCkEgcmVsYXRpdmVseSBkZWNlbnQgbGFwdG9wIHdvcmtzIGZv
ciBtZS4KCj4gSSdsbCBwb3N0IGFsbCBhcmNoIHBhdGNoZXMgd2hlbiBQYXVsIHRlbGxzIG1lIGhv
dyBoZSB3YW50cyBpdAoKUGxlYXNlIGRvIGEgbWluaW1hbCBjb21waWxlIGJ1aWxkIC0gaXQgd2ls
bCBzYXZlIHlvdSB0aGUgcmUtc3BpbnMuCgo+IExpa2UgaWYgaGUgd2FudHMgdTE2IGluIGZpcnN0
IHRoZW4gYXJjaCBjaGFuZ2VzIHNlbnQuCgpTdXJlICEKCkNoZWVycywKLVZpbmVldAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtc25wcy1hcmMg
bWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBzLWFyYwo=
