Return-Path: <SRS0=vI3k=CK=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37524C433E2
	for <linux-snps-arc@archiver.kernel.org>; Tue,  1 Sep 2020 09:58:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 007ED206A5
	for <linux-snps-arc@archiver.kernel.org>; Tue,  1 Sep 2020 09:58:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="skamA5gD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="f+Kawktr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 007ED206A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=k7koCGkMwL4ZhhGMlB7uLblKCaOzFK4lPRIf2cQ5/To=; b=skamA5gDb0K/niHe96GvdL9L9
	l4JDoPMFewp3/Tyr6/b4tKQGuKa/JTKdjZ7ifO7T6GG6hFFP/X4tjXgiU8KdygjsHMBVVi+AE50om
	89QE/G/9xQVRUhevyspSZP2c6dvIMrzJN4pN6Yt+KF1r9IMtTwyAfldg0+oS3HGBY0qH9fx9Puvlw
	1dXQMFkLazU/Eeme+ZdMQdd2H+csh8WNcOrXtY6cYKXWg2UHIk+kVz35cnJIMIFsxki9XDp4CUYm2
	yeBvNw/s18J67O0R6nHfR6M6fvxPCOAgBCY5dq4PxJZgsEQfNVmbXdQsScrjW6/Rsjfq55r4xAZrO
	eVC+wBJAw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kD341-0002Iw-DV; Tue, 01 Sep 2020 09:58:53 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kD33z-0002Hl-Jv; Tue, 01 Sep 2020 09:58:52 +0000
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0819X5he034189; Tue, 1 Sep 2020 05:58:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=S5R2pENwrHGOaDDy4JG4nfqufhMJxjYzq3BcPK7DqqY=;
 b=f+KawktrSIte9wveFyStzdtvU4TzMydyBstvuogEkFvjn6FkoHQox2S2/8TX93xuqLFj
 JowjnOEIbB6tsDmLRzO2Ja3K9tN5SJzrWMDGnlu5PxDeciWtxb384Yi3DtEiRVQPrJr0
 BJeGxG2TuKHZ01KQom4cdF+JUHr8j+DJTaN9rtPR2dpSQlF9O/yPunNYyd/SIY4HHWLu
 rsgHfHGvBDwrDBW/i+IJ1IW87VuiwigHb/U/a1UyeJS08BQSAtoKI/Dcs9jkFn7MinKY
 CGNuDgE0sEZWmCq3cLKagS85i9LUQcNYQLCQighT/piytK2K6WG4IRmL6CpC/3LAN5A/ xw== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 339gd0pya4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Sep 2020 05:58:38 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0819ump7010963;
 Tue, 1 Sep 2020 09:58:36 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma02fra.de.ibm.com with ESMTP id 337en7j0bw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Sep 2020 09:58:35 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 0819wXQQ65143156
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 1 Sep 2020 09:58:33 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 94C9111C04C;
 Tue,  1 Sep 2020 09:58:33 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5E9B011C050;
 Tue,  1 Sep 2020 09:58:30 +0000 (GMT)
Received: from [9.85.87.174] (unknown [9.85.87.174])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  1 Sep 2020 09:58:30 +0000 (GMT)
Subject: Re: [PATCH v3 13/13] mm/debug_vm_pgtable: populate a pte entry before
 fetching it
To: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <20200827080438.315345-1-aneesh.kumar@linux.ibm.com>
 <20200827080438.315345-14-aneesh.kumar@linux.ibm.com>
 <edc68223-7f8a-13df-68eb-9682f585adb8@arm.com>
 <abef1791-8779-6b34-3178-3bf3ab36d42b@linux.ibm.com>
 <e3140b44-993e-aa4b-130d-ee2230eff2b5@arm.com>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <7ef7c302-e7e6-570e-3100-5dd1bf9551be@linux.ibm.com>
Date: Tue, 1 Sep 2020 15:28:29 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <e3140b44-993e-aa4b-130d-ee2230eff2b5@arm.com>
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-01_04:2020-09-01,
 2020-09-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 mlxlogscore=999 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009010080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200901_055851_777348_D17AB7A5 
X-CRM114-Status: GOOD (  26.04  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

T24gOS8xLzIwIDE6MDggUE0sIEFuc2h1bWFuIEtoYW5kdWFsIHdyb3RlOgo+IAo+IAo+IE9uIDA5
LzAxLzIwMjAgMTI6MDcgUE0sIEFuZWVzaCBLdW1hciBLLlYgd3JvdGU6Cj4+IE9uIDkvMS8yMCA4
OjU1IEFNLCBBbnNodW1hbiBLaGFuZHVhbCB3cm90ZToKPj4+Cj4+Pgo+Pj4gT24gMDgvMjcvMjAy
MCAwMTozNCBQTSwgQW5lZXNoIEt1bWFyIEsuViB3cm90ZToKPj4+PiBwdGVfY2xlYXJfdGVzdHMg
b3BlcmF0ZSBvbiBhbiBleGlzdGluZyBwdGUgZW50cnkuIE1ha2Ugc3VyZSB0aGF0IGlzIG5vdCBh
IG5vbmUKPj4+PiBwdGUgZW50cnkuCj4+Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBBbmVlc2ggS3Vt
YXIgSy5WIDxhbmVlc2gua3VtYXJAbGludXguaWJtLmNvbT4KPj4+PiAtLS0KPj4+PiAgwqAgbW0v
ZGVidWdfdm1fcGd0YWJsZS5jIHwgNiArKysrLS0KPj4+PiAgwqAgMSBmaWxlIGNoYW5nZWQsIDQg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS9tbS9k
ZWJ1Z192bV9wZ3RhYmxlLmMgYi9tbS9kZWJ1Z192bV9wZ3RhYmxlLmMKPj4+PiBpbmRleCAyMTMy
OWM3ZDY3MmYuLjg1MjdlYmI3NWYyYyAxMDA2NDQKPj4+PiAtLS0gYS9tbS9kZWJ1Z192bV9wZ3Rh
YmxlLmMKPj4+PiArKysgYi9tbS9kZWJ1Z192bV9wZ3RhYmxlLmMKPj4+PiBAQCAtNTQ2LDcgKzU0
Niw3IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBwZ2RfcG9wdWxhdGVfdGVzdHMoc3RydWN0IG1tX3N0
cnVjdCAqbW0sIHBnZF90ICpwZ2RwLAo+Pj4+ICDCoCBzdGF0aWMgdm9pZCBfX2luaXQgcHRlX2Ns
ZWFyX3Rlc3RzKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLCBwdGVfdCAqcHRlcCwKPj4+PiAgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBsb25nIHZhZGRyKQo+
Pj4+ICDCoCB7Cj4+Pj4gLcKgwqDCoCBwdGVfdCBwdGUgPSBwdGVwX2dldChwdGVwKTsKPj4+PiAr
wqDCoMKgIHB0ZV90IHB0ZSA9wqAgcHRlcF9nZXRfYW5kX2NsZWFyKG1tLCB2YWRkciwgcHRlcCk7
Cj4+Pgo+Pj4gU2VlbXMgbGlrZSBwdGVwX2dldF9hbmRfY2xlYXIoKSBoZXJlIGp1c3QgY2xlYXJz
IHRoZSBlbnRyeSBpbiBwcmVwYXJhdGlvbgo+Pj4gZm9yIGEgZm9sbG93aW5nIHNldF9wdGVfYXQo
KSB3aGljaCBvdGhlcndpc2Ugd291bGQgaGF2ZSBiZWVuIGEgcHJvYmxlbSBvbgo+Pj4gcHBjNjQg
YXMgeW91IGhhZCBwb2ludGVkIG91dCBlYXJsaWVyIGkuZSBzZXRfcHRlX2F0KCkgc2hvdWxkIG5v
dCB1cGRhdGUgYW4KPj4+IGV4aXN0aW5nIHZhbGlkIGVudHJ5LiBTbyB0aGUgY29tbWl0IG1lc3Nh
Z2UgaGVyZSBpcyBiaXQgbWlzbGVhZGluZy4KPj4+Cj4+Cj4+IGFuZCBhbHNvIGZldGNoIHRoZSBw
dGUgdmFsdWUgd2hpY2ggaXMgdXNlZCBmdXJ0aGVyLgo+Pgo+Pgo+Pj4+ICDCoCDCoMKgwqDCoMKg
IHByX2RlYnVnKCJWYWxpZGF0aW5nIFBURSBjbGVhclxuIik7Cj4+Pj4gIMKgwqDCoMKgwqAgcHRl
ID0gX19wdGUocHRlX3ZhbChwdGUpIHwgUkFORE9NX09SVkFMVUUpOwo+Pj4+IEBAIC05NDQsNyAr
OTQ0LDcgQEAgc3RhdGljIGludCBfX2luaXQgZGVidWdfdm1fcGd0YWJsZSh2b2lkKQo+Pj4+ICDC
oMKgwqDCoMKgIHA0ZF90ICpwNGRwLCAqc2F2ZWRfcDRkcDsKPj4+PiAgwqDCoMKgwqDCoCBwdWRf
dCAqcHVkcCwgKnNhdmVkX3B1ZHA7Cj4+Pj4gIMKgwqDCoMKgwqAgcG1kX3QgKnBtZHAsICpzYXZl
ZF9wbWRwLCBwbWQ7Cj4+Pj4gLcKgwqDCoCBwdGVfdCAqcHRlcDsKPj4+PiArwqDCoMKgIHB0ZV90
ICpwdGVwLCBwdGU7Cj4+Pj4gIMKgwqDCoMKgwqAgcGd0YWJsZV90IHNhdmVkX3B0ZXA7Cj4+Pj4g
IMKgwqDCoMKgwqAgcGdwcm90X3QgcHJvdCwgcHJvdG5vbmU7Cj4+Pj4gIMKgwqDCoMKgwqAgcGh5
c19hZGRyX3QgcGFkZHI7Cj4+Pj4gQEAgLTEwNDksNiArMTA0OSw4IEBAIHN0YXRpYyBpbnQgX19p
bml0IGRlYnVnX3ZtX3BndGFibGUodm9pZCkKPj4+PiAgwqDCoMKgwqDCoMKgICovCj4+Pj4gIMKg
IMKgwqDCoMKgwqAgcHRlcCA9IHB0ZV9hbGxvY19tYXBfbG9jayhtbSwgcG1kcCwgdmFkZHIsICZw
dGwpOwo+Pj4+ICvCoMKgwqAgcHRlID0gcGZuX3B0ZShwdGVfYWxpZ25lZCwgcHJvdCk7Cj4+Pj4g
K8KgwqDCoCBzZXRfcHRlX2F0KG1tLCB2YWRkciwgcHRlcCwgcHRlKTsKPj4+Cj4+PiBOb3QgaGVy
ZSwgY3JlYXRpbmcgYW5kIHBvcHVsYXRpbmcgYW4gZW50cnkgbXVzdCBiZSBkb25lIGluIHJlc3Bl
Y3RpdmUKPj4+IHRlc3QgZnVuY3Rpb25zIGl0c2VsZi4gQmVzaWRlcywgdGhpcyBzZWVtcyBiaXQg
cmVkdW5kYW50IGFzIHdlbGwuIFRoZQo+Pj4gdGVzdCBwdGVfY2xlYXJfdGVzdHMoKSB3aXRoIHRo
ZSBhYm92ZSBjaGFuZ2UgYWRkZWQsIGFscmVhZHkKPj4+Cj4+PiAtIENsZWFycyB0aGUgUFRFUCBl
bnRyeSB3aXRoIHB0ZXBfZ2V0X2FuZF9jbGVhcigpCj4+Cj4+IGFuZCBmZXRjaCB0aGUgb2xkIHZh
bHVlIHNldCBwcmV2aW91c2x5Lgo+IAo+IEluIHRoYXQgY2FzZSwgcGxlYXNlIG1vdmUgYWJvdmUg
dHdvIGxpbmVzIGkuZQo+IAo+IHB0ZSA9IHBmbl9wdGUocHRlX2FsaWduZWQsIHByb3QpOwo+IHNl
dF9wdGVfYXQobW0sIHZhZGRyLCBwdGVwLCBwdGUpOwo+IAo+IGZyb20gZGVidWdfdm1fcGd0YWJs
ZSgpIHRvIHB0ZV9jbGVhcl90ZXN0cygpIGFuZCB1cGRhdGUgaXQncyBhcmd1bWVudHMKPiBhcyBy
ZXF1aXJlZC4KPiAKCkZyYW5rbHksIEkgZG9uJ3QgdW5kZXJzdGFuZCB3aGF0IHRoZXNlIHRlc3Rz
IGFyZSB0ZXN0aW5nLiBJdCBhbGwgbG9va3MgCmxpa2Ugc29tZSByYW5kb20gY2xlYXIgYW5kIHNl
dC4KCnN0YXRpYyB2b2lkIF9faW5pdCBwdGVfY2xlYXJfdGVzdHMoc3RydWN0IG1tX3N0cnVjdCAq
bW0sIHB0ZV90ICpwdGVwLAoJCQkJICAgdW5zaWduZWQgbG9uZyB2YWRkciwgdW5zaWduZWQgbG9u
ZyBwZm4sCgkJCQkgICBwZ3Byb3RfdCBwcm90KQp7CgoJcHRlX3QgcHRlID0gcGZuX3B0ZShwZm4s
IHByb3QpOwoJc2V0X3B0ZV9hdChtbSwgdmFkZHIsIHB0ZXAsIHB0ZSk7CgoJcHRlID0gIHB0ZXBf
Z2V0X2FuZF9jbGVhcihtbSwgdmFkZHIsIHB0ZXApOwoKCXByX2RlYnVnKCJWYWxpZGF0aW5nIFBU
RSBjbGVhclxuIik7CglwdGUgPSBfX3B0ZShwdGVfdmFsKHB0ZSkgfCBSQU5ET01fT1JWQUxVRSk7
CglzZXRfcHRlX2F0KG1tLCB2YWRkciwgcHRlcCwgcHRlKTsKCWJhcnJpZXIoKTsKCXB0ZV9jbGVh
cihtbSwgdmFkZHIsIHB0ZXApOwoJcHRlID0gcHRlcF9nZXQocHRlcCk7CglXQVJOX09OKCFwdGVf
bm9uZShwdGUpKTsKfQoKCi1hbmVlc2gKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFy
Y0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtc25wcy1hcmMK
