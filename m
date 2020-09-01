Return-Path: <SRS0=vI3k=CK=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A501C433E6
	for <linux-snps-arc@archiver.kernel.org>; Tue,  1 Sep 2020 09:36:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3D21206CD
	for <linux-snps-arc@archiver.kernel.org>; Tue,  1 Sep 2020 09:36:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0RSAKfe0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="nfW1BD90"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D3D21206CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=c0lw5k2aGPQTY7Kij9OJO1EiiMM/ij5J2PuIeXmOjOA=; b=0RSAKfe0PjfOEuytEwhz1IEWK
	U3wUvfcXDyJFoC3ylKIC15Nyo+Yp3fJUiGN5BxvkA4EShuymc72i6wNf6O5Q38FRaAiZVONdXw0tB
	d9FutmCQy901Lgkzl4IWrJ83bJer6xSjaFxxDtEn2gEWk9IfsBLjR0UxrN9TQLUdQ3HKRraBRMKGm
	6EpcOccvUHTeMpcPqvdaVpOqcvwLH6EvVZs6coMru+Cq2V+QS2nPfZls4aJ2wmN0dQsUpUjGAouDi
	uFRYhCCj/cpId0UdyMqbV0XspIeP8xUsTGZykDSHVWUdCHBDjzdWIGEkzEWQhIRDHxm8mKCqODuD2
	8eYMe2R2Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kD2iZ-0006hH-8N; Tue, 01 Sep 2020 09:36:43 +0000
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kD2iX-0006gW-IO; Tue, 01 Sep 2020 09:36:42 +0000
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0819WopQ152071; Tue, 1 Sep 2020 05:36:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=ieUbKRrXXUeTrFPxea2tKHx4x0U86S23DsEANvqZna0=;
 b=nfW1BD90IZ6nv1L25CGs/cMhCnex8TwRpB1E/ny6y8mZDHfWTEY4XfC8VLMGW0DQEnC0
 f0U2avA4C26Ve3eKvKYUrnBrj5Jk9wqICkU8qB+Pm6ZTjNqTTQZ7M4WHCczA5lFUAo5n
 6T68ZjXgJOa/EdzasoLe8yjOpNO3A14P65arOVp3cIR9/cL0tGw9IOoDIiKSYENOwD8P
 PPfgM25kuXuhqc4aCF9fD9OIWUu5btu8txOGFQ7/xJ4aWA4IQidBiXSjOaiqSeaNVKnU
 90c83vDuPsAMgVYDEItznDaDTatcz9vJEMIStKBP1jWzEfpCOw+gNNUvnTplLN+ctK+y NA== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 339h2yvhtw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Sep 2020 05:36:25 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0819RlIU001400;
 Tue, 1 Sep 2020 09:36:23 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03fra.de.ibm.com with ESMTP id 337en89yda-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Sep 2020 09:36:23 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0819aLxs11993592
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 1 Sep 2020 09:36:21 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1D59911C052;
 Tue,  1 Sep 2020 09:36:21 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0C70511C04C;
 Tue,  1 Sep 2020 09:36:18 +0000 (GMT)
Received: from [9.85.87.174] (unknown [9.85.87.174])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  1 Sep 2020 09:36:17 +0000 (GMT)
Subject: Re: [PATCH v3 09/13] mm/debug_vm_pgtable/locks: Move non page table
 modifying test together
To: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <20200827080438.315345-1-aneesh.kumar@linux.ibm.com>
 <20200827080438.315345-10-aneesh.kumar@linux.ibm.com>
 <d0a0a50c-702b-c63a-edf2-263e4e7bd4a5@arm.com>
 <b6240372-4554-8c17-186a-cdc0b0a9089c@linux.ibm.com>
 <9b75b175-f319-d40e-a95e-b323b3db654a@arm.com>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <58a5280f-4882-4a36-c52d-15ad879209d6@linux.ibm.com>
Date: Tue, 1 Sep 2020 15:06:16 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <9b75b175-f319-d40e-a95e-b323b3db654a@arm.com>
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-01_04:2020-09-01,
 2020-09-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 impostorscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015 mlxlogscore=957
 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009010080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200901_053641_695129_09E7626F 
X-CRM114-Status: GOOD (  19.08  )
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

Cj4+Pgo+Pj4gW8KgwqAgMTcuMDgwNjQ0XSAtLS0tLS0tLS0tLS1bIGN1dCBoZXJlIF0tLS0tLS0t
LS0tLS0KPj4+IFvCoMKgIDE3LjA4MTM0Ml0ga2VybmVsIEJVRyBhdCBtbS9wZ3RhYmxlLWdlbmVy
aWMuYzoxNjQhCj4+PiBbwqDCoCAxNy4wODIwOTFdIEludGVybmFsIGVycm9yOiBPb3BzIC0gQlVH
OiAwIFsjMV0gUFJFRU1QVCBTTVAKPj4+IFvCoMKgIDE3LjA4Mjk3N10gTW9kdWxlcyBsaW5rZWQg
aW46Cj4+PiBbwqDCoCAxNy4wODM0ODFdIENQVTogNzkgUElEOiAxIENvbW06IHN3YXBwZXIvMCBU
YWludGVkOiBHwqDCoMKgwqDCoMKgwqAgV8KgwqDCoMKgwqDCoMKgwqAgNS45LjAtcmMyLTAwMTA1
LWc3NDBlNzJjZDY3MTcgIzE0Cj4+PiBbwqDCoCAxNy4wODQ5OThdIEhhcmR3YXJlIG5hbWU6IGxp
bnV4LGR1bW15LXZpcnQgKERUKQo+Pj4gW8KgwqAgMTcuMDg1NzQ1XSBwc3RhdGU6IDYwNDAwMDA1
IChuWkN2IGRhaWYgK1BBTiAtVUFPIEJUWVBFPS0tKQo+Pj4gW8KgwqAgMTcuMDg2NjQ1XSBwYyA6
IHBndGFibGVfdHJhbnNfaHVnZV9kZXBvc2l0KzB4NTgvMHg2MAo+Pj4gW8KgwqAgMTcuMDg3NDYy
XSBsciA6IGRlYnVnX3ZtX3BndGFibGUrMHg0ZGMvMHg4ZjAKPj4+IFvCoMKgIDE3LjA4ODE2OF0g
c3AgOiBmZmZmODAwMDEyMTliY2YwCj4+PiBbwqDCoCAxNy4wODg3MTBdIHgyOTogZmZmZjgwMDAx
MjE5YmNmMCB4Mjg6IGZmZmY4MDAwMTE0YWMwMDAKPj4+IFvCoMKgIDE3LjA4OTU3NF0geDI3OiBm
ZmZmODAwMDExNGFjMDAwIHgyNjogMDAyMDAwMDAwMDAwMGZkMwo+Pj4gW8KgwqAgMTcuMDkwNDMx
XSB4MjU6IDAwMjAwMDAwODE0MDBmZDMgeDI0OiBmZmZmZmUwMDE3NWMxMmMwCj4+PiBbwqDCoCAx
Ny4wOTEyODZdIHgyMzogZmZmZjAwMDVkZjA0ZDFhOCB4MjI6IDAwMDBmMThkNmUwMzUwMDAKPj4+
IFvCoMKgIDE3LjA5MjE0M10geDIxOiBmZmZmMDAwNWRkNzkwMDAwIHgyMDogZmZmZjAwMDVkZjE4
ZTFhOAo+Pj4gW8KgwqAgMTcuMDkzMDAzXSB4MTk6IGZmZmYwMDA1ZGYwNGNiODAgeDE4OiAwMDAw
MDAwMDAwMDAwMDE0Cj4+PiBbwqDCoCAxNy4wOTM4NTldIHgxNzogMDAwMDAwMDBiNzY2NjdkMCB4
MTY6IDAwMDAwMDAwZmQ0ZTY2MTEKPj4+IFvCoMKgIDE3LjA5NDcxNl0geDE1OiAwMDAwMDAwMDAw
MDAwMDAxIHgxNDogMDAwMDAwMDAwMDAwMDAwMgo+Pj4gW8KgwqAgMTcuMDk1NTcyXSB4MTM6IDAw
MDAwMDAwMDA1NWQ5NjYgeDEyOiBmZmZmZmUwMDE3NTVlNDAwCj4+PiBbwqDCoCAxNy4wOTY0Mjld
IHgxMTogMDAwMDAwMDAwMDAwMDAwOCB4MTA6IGZmZmYwMDA1ZmNiNmUyMTAKPj4+IFvCoMKgIDE3
LjA5NzI5Ml0geDkgOiBmZmZmMDAwNWZjYjZlMjEwIHg4IDogMDAyMDAwMDA4MTU5MGZkMwo+Pj4g
W8KgwqAgMTcuMDk4MTQ5XSB4NyA6IGZmZmYwMDA1ZGQ3MWUwYzAgeDYgOiBmZmZmMDAwNWRmMThl
MWE4Cj4+PiBbwqDCoCAxNy4wOTkwMDZdIHg1IDogMDAyMDAwMDA4MTU5MGZkMyB4NCA6IDAwMjAw
MDAwODE1OTBmZDMKPj4+IFvCoMKgIDE3LjA5OTg2Ml0geDMgOiBmZmZmMDAwNWRmMThlMWE4IHgy
IDogZmZmZmZlMDAxNzVjMTJjMAo+Pj4gW8KgwqAgMTcuMTAwNzE4XSB4MSA6IGZmZmZmZTAwMTc1
YzEzMDAgeDAgOiAwMDAwMDAwMDAwMDAwMDAwCj4+PiBbwqDCoCAxNy4xMDE1ODNdIENhbGwgdHJh
Y2U6Cj4+PiBbwqDCoCAxNy4xMDE5OTNdwqAgcGd0YWJsZV90cmFuc19odWdlX2RlcG9zaXQrMHg1
OC8weDYwCj4+PiBbwqDCoCAxNy4xMDI3NTRdwqAgZG9fb25lX2luaXRjYWxsKzB4NzQvMHgxY2MK
Pj4+IFvCoMKgIDE3LjEwMzM4MV3CoCBrZXJuZWxfaW5pdF9mcmVlYWJsZSsweDFkMC8weDIzOAo+
Pj4gW8KgwqAgMTcuMTA0MDg5XcKgIGtlcm5lbF9pbml0KzB4MTQvMHgxMTgKPj4+IFvCoMKgIDE3
LjEwNDY1OF3CoCByZXRfZnJvbV9mb3JrKzB4MTAvMHgzNAo+Pj4gW8KgwqAgMTcuMTA1MjUxXSBD
b2RlOiBmOTAwMDQ0MyBmOTAwMDg0MyBmOTAwMDgyMiBkNjVmMDNjMCAoZDQyMTAwMDApCj4+PiBb
wqDCoCAxNy4xMDYzMDNdIC0tLVsgZW5kIHRyYWNlIGU2MzQ3MWUwMGY4YzE0N2YgXS0tLQo+Pj4K
Pj4KPj4gSUlVQywgdGhpcyBzaG91bGQgaGFwcGVuIGV2ZW4gd2l0aG91dCB0aGUgc2VyaWVzIHJp
Z2h0PyBUaGlzIGlzCj4+Cj4+ICDCoMKgwqDCoGFzc2VydF9zcGluX2xvY2tlZChwbWRfbG9ja3B0
cihtbSwgcG1kcCkpOwo+IAo+IENyYXNoIGRvZXMgbm90IGhhcHBlbiB3aXRob3V0IHRoaXMgc2Vy
aWVzLiBBIHByZXZpb3VzIHBhdGNoIFtQQVRDSCB2MyAwOC8xM10KPiBhZGRlZCBwZ3RhYmxlX3Ry
YW5zX2h1Z2VfZGVwb3NpdC93aXRoZHJhdygpIGluIHBtZF9hZHZhbmNlZF90ZXN0cygpLiBhcm02
NAo+IGRvZXMgbm90IGRlZmluZSBfX0hBVkVfQVJDSF9QR1RBQkxFX0RFUE9TSVQgYW5kIGhlbmNl
IGZhbGxzIGJhY2sgb24gZ2VuZXJpYwo+IHBndGFibGVfdHJhbnNfaHVnZV9kZXBvc2l0KCkgd2hp
Y2ggdGhlIGFzc2VydHMgdGhlIGxvY2suCj4gCgoKSSBmaXhlZCB0aGF0IGJ5IG1vdmluZyB0aGUg
cGd0YWJsZSBkZXBvc2l0IGFmdGVyIGFkZGluZyB0aGUgcG1kIGxvY2tzIApjb3JyZWN0bHkuCgpt
bS9kZWJ1Z192bV9wZ3RhYmxlL2xvY2tzOiBNb3ZlIG5vbiBwYWdlIHRhYmxlIG1vZGlmeWluZyB0
ZXN0IHRvZ2V0aGVyCm1tL2RlYnVnX3ZtX3BndGFibGUvbG9ja3M6IFRha2UgY29ycmVjdCBwYWdl
IHRhYmxlIGxvY2sKbW0vZGVidWdfdm1fcGd0YWJsZS90aHA6IFVzZSBwYWdlIHRhYmxlIGRlcG9z
dC93aXRoZHJhdyB3aXRoIFRIUAoKLWFuZWVzaAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgt
c25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
