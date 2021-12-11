Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE865C433F5
	for <linux-snps-arc@archiver.kernel.org>; Sat, 11 Dec 2021 00:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ju+QV5lGR/DjuNIaSQ6fT3BZUSUsE5Jls7cwWDVUFo4=; b=cBnq7QGCifactW
	+MAqL3D6sHyBihQSI42CgWNygqOIsHx7Fys11LQhrfE/x5wckb0A3/XlAII02SFhIkQ1iOOsdsa/N
	DO8l/LFSaxCK1MOB0LZIHcbGAMRaqaFDml9OQgna0/93Vbi2gTBImzNlRRElGc9sA/H2OOpyo8g+j
	TNQ8wnyEcVpXz/BLWBISBrmQoeP4c3fh+Dg2iksH7KHTHHLBbim0lHGGhCzxnq4TP0Lg4Js9jMq5i
	NtKVUEm8WZyVVACltex+78U/NqoWbpqbEMcV28U2YcT3hLyk5hHH9Gp33To8vhEOtSmU+CQ9EQibB
	CYJPYF2170qUbNy6DTBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvq03-004LHl-Al; Sat, 11 Dec 2021 00:12:27 +0000
Received: from 188-39-32-17.static.enta.net ([188.39.32.17]
 helo=mail.airspan.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvq00-004LH1-26
 for linux-snps-arc@lists.infradead.org; Sat, 11 Dec 2021 00:12:25 +0000
Received: from FS50.airspan.com (10.2.10.50) by FS60.airspan.com (10.2.10.60)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.12; Sat, 11 Dec
 2021 00:12:14 +0000
Received: from FS50.airspan.com ([fe80::5103:1cfd:775b:73dc]) by
 FS50.airspan.com ([fe80::5103:1cfd:775b:73dc%5]) with mapi id 15.01.2375.017; 
 Sat, 11 Dec 2021 00:12:14 +0000
From: Barbaros Tokaoglu <btokaoglu@airspan.com>
To: Vineet Gupta <vgupta@kernel.org>, "linux-snps-arc@lists.infradead.org"
 <linux-snps-arc@lists.infradead.org>
CC: Miika Keskinen <mkeskinen@airspan.com>
Subject: [PATCH] ARC: mm: Update ARC_REG_*C_PTAG on each cacheline operation
Thread-Topic: [PATCH] ARC: mm: Update ARC_REG_*C_PTAG on each cacheline
 operation
Thread-Index: AQHX7iPAZzqOKo4ehEGf1OJVEc+hJg==
Date: Sat, 11 Dec 2021 00:12:14 +0000
Message-ID: <cdddfeee-1718-ec30-bb17-2971d74b89cd@airspan.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [176.218.128.220]
x-c2processedorg: 9bdab810-6dbc-44eb-a994-a231bebe8d9f
Content-ID: <8D3DE921B323EF43A8BC130D81111DEE@airspan.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211210_161224_377154_05978C9B 
X-CRM114-Status: GOOD (  11.13  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

VGhpcyBwYXRjaCBpcyBmb3IgYSBwcm9ibGVtIHdlIG9ic2VydmVkIG9uIGFuIEFSQzc3MEQgYW5k
IE1NVXYzIA0KaW1wbGVtZW50YXRpb24uDQpUaGUgcHJvYmxlbSB3YXMgYWx0aG91Z2ggX19mbHVz
aF9kY2FjaGVfcGFnZSgpIHJldHVybnMgdGhlcmUgd2VyZSBzb21lIA0KY2FjaGVsaW5lDQplbnRy
aWVzIHRoYXQgZGlkbid0IGZsdXNoIHRvIEREUi4gSW4gb3VyIGNhc2UgdXBkYXRpbmcgQVJDX1JF
R19EQ19QVEFHIA0KcmVnaXN0ZXINCm9uIGVhY2ggY2FjaGVsaW5lIGl0ZXJhdGlvbiB3aXRoIHVw
ZGF0ZWQgcGh5c2ljYWwgYWRkcmVzcyBoZWxwZWQgZmx1c2hpbmcNCmNhY2hlbGluZSBlbnRyaWVz
IHRvIEREUi4NCg0KVGhpcyBwYXRjaCBpcyBvcGVuIGZvciB5b3VyIGNvbnNpZGVyYXRpb25zLg0K
DQpTaWduZWQtb2ZmLWJ5OiBCYXJiYXJvcyBUb2thb2dsdSA8YnRva2FvZ2x1QGFpcnNwYW4uY29t
Pg0KLS0tDQogwqBhcmNoL2FyYy9tbS9jYWNoZS5jIHwgMTMgKystLS0tLS0tLS0tLQ0KIMKgMSBm
aWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1n
aXQgYS9hcmNoL2FyYy9tbS9jYWNoZS5jIGIvYXJjaC9hcmMvbW0vY2FjaGUuYw0KaW5kZXggOGFh
MTIzMS4uZDA4NzVhOCAxMDA2NDQNCi0tLSBhL2FyY2gvYXJjL21tL2NhY2hlLmMNCisrKyBiL2Fy
Y2gvYXJjL21tL2NhY2hlLmMNCkBAIC0yNTEsMTMgKzI1MSw2IEBAIHZvaWQgX19jYWNoZV9saW5l
X2xvb3BfdjMocGh5c19hZGRyX3QgcGFkZHIsIA0KdW5zaWduZWQgbG9uZyB2YWRkciwNCiDCoMKg
wqDCoMKgwqDCoCBudW1fbGluZXMgPSBESVZfUk9VTkRfVVAoc3osIEwxX0NBQ0hFX0JZVEVTKTsN
Cg0KIMKgwqDCoMKgwqDCoMKgIC8qDQotwqDCoMKgwqDCoMKgwqAgKiBNTVV2MywgY2FjaGUgb3Bz
IHJlcXVpcmUgcGFkZHIgaW4gUFRBRyByZWcNCi3CoMKgwqDCoMKgwqDCoCAqIGlmIFYtUCBjb25z
dCBmb3IgbG9vcCwgUFRBRyBjYW4gYmUgd3JpdHRlbiBvbmNlIG91dHNpZGUgbG9vcA0KLcKgwqDC
oMKgwqDCoMKgICovDQotwqDCoMKgwqDCoMKgIGlmIChmdWxsX3BhZ2UpDQotwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB3cml0ZV9hdXhfcmVnKGF1eF90YWcsIHBhZGRyKTsNCi0NCi3CoMKg
wqDCoMKgwqAgLyoNCiDCoMKgwqDCoMKgwqDCoMKgICogVGhpcyBpcyB0ZWNobmljYWxseSBmb3Ig
TU1VIHY0LCB1c2luZyB0aGUgTU1VIHYzIHByb2dyYW1taW5nIA0KbW9kZWwNCiDCoMKgwqDCoMKg
wqDCoMKgICogU3BlY2lhbCB3b3JrIGZvciBIUzM4IGFsaWFzaW5nIEktY2FjaGUgY29uZmlndXJh
dGlvbiB3aXRoIFBBRTQwDQogwqDCoMKgwqDCoMKgwqDCoCAqwqDCoCAtIHVwcGVyIDggYml0cyBv
ZiBwYWRkciBuZWVkIHRvIGJlIHdyaXR0ZW4gaW50byBQVEFHX0hJDQpAQCAtMjY4LDEwICsyNjEs
OCBAQCB2b2lkIF9fY2FjaGVfbGluZV9sb29wX3YzKHBoeXNfYWRkcl90IHBhZGRyLCANCnVuc2ln
bmVkIGxvbmcgdmFkZHIsDQogwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHdyaXRlX2F1
eF9yZWcoQVJDX1JFR19JQ19QVEFHX0hJLCAodTY0KXBhZGRyID4+IDMyKTsNCg0KIMKgwqDCoMKg
wqDCoMKgIHdoaWxlIChudW1fbGluZXMtLSA+IDApIHsNCi3CoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGlmICghZnVsbF9wYWdlKSB7DQotwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgd3JpdGVfYXV4X3JlZyhhdXhfdGFnLCBwYWRkcik7DQotwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcGFkZHIgKz0gTDFfQ0FDSEVfQllU
RVM7DQotwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9DQorwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCB3cml0ZV9hdXhfcmVnKGF1eF90YWcsIHBhZGRyKTsNCivCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHBhZGRyICs9IEwxX0NBQ0hFX0JZVEVTOw0KDQogwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHdyaXRlX2F1eF9yZWcoYXV4X2NtZCwgdmFkZHIpOw0KIMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB2YWRkciArPSBMMV9DQUNIRV9CWVRFUzsNCi0tIA0K
Mi43LjQNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtc25wcy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1z
bnBzLWFyYwo=
