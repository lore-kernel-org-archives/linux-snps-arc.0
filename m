Return-Path: <SRS0=YOVA=CL=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1E5AC433E2
	for <linux-snps-arc@archiver.kernel.org>; Wed,  2 Sep 2020 13:20:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D896207D3
	for <linux-snps-arc@archiver.kernel.org>; Wed,  2 Sep 2020 13:20:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TWJ79Ht9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="U4YUbjRS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D896207D3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=O3e5rSn5B2pOJrSPNAmPy2lNWlgENXgNgDCzMvaDo6w=; b=TWJ79Ht9MGSEIQGTPqKTuzxYP
	SzBegOLKOVUnLXXtzPNPvukB+6RZcRA280BQAn6Aq9UwhTAIWFg2hz6pAuo6VKN//ciFcAogaBJdT
	stLMrI9roHClvQhW6O/tkgs2VlA21daBLdOjR228cPMaWKsn0Q8CTZcDI+8g2Gl1kpTI3Hu10SVxB
	tplM5Ne6ETDmTgb/1JDdvz13P7a8Gwnr+jfnXsSskJpxqC5RZ1K4fNVqvlkVgIO4zVi7i19UMfkfH
	MBhO9cwTxtkau5nL5uPVf3YTLNhKDs6x0vRX86NtF/kvNB02oTF8wPwJcs/1o2E2NfJEuFh3EWJJr
	ZpAbFIc2A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDSgn-00087T-BI; Wed, 02 Sep 2020 13:20:37 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDSgl-000873-7Y; Wed, 02 Sep 2020 13:20:36 +0000
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 082D32D5082651; Wed, 2 Sep 2020 09:20:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=AWgBI/YrhXkEmm+Qf+fcD6e36zb+RyfY/AO6JpSkQRw=;
 b=U4YUbjRSaR+rCFG6DWCiDZuk/wIngA6teRubXBrZBoevSyZ37Id/JCC/4T+/x231ms86
 WBDJ/aeSIJyMMb8xMqjKERxGsqRJGY9BUj5xhqSL1PbAEcTpOR1DVj0MkHj7Y8wTiPgz
 FMj9ge2U8MROOxRqpC3qVNMupp4wulx0D5sEQbOJsiMohAtOj2PBXVWzwMgCQX0pji7I
 psezDLC67scKFixndTBhlh60moFAktujDfbFpkNnpDrGExDpDuaaNpKuR9qkmAWGPBxb
 LdXwpJxaKGw65RET5iW9/3yJWvItzSwGqxteRGuR4rE8LGz4ANiPc1WjMogHo5XURh7R jg== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0b-001b2d01.pphosted.com with ESMTP id 33ab64j3qq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Sep 2020 09:20:19 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 082DDB6F025854;
 Wed, 2 Sep 2020 13:20:19 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma05wdc.us.ibm.com with ESMTP id 337en9g3df-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Sep 2020 13:20:19 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 082DKI7d56099310
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Sep 2020 13:20:19 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E5777124052;
 Wed,  2 Sep 2020 13:20:17 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2426B124053;
 Wed,  2 Sep 2020 13:20:13 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.199.61.124])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed,  2 Sep 2020 13:20:12 +0000 (GMT)
X-Mailer: emacs 27.1 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
Subject: Re: [PATCH v3 12/13] mm/debug_vm_pgtable/hugetlb: Disable hugetlb
 test on ppc64
In-Reply-To: <a76a180b-650c-c868-7a52-593afe97eab3@arm.com>
References: <20200827080438.315345-1-aneesh.kumar@linux.ibm.com>
 <20200827080438.315345-13-aneesh.kumar@linux.ibm.com>
 <6191e77f-c3b7-21ea-6dbd-eecc09735923@arm.com>
 <68f90b44-b830-58be-3c21-424fee05da37@linux.ibm.com>
 <a76a180b-650c-c868-7a52-593afe97eab3@arm.com>
Date: Wed, 02 Sep 2020 18:50:09 +0530
Message-ID: <873640e2nq.fsf@linux.ibm.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-02_09:2020-09-02,
 2020-09-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 suspectscore=0 impostorscore=0 phishscore=0
 adultscore=0 spamscore=0 clxscore=1015 mlxscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009020118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200902_092035_336366_41191848 
X-CRM114-Status: GOOD (  43.19  )
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

QW5zaHVtYW4gS2hhbmR1YWwgPGFuc2h1bWFuLmtoYW5kdWFsQGFybS5jb20+IHdyaXRlczoKCj4g
T24gMDkvMDEvMjAyMCAxMjowMCBQTSwgQW5lZXNoIEt1bWFyIEsuViB3cm90ZToKPj4gT24gOS8x
LzIwIDk6MzMgQU0sIEFuc2h1bWFuIEtoYW5kdWFsIHdyb3RlOgo+Pj4KPj4+Cj4+PiBPbiAwOC8y
Ny8yMDIwIDAxOjM0IFBNLCBBbmVlc2ggS3VtYXIgSy5WIHdyb3RlOgo+Pj4+IFRoZSBzZWVtcyB0
byBiZSBtaXNzaW5nIHF1aXRlIGEgbG90IG9mIGRldGFpbHMgdy5yLnQgYWxsb2NhdGluZwo+Pj4+
IHRoZSBjb3JyZWN0IHBndGFibGVfdCBwYWdlIChodWdlX3B0ZV9hbGxvYygpKSwgaG9sZGluZyB0
aGUgcmlnaHQKPj4+PiBsb2NrIChodWdlX3B0ZV9sb2NrKCkpIGV0Yy4gVGhlIHZtYSB1c2VkIGlz
IGFsc28gbm90IGEgaHVnZXRsYiBWTUEuCj4+Pj4KPj4+PiBwcGM2NCBkbyBoYXZlIHJ1bnRpbWUg
Y2hlY2tzIHdpdGhpbiBDT05GSUdfREVCVUdfVk0gZm9yIG1vc3Qgb2YgdGhlc2UuCj4+Pj4gSGVu
Y2UgZGlzYWJsZSB0aGUgdGVzdCBvbiBwcGM2NC4KPj4+Cj4+PiBXb3VsZCByZWFsbHkgbGlrZSB0
aGlzIHRvIGdldCByZXNvbHZlZCBpbiBhbiB1bmlmb3JtIGFuZCBiZXR0ZXIgd2F5Cj4+PiBpbnN0
ZWFkLCBpLmUgYSBtb2RpZmllZCBodWdldGxiX2FkdmFuY2VkX3Rlc3RzKCkgd2hpY2ggd29ya3Mg
b24gYWxsCj4+PiBwbGF0Zm9ybXMgaW5jbHVkaW5nIHBwYzY0Lgo+Pj4KPj4+IEluIGFic2VuY2Ug
b2YgYSBtb2RpZmllZCB2ZXJzaW9uLCBJIGRvIHJlYWxpemUgdGhlIHNpdHVhdGlvbiBoZXJlLAo+
Pj4gd2hlcmUgREVCVUdfVk1fUEdUQUJMRSB0ZXN0IGVpdGhlciBydW5zIG9uIHBwYzY0IG9yIGp1
c3QgY29tcGxldGVseQo+Pj4gcmVtb3ZlIGh1Z2V0bGJfYWR2YW5jZWRfdGVzdHMoKSBmcm9tIG90
aGVyIHBsYXRmb3JtcyBhcyB3ZWxsLgo+Pj4KPj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IEFuZWVz
aCBLdW1hciBLLlYgPGFuZWVzaC5rdW1hckBsaW51eC5pYm0uY29tPgo+Pj4+IC0tLQo+Pj4+IMKg
IG1tL2RlYnVnX3ZtX3BndGFibGUuYyB8IDQgKysrKwo+Pj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKykKPj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS9tbS9kZWJ1Z192bV9wZ3RhYmxl
LmMgYi9tbS9kZWJ1Z192bV9wZ3RhYmxlLmMKPj4+PiBpbmRleCBhMTg4YjZlNGUzN2UuLjIxMzI5
YzdkNjcyZiAxMDA2NDQKPj4+PiAtLS0gYS9tbS9kZWJ1Z192bV9wZ3RhYmxlLmMKPj4+PiArKysg
Yi9tbS9kZWJ1Z192bV9wZ3RhYmxlLmMKPj4+PiBAQCAtODEzLDYgKzgxMyw3IEBAIHN0YXRpYyB2
b2lkIF9faW5pdCBodWdldGxiX2Jhc2ljX3Rlc3RzKHVuc2lnbmVkIGxvbmcgcGZuLCBwZ3Byb3Rf
dCBwcm90KQo+Pj4+IMKgICNlbmRpZiAvKiBDT05GSUdfQVJDSF9XQU5UX0dFTkVSQUxfSFVHRVRM
QiAqLwo+Pj4+IMKgIH0KPj4+PiDCoCArI2lmbmRlZiBDT05GSUdfUFBDX0JPT0szU182NAo+Pj4+
IMKgIHN0YXRpYyB2b2lkIF9faW5pdCBodWdldGxiX2FkdmFuY2VkX3Rlc3RzKHN0cnVjdCBtbV9z
dHJ1Y3QgKm1tLAo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwdGVfdCAqcHRlcCwgdW5zaWduZWQgbG9uZyBw
Zm4sCj4+Pj4gQEAgLTg1NSw2ICs4NTYsNyBAQCBzdGF0aWMgdm9pZCBfX2luaXQgaHVnZXRsYl9h
ZHZhbmNlZF90ZXN0cyhzdHJ1Y3QgbW1fc3RydWN0ICptbSwKPj4+PiDCoMKgwqDCoMKgIHB0ZSA9
IGh1Z2VfcHRlcF9nZXQocHRlcCk7Cj4+Pj4gwqDCoMKgwqDCoCBXQVJOX09OKCEoaHVnZV9wdGVf
d3JpdGUocHRlKSAmJiBodWdlX3B0ZV9kaXJ0eShwdGUpKSk7Cj4+Pj4gwqAgfQo+Pj4+ICsjZW5k
aWYKPj4+Cj4+PiBJbiB0aGUgd29yc3QgY2FzZSBpZiB3ZSBjb3VsZCBub3QgZ2V0IGEgbmV3IGh1
Z2V0bGJfYWR2YW5jZWRfdGVzdHMoKSB0ZXN0Cj4+PiB0aGF0IHdvcmtzIG9uIGFsbCBwbGF0Zm9y
bXMsIHRoaXMgbWlnaHQgYmUgdGhlIGxhc3QgZmFsbGJhY2sgb3B0aW9uLiBJbgo+Pj4gd2hpY2gg
Y2FzZSwgaXQgd2lsbCByZXF1aXJlIGEgcHJvcGVyIGNvbW1lbnQgc2VjdGlvbiB3aXRoIGEgIkZJ
WE1FOiAiLAo+Pj4gZXhwbGFpbmluZyB0aGUgY3VycmVudCBzaXR1YXRpb24gKGFuZCB0aGF0ICNp
ZmRlZiBpcyB0ZW1wb3JhcnkgaW4gbmF0dXJlKQo+Pj4gYW5kIGEgaHVnZXRsYl9hZHZhbmNlZF90
ZXN0cygpIHN0dWIgd2hlbiBDT05GSUdfUFBDX0JPT0szU182NCBpcyBlbmFibGVkLgo+Pj4KPj4+
PiDCoCAjZWxzZcKgIC8qICFDT05GSUdfSFVHRVRMQl9QQUdFICovCj4+Pj4gwqAgc3RhdGljIHZv
aWQgX19pbml0IGh1Z2V0bGJfYmFzaWNfdGVzdHModW5zaWduZWQgbG9uZyBwZm4sIHBncHJvdF90
IHByb3QpIHsgfQo+Pj4+IMKgIHN0YXRpYyB2b2lkIF9faW5pdCBodWdldGxiX2FkdmFuY2VkX3Rl
c3RzKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLAo+Pj4+IEBAIC0xMDY1LDcgKzEwNjcsOSBAQCBzdGF0
aWMgaW50IF9faW5pdCBkZWJ1Z192bV9wZ3RhYmxlKHZvaWQpCj4+Pj4gwqDCoMKgwqDCoCBwdWRf
cG9wdWxhdGVfdGVzdHMobW0sIHB1ZHAsIHNhdmVkX3BtZHApOwo+Pj4+IMKgwqDCoMKgwqAgc3Bp
bl91bmxvY2socHRsKTsKPj4+PiDCoCArI2lmbmRlZiBDT05GSUdfUFBDX0JPT0szU182NAo+Pj4+
IMKgwqDCoMKgwqAgaHVnZXRsYl9hZHZhbmNlZF90ZXN0cyhtbSwgdm1hLCBwdGVwLCBwdGVfYWxp
Z25lZCwgdmFkZHIsIHByb3QpOwo+Pj4+ICsjZW5kaWYKPj4+Cj4+IAo+PiBJIGFjdHVhbGx5IHdh
bnRlZCB0byBhZGQgI2lmZGVmIEJST0tFTi4gVGhhdCB0ZXN0IGlzIGNvbXBsZXRlbHkgYnJva2Vu
LiBJbmZhY3QgSSB3b3VsZCBzdWdnZXN0IHRvIHJlbW92ZSB0aGF0IHRlc3QgY29tcGxldGVseS4K
Pj4gCj4+IAo+PiAKPj4+ICNpZmRlZiB3aWxsIG5vdCBiZSByZXF1aXJlZCBoZXJlIGFzIHRoZXJl
IHdvdWxkIGJlIGEgc3R1YiBkZWZpbml0aW9uCj4+PiBmb3IgaHVnZXRsYl9hZHZhbmNlZF90ZXN0
cygpIHdoZW4gQ09ORklHX1BQQ19CT09LM1NfNjQgaXMgZW5hYmxlZC4KPj4+Cj4+Pj4gwqAgwqDC
oMKgwqDCoCBzcGluX2xvY2soJm1tLT5wYWdlX3RhYmxlX2xvY2spOwo+Pj4+IMKgwqDCoMKgwqAg
cDRkX2NsZWFyX3Rlc3RzKG1tLCBwNGRwKTsKPj4+Pgo+Pj4KPj4+IEJ1dCBhZ2Fpbiwgd2Ugc2hv
dWxkIHJlYWxseSB0cnkgYW5kIGF2b2lkIHRha2luZyB0aGlzIHBhdGguCj4+Pgo+PiAKPj4gVG8g
YmUgZnJhbmsgaSBhbSBraW5kIG9mIGZydXN0cmF0ZWQgd2l0aCBob3cgdGhpcyBwYXRjaCBzZXJp
ZXMgaXMgYmVpbmcgbG9va2VkIGF0LiBXZSBwdXNoZWQgYSBjb21wbGV0ZWx5IGJyb2tlbiB0ZXN0
IHRvIHVwc3RyZWFtIGFuZCByaWdodCBub3cgd2UgaGF2ZSBhIGNvZGUgaW4gdXBzdHJlYW0gdGhh
dCBjcmFzaCB3aGVuIGJvb3RlZCBvbiBwcGM2NC4gTXkgYXR0ZW1wdCBoYXMgYmVlbiB0byBtYWtl
IHByb2dyZXNzIGhlcmUgYW5kIHlvdSBkZWZpbml0ZWx5IHNlZW1zIHRvIGJlIG5vdCBpbiBhZ3Jl
ZW1lbnQgdG8gdGhhdC4KPj4gCj4KPiBJIGFtIGFmcmFpZCwgdGhpcyBkb2VzIG5vdCBhY2N1cmF0
ZWx5IHJlcHJlc2VudCB0aGUgc2l0dWF0aW9uLgo+Cj4gLSBUaGUgc2Vjb25kIHNldCBwYXRjaCBz
ZXJpZXMgZ290IG1lcmdlZCBpbiBpdCdzIFY1IGFmdGVyIGFjY29tbW9kYXRpbmcgYWxtb3N0Cj4g
ICBhbGwgcmV2aWV3cyBhbmQgb2JqZWN0aW9ucyBkdXJpbmcgcHJldmlvdXMgZGlzY3Vzc2lvbiBj
eWNsZXMuIEZvciBhIGNvbXBsZXRlCj4gICBkZXZlbG9wbWVudCBsb2csIHBsZWFzZSByZWZlciBo
dHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL2NvdmVyLzExNjU4NjI3Ly4KPgo+IC0gVGhlIHNl
cmllcyBoYXMgYmVlbiByZXBlYXRlZGx5IHRlc3RlZCBvbiBhcm02NCBhbmQgeDg2IHBsYXRmb3Jt
cyBmb3IgbXVsdGlwbGUKPiAgIGNvbmZpZ3VyYXRpb25zIGJ1dCBidWlsZCB0ZXN0ZWQgb24gYWxs
IG90aGVyIGVuYWJsZWQgcGxhdGZvcm1zLiBJIGhhdmUgYWx3YXlzCj4gICBiZWVuIGRlcGVuZGVu
dCBvbiB2b2x1bnRhcnkgaGVscCBmcm9tIGZvbGtzIG9uIHRoZSBsaXN0IHRvIGdldCB0aGlzIHRl
c3RlZCBvbgo+ICAgb3RoZXIgZW5hYmxlZCBwbGF0Zm9ybXMgYXMgSSBkb250IGhhdmUgYWNjZXNz
IHRvIHN1Y2ggc3lzdGVtcy4gQWx3YXlzIGFzc3VtZWQKPiAgIHRoYXQgaXMgdGhlIHdheSB0byBn
byBmb3IgYW55dGhpbmcgd2hpY2ggcnVucyBvbiBtdWx0aXBsZSBwbGF0Zm9ybXMuIFNvLCBhbSBJ
Cj4gICBleHBlY3RlZCB0byB0ZXN0IG9uIHBsYXRmb3JtcyB0aGF0IEkgZG9udCBoYXZlIGFjY2Vz
cyB0byA/IEJ1dCBJIGFtIHJlYWR5IHRvCj4gICBiZSBjb3JyZWN0ZWQgaGVyZSwgaWYgdGhlIGNv
bW11bml0eSBwcm90b2NvbCBpcyBub3Qgd2hhdCBJIGhhdmUgYWx3YXlzIGFzc3VtZWQKPiAgIGl0
IHRvIGJlLgo+Cj4gLSBFYWNoIGFuZCBldmVyeSB2ZXJzaW9uIG9mIHRoZSBzZXJpZXMgaGFkIGFw
cHJvcHJpYXRlbHkgY29waWVkIGFsbCB0aGUgZW5hYmxlZAo+ICAgcGxhdGZvcm0ncyBtYWlsaW5n
IGxpc3QuIEFsc28sIEkgaGFkIGV4cGxpY2l0bHkgYXNrZWQgZm9yIHZvbHVudGVlcnMgdG8gdGVz
dAo+ICAgdGhpcyBvdXQgb24gcGxhdGZvcm1zIGFwYXJ0IGZyb20geDg2IGFuZCBhcm02NC4gV2Ug
aGFkIHBvc2l0aXZlIHJlc3BvbnNlIGZyb20KPiAgIGFsbCBwbGF0Zm9ybXMgaS5lIGFyYywgczM5
MCwgcHBjMzIgYnV0IGV4Y2VwdCBmb3IgcHBjNjQuCj4KPiAgIGh0dHBzOi8vcGF0Y2h3b3JrLmtl
cm5lbC5vcmcvY292ZXIvMTE2NDQ3NzEvCj4gICBodHRwczovL3BhdGNod29yay5rZXJuZWwub3Jn
L2NvdmVyLzExNjAzNzEzLwo+Cj4gLSBUaGUgZGV2ZWxvcG1lbnQgY3ljbGUgcHJvdmlkZWQgc3Vm
ZmljaWVudCB0aW1lIHdpbmRvdyBmb3IgYW55IGRldGFpbGVkIHJldmlldwo+ICAgYW5kIHRlc3Qu
IEkgaGF2ZSBhbHdheXMgYmVlbiB3aWxsaW5nIHRvIGFkZHJlc3MgYWxtb3N0IGFsbCB0aGUgaXNz
dWVzIGJyb3VnaHQKPiAgIGZvcndhcmQgZHVyaW5nIHRoZXNlIGRpc2N1c3Npb25zLiBGcm9tIHBh
c3QgZXhwZXJpZW5jZSBvbiB0aGlzIHRlc3QsIHRoZXJlIGlzCj4gICBhbiBpbmhlcmVudCBuZWVk
IHRvIHVuZGVyc3RhbmQgcGxhdGZvcm0gc3BlY2lmaWMgZGV0YWlscyB3aGlsZSB0cnlpbmcgdG8g
Y29tZQo+ICAgdXAgd2l0aCBzb21ldGhpbmcgZ2VuZXJpYyBlbm91Z2ggdGhhdCB3b3JrcyBvbiBh
bGwgcGxhdGZvcm1zLiBJdCBuZWNlc3NpdGF0ZXMKPiAgIHBhcnRpY2lwYXRpb24gZnJvbSByZWxl
dmFudCBmb2xrcyB0byBlbmFibGUgdGhpcyB0ZXN0IG9uIGEgZ2l2ZW4gcGxhdGZvcm0uIFdlCj4g
ICB3ZXJlIGFibGUgdG8gZW5hYmxlIHRoaXMgb24gYXJtNjQsIHg4NiwgYXJjLCBzMzkwLCBwb3dl
cnBjIGZvbGxvd2luZyBhIHNpbWlsYXIKPiAgIG1vZGVsLgo+Cj4gLSBJIGhhdmUgdG8gZGlzYWdy
ZWUgaGVyZSB0aGF0IHRoZSBjb25jZXJuZWQgdGVzdCBpLmUgaHVnZXRsYl9hZHZhbmNlZF90ZXN0
cygpCj4gICBpcyBjb21wbGV0ZWx5IGJyb2tlbi4gQXMgbWVudGlvbmVkIGJlZm9yZSwgdGhlIGlk
ZWEgaGVyZSBoYXMgYWx3YXlzIGJlZW4gdG8KPiAgIGVtdWxhdGUgZW5vdWdoIE1NIG9iamVjdHMs
IHNvIHRoYXQgYSBnaXZlbiBwYWdlIHRhYmxlIGhlbHBlciBjb3VsZCBiZSB0ZXN0ZWQuCj4gICBo
dWdldGxiX2FkdmFuY2VkX3Rlc3RzKCkgc2VlbXMgdG8gYmUgaW5zdWZmaWNpZW50IG9uIHBwYzY0
IHBsYXRmb3JtIGNhdXNpbmcgaXQKPiAgIHRvIGNyYXNoLCB3aGljaCBpcyBub3QgdGhlIGNhc2Ug
b24gb3RoZXIgcGxhdGZvcm1zLiBCdXQgaXQgaXMgbm90IHBlcmZlY3QgYW5kCj4gICBjYW4gYmUg
aW1wcm92ZWQgdXBvbi4gR2l2ZW4gdGhlIGNvbnN0cmFpbnRzIGkuZSBsaW1pdGVkIGVtdWxhdGlv
biBvZiBvYmplY3RzLAo+ICAgdGhlIHRlc3QgdHJpZXMgdG8gZG8gdGhlIHJpZ2h0IHRoaW5nLiBD
YWxsaW5nIGl0IGJyb2tlbiBpcyBub3QgYW4gYXBwcm9wcmlhdGUKPiAgIGRlc2NyaXB0aW9uLgo+
CgoKTm9uZSBvZiB0aGUgZml4ZXMgZG9uZSBoZXJlIGFyZSBzcGVjaWZpYyB0byBwcGM2NC4gSSBh
bSBub3Qgc3VyZSB3aHkgeW91CmtlZXAgc3VnZ2VzdGluZyBwcGM2NCBzcGVjaWZpYyBpc3N1ZXMu
IE9uZSBzaG91bGQgbm90IGRvIHBhZ2UgdGFibGUKdXBkYXRlcyB3aXRob3V0IGhvbGRpbmcgbG9j
a3MuIEEgaHVnZXRsYiBwdGUgdXBkYXRlcyBleHBlY3QgYSB2bWEgbWFya2VkCmh1Z2V0bGIuCgpB
cyBleHBsYWluZWQgaW4gdGhlIHBhdGNoLCBJIHNlZSB2ZXJ5IGxpdHRsZSB2YWx1ZSBpbiBhIGJ1
bmNoIG9mIHRlc3RzCmxpa2UgdGhpcyBhbmQgdGhlIG9ubHkgcmVhc29uIEkgc3RhcnRlZCB0byBm
aXggdGhpcyB1cCBpcyBiZWNhdXNlIG9mCm11bHRpcGxlIGNyYXNoIHJlcG9ydHMgb24gcHBjNjQu
CgpDb25zaWRlcmluZyB0aGUgaHVnZXRsYiB0ZXN0cyByZXF1aXJlIG11Y2ggbGFyZ2VyIGNoYW5n
ZSBhbmQgYXMgaXQgaXMKY3VycmVudGx5IHdyaXR0ZW4gaXMgYnJva2VuLCBJIHdhbnRlZCB0byBy
ZW1vdmUgdGhhdCB0ZXN0IGFuZCBsZXQgeW91CmNvbWUgdXAgd2l0aCBhIHByb3BlciB0ZXN0LiBC
dXQgc2luY2UgeW91IGhhZCBpdCAid29ya2luZyIsIEkgZGlzYWJsZWQKdGhpcyBvbmx5IG9uIHBw
YzY0LgoKQnV0IHlvdSBrZWVwIHN1Z2dlc3RpbmcgdGhhdCB0aGUgaHVnZXRsYiB0ZXN0IG5lZWQg
dG8gYmUgZml4ZWQgYXMgcGFydApvZiB0aGUgcGF0Y2ggc2VyaWVzIHJldmlldy4gSSBkb24ndCBo
YXZlIGVub3VnaCBtb3RpdmF0aW9uIHRvIGZpeCB0aGF0LApiZWNhdXNlIEkgZG9uJ3Qgc2VlIG11
Y2ggdmFsdWUgaW4gYSBidW5jaCBvZiB0ZXN0cyBsaWtlIHRoZXNlLiBBcyBzaG93bgphbHJlYWR5
IHRoZXNlIHRlc3RzIGFscmVhZHkgcmVwb3J0ZWQgc3VjY2VzcyB0aWxsIG5vdyB3aXRob3V0IGV2
ZW4KZm9sbG93aW5nIGFueSBwYWdlIHRhYmxlIHVwZGF0ZSBydWxlcy4KCi1hbmVlc2gKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXNucHMtYXJj
IG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1hcmMK
