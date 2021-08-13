Return-Path: <SRS0=Hn5+=NE=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61A49C4320A
	for <linux-snps-arc@archiver.kernel.org>; Fri, 13 Aug 2021 19:44:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 204A0610F7
	for <linux-snps-arc@archiver.kernel.org>; Fri, 13 Aug 2021 19:44:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 204A0610F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RfGz0CULaPhIDsUgTImAFQrjgXyXZjeeEZo+UdIclM4=; b=A/oGNkMtYQ2HWjQV1M2f3Lml1V
	3GpzFJRVa9+xrUnYNCaVtlD8ZWpHVksfE4BsLd5hhLixPKd3CiWzuRRlC6n9hYvgVZzbytg+XMZgi
	jvL8r+wrDXH2IX3f7RDH4eCrl4Aug02+49Yb6Y8P43+OCBKfNYW89IW//1Ku1GFmdDCqsn9k+lx0K
	gu3yFpqJCAJpF4NisXhrXWp/bmAHPJ3T+Tk/dd+qU/4MG3DJqxWBi7TJBYd5RpxMIzZVg5QkOFS8r
	7wgROPgSQinWKYULV6q/Xvnsi+JTzBc76QEAQoUrDZNy9ROTeX0uVIlANGnHCsmw1a9KfTXAgj+yl
	Wv4zuaBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEd5z-00DUzE-KP; Fri, 13 Aug 2021 19:43:59 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEd5x-00DUyT-E6
 for linux-snps-arc@lists.infradead.org; Fri, 13 Aug 2021 19:43:59 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5501260F21;
 Fri, 13 Aug 2021 19:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628883836;
 bh=2hyViBfwHWSQ5FVPojFdRsY2lrOVaSM1RPUsZNslGHQ=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=eH6ijDVTmCJEio8xYt1IYxbLhwyyqK/c56JFiqRI7pUlkpH4Q2o1xaMTKdcwHHWS8
 ZDdAABt/RgQb46p7RsfgG2hGUbrm23LjhIRXUFs23ogtZK06CndzUgx02/WfVF0bfo
 v+uXFhYI118O4LZ/m8gqpZ69vUCnac66PjsiItOc5IPexHpVS0EbxGl3B3PRxz0nru
 3p8QSNQd6CWUnTrMFbYJDrSBVU73FBGgritnex+lBgxapsg2DoH14TFFqIc9jLo2m+
 LaFy+3q4uRBZehB4A+ZU0WBbfhliAOscw6MLxoxGVtTt4C/jc+04lJfH5G7iEznWCv
 j3lEpgheHWKig==
Subject: Re: [PATCH v6 00/12] mm/debug_vm_pgtable: Enhancements
To: Gavin Shan <gshan@redhat.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, gerald.schaefer@linux.ibm.com,
 aneesh.kumar@linux.ibm.com, christophe.leroy@csgroup.eu, cai@lca.pw,
 catalin.marinas@arm.com, will@kernel.org, akpm@linux-foundation.org,
 chuhu@redhat.com, shan.gavin@gmail.com,
 arcml <linux-snps-arc@lists.infradead.org>
References: <20210809092631.1888748-1-gshan@redhat.com>
 <b066aea5-6b3e-193a-01d0-32b52d5ac513@arm.com>
 <d96fa0d8-98d8-c924-99f7-bb9673fc2a13@redhat.com>
From: Vineet Gupta <vgupta@kernel.org>
Message-ID: <25018384-acc5-dcf7-5125-378499ab4555@kernel.org>
Date: Fri, 13 Aug 2021 12:43:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <d96fa0d8-98d8-c924-99f7-bb9673fc2a13@redhat.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210813_124357_552670_8E0FE64B 
X-CRM114-Status: GOOD (  17.82  )
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

T24gOC8xMy8yMSAyOjI1IEFNLCBHYXZpbiBTaGFuIHdyb3RlOgo+IEhpIEFuc2h1bWFuIGFuZCBW
aW5lZXQsCj4KPiBPbiA4LzEyLzIxIDk6MTEgUE0sIEFuc2h1bWFuIEtoYW5kdWFsIHdyb3RlOgo+
PiBPbiA4LzkvMjEgMjo1NiBQTSwgR2F2aW4gU2hhbiB3cm90ZToKPj4+IFRoZXJlIGFyZSBjb3Vw
bGUgb2YgaXNzdWVzIHdpdGggY3VycmVudCBpbXBsZW1lbnRhdGlvbnMgYW5kIHRoaXMgc2VyaWVz
Cj4+PiB0cmllcyB0byByZXNvbHZlIHRoZSBpc3N1ZXM6Cj4+Pgo+Pj4gwqDCoCAoYSkgQWxsIG5l
ZWRlZCBpbmZvcm1hdGlvbiBhcmUgc2NhdHRlcmVkIGluIHZhcmlhYmxlcywgcGFzc2VkIHRvIAo+
Pj4gdmFyaW91cwo+Pj4gwqDCoMKgwqDCoMKgIHRlc3QgZnVuY3Rpb25zLiBUaGUgY29kZSBpcyBv
cmdhbml6ZWQgaW4gcHJldHR5IG11Y2ggcmVsYXhlZCAKPj4+IGZhc2hpb24uCj4+Pgo+Pj4gwqDC
oCAoYikgVGhlIHBhZ2UgaXNuJ3QgYWxsb2NhdGVkIGZyb20gYnVkZHkgZHVyaW5nIHBhZ2UgdGFi
bGUgZW50cnkgCj4+PiBtb2RpZnlpbmcKPj4+IMKgwqDCoMKgwqDCoCB0ZXN0cy4gVGhlIHBhZ2Ug
Y2FuIGJlIGludmFsaWQsIGNvbmZsaWN0aW5nIHRvIHRoZSAKPj4+IGltcGxlbWVudGF0aW9ucwo+
Pj4gwqDCoMKgwqDCoMKgIG9mIHNldF94eHhfYXQoKSBvbiBBUk02NC4gVGhlIHRhcmdldCBwYWdl
IGlzIGFjY2Vzc2VkIHNvIHRoYXQgCj4+PiB0aGUKPj4+IMKgwqDCoMKgwqDCoCBpQ2FjaGUgY2Fu
IGJlIGZsdXNoZWQgd2hlbiBleGVjdXRpb24gcGVybWlzc2lvbiBpcyBnaXZlbiBvbiAKPj4+IEFS
TTY0Lgo+Pj4gwqDCoMKgwqDCoMKgIEJlc2lkZXMsIHRoZSB0YXJnZXQgcGFnZSBjYW4gYmUgdW5t
YXBwZWQgYW5kIGFjY2Vzc2luZyB0byBpdCAKPj4+IGNhdXNlcwo+Pj4gwqDCoMKgwqDCoMKgIGtl
cm5lbCBjcmFzaC4KPj4+Cj4+PiAic3RydWN0IHBndGFibGVfZGVidWdfYXJncyIgaXMgaW50cm9k
dWNlZCB0byBhZGRyZXNzIGlzc3VlIChhKS4gRm9yIAo+Pj4gaXNzdWUKPj4+IChiKSwgdGhlIHVz
ZWQgcGFnZSBpcyBhbGxvY2F0ZWQgZnJvbSBidWRkeSBpbiBwYWdlIHRhYmxlIGVudHJ5IAo+Pj4g
bW9kaWZ5aW5nCj4+PiB0ZXN0cy4gVGhlIGNvcnJlc3BvbmRpbmcgdGV0cyB3aWxsIGJlIHNraXBw
ZWQgaWYgd2UgZmFpbCB0byBhbGxvY2F0ZSAKPj4+IHRoZQo+Pj4gKGh1Z2UpIHBhZ2UuIEZvciBv
dGhlciB0ZXN0IGNhc2VzLCB0aGUgb3JpZ2luYWwgcGFnZSBhcm91bmQgdG8ga2VybmVsCj4+PiBz
eW1ib2wgKEBzdGFydF9rZXJuZWwpIGlzIHN0aWxsIHVzZWQuCj4+Pgo+Pj4gVGhlIHBhdGNoZXMg
YXJlIG9yZ2FuaXplZCBhcyBiZWxvdy4gUEFUQ0hbMi0xMF0gY291bGQgYmUgY29tYmluZWQgdG8g
Cj4+PiBvbmUKPj4+IHBhdGNoLCBidXQgaXQgd2lsbCBtYWtlIHRoZSByZXZpZXcgaGFyZGVyOgo+
Pj4KPj4+IMKgwqAgUEFUQ0hbMV0gaW50cm9kdWNlcyAic3RydWN0IHBndGFibGVfZGVidWdfYXJn
cyIgYXMgcGxhY2UgaG9sZGVyIAo+Pj4gb2YgYWxsCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IG5lZWRlZCBpbmZvcm1hdGlvbi4gV2l0aCBpdCwgdGhlIG9sZCBhbmQgbmV3IGltcGxlbWVudGF0
aW9uCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNhbiBjb2V4aXN0Lgo+Pj4gwqDCoCBQQVRD
SFsyLTEwXSB1c2VzICJzdHJ1Y3QgcGd0YWJsZV9kZWJ1Z19hcmdzIiBpbiB2YXJpb3VzIHRlc3Qg
Cj4+PiBmdW5jdGlvbnMuCj4+PiDCoMKgIFBBVENIWzExXSByZW1vdmVzIHRoZSB1bnVzZWQgY29k
ZSBmb3Igb2xkIGltcGxlbWVudGF0aW9uLgo+Pj4gwqDCoCBQQVRDSFsxMl0gZml4ZXMgdGhlIGlz
c3VlIG9mIGNvcnJ1cHRlZCBwYWdlIGZsYWcgZm9yIEFSTTY0Cj4+Pgo+Pj4gQ2hhbmdlbG9nCj4+
PiA9PT09PT09PT0KPj4+IHY2Ogo+Pj4gwqDCoMKgICogUG9wdWxhdGUgc2F2ZWQgcGFnZSB0YWJs
ZSBlbnRyeSBwb2ludGVycyBhZnRlcgo+Pj4gwqDCoMKgwqDCoCB0aGV5J3JlIGFsbG9jYXRlZCBp
biBpbml0X2FyZ3MoKSAoQW5zaHVtYW4pCj4+PiDCoMKgwqAgKiBGaXggaW1iYWxhbmNlZCBwcmVl
bXB0aW9uIGNvdW50IGlzc3VlIGJ5IHJlcGxhY2luZwo+Pj4gwqDCoMKgwqDCoCBwdGVfYWxsb2Nf
bW1hcCgpIHdpdGggcHRlX2FsbG9jKCkgaW4gaW5pdF9hcmdzKCkgKHN5emJvdCkKPj4KPj4gKyB2
Z3VwdGFAa2VybmVsLm9yZwoKUGxlYXNlIGFsc28ga2VlcCBsaW51eC1zbnBzLWFyYyBDQydlZCBm
b3IgQVJDIGNoYW5nZXMuCgo+Pgo+PiBIZWxsbyBHYXZpbi9WaW5lZXQsCj4+Cj4+IFRoaXMgc2Vy
aWVzIHN0aWxsIG5lZWQgdG8gYmUgdGVzdGVkIG9uIEFSQyA/Cj4+Cj4KPiBZZXMsIEknbSB1bmFi
bGUgdG8gdGVzdCBBUkMgYXMgaXQncyBub3Qgc3VwcG9ydGVkIGJ5IFFFTVUgeWV0Lgo+IEl0IHdv
dWxkIGdyZWF0IGlmIFZpbmVldCBjYW4gZ2l2ZSBpdCBhIHRyeSBvbiBBUkMgOikKCldlIGRvIGhh
dmUgYSB3b3JraW5nIFFFTVUgKGluIHRoZSBwcm9jZXNzIG9mIGJlaW5nIHVwc3RyZWFtZWQpIHlv
dSBjb3VsZCB0cnkKaHR0cHM6Ly9naXRodWIuY29tL2Zvc3MtZm9yLXN5bm9wc3lzLWR3Yy1hcmMt
cHJvY2Vzc29ycy9xZW11ICNtYXN0ZXIKCklzIHRoaXMgY29kZSBpbiBzb21lIHNoYXJlZCBnaXQg
cmVwbyB3ZSBjYW4gcHVsbCAtIGluc3RlYWQgb2YgYXBwbHkgOCBmaWxlcy4KClRoeCwKLVZpbmVl
dAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
c25wcy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBzLWFy
Ywo=
