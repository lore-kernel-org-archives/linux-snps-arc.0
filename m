Return-Path: <SRS0=tUbe=NF=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDA7EC4338F
	for <linux-snps-arc@archiver.kernel.org>; Sat, 14 Aug 2021 02:58:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7618960F51
	for <linux-snps-arc@archiver.kernel.org>; Sat, 14 Aug 2021 02:58:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7618960F51
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zSNbu6yojD5m2zlRWEBIAAJlfEDO83PnapSNQuvv5C4=; b=v74NvnF5k3Zl1D
	it9UeLfk3ZR0x/CUtMc3yekgyzK4Qeq1tocbaBA833C1YkSUOwPS2YdAJ6HPj2McpMtal5Slf5Yi0
	xQYrjX9LL5Pva2v0A24EUO4LRgNmETzfyCopNvMGqQtLWkQZCyttSqYvvJXi3NajRHZuU5vdPhdI+
	gMsSZKOAfSZoSmFN7HuvKbgz4PrR4dSjNmf+BcgTQFN70tUq0EMGNdr6brAnzL1FGHRrQTOTqPA+0
	5Ug/NZiOCUyROor7n8TK++iichdwJxku3QMJTlzpf8XIbbyNLcM46lQC+PkktDuJ/QphPrAi2q/Js
	mZHPgSfLUAaVW+VSJH/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEjs3-00Dmbl-FD; Sat, 14 Aug 2021 02:58:03 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEjs0-00Dmb5-IW
 for linux-snps-arc@lists.infradead.org; Sat, 14 Aug 2021 02:58:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628909875;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SZ/gidsl6OmROeOx/n9lMGdC7WafEvzvYpOK4Q3l9nc=;
 b=VBiPc7zSU7tXoe0FT9rAT6xHCdjFzLQR5Ndy467kf/gSChMp4szkY1oKgZB3kBHA79jsZq
 KqRqoHr1gf8287+LbcsR9rGmf2mmp0/Va/TMZeW6cVb+56fpSq6p1i7BTZNoLBVgxpjNRq
 RDIAr1Xu0iyZ1Gb1JupsOsmJXVIovZQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-20-L-p7VCTxOcq4NrRI9XGaug-1; Fri, 13 Aug 2021 22:57:51 -0400
X-MC-Unique: L-p7VCTxOcq4NrRI9XGaug-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DB61F8030B7;
 Sat, 14 Aug 2021 02:57:49 +0000 (UTC)
Received: from [10.64.54.103] (vpn2-54-103.bne.redhat.com [10.64.54.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2097F5C1A1;
 Sat, 14 Aug 2021 02:57:41 +0000 (UTC)
Subject: Re: [PATCH v6 00/12] mm/debug_vm_pgtable: Enhancements
To: Vineet Gupta <vgupta@kernel.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, gerald.schaefer@linux.ibm.com,
 aneesh.kumar@linux.ibm.com, christophe.leroy@csgroup.eu, cai@lca.pw,
 catalin.marinas@arm.com, will@kernel.org, akpm@linux-foundation.org,
 chuhu@redhat.com, shan.gavin@gmail.com,
 arcml <linux-snps-arc@lists.infradead.org>
References: <20210809092631.1888748-1-gshan@redhat.com>
 <b066aea5-6b3e-193a-01d0-32b52d5ac513@arm.com>
 <d96fa0d8-98d8-c924-99f7-bb9673fc2a13@redhat.com>
 <25018384-acc5-dcf7-5125-378499ab4555@kernel.org>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <828d44a7-525f-c507-00d1-8e323c8956bc@redhat.com>
Date: Sat, 14 Aug 2021 12:57:38 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <25018384-acc5-dcf7-5125-378499ab4555@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210813_195800_728788_9945B0B1 
X-CRM114-Status: GOOD (  23.76  )
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
Reply-To: Gavin Shan <gshan@redhat.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

SGkgVmluZWV0LAoKT24gOC8xNC8yMSA1OjQzIEFNLCBWaW5lZXQgR3VwdGEgd3JvdGU6Cj4gT24g
OC8xMy8yMSAyOjI1IEFNLCBHYXZpbiBTaGFuIHdyb3RlOgo+PiBPbiA4LzEyLzIxIDk6MTEgUE0s
IEFuc2h1bWFuIEtoYW5kdWFsIHdyb3RlOgo+Pj4gT24gOC85LzIxIDI6NTYgUE0sIEdhdmluIFNo
YW4gd3JvdGU6Cj4+Pj4gVGhlcmUgYXJlIGNvdXBsZSBvZiBpc3N1ZXMgd2l0aCBjdXJyZW50IGlt
cGxlbWVudGF0aW9ucyBhbmQgdGhpcyBzZXJpZXMKPj4+PiB0cmllcyB0byByZXNvbHZlIHRoZSBp
c3N1ZXM6Cj4+Pj4KPj4+PiDCoMKgIChhKSBBbGwgbmVlZGVkIGluZm9ybWF0aW9uIGFyZSBzY2F0
dGVyZWQgaW4gdmFyaWFibGVzLCBwYXNzZWQgdG8gdmFyaW91cwo+Pj4+IMKgwqDCoMKgwqDCoCB0
ZXN0IGZ1bmN0aW9ucy4gVGhlIGNvZGUgaXMgb3JnYW5pemVkIGluIHByZXR0eSBtdWNoIHJlbGF4
ZWQgZmFzaGlvbi4KPj4+Pgo+Pj4+IMKgwqAgKGIpIFRoZSBwYWdlIGlzbid0IGFsbG9jYXRlZCBm
cm9tIGJ1ZGR5IGR1cmluZyBwYWdlIHRhYmxlIGVudHJ5IG1vZGlmeWluZwo+Pj4+IMKgwqDCoMKg
wqDCoCB0ZXN0cy4gVGhlIHBhZ2UgY2FuIGJlIGludmFsaWQsIGNvbmZsaWN0aW5nIHRvIHRoZSBp
bXBsZW1lbnRhdGlvbnMKPj4+PiDCoMKgwqDCoMKgwqAgb2Ygc2V0X3h4eF9hdCgpIG9uIEFSTTY0
LiBUaGUgdGFyZ2V0IHBhZ2UgaXMgYWNjZXNzZWQgc28gdGhhdCB0aGUKPj4+PiDCoMKgwqDCoMKg
wqAgaUNhY2hlIGNhbiBiZSBmbHVzaGVkIHdoZW4gZXhlY3V0aW9uIHBlcm1pc3Npb24gaXMgZ2l2
ZW4gb24gQVJNNjQuCj4+Pj4gwqDCoMKgwqDCoMKgIEJlc2lkZXMsIHRoZSB0YXJnZXQgcGFnZSBj
YW4gYmUgdW5tYXBwZWQgYW5kIGFjY2Vzc2luZyB0byBpdCBjYXVzZXMKPj4+PiDCoMKgwqDCoMKg
wqAga2VybmVsIGNyYXNoLgo+Pj4+Cj4+Pj4gInN0cnVjdCBwZ3RhYmxlX2RlYnVnX2FyZ3MiIGlz
IGludHJvZHVjZWQgdG8gYWRkcmVzcyBpc3N1ZSAoYSkuIEZvciBpc3N1ZQo+Pj4+IChiKSwgdGhl
IHVzZWQgcGFnZSBpcyBhbGxvY2F0ZWQgZnJvbSBidWRkeSBpbiBwYWdlIHRhYmxlIGVudHJ5IG1v
ZGlmeWluZwo+Pj4+IHRlc3RzLiBUaGUgY29ycmVzcG9uZGluZyB0ZXRzIHdpbGwgYmUgc2tpcHBl
ZCBpZiB3ZSBmYWlsIHRvIGFsbG9jYXRlIHRoZQo+Pj4+IChodWdlKSBwYWdlLiBGb3Igb3RoZXIg
dGVzdCBjYXNlcywgdGhlIG9yaWdpbmFsIHBhZ2UgYXJvdW5kIHRvIGtlcm5lbAo+Pj4+IHN5bWJv
bCAoQHN0YXJ0X2tlcm5lbCkgaXMgc3RpbGwgdXNlZC4KPj4+Pgo+Pj4+IFRoZSBwYXRjaGVzIGFy
ZSBvcmdhbml6ZWQgYXMgYmVsb3cuIFBBVENIWzItMTBdIGNvdWxkIGJlIGNvbWJpbmVkIHRvIG9u
ZQo+Pj4+IHBhdGNoLCBidXQgaXQgd2lsbCBtYWtlIHRoZSByZXZpZXcgaGFyZGVyOgo+Pj4+Cj4+
Pj4gwqDCoCBQQVRDSFsxXSBpbnRyb2R1Y2VzICJzdHJ1Y3QgcGd0YWJsZV9kZWJ1Z19hcmdzIiBh
cyBwbGFjZSBob2xkZXIgb2YgYWxsCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBuZWVkZWQg
aW5mb3JtYXRpb24uIFdpdGggaXQsIHRoZSBvbGQgYW5kIG5ldyBpbXBsZW1lbnRhdGlvbgo+Pj4+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY2FuIGNvZXhpc3QuCj4+Pj4gwqDCoCBQQVRDSFsyLTEw
XSB1c2VzICJzdHJ1Y3QgcGd0YWJsZV9kZWJ1Z19hcmdzIiBpbiB2YXJpb3VzIHRlc3QgZnVuY3Rp
b25zLgo+Pj4+IMKgwqAgUEFUQ0hbMTFdIHJlbW92ZXMgdGhlIHVudXNlZCBjb2RlIGZvciBvbGQg
aW1wbGVtZW50YXRpb24uCj4+Pj4gwqDCoCBQQVRDSFsxMl0gZml4ZXMgdGhlIGlzc3VlIG9mIGNv
cnJ1cHRlZCBwYWdlIGZsYWcgZm9yIEFSTTY0Cj4+Pj4KPj4+PiBDaGFuZ2Vsb2cKPj4+PiA9PT09
PT09PT0KPj4+PiB2NjoKPj4+PiDCoMKgwqAgKiBQb3B1bGF0ZSBzYXZlZCBwYWdlIHRhYmxlIGVu
dHJ5IHBvaW50ZXJzIGFmdGVyCj4+Pj4gwqDCoMKgwqDCoCB0aGV5J3JlIGFsbG9jYXRlZCBpbiBp
bml0X2FyZ3MoKSAoQW5zaHVtYW4pCj4+Pj4gwqDCoMKgICogRml4IGltYmFsYW5jZWQgcHJlZW1w
dGlvbiBjb3VudCBpc3N1ZSBieSByZXBsYWNpbmcKPj4+PiDCoMKgwqDCoMKgIHB0ZV9hbGxvY19t
bWFwKCkgd2l0aCBwdGVfYWxsb2MoKSBpbiBpbml0X2FyZ3MoKSAoc3l6Ym90KQo+Pj4KPj4+ICsg
dmd1cHRhQGtlcm5lbC5vcmcKPiAKPiBQbGVhc2UgYWxzbyBrZWVwIGxpbnV4LXNucHMtYXJjIEND
J2VkIGZvciBBUkMgY2hhbmdlcy4KPiAKClN1cmUuCgo+Pj4KPj4+IEhlbGxvIEdhdmluL1ZpbmVl
dCwKPj4+Cj4+PiBUaGlzIHNlcmllcyBzdGlsbCBuZWVkIHRvIGJlIHRlc3RlZCBvbiBBUkMgPwo+
Pj4KPj4KPj4gWWVzLCBJJ20gdW5hYmxlIHRvIHRlc3QgQVJDIGFzIGl0J3Mgbm90IHN1cHBvcnRl
ZCBieSBRRU1VIHlldC4KPj4gSXQgd291bGQgZ3JlYXQgaWYgVmluZWV0IGNhbiBnaXZlIGl0IGEg
dHJ5IG9uIEFSQyA6KQo+IAo+IFdlIGRvIGhhdmUgYSB3b3JraW5nIFFFTVUgKGluIHRoZSBwcm9j
ZXNzIG9mIGJlaW5nIHVwc3RyZWFtZWQpIHlvdSBjb3VsZCB0cnkKPiBodHRwczovL2dpdGh1Yi5j
b20vZm9zcy1mb3Itc3lub3BzeXMtZHdjLWFyYy1wcm9jZXNzb3JzL3FlbXUgI21hc3Rlcgo+IAo+
IElzIHRoaXMgY29kZSBpbiBzb21lIHNoYXJlZCBnaXQgcmVwbyB3ZSBjYW4gcHVsbCAtIGluc3Rl
YWQgb2YgYXBwbHkgOCBmaWxlcy4KPiAKCkhlcmUgaXMgcmVwbyB3aXRoIHY2IHNlcmllcyBpbmNs
dWRlZC4gUGxlYXNlIGhlbHAgdG8gaGF2ZQphIHRyeS4KCiAgICBodHRwczovL2dpdGh1Yi5jb20v
Z3dzaGFuL2xpbnV4ICAjIGt2bS9hcm02NF9kZWJ1ZwoKSSB0cmllZCB0byBidWlsZCB0aGUgY3Jv
c3MtY29tcGlsZXIgd2l0aCBidWlsZHJvb3Qgd2l0aCBmb2xsb3dpbmcKMiByZXBvcy4gVW5mb3J0
dW5hdGVseSwgbm9uZSBvZiB0aGVtIHdvcmtlZCBmb3IgbWUuIFRoZSBRRU1VCmJpbmFyeSBjYW4g
YmUgYnVpbHQgc3VjY2Vzc2Z1bGx5IHdpdGggdGhlIHByb3ZpZGVkIHJlcG8gdGhvdWdoLgoKClsx
XSBnaXQ6Ly9naXRodWIuY29tL2Zvc3MtZm9yLXN5bm9wc3lzLWR3Yy1hcmMtcHJvY2Vzc29ycy9i
dWlsZHJvb3QuZ2l0CiAgICAgKGJyYW5jaDogbWFzdGVyKQoKICAgICBUaGVyZSBhcmUgYnVpbGQg
ZXJyb3JzIGFmdGVyIGNob29zaW5nIGxpdHRsZS1lbmRpYW4gQVJNIGZyb20KICAgICAibWFrZSBt
ZW51Y29uZmlnIgoKWzJdIGh0dHBzOi8vZ2l0aHViLmNvbS9idWlsZHJvb3QvYnVpbGRyb290CiAg
ICAgKGJyYW5jaDogbWFzdGVyKQoKICAgICBUaGUgYnVpbGQgaXMgc3VjY2Vzc2Z1bCwgYnV0IHRo
ZSBrZXJuZWwgY2FuJ3QgYmUgYnVpbHQgYmVjYXVzZQogICAgIG9mIHRoZSBmb2xsb3dpbmcgZXJy
b3JzOgogICAgCiAgICAgIyBtYWtlIEFSQ0g9YXJjIENST1NTX0NPTVBJTEU9YXJjLWxpbnV4LSBh
eHMxMDNfc21wX2RlZmNvbmZpZwogICAgICMgbWFrZSAtaiA0MAogICAgICAgIDoKICAgICBMRCAg
ICAgIHZtbGludXgubwogICAgIGFyYy1saW51eC1sZDogZXJyb3I6IGF0dGVtcHRpbmcgdG8gbGlu
ayAvaG9tZS9nYXZpbi9zYW5kYm94L2J1aWxkcm9vdC9idWlsZHJvb3QuYXJjL291dHB1dC9ob3N0
L2xpYgogICAgIC9nY2MvYXJjLWJ1aWxkcm9vdC1saW51eC11Y2xpYmMvMTAuMi4wL2xpYmdjYy5h
KF9tdWxkaTMubykgd2l0aCBhIGJpbmFyeSB2bWxpbnV4Lm8gb2YgZGlmZmVyZW50CiAgICAgYXJj
aGl0ZWN0dXJlCgpUaGFua3MsCkdhdmluCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtc25wcy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4LXNucHMt
YXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1zbnBzLWFyYwo=
